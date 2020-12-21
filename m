Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1302DFDAC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:45:54 +0100 (CET)
Received: from localhost ([::1]:43178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krNNg-0000RY-TY
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:45:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1krMpj-0002Ni-RL
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 10:10:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1krMpd-0007fa-KC
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 10:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608563439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NDSXQCDS2HHD98bMIrfQWL29cVE3YpI9oQf2wKnZX68=;
 b=etfq/ehKMzn+DKqrRHbNyfKKBcw2R03pQ/1zahB+jMj1U0d4rjBectkNaZL/T+sGtP71bZ
 zK7VEQ3xlCrBURKps31ZTkTCdO7WYxaP8SzZVmMIKvqToPnmlW80KR9CMaGvoxYBFQoML2
 XK4AUabtqazgu4W1LdRkWfAK8xyiKSE=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-jUvfjVDEPAC-YXZHTnO-pw-1; Mon, 21 Dec 2020 10:10:35 -0500
X-MC-Unique: jUvfjVDEPAC-YXZHTnO-pw-1
Received: by mail-ua1-f69.google.com with SMTP id 14so2523618uae.8
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 07:10:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NDSXQCDS2HHD98bMIrfQWL29cVE3YpI9oQf2wKnZX68=;
 b=foDRTeI2jsd4Pz7vwr/R9aIMBuZfeV/AMHtgwKsyh1F4ws+wrQ7Hvo6wgFbCybyUAM
 qRjboh5Mt1cGx+Hupc/4+6TwO+9kcnsUFQd1t1jWtawUUuGH3DqK5dR1ovlbBhFBvCWn
 +RYPkW3qpLlprooPKSjD1MadlScgsxEp/JpFpXxMzB7+cLFxEYtN8IQQPyyWkpLcySKw
 KwDR5A0V7vESjFvsxTsxuLta4arw2c3PgltQwcpV3Jx8lpCj9YYhOvgsGqzMK0KX6h+e
 LcmeFWxCtCXRTs2pYDPTB5aXdljYzV1COQ7e915mLBCNTU5N2hsAYls0nQDGE6sDdYlA
 xlfw==
X-Gm-Message-State: AOAM533vMrB1r3sHUlllmdG1ZApoECYPyhb81fuoLrOwjTGcX7Ex+cX6
 6aRfQ1RKbR94Y6fppYvY3QIMF8E5+nco4pXeqogIh66zNY678vzi6bQIceeiauS3DZXF3CN/gLV
 RZho/fmDrwcE6s9bvj1c8E1y1vRDFgGU=
X-Received: by 2002:a67:1b01:: with SMTP id b1mr11993370vsb.39.1608563433987; 
 Mon, 21 Dec 2020 07:10:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwntNaEL4dq7GeYe3rT2LPGPmBjlji/2PWjDyqrEiirJ+Lc9dZLWyhysI2IB43Enk/qvUY/bWDQRTr9FS8rwJ4=
X-Received: by 2002:a67:1b01:: with SMTP id b1mr11993309vsb.39.1608563433205; 
 Mon, 21 Dec 2020 07:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20201217085334.211772-1-thuth@redhat.com>
 <d341b59d-17bb-a159-0bbd-e53e2dab9f65@redhat.com>
 <20201221135955.69b0b182.cohuck@redhat.com>
In-Reply-To: <20201221135955.69b0b182.cohuck@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 21 Dec 2020 12:10:22 -0300
Message-ID: <CAKJDGDYW8bhjcyoHrAC_LZ7cfbL7FUBF-2gYmmZnewZ1=aChFg@mail.gmail.com>
Subject: Re: [PATCH v2] tests/acceptance: Add a test with the Fedora 31 kernel
 and initrd
To: Cornelia Huck <cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 21, 2020 at 10:00 AM Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Fri, 18 Dec 2020 15:23:32 -0300
> Willian Rampazzo <wrampazz@redhat.com> wrote:
>
> > On 12/17/20 5:53 AM, Thomas Huth wrote:
>
> > > +        # Hot-plug a virtio-crypto device and see whether it gets accepted
> > > +        self.clear_guest_dmesg()
> >
> > Your previous patch "[PATCH 1/3] tests/acceptance: Extract the code to
> > clear dmesg and wait for CRW reports" defined the method as
> > "clear_guests_dmesg". After fixing this in the code:
>
> Hm, I see clear_guest_dmesg in the code I have on my s390-next branch?

Ah, I had his v0 locally
(https://patchew.org/QEMU/20201211173134.376078-1-thuth@redhat.com/20201211173134.376078-2-thuth@redhat.com/).

The v1 is, indeed, clear_guest_dmesg, so, we should be good to go!


