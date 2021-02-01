Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F2D30B3B8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 00:53:08 +0100 (CET)
Received: from localhost ([::1]:33580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6j0F-0006KL-AZ
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 18:53:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6iz5-0005kX-R6
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 18:51:55 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:50863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6iz3-0003mg-Ff
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 18:51:55 -0500
Received: by mail-wm1-x336.google.com with SMTP id 190so815208wmz.0
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 15:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=m2ROEdv5NRQ2ofIXtED1IzRFu+0LPMJMYXDrzA24FJA=;
 b=dZFsit6KuevZwG4Cr3fjOowqh6fCRhGzfb/QYG1vdM3LGQUMvqbdzb2fLqBy3nEAOi
 BQwGjuOCiSbO5v+K/395eneOfIe/Fo+pSq6WlDGGZzEy6rONhfgKHiwq9qOf7yK4YX1N
 1Pl3rsIs4zXn2AMmPp0U3SfroE4013B4/Fpdq8cIMIueqZ5+HO1Mhrmb4K4vazvw724R
 m3pq9hF/gNiAczR04ARFMhzjaV2oql4mBb9Fe9JL0pouxMpRhYKSSziIzO3vTQ7eeXN3
 /rzoo5sFqMCKSsPoOToVK1RgGxQ4OR8NopqIARwdC377r+mVJMHLqFZSOdl6sPlYKT8z
 6MCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=m2ROEdv5NRQ2ofIXtED1IzRFu+0LPMJMYXDrzA24FJA=;
 b=DhfnJxcg4BINmYm9v7lscl/17CQLkfqMcfSKEdnxBKczufV+LpNzxt55OagEV0xePW
 b3FxJP926vEzk3daeg4kvg+XZcw5Q3Gs7ARQKgKLSYJPehM3d8lMkaGUnIS1WIkgngZi
 CXa3fWLDyLM3WaD/uObBlMWFx3Vg2tYOZLj4Vc6ZYA+etGB6KbETmajDHZN3m2brRI5Y
 IC1CAnAVBPBOYe+9eEfIks7b91nEw6UtN6DelTgEYlCrvEbBCnU9/aDXZSrpX03laFC/
 XPypA9iNRWrMuQY52ml60LbHSXhrjJXY6MoUzoWs5N3WnPHLJe/+J2HlSlb6OO9GjiV7
 4o8g==
X-Gm-Message-State: AOAM532a9AIy3BMpsIR1EhAUYVebchYP/uSLa2KNwAaEUiXVu6Ue7tvI
 hW1svXskehFdLimTUDG5f7nOtg==
X-Google-Smtp-Source: ABdhPJyRcx4DY+6ZtyGIq3GfOsqW87WK8TEV5S9TeP92G4iALAkZ1qw+7R9Wb8JugjGrmYpuJZjR/A==
X-Received: by 2002:a7b:c4c1:: with SMTP id g1mr1015902wmk.145.1612223511732; 
 Mon, 01 Feb 2021 15:51:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v4sm32886653wrw.42.2021.02.01.15.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 15:51:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E38941FF7E;
 Mon,  1 Feb 2021 23:51:49 +0000 (GMT)
References: <20210128185300.2875-1-alex.bennee@linaro.org>
 <CAFEAcA_R3phXwOtj-v-6-oCN891SjGSyAGwcx3_zDf+GFPWLqg@mail.gmail.com>
 <871rdzv9cf.fsf@linaro.org>
 <CAFEAcA8aLBFG9SjVqeDwbcGRU_chkt2s0E1i9BY+xDdXnrfO6Q@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] docs/system: document an example vexpress-a15 invocation
Date: Mon, 01 Feb 2021 23:50:04 +0000
In-reply-to: <CAFEAcA8aLBFG9SjVqeDwbcGRU_chkt2s0E1i9BY+xDdXnrfO6Q@mail.gmail.com>
Message-ID: <87y2g7tkh6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Anders Roxell <anders.roxell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 1 Feb 2021 at 20:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Thu, 28 Jan 2021 at 18:53, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> >>
>> >> The wiki and the web are curiously absent of the right runes to boot a
>> >> vexpress model so I had to work from first principles to work it out.
>> >> Use the more modern -drive notation so alternative backends can be
>> >> used (unlike the hardwired -sd mode).
>> >>
>> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >> Cc: Anders Roxell <anders.roxell@linaro.org>
>> >> ---
>> >>  docs/system/arm/vexpress.rst | 26 ++++++++++++++++++++++++++
>> >>  1 file changed, 26 insertions(+)
>> >>
>> >> diff --git a/docs/system/arm/vexpress.rst b/docs/system/arm/vexpress.=
rst
>> >> index 7f1bcbef07..30b1823b95 100644
>> >> --- a/docs/system/arm/vexpress.rst
>> >> +++ b/docs/system/arm/vexpress.rst
>> >> @@ -58,3 +58,29 @@ Other differences between the hardware and the QEM=
U model:
>> >>    ``vexpress-a15``, and have IRQs from 40 upwards. If a dtb is
>> >>    provided on the command line then QEMU will edit it to include
>> >>    suitable entries describing these transports for the guest.
>> >> +
>> >> +Booting a Linux kernel
>> >> +----------------------
>> >> +
>> >> +Building a current Linux kernel with ``multi_v7_defconfig`` should be
>> >> +enough to get something running.
>> >> +
>> >> +.. code-block:: bash
>> >> +
>> >> +  $ export ARCH=3Darm
>> >> +  $ export CROSS_COMPILE=3Darm-linux-gnueabihf-
>> >> +  $ make multi_v7_defconfig
>> >> +  $ make
>> >
>> > We probably shouldn't be recommending in-tree kernel builds, or
>> > polluting the user's environment with random variables. Try:
>> >
>> > $ make O=3Dbuilddir ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- mu=
lti_v7_defconfig
>> > $ make O=3Dbuilddir ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf-
>
>> Building a current Linux kernel with ``multi_v7_defconfig`` should be
>> enough to get something running. Nowadays an out-of-tree build is
>> recommended (and also useful if you build a lot of different targets).
>> $SRC points at root of the linux source tree.
>>
>> .. code-block:: bash
>>
>>   $ mkdir build; cd build
>>   $ make O=3D$(pwd) -C $SRC ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi=
hf- multi_v7_defconfig
>>   $ make O=3D$(pwd) -C $SRC ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi=
hf-
>
> That works, but do you really commonly cd into the build directory?
> I usually sit in the source tree...

I have tmux panes, lots of lots of tmux panes. It's more common to live
in the build directories for QEMU because I have to run the binaries I
build. For the kernels I usually have one pane in the tip of source tree
and a bunch of others for build configurations I'm actively messing
about with and rebuilding.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

