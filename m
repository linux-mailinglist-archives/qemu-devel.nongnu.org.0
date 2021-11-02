Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FE944314E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:11:27 +0100 (CET)
Received: from localhost ([::1]:54730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvRe-000687-OW
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mhvGa-0004I5-3J
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:00:00 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935]:37439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mhvGX-0003ZS-JB
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:59:59 -0400
Received: by mail-ua1-x935.google.com with SMTP id l43so3261858uad.4
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 07:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2jDJ9Pi2s0s3dOcX6V2RjL1lFMDYz+VbCF07KRga1+Q=;
 b=KnglMui075VI552MX4BlmzAkY0tjRjmaQdFA8SQ21ic5Q5OlVv5i1cEKB2lXis/tJB
 MUKMQOZYDGD6/QKENHx6MbJdAkBBbx6seCgDS7oHrPp1iiGfd3C8OHJB6MC9hxyJoEJx
 c55vX+3XjEei9jFk2K5BVrZET8XjMkYqhl9ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2jDJ9Pi2s0s3dOcX6V2RjL1lFMDYz+VbCF07KRga1+Q=;
 b=a9tYVjiUUkNG5PEo7th1mLVsVaDv0hLo3V9QXqua6/pNxvvlocUITt619QbRFt9rod
 uIUrX9eTS2svNxFO6yir5s7YLcJiwdn1sPuc4f4fzd7pivsRc3V+FrQvcxfcAQMxROZg
 p7qRLGDo5+3ySj8p1y2LLKRaEVYUmfI1DXeEcIpUDq2tRuH2ZkUl+zzwAbwWu8EwHdtM
 VaTZtGy9TGwOEKXuFcy6etHbV9F5QcKNLRgQzfsMOBdog4UGweVvVGw1ygJuiHy8MK6z
 fOZtKNpY5bAkDueBG28kyiyhsbiznPDY2OzClRfcTfNa4N432kG8zEMrSGXH2bLfUWri
 a3hw==
X-Gm-Message-State: AOAM5308GUgbwBwV1YOZKtVRPgZH/BYd1+/fglIhf7glug1mqJQbDOwI
 OruFbvBgvkDSN1KMmnJEq5L7EW4SFuXAbrKkq3inAg==
X-Google-Smtp-Source: ABdhPJyx2beRBZJf7GxDAsnMYZVFFvz0UIER/MTEuaoClq8PGcmmFvvhOTT5jV/YwtgTt7mW9XV7K5/Kvwb3wSQIA0E=
X-Received: by 2002:a05:6102:dcb:: with SMTP id
 e11mr26706693vst.59.1635865196421; 
 Tue, 02 Nov 2021 07:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
 <20211026002344.405160-7-sjg@chromium.org>
 <CAFEAcA-UukuQXT3ebcboiVOSn0J+88w-kzoH8jE1JVxQnoeuvQ@mail.gmail.com>
 <CAPnjgZ2C8okdUMcgKjuLgV8JdPexYY0=9NtbSOHO81dN7=2RCg@mail.gmail.com>
 <CAHFG_=XWc+Fb=m=SHC6=y4KeF533yqCNk=Ae088oAZyjOULPaw@mail.gmail.com>
In-Reply-To: <CAHFG_=XWc+Fb=m=SHC6=y4KeF533yqCNk=Ae088oAZyjOULPaw@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 2 Nov 2021 08:59:45 -0600
Message-ID: <CAPnjgZ0O56yokanMjybQKa1kBmtFHHbDfQ0sPPawrbLWtw7aDQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/26] arm: qemu: Add a devicetree file for qemu_arm64
To: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=sjg@google.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Anderson <seanga2@gmail.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Tom Rini <trini@konsulko.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Fran=C3=A7ois,

On Mon, 1 Nov 2021 at 11:33, Fran=C3=A7ois Ozog <francois.ozog@linaro.org> =
wrote:
>
> Hi Simon
>
> Le lun. 1 nov. 2021 =C3=A0 17:58, Simon Glass <sjg@chromium.org> a =C3=A9=
crit :
>>
>> Hi Peter,
>>
>> On Mon, 1 Nov 2021 at 04:48, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>> >
>> > On Tue, 26 Oct 2021 at 01:33, Simon Glass <sjg@chromium.org> wrote:
>> > >
>> > > Add this file, generated from qemu, so there is a reference devicetr=
ee
>> > > in the U-Boot tree.
>> > >
>> > > Signed-off-by: Simon Glass <sjg@chromium.org>
>> >
>> > Note that the dtb you get from QEMU is only guaranteed to work if:
>> >  1) you run it on the exact same QEMU version you generated it with
>> >  2) you pass QEMU the exact same command line arguments you used
>> >     when you generated it
>>
>> Yes, I certainly understand that. In general this is not safe, but in
>> practice it works well enough for development and CI.
>
> You recognize that you hijack a product directory with development hack f=
acility. There is a test directory to keep things clear. There can be a dev=
-dts or something similar for Dev time tools.
> I have only seen push back on those fake dts files in the dts directory: =
I guess that unless someone strongly favors a continuation of the discussio=
n, you may consider re-shaping the proposal to address concerns.

As stated previously, I would like to have at least a sample DT
in-tree for all boards. I cannot see another way to get the Kconfig
options in line. If we are able to put these files somewhere else in
the future and get them out of U-Boot, with perhaps just an overlay
for development purposes, I'd be keen to see it. But for now, this is
where we are, I believe.

In this particular case, this is not just a dev hack. It is also for
CI tests which need to use a devicetree. See for example here:

https://patchwork.ozlabs.org/project/uboot/patch/20211101011734.1614781-15-=
sjg@chromium.org/
https://patchwork.ozlabs.org/project/uboot/patch/20211101011734.1614781-24-=
sjg@chromium.org/


>>
>> I am able to use
>> QEMU versions that differ by two years, partly because I am not trying
>> to do anything clever.
>>
>> I have sent a patch to add an indication of where the devicetree came
>> from, to help with visibility on this.

Regards,
Simon

