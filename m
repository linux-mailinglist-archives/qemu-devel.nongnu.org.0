Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553504442A7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 14:51:11 +0100 (CET)
Received: from localhost ([::1]:55924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miGfV-0001Ts-TQ
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 09:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miGec-0000nh-As
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 09:50:14 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miGeX-00089A-Uk
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 09:50:13 -0400
Received: by mail-wr1-x431.google.com with SMTP id b12so3709056wrh.4
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 06:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=HpVMTF3gIdu4QXpAqls2HNiPmigLl2ZyB3cyL3ivBrU=;
 b=jdcSWPxWJRXVCM7mmC9skoOLA81M9Dtc/cNJB8IRu3gdQXjbYzA2rjxT/3nqtFixNT
 2LMExrBQcaOSkGlB1Lv6+ZW4SEIc9nhYPPRYkI5F0awjAXgJZstZccmasee4ZrxHQ8hL
 z1dPn+ZeVp1h8jQaEDT1pyV06/0+prdqV3ODOU/e6ws6yPMo/Xe6cqdJ5DiZT8BvY4Tf
 BVuR1M24KmPLLbEOOcmRr5MTjWvtJ5uGUyI0/1SddfKTzcrFTKmHD2H1KSQ5Sm4hJeuJ
 3NpcqX1fZ57q4xw0Z8NuThmTxVh1quPM7FWTiuynY1c+ab3XdvTt7BVz05edkuhNLkoz
 1lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=HpVMTF3gIdu4QXpAqls2HNiPmigLl2ZyB3cyL3ivBrU=;
 b=l78bWj7kh1HGpVIn45xne3pe07sW2AX8KlekcvVe+y1pgTl/vntaN820NOdLt0VSDI
 FW2Kfv1r3fmOA4kzUAoio1fqRhWYFxzU/aA62y+pBT3lHZvCvouQwrEF86RAoV8hMqcy
 oXDvHT694msRzE3fLX1Ii2eOG4UB/26OJCuqXlOZQS6WcMAXEeyIDGcrSysI7a3XF6t9
 jc2Do4c0zl6kBFQ/BfScbC+rzZmGeBGvskry87jucTafJcrii0iXo8/YiA5Asvn3RSZk
 WO2ga8MEDB+dKiOE7ATPd2Ne6zqHBpcU9cnV2tYqLjJ0NEAclHyzcZYCM+y4XZTUnu/H
 ChIg==
X-Gm-Message-State: AOAM530w9aqOU84j3Lsq676LkY0KLIdAvKOjFxb1kSRCw7SzC7RKrcCO
 IWmiFN3VmUjBjkff272ix/zhHA==
X-Google-Smtp-Source: ABdhPJyInpQOsJup0hWXziRiFB24QMYSTIAMp+iD3FA2IZPRGYwMe4BzjdlJ63T9EmWHZrcJy/ueOA==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr56488465wrx.433.1635947405930; 
 Wed, 03 Nov 2021 06:50:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u16sm5236384wmc.21.2021.11.03.06.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 06:50:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3BBC81FF96;
 Wed,  3 Nov 2021 13:50:04 +0000 (GMT)
References: <1635698589-31849-1-git-send-email-tsimpson@quicinc.com>
 <1635698589-31849-29-git-send-email-tsimpson@quicinc.com>
 <e1d3d003-f287-7f82-d604-6f43b0d9c55c@amsat.org>
 <2f35d0c6-0ba7-b911-56db-c1ed9ae4afbc@linaro.org>
 <SN4PR0201MB8808814113CBE84889CD5234DE8A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <3e93e507-da92-0a1c-346b-ebfde27168fc@amsat.org>
 <d2395c92-4ece-31a3-8bd6-24345c946780@linaro.org>
 <SN4PR0201MB8808870B218F0DFCE1AE4B20DE8B9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87zgqmjypq.fsf@linaro.org>
 <SN4PR0201MB880807096E4D98700320E4FFDE8B9@SN4PR0201MB8808.namprd02.prod.outlook.com>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Taylor Simpson <tsimpson@quicinc.com>
Subject: Re: [PULL 28/30] Hexagon HVX (tests/tcg/hexagon) hvx_misc test
Date: Wed, 03 Nov 2021 13:31:53 +0000
In-reply-to: <SN4PR0201MB880807096E4D98700320E4FFDE8B9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Message-ID: <87ee7xjqlv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brian Cain <bcain@quicinc.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?M?= =?utf-8?Q?athieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Taylor Simpson <tsimpson@quicinc.com> writes:

>> -----Original Message-----
>> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Sent: Tuesday, November 2, 2021 11:42 AM
>> To: Taylor Simpson <tsimpson@quicinc.com>
>> Cc: Richard Henderson <richard.henderson@linaro.org>; Philippe Mathieu-
>> Daud=C3=A9 <f4bug@amsat.org>; qemu-devel@nongnu.org;
>> peter.maydell@linaro.org
>> Subject: Re: [PULL 28/30] Hexagon HVX (tests/tcg/hexagon) hvx_misc test
>>=20
>> Taylor Simpson <tsimpson@quicinc.com> writes:
>>=20
>> >> -----Original Message-----
>> >> From: Richard Henderson <richard.henderson@linaro.org>
>> >> Sent: Monday, November 1, 2021 10:03 AM
>> >> To: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>; Taylor Simpson
>> >> <tsimpson@quicinc.com>; qemu-devel@nongnu.org; Alex Benn=C3=A9e
>> >> <alex.bennee@linaro.org>
>> >> Cc: peter.maydell@linaro.org
>> >> Subject: Re: [PULL 28/30] Hexagon HVX (tests/tcg/hexagon) hvx_misc
>> >> test
>> >>
>> >> On 11/1/21 10:17 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> >> > On 11/1/21 15:09, Taylor Simpson wrote:
>> >> >> Plan-A should be to update the container with the new toolchain.
>> >> >
>> >> > IIUC Richard is going with Plan-A: wait Alex queue get merged, then
>> >> > retry merging this pull request.
>> >>
>> >> Correct.
>> >
>> > Agreed.  Just let me know if Alex isn't going to get the new toolchain
>> > merged in time, and I can go to plan B.
>>=20
>> The PR has been a pain to get working but it should be in soon. Just nee=
d to
>> work out why the signals test has broken between master and my
>> PR:
>>=20
>>  https://gitlab.com/qemu-project/qemu/-/jobs/1739288510#L1318
>>=20
>> vs
>>=20
>>  https://gitlab.com/stsquad/qemu/-/jobs/1740048034#L1316
>>=20
>> Could it be a toolchain thing?
>
> Not likely a toolchain problem.  If I can access both of the signals
> binaries, I can confirm.

Testing against two signals binaries I see a 4-7% failure rate against the
new binary versus the original pre-toolchain change one. That's not to
say the binary is broken - it could be a subtle change that exacerbated
our existing poor signals support.=20

  https://transfer.sh/xA2ejk/signals.old (pre-toolchain change)
  https://transfer.sh/vSsn5s/signals

something in the CI ensures it fails much more reliably as U can't get
it to pass on a retry.

>
> Richard was doing some changes in qemu related to signals.  Are his
> changes available in both repos?

I've tested against master and rth/tgt-next (742f07628c0)

>
>
> Taylor


--=20
Alex Benn=C3=A9e

