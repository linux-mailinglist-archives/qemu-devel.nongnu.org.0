Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDEC43F503
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 04:37:52 +0200 (CEST)
Received: from localhost ([::1]:35856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgHmA-0000Z9-Qj
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 22:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mgHkL-0008IA-PH
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 22:35:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mgHkI-0002XA-LR
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 22:35:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635474952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dl17QBP2dTqvlaUWedBRRkDXPDA1PSW8q3hV0t9ELlM=;
 b=VkRyILLLDak/ELRH2WbA+p7OpW/q2qb6TfAd0+zffUxvtGipx4YshBM3IRhvtaV7J8fHFT
 FcSZF6aIO3NYUfVrf/3TLUDUCwj+lSfNojAlsymJV7G24aaH6HBCzNMiOuM3C+pYN2jqnW
 duknm1r34Wko6mLlx+FgzEq/Hw1IeVs=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-WAJIZGduOzeyCn3ZogzNtQ-1; Thu, 28 Oct 2021 22:35:51 -0400
X-MC-Unique: WAJIZGduOzeyCn3ZogzNtQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 x17-20020a0565123f9100b003ff593b7c65so3636498lfa.12
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 19:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dl17QBP2dTqvlaUWedBRRkDXPDA1PSW8q3hV0t9ELlM=;
 b=0zepA9/tYJNWHvkilQz0D/gr+bTHMWK2zzhFsIWfbV+//ozYybSxClv5kW2ycLik6j
 n9xukXCLjnFPvmLPVbaGdVgMoY5CgdD7f8wx7TQ6XJS5CyYhRTXiGg1DXTH++6ua2lza
 rpj/T+95TSe//i/fP5FiDXB8L16XnhPWlKfF9KK8j8jgP9Zdig2fTxQTvZjPCv6HZR9X
 LB3sCbTLrZ3uSVae53aZQZo0lBSqD0MVQkcC2ZXeojfYHQ8JO9J6kbF86+eUQLus9zw2
 Ns2l9x13LieHnp2ryLFOYQLq6ojZsCVbjOkkY3UfBnHCVUFIAk9rURtbUTifTUAPH39f
 yzeQ==
X-Gm-Message-State: AOAM530rYHRjRksaX8ZYGWGzkwNj6FXBtXKinymhlsPBH55Dfc0nSRfF
 520i/RVwZF4IUb8qEuHPS1ELpslRsm65qHyiVjl+d6z5mBpraYjeSx5a/UMe0qYVwj5sv4P7D3u
 jJQzGBKxLH7z4ZIscybTnrw7gdhmevSA=
X-Received: by 2002:a2e:8846:: with SMTP id z6mr8701786ljj.277.1635474949911; 
 Thu, 28 Oct 2021 19:35:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVbwdY5725Fcj6b19jjX6qZfBsM+ZAJ78a3BUejSoxnGJNlNl3jpfd8p2Bh1XeFxI3wkrfiuwUGZeFXfOMiRk=
X-Received: by 2002:a2e:8846:: with SMTP id z6mr8701766ljj.277.1635474949649; 
 Thu, 28 Oct 2021 19:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211028173014.139692-1-lvivier@redhat.com>
In-Reply-To: <20211028173014.139692-1-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 29 Oct 2021 10:35:38 +0800
Message-ID: <CACGkMEsrHVQ2bhnyPC1KEL4-i50QOsd-+HX6oao9BNNBWVcY-Q@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/virtio-net: fix hotplug test case
To: Laurent Vivier <lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 29, 2021 at 1:30 AM Laurent Vivier <lvivier@redhat.com> wrote:
>
> virtio-net-test has an hotplug testcase that is never executed.
>
> This is because the testcase is attached to virtio-pci interface
> rather than to virtio-net-pci.
>
>   $ QTEST_QEMU_BINARY=./qemu-system-x86_64 tests/qtest/qos-test -l | grep hotplug
>   /x86_64/.../pci-ohci-tests/ohci_pci-test-hotplug
>   /x86_64/.../e1000e/e1000e-tests/hotplug
>   /x86_64/.../virtio-blk-pci/virtio-blk-pci-tests/hotplug
>   /x86_64/.../vhost-user-blk-pci/vhost-user-blk-pci-tests/hotplug
>   /x86_64/.../virtio-rng-pci/virtio-rng-pci-tests/hotplug
>   /x86_64/.../virtio-scsi/virtio-scsi-tests/hotplug
>   /x86_64/.../virtio-serial/virtio-serial-tests/hotplug
>
> With this fix:
>
>   $ QTEST_QEMU_BINARY=./qemu-system-x86_64 tests/qtest/qos-test -l | grep hotplug
>   ...
>   /x86_64/.../vhost-user-blk-pci/vhost-user-blk-pci-tests/hotplug
>   /x86_64/.../virtio-net-pci/virtio-net-pci-tests/hotplug
>   /x86_64/.../virtio-rng-pci/virtio-rng-pci-tests/hotplug
>   ...
>   $ QTEST_QEMU_BINARY=./qemu-system-x86_64 tests/qtest/qos-test -p /x86_64/.../virtio-net-pci-tests/hotplug
>   /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net-pci-tests/hotplug: OK
>
> Fixes: 6ae333f91b99 ("qos-test: virtio-net test node")
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Applied.

Thanks

> ---
>  tests/qtest/virtio-net-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/qtest/virtio-net-test.c b/tests/qtest/virtio-net-test.c
> index a08e2ffe123f..8bf74e516cce 100644
> --- a/tests/qtest/virtio-net-test.c
> +++ b/tests/qtest/virtio-net-test.c
> @@ -319,7 +319,7 @@ static void register_virtio_net_test(void)
>          .before = virtio_net_test_setup,
>      };
>
> -    qos_add_test("hotplug", "virtio-pci", hotplug, &opts);
> +    qos_add_test("hotplug", "virtio-net-pci", hotplug, &opts);
>  #ifndef _WIN32
>      qos_add_test("basic", "virtio-net", send_recv_test, &opts);
>      qos_add_test("rx_stop_cont", "virtio-net", stop_cont_test, &opts);
> --
> 2.31.1
>


