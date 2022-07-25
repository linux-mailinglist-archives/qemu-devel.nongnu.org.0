Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E067580344
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 19:04:36 +0200 (CEST)
Received: from localhost ([::1]:47286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG1VT-0003h2-AY
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 13:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1oG1TI-0002D3-If
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 13:02:20 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1oG1TB-0003be-Mw
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 13:02:20 -0400
Received: by mail-ej1-x635.google.com with SMTP id tk8so21703098ejc.7
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 10:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=f/ru/Ase5EolFLlUUpxb6+XrJwZIrgyYDXsRhTx1ol8=;
 b=dVhCfSdB4BosJcDdvugl3JM5TnWmscKNxYUVrMKHVM0b5BloKCXe/4mYHeaS7csrLp
 s645ziC2pzX4XXYcoTpup7nKEnbx12Bj0V2eAHGH/K2WII5YQpn7PXnAkkOi+apFcScx
 xdYtX4ushAiGortAeNRTqfVfxYXzl2/Ohn0dh3hvfcPaodthpZ/2eJsISZt+M0pEd08d
 GL+HYAroaslr2Egs242hKTObdifbdG+0AkcYe4bMXz2lBkhP+GWvVZwP/bOooZSKbpQV
 Gbv9fEUJ2tuSFPqUZ31q/lPAho0DmR2O5AcoX1CQgqfZUwr/HsCMpj4aS83ExUmFdZIu
 NTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=f/ru/Ase5EolFLlUUpxb6+XrJwZIrgyYDXsRhTx1ol8=;
 b=ngzYOggnOWDlsEZM8TsdjtncvkqZsZY+HykSy3lR7GclRLQqn6b2mOLAalFHToGpCQ
 vF9qesRpttXfhONeyobqB/bUqGKmWqqzaq2gHLgEJE57B1RBh3Tz4R5r9qQc2JaSvrOn
 /2hoSa3AKuZ6KcaMjKye1yFielRjOZs+3rzvGrfwetBbOLx9Fu78dzY69Ty2eBLLMbRg
 Iwo/6D7KUytkad+pbLT3GTdrPyMT5IpwAlnbtsoyd9skSH/UnLfWRYd8fuMKvH1x/1IH
 fRB6bS6oxwHEYeXZ1OmInnJw3ErdL6uTAsG2BXpx9/GSJICNloF+pKuY1oa+ka57kOhd
 XbZg==
X-Gm-Message-State: AJIora9x5GMIQEbTwQt9j6Q1YJ4CDaueSByMoiwy/dX6F+74spVZp8gh
 7lq2A6aNho/eW3ptfMUNb2rDXw==
X-Google-Smtp-Source: AGRyM1sEyYikL1HioWjeRPe2aKpXTpFylkKqFg6QwJcPJ6Y36V2XsiiHNGRRtc+QP/SjFjPLYOZNRQ==
X-Received: by 2002:a17:907:7396:b0:72d:a080:86a9 with SMTP id
 er22-20020a170907739600b0072da08086a9mr10694532ejc.49.1658768531507; 
 Mon, 25 Jul 2022 10:02:11 -0700 (PDT)
Received: from smtpclient.apple (5-12-52-36.residential.rdsnet.ro.
 [5.12.52.36]) by smtp.gmail.com with ESMTPSA id
 g9-20020a50ec09000000b0043ba51a84f2sm7276287edr.14.2022.07.25.10.02.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jul 2022 10:02:11 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: TARGET_SYS_HEAPINFO and Cortex-A15 memory map
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAFEAcA8BJ+jphWCMNemBC30x+wf3PW2kqSqNz6pCHeD+RyBFeQ@mail.gmail.com>
Date: Mon, 25 Jul 2022 20:02:09 +0300
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C1F087EA-B319-493F-B7BC-BB94D75B443C@livius.net>
References: <8F58FBA7-17C8-44F6-9798-A65FD63E0E78@livius.net>
 <BE36745B-A3A6-443A-A290-31A5578F36E3@livius.net>
 <CAFEAcA_BcnzQ1KnRh=ovKTSahHCabc61n+BHvedqjC0bD2fKOg@mail.gmail.com>
 <4B583095-ED34-4D33-A193-59666FBFAB8A@livius.net>
 <CAFEAcA8BJ+jphWCMNemBC30x+wf3PW2kqSqNz6pCHeD+RyBFeQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3696.100.31)
Received-SPF: none client-ip=2a00:1450:4864:20::635;
 envelope-from=ilg@livius.net; helo=mail-ej1-x635.google.com
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



> On 25 Jul 2022, at 19:02, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
>=20
> We document what the guest can assume about the virt board
> memory layout here:
>=20
> =
https://www.qemu.org/docs/master/system/arm/virt.html#hardware-configurati=
on-information-for-bare-metal-programming
>=20
> Flash at 0, RAM at 0x4000_0000, must look in the DTB blob
> for all other information.

ah, ok, I probably missed this. :-(

btw, looking in the dtb blob is probably not a problem for a linux =
kernel, but if I want only to write a simple test that needs a timer, =
getting the timer address is probably more complicated than my entire =
test... :-(

> The one where SYS_HEAPINFO produces the bogus result putting the
> heap at 0x04000000, that you mentioned in the original report with
> the command line
>=20
> .../qemu-system-arm "--machine" "virt" "--cpu" "cortex-a15"
> "--nographic" "-d" "unimp,guest_errors" "--semihosting-config"
> "enable=3Don,target=3Dnative,arg=3Dsample-test,arg=3Done,arg=3Dtwo" -s =
-S

ah, the bogus one... that's a bit more complicated, since it happened in =
the early tests, and I don't remember how I did it, it might be that I =
tried to load my code in flash and my data in ram, but I'm not sure.

try to check the logic and avoid the cases when flash addresses are =
returned for heap, if possible.

btw, this might be a different topic, but on Cortex-M devices I'm used =
to configure the linker scripts to allocate the text in flash and the =
data+bss in ram; for qemu aarch32/64 devices I could not make this work, =
and I had to allocate everything in ram, which is functional, but =
probably not very accurate for some tests, that might fail when running =
from flash.


regards,

Liviu


