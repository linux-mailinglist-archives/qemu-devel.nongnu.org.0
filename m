Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB9145A61C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 15:57:47 +0100 (CET)
Received: from localhost ([::1]:46510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpXEv-0005cN-Rk
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 09:57:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mpXDE-0004s1-Az
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 09:56:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mpXD9-00069x-Gg
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 09:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637679354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=csIhbRkNiueVF91fLNcVz9KTUOCevWOvZW6cJ3BDPrg=;
 b=CheQ0OQD8DwhVuh1jDKDPEandGzSlLErD/y77wEncfET1BRh0mXxiG/u7xFdMYQIeVEUsS
 s00uzcVJVNte8u6jSVRjKhVb6xZOKX7I97mFRd3TThKYutHYUCyrxPB4ZeQtkC1xMT6uQU
 OI1CmlIR8mpxQP2ecljE96R2f2Pw9CQ=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-m0KefWswO3eMHiLFBbtG3g-1; Tue, 23 Nov 2021 09:55:52 -0500
X-MC-Unique: m0KefWswO3eMHiLFBbtG3g-1
Received: by mail-pj1-f69.google.com with SMTP id
 u11-20020a17090a4bcb00b001a6e77f7312so1474928pjl.5
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 06:55:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=csIhbRkNiueVF91fLNcVz9KTUOCevWOvZW6cJ3BDPrg=;
 b=0n3ZY0rGaQQseoQreN+e9prly56EiEz98j288OfZHpTuVDNmyghfwH6pPwwhWp1ggJ
 qPgww2u8kZty1yMB3gl6FTacLxwInm1oyClrUujXvuRcLvgmfv7p1AI6mDo9SwCKQFMj
 FQNVR/1iGa047xrf6G/CZXKKldtTsIq0xbQ6aYVFoUbI/q8r26ipQdOcD43B0qLzzcMr
 luD0VbDV23lKMVPcBV4tVuaSp21lYCiKth7A0415B8b4tU2C92wRoEIwLqKAsJxH89BK
 4bIKvbtDvmALp4Y+d4PoTHflL9CrpQ21qSlaWWv0ymd3aLTDirg/90dA08MkH4MXKrZP
 3llg==
X-Gm-Message-State: AOAM532Qh4PHtNJ4NkWUjQBl8yEoCv3rP2hxg7E4KdmhN2sPJ/1faPV8
 sBvdwxFa0u6cefrZe3t7tMO+xicyxnp8Fh5Y4zKxHGj6erSXoyvTIaF9L1xua9bdzKZpb7i8qVc
 HQOT++h8RlZ7wiiOJa/s1XPNm53Z/HQM=
X-Received: by 2002:a17:902:c3cc:b0:141:be17:405e with SMTP id
 j12-20020a170902c3cc00b00141be17405emr7890789plj.76.1637679351208; 
 Tue, 23 Nov 2021 06:55:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTkVxoKA+oSJFkeuKtiykfy00I3YRt2woaGh+D8GSG+SI5ytrSsbujGd+krQTMV9Y0Uka870orA4s+4OVZZcc=
X-Received: by 2002:a17:902:c3cc:b0:141:be17:405e with SMTP id
 j12-20020a170902c3cc00b00141be17405emr7890746plj.76.1637679350948; Tue, 23
 Nov 2021 06:55:50 -0800 (PST)
MIME-Version: 1.0
References: <20211122191124.31620-1-willianr@redhat.com>
 <5aa31f51-f9d3-ac21-4c09-28c4a05480ff@redhat.com>
In-Reply-To: <5aa31f51-f9d3-ac21-4c09-28c4a05480ff@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 23 Nov 2021 11:55:24 -0300
Message-ID: <CAKJDGDbi5Yv4N1qTQtEOgJP77G3aZoGFyEGHQy9Bw9Gc4EW0ww@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove me as a reviewer for the build and
 test/avocado
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 23, 2021 at 7:37 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 11/22/21 20:11, Willian Rampazzo wrote:
> > Remove me as a reviewer for the Build and test automation and the
> > Integration Testing with the Avocado Framework and add Beraldo
> > Leal.
>
> Thank you Willian for your QEMU contributions and reviews,
> they helped the community in having a better idea of what
> integration testing is and is not, and how to use the
> Avocado framework, having a better idea what Avocado can
> not do for QEMU needs. Also thank you for improving the
> documentation :)

My pleasure!

Thanks for taking the time to help me understand the basics of QEMU.

>
> Beraldo, thank you for replacing Willian as an upstream
> Avocado <-> QEMU projects bridge :)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > ---
> >  MAINTAINERS | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d3879aa3c1..8f5156bfa7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3469,7 +3469,7 @@ M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >  M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >  M: Thomas Huth <thuth@redhat.com>
> >  R: Wainer dos Santos Moschetta <wainersm@redhat.com>
> > -R: Willian Rampazzo <willianr@redhat.com>
> > +R: Beraldo Leal <bleal@redhat.com>
> >  S: Maintained
> >  F: .github/lockdown.yml
> >  F: .gitlab-ci.yml
> > @@ -3507,7 +3507,7 @@ W: https://trello.com/b/6Qi1pxVn/avocado-qemu
> >  R: Cleber Rosa <crosa@redhat.com>
> >  R: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >  R: Wainer dos Santos Moschetta <wainersm@redhat.com>
> > -R: Willian Rampazzo <willianr@redhat.com>
> > +R: Beraldo Leal <bleal@redhat.com>
> >  S: Odd Fixes
> >  F: tests/avocado/
> >
> >
>


