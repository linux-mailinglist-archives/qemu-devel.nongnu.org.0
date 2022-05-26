Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F32534EC4
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:03:17 +0200 (CEST)
Received: from localhost ([::1]:35502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCCy-0005WF-02
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nuBwV-0002Oj-Sh
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:46:16 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:36575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nuBwT-0002bt-QJ
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:46:15 -0400
Received: by mail-ej1-x633.google.com with SMTP id gi33so2554497ejc.3
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 04:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rqzNPNRvnB3umrv7eweYLN7LsKWXXUibBj8k2uiO8dc=;
 b=208mG8RiMHChr0t+bnEUoJTXTeQocPeM/SZQlgxc6CCiSiGjo4ay3udMybEJSrkT6N
 FZobwlhJPy8PbSgOhrXHsY11n8qi0DmphRgZaud8wPbXdsBP8tbOggxRcBX9JFHZqSKW
 ViKrP7IZmhqF9gvo+om3Dn1GpsTF5nUzzN50iEEdPl8dvRO5d/UhaW26I8skhqcw1kcp
 kVZqloALt2V3FUvOVpui9OVEve0RANKW1D6MPg9NRjrciprKXYORvDZozkubKkgeZFQR
 JGOY4cgQNfbs09pzI7PMBEOcWlneQj9aHKTKDp4IetVwHrVAmmSn58tlHxeV48pbkXh8
 9u0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rqzNPNRvnB3umrv7eweYLN7LsKWXXUibBj8k2uiO8dc=;
 b=5PAKGX3XkrzuQ3abMYb6EfAF2jE8R4RCQissp+ygriSUwQmITEyAF4zC4eE2NzFf1P
 mebS7EougLI6IavIwbE9iL90CZi9SHHYmgy0RSVw0guv/dOGVc/WxsgN9absfB9Gp5uQ
 fXGT5Pp0q1s3arb74DeBemt0y7XG+jDgYL0o0Br3+XsiNrmg6k5tymFFg8eucOHmtf9a
 gNYAyrx8eIMa4NB+QWclrVad5+KbBNzgGa+rRQ2dib77GJ41hQDcLPiucp/Crq+qFbZ1
 /iesEhOJxDX7K7+0/vjAxwvsNureJqgydCAp7rp4C22v68191tLTisrwDYyTfAUT30HB
 vqjw==
X-Gm-Message-State: AOAM5336eYFmUllnQ1oElLUKv5j64/yF7BGAMTjTRo/QHNM32WRsqPdX
 8fDMmImSLCpo6+QXblZXkvHopg==
X-Google-Smtp-Source: ABdhPJxjd6Rk427PYt7cc1m+rs1N0U4IfG2E0EHxq/3a6CsCQDxHBkJ7KmpCl3jLj+g+OLzrzcyerA==
X-Received: by 2002:a17:906:6009:b0:6fe:9813:14ea with SMTP id
 o9-20020a170906600900b006fe981314eamr31895781ejj.732.1653565572191; 
 Thu, 26 May 2022 04:46:12 -0700 (PDT)
Received: from smtpclient.apple ([86.121.23.37])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a05640240d400b0042aad9edc9bsm716873edb.71.2022.05.26.04.46.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 May 2022 04:46:11 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: AArch64 semihosting?
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAFEAcA94DMQA_HeGJenzfPq2+eTv0gnpBd-EnGTjQzGnudNGNw@mail.gmail.com>
Date: Thu, 26 May 2022 14:46:10 +0300
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C565EE73-CDB1-4D69-8158-4125FDF8F400@livius.net>
References: <AADD58D2-C3BE-40DF-8EE5-3A901F4F8F04@livius.net>
 <CAFEAcA-n4GMq1_SCdTDp6sQmHzyyzTk5hav4QqOY3-j3Sr86Jg@mail.gmail.com>
 <EA9AEE55-A416-4819-98FF-E51B2317390F@livius.net>
 <CAFEAcA_beHgi7pg+ByW4ufG5qfz5n7o4ZP22WuayTtdGSQ_EQQ@mail.gmail.com>
 <0B956505-BFF3-4ACD-AAF9-7F939F426274@livius.net>
 <CAFEAcA94DMQA_HeGJenzfPq2+eTv0gnpBd-EnGTjQzGnudNGNw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
Received-SPF: none client-ip=2a00:1450:4864:20::633;
 envelope-from=ilg@livius.net; helo=mail-ej1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



> On 26 May 2022, at 14:08, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20

I confirm that, started via "-kernel aarch64-boot-libgloss.elf", with a =
single "--semihosting-config", the app ran properly, displayed the =
printf() output and no longer crashed.

```
ilg@wksi ~ % =
/Users/ilg/Library/xPacks/@xpack-dev-tools/qemu-arm/6.2.0-1.1/.content/bin=
/qemu-system-aarch64  "--machine" "virt" "--cpu" "cortex-a57" "--kernel" =
"/Users/ilg/My Files/WKS =
Projects/micro-os-plus.github/work/aarch64-boot-libgloss/Debug/aarch64-boo=
t-libgloss.elf" "--nographic" "-d" "unimp,guest_errors" =
"--semihosting-config" =
"enable=3Don,target=3Dnative,arg=3Dsample-test,arg=3Done,arg=3Dtwo"

Hello World 3!
arg 0 =3D sample-test!
arg 1 =3D one!
arg 2 =3D two!
...
```

> ... You want both '-s' and '-S'

Same with '-s -S' and the elf loaded via GDB in Eclipse.


Thank you,

Liviu


