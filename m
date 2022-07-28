Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727EE583C94
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 12:56:54 +0200 (CEST)
Received: from localhost ([::1]:45774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH1CH-0003I0-I6
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 06:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH19A-0008UL-Q5
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:53:40 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:39666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH198-0001O5-R8
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:53:40 -0400
Received: by mail-yb1-xb34.google.com with SMTP id r3so2648727ybr.6
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 03:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kg3ZKLrGZx0sBTQ9U5JSXETgg5YJ4TJCpuiGnoR9CIA=;
 b=ANwJoMAsWEQWS50jCEVSkA4XRxlVvf11hhZZHbL9lr7xKGMLEDmg6xHAFrpoVQSk3f
 QQvvXFouPCnbRFZPaBVgeyporMzk6u8xV24EOpG0NRkbY5Fl4ooTJxK0H1UamEoWrTSb
 a+J/0cjomUJLu1248JPuEUF81zYTLCxiqH3Sq3VWLipgnybFIATRQljJyA1hB9zAWXAq
 G0UIQ/6RRvgNXiEZd2YIEnTVtsf70VZttOlnAFAmWnjU/wZi/TpmmoY0gOwxm2xBzGCC
 e0dccQUq4638c3MUANPVQcUL67DXPqVRS67YTqjSRimbay+rEHQRBNkFHw3wYhmX9rBh
 4cYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kg3ZKLrGZx0sBTQ9U5JSXETgg5YJ4TJCpuiGnoR9CIA=;
 b=s1NcPH3ZCMFwPgAuQR4KR/MZeyDTusOZpme8PRTTzlcInUxDHoKLD6nmK41pNq6pyI
 kjsfDj+4IBV1O9XPmLoB0WzlkqkaSM7KcxF7sbjpaAoZh7rgf+OQ7igYFwC1YstAQ89A
 Vw0TJsNSWJlY15Y2y1YDPuq7Yje6aEmB0XGBNiPSwl7G+6k1L4JLp4TATFSL4mIRszBp
 892lm9PVplnMzvp/gLTdq+Grkj3xdk8q1rdnCFOlNUewtB2OsP2BcoTnx5vTeZO1ZYgv
 MgGDqug3CJqBxAmk2MBx7O4S/0DCF3Os9EhgO+O9wobFxL+S82ivl3StBqd4OXQSwNyR
 uhxw==
X-Gm-Message-State: AJIora/CL8iGxK8ex50Zsy/Mnj2gyJtZsckeGH1T/EFCrLN2pydIJTrj
 897rAbeS/rGqeZ3SG+YWWPtBTGKrd4diL2U53V3JKQ==
X-Google-Smtp-Source: AGRyM1uDJ8rKXrjAA/tZRuHaQ0CrJ6Bk54xLyc+vRoT6PmKUYD6HhSrtg3DdyaUgpNWy54uS3nmyowC0xQEGr9Kvd/Y=
X-Received: by 2002:a25:cf47:0:b0:671:8224:75c6 with SMTP id
 f68-20020a25cf47000000b00671822475c6mr5459531ybg.288.1659005617262; Thu, 28
 Jul 2022 03:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220728093558.1163751-1-imammedo@redhat.com>
 <YuJbaxMbqNF+Cw65@redhat.com>
 <CAFEAcA85qvEjV53XMs3uDWKqzY4vrLqxfLKjZ_qfbrYMmfkx=Q@mail.gmail.com>
 <YuJjhHLzQEx4Ui1J@redhat.com>
In-Reply-To: <YuJjhHLzQEx4Ui1J@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2022 11:52:57 +0100
Message-ID: <CAFEAcA_cH7_r7vFYno1A=1XfjfWHj=VbDY62up2yqrkQ3VdTLw@mail.gmail.com>
Subject: Re: [PATCH for-7.1] applesmc: silence invalid key warning in case
 default one is used
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org, mst@redhat.com,
 t0rr3sp3dr0@gmail.com, alex.bennee@linaro.org, dgilbert@redhat.com, 
 agraf@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jul 2022 at 11:23, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Thu, Jul 28, 2022 at 11:05:13AM +0100, Peter Maydell wrote:
> > On Thu, 28 Jul 2022 at 10:48, Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
> > >
> > > On Thu, Jul 28, 2022 at 05:35:58AM -0400, Igor Mammedov wrote:
> > > > QEMU probably can't carry OSK key[1] for legal reasons so it
> > > > can't supply the valid default key. However when tests are run
> > > > applesmc will pollute test log with distracting warning,
> > > > silence that warning so it won't distract maintainers/CI.
> > >
> > > What test is causing this problem ?
> >
> > bios-tables-test -- see here for the relevant bit of the log:
> >
> > https://lore.kernel.org/qemu-devel/CAFEAcA8u8jm7b+JD_t0qMNMy+WSJPOw=3Dq=
xqptZpwTp=3DTkcXrhg@mail.gmail.com/
>
> The right fix is for bios-tables-tests to pass an explicit 'osk' value
> then. As its a test it doesn't have to be a genuine OSK, jsut any old
> 64-byte string
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index 359916c228..f6b5adf200 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1632,7 +1632,7 @@ static void test_acpi_q35_applesmc(void)
>          .variant =3D ".applesmc",
>      };
>
> -    test_acpi_one("-device isa-applesmc", &data);
> +    test_acpi_one("-device isa-applesmc,osk=3Diamalsonottherealoskimjust=
heretostopbiostablestestspammingstderr", &data);
>      free_test_data(&data);

We should either have a comment saying that this has to be exactly
64 characters and it doesn't matter what they are; or we could use
 any64characterfakeoskisenoughtopreventinvalidkeywarningsonstderr

:-)

-- PMM

