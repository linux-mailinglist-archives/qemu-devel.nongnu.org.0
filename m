Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C330F52314E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 13:17:36 +0200 (CEST)
Received: from localhost ([::1]:46388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nokLX-0006EW-Tz
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 07:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nokHk-0002jq-Gv
 for qemu-devel@nongnu.org; Wed, 11 May 2022 07:13:40 -0400
Received: from mail-yb1-f175.google.com ([209.85.219.175]:37882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nokHi-0002V6-3V
 for qemu-devel@nongnu.org; Wed, 11 May 2022 07:13:40 -0400
Received: by mail-yb1-f175.google.com with SMTP id m190so3328484ybf.4
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 04:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W6HGRMQANU/wlouNRl7w8s+nE+z4AmECvJ0dBlc0lLQ=;
 b=AnG7IkSBKJRnzgQs7qkawPmFVm5kEitIZdlnH9SCCkUuCVUKAhooo5N6ZyB/B+BeEa
 zIFZpTmbbRF5sCVWWD/T+q022nakhEJD7slWMYx4Q86tOLkD+cuIyPiNxdQUGQd6rEDZ
 cERLsYWKNxAr/OS20mzsCu84H6+hL4d1qG28ywPsFcmNrDXZiVsu9w7+rs2BPQwrlL0d
 MDrO0D+yXrhfjRMJnhsbeXFBNuN/ohXn5ATqqKz8d80ZViFtrm9Y7ncfNYgzZUCV779q
 Cd3zzQ2LgZIHAW2B1jpzKpiby++6CB6EygpA3flxwOnYnzJIekBCbl4Tlb03mDVXq9SY
 duXQ==
X-Gm-Message-State: AOAM530rqb0mnNN5yDrHje3zR7STCXSLnjhEZMi2gkt4aO6l7riLKnVK
 0OLt/9YYxUAEHropkHsX0+GKhoT91vbGQHb1S0g=
X-Google-Smtp-Source: ABdhPJxMBXyP56k8I+BLiwJJANd8MyY+UXXNr1miAGPFQ0LLv4Z6l98t8DOJlqoRHLYe2Mu6VR9Yw0CGp44wCtkVIFo=
X-Received: by 2002:a25:b98f:0:b0:64a:bc13:3b11 with SMTP id
 r15-20020a25b98f000000b0064abc133b11mr16099898ybg.214.1652267616325; Wed, 11
 May 2022 04:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220510195612.677494-1-thuth@redhat.com>
 <YnuCEPOj70J+1NXx@redhat.com>
 <CAAdtpL45Bn0wrDX6nQzkzQW=eqxrja4zOFcfG_gTz84LExSpoA@mail.gmail.com>
 <f40ceb7b-8412-8da2-7c16-2590debecaed@redhat.com>
In-Reply-To: <f40ceb7b-8412-8da2-7c16-2590debecaed@redhat.com>
Date: Wed, 11 May 2022 13:13:25 +0200
Message-ID: <CAAdtpL4oGW28-r0ZuMV9nBoZGDR5L9PYM2jsKw0Fmuwx68MWdw@mail.gmail.com>
Subject: Re: [PATCH] Remove Ubuntu 18.04 support from the repository
To: Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Robert Foley <robert.foley@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.175;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yb1-f175.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

+Fam
On Wed, May 11, 2022 at 1:03 PM Thomas Huth <thuth@redhat.com> wrote:
> On 11/05/2022 12.46, Philippe Mathieu-Daud=C3=A9 wrote:
> > +Robert
> >
> >   On Wed, May 11, 2022 at 11:30 AM Daniel P. Berrang=C3=A9
> > <berrange@redhat.com> wrote:
> >>
> >> On Tue, May 10, 2022 at 09:56:12PM +0200, Thomas Huth wrote:
> >>> According to our "Supported build platforms" policy, we now do not su=
pport
> >>> Ubuntu 18.04 anymore. Remove the related files and entries from our C=
I.
> >>>
> >>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >>> ---
> >>>   Seems like nobody touched the 18.04-based tests/vm/ubuntu* files in=
 a
> >>>   very long time, so I assume these are not used anymore and can comp=
letely
> >>>   be removed now.
> >>
> >> Or it could mean that they are working fine and so haven't needed
> >> changes...
> >
> > Yes :)
>
> At least for me "make vm-build-ubuntu.aarch64" is only failing with ssh
> timeouts (on my x86 laptop) ... is this really supposed to work with TCG,=
 or
> is this KVM (on arm hosts) only?

Yes this timeout code is not working. I suppose it is tied to the TCG host =
perf.
I suggested a pair of patches to increase it but back then Fam didn't accep=
ted
them because IIRC these VMs were used by patchew (previous to Gitlab).
Today we have better framework for testing, so I wouldn't use this script o=
n
CI, but it is still valuable for manual testing.

Robert's email doesn't work anymore. Since I don't have x86 workstation
anymore, I'll probably use these tests/vm for testing. So let me add a
"upgrade tests/vm/ubuntu to 22.04" to my TODO list. If I fail and nobody
miss them, then I won't object to remove them.

Regards,

Phil.

