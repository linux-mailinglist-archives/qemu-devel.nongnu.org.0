Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C7F2E25FA
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 11:52:18 +0100 (CET)
Received: from localhost ([::1]:40866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksOEC-0002SJ-Pv
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 05:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ksOCr-0001bI-JZ
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 05:50:53 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:46341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ksOCq-0001lC-2F
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 05:50:53 -0500
Received: by mail-ot1-f43.google.com with SMTP id w3so1497542otp.13
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 02:50:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mcp6HfaSC1Q0nGeue5pBU8KAZqi/mxZPgIIFlRWUbI8=;
 b=UDjTOBJjIyKZghhYLSGBgp2oSR/J2PR7WeouUUsU7T/YwpjMQVpTzPo4KayNF7a+Ji
 AgcdovlODvtoyadS5bVXw34Z6Vi21jnm6G3b6x8/XzK8S3OR7L0Ig6aHkVIDaIJD6iR9
 9UcNEBzUDRhlKFjPkUSh8rpFv/Qn7h9AWQR9W/rHNWodqm1PeXtNu5NqB8HWjw3Mc8bU
 qA3PGBaoUY4DUl+YGKnCxxfMoey59cDZMSoweP2bRL8L6D4biSeuXkkniDadfGfu3AMf
 jVBV81c+lwZp08IB/+aAVkC6QdUIP83XtX/lxrX+XqTrNLmMJzZ8vAdRsJ152ucqwJxv
 nkuA==
X-Gm-Message-State: AOAM533Gz9nDY8/g1aWvUnpwAA82P58So82y3hEPVE6gBba7K/w6tACD
 dAP+jRvGr05JZa9pZgHrH6dVRqdNZ34iGIkQSug=
X-Google-Smtp-Source: ABdhPJzzVhrhXP/gnsmNkufj3ECtnPATKC3ituppMkcjiOvLvMKhpenOonRl/tqHPVYx8wqrOtPe5UoDdHgp4J38DQI=
X-Received: by 2002:a9d:5c8b:: with SMTP id a11mr21910733oti.126.1608807050593; 
 Thu, 24 Dec 2020 02:50:50 -0800 (PST)
MIME-Version: 1.0
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <e90b9df0-5173-6e2b-3572-4f21ac318231@amsat.org>
 <2c478b3e-5098-1887-73b3-90f91a808ad8@ilande.co.uk>
 <1d33fa46-2079-ad40-d579-6e827543de50@roeck-us.net>
 <f04ae64-fa4a-2e21-1468-cf37315ec9b2@eik.bme.hu>
 <c64fe3a4-cd9c-b455-53ce-c53fb6cf0632@roeck-us.net>
 <8a3b2030-8ee6-fd56-6bfa-206457db84f@eik.bme.hu>
 <165973a-135e-3072-ee2c-afda64844770@eik.bme.hu>
 <20201224053216.GA60462@roeck-us.net>
 <88314cc3-6219-3dc-2981-279ef6442514@eik.bme.hu>
In-Reply-To: <88314cc3-6219-3dc-2981-279ef6442514@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 24 Dec 2020 11:50:39 +0100
Message-ID: <CAAdtpL7E+Vxe1FxP5F53AfyjUdJNh18LE198t-jvJbAkr8NXBg@mail.gmail.com>
Subject: Re: Problems with irq mapping in qemu v5.2
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.210.43;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f43.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 24, 2020 at 9:11 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
> On Wed, 23 Dec 2020, Guenter Roeck wrote:
> > On Thu, Dec 24, 2020 at 02:34:07AM +0100, BALATON Zoltan wrote:
> > [ ... ]
> >>
> >> If we need legacy mode then we may be able to emulate that by setting BARs
> >> to legacy ports ignoring what values are written to them if legacy mode
> >> config is set (which may be what the real chip does) and we already have
> >> IRQs hard wired to legacy values so that would give us legacy and
> >> half-native mode which is enough for both fuloong2e and pegasos2 but I'm not
> >> sure how can we fix BARs in QEMU because that's also handled by generic PCI
> >> code which I also don't want to break.
> >
> > The code below works for booting Linux while at the same time not affecting
> > any other emulation. I don't claim it to be a perfect fix, and overloading
> > the existing property is a bit hackish, but it does work.
[...]
> I think we don't need more complete
> emulation of this chip than this for now but if somebody wants to attempt
> that I don't mind as long as it does not break pegasos2.

Fine by me as long as pegasos2 doesn't break other OSes :)

Can we have integration tests of pegasos2 so we can modify the device models
without introducing regressions?
If it is not open-source, you could still contribute tests with hash
of tested binary
and provide the binary file to test on demand off-list.

Regards,

Phil.

