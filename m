Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D464EA12E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 22:14:16 +0200 (CEST)
Received: from localhost ([::1]:39504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYvkl-0001S3-2X
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 16:14:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nYvj4-00081s-Sv
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:12:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nYvj0-0002rK-2p
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:12:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648498345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WqVT3KvgQV+tZRe7WZblIXuVXsuTLMlVvflnQm6HlpY=;
 b=Qpx6RjZUj0zbH1dH+EcgzkLJI3E6DTQVka0HhhZvKLvhnEXN3iI/zQWISWteUakbNTnexX
 uttg+XnwKhZ0/3W1QaS7DjUINIOMICvuYoKSJOQpZwTFaJHt/JcJGOFlc1qHY3lKys3ZXX
 pEEUfG3VxOgJebRyLC9cqTaNyEsUlqc=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-5tUL4TpCNBaeMYGyuLMlzA-1; Mon, 28 Mar 2022 16:12:21 -0400
X-MC-Unique: 5tUL4TpCNBaeMYGyuLMlzA-1
Received: by mail-il1-f198.google.com with SMTP id
 z14-20020a92d6ce000000b002c993540ee1so3141728ilp.0
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 13:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=WqVT3KvgQV+tZRe7WZblIXuVXsuTLMlVvflnQm6HlpY=;
 b=EMMb8GIaKybQnR0JsSyCRVaGS1yUqae8r8s5OdU3vb3nigLaOb7vOfjwmLPOq5u0pN
 R7oEYdt4VXzI2anvgNebjzBahWrE2SP0IykjQ/imgkGPvxOhpSs2HR6TXLPenvqIx+DV
 HMp7ukKFX7zfhhExy82JDoZLucXHquRn6BMnHaQaQ1R6mpn/0zM53+De1FlsCHb5czpZ
 9QGHBFMzFjy4sQzNGbxFGELUSgmxOLON8ko6MdH2KAfHtzkODBobwZCrTQwVP93JYL8G
 zLeGORevBcO8ynNB1g9GPp1YD9MgltDyuuJAnPQ4/aNRxIGdZt2TF6q880jFwONzly62
 PWIw==
X-Gm-Message-State: AOAM533iTAR6lgjaZCgUusPYcL9tKL8JSl0BP+I6yq0dllJRRCegbO4S
 GHpZWy5ovVz7nRlyRTpMCpdb7khpAcsT2Jd/YHUp+n6jZR8K7OTvm1kYsTNvj+LNXYvFBzTAoab
 6Uatqve47e9TLS3c=
X-Received: by 2002:a5e:820a:0:b0:649:5b8:d02c with SMTP id
 l10-20020a5e820a000000b0064905b8d02cmr7471321iom.50.1648498340717; 
 Mon, 28 Mar 2022 13:12:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBWieBEZJKb+4gcLO8gWGz0t+u2tDXAulAsD5Gd3ckb0X+PQp44Pjwj/KZIpU70TvWYk/mng==
X-Received: by 2002:a5e:820a:0:b0:649:5b8:d02c with SMTP id
 l10-20020a5e820a000000b0064905b8d02cmr7471310iom.50.1648498340498; 
 Mon, 28 Mar 2022 13:12:20 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f4-20020a92b504000000b002c21ef70a81sm7949207ile.7.2022.03.28.13.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 13:12:20 -0700 (PDT)
Date: Mon, 28 Mar 2022 14:12:19 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [PATCH v6 0/5] optimize the downtime for vfio migration
Message-ID: <20220328141219.5da6e010.alex.williamson@redhat.com>
In-Reply-To: <20220326060226.1892-1-longpeng2@huawei.com>
References: <20220326060226.1892-1-longpeng2@huawei.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org, yechuan@huawei.com,
 arei.gonglei@huawei.com, huangzhichao@huawei.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 26 Mar 2022 14:02:21 +0800
"Longpeng(Mike)" <longpeng2@huawei.com> wrote:

> From: Longpeng <longpeng2@huawei.com>
> 
> Hi guys,
>  
> In vfio migration resume phase, the cost would increase if the
> vfio device has more unmasked vectors. We try to optimize it in
> this series.
>  
> You can see the commit message in PATCH 6 for details.
>  
> Patch 1-3 are simple cleanups and fixup.
> Patch 4 are the preparations for the optimization.
> Patch 5 optimizes the vfio msix setup path.
> 
> v5: https://lore.kernel.org/all/20211103081657.1945-1-longpeng2@huawei.com/T/
> 
> Change v5->v6:
>  - remove the Patch 4("kvm: irqchip: extract kvm_irqchip_add_deferred_msi_route")
>     of v5, and use KVMRouteChange API instead. [Paolo, Longpeng]
> 
> Changes v4->v5:
>  - setup the notifier and irqfd in the same function to makes
>    the code neater.    [Alex]
> 
> Changes v3->v4:
>  - fix several typos and grammatical errors [Alex]
>  - remove the patches that fix and clean the MSIX common part
>    from this series [Alex]
>  - Patch 6:
>     - use vector->use directly and fill it with -1 on error
>       paths [Alex]
>     - add comment before enable deferring to commit [Alex]
>     - move the code that do_use/release on vector 0 into an
>       "else" branch [Alex]
>     - introduce vfio_prepare_kvm_msi_virq_batch() that enables
>       the 'defer_kvm_irq_routing' flag [Alex]
>     - introduce vfio_commit_kvm_msi_virq_batch() that clears the
>       'defer_kvm_irq_routing' flag and does further work [Alex]
> 
> Changes v2->v3:
>  - fix two errors [Longpeng]
> 
> Changes v1->v2:
>  - fix several typos and grammatical errors [Alex, Philippe]
>  - split fixups and cleanups into separate patches  [Alex, Philippe]
>  - introduce kvm_irqchip_add_deferred_msi_route to
>    minimize code changes    [Alex]
>  - enable the optimization in msi setup path    [Alex]
> 
> Longpeng (Mike) (5):
>   vfio: simplify the conditional statements in vfio_msi_enable
>   vfio: move re-enabling INTX out of the common helper
>   vfio: simplify the failure path in vfio_msi_enable
>   Revert "vfio: Avoid disabling and enabling vectors repeatedly in VFIO
>     migration"
>   vfio: defer to commit kvm irq routing when enable msi/msix
> 
>  hw/vfio/pci.c | 183 +++++++++++++++++++++++++++++++-------------------
>  hw/vfio/pci.h |   2 +
>  2 files changed, 115 insertions(+), 70 deletions(-)
> 

Nice to see you found a solution with Paolo's suggestion for
begin/commit batching.  Looks ok to me; I'll queue this for after the
v7.0 QEMU release and look for further reviews and comments in the
interim.  Thanks,

Alex


