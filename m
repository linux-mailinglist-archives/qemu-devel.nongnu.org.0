Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CD9490AA3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 15:38:46 +0100 (CET)
Received: from localhost ([::1]:57136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9T9h-00038g-5O
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 09:38:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9Seu-0006cw-0s
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:06:56 -0500
Received: from [2a00:1450:4864:20::335] (port=44800
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9Ses-0000Jd-EA
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:06:55 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 f141-20020a1c1f93000000b003497aec3f86so22962761wmf.3
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 06:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=haBFR/tCaEl2/2O5GoOMqX1kri13yg3TjoudYFO4LqQ=;
 b=GsbIO3aCUECEGhVInQJXHZk42/mr8C1llrWQKIwvDbclM/Wb5RoWLCG1eSmMoC/Y+C
 cwWrzJgUVTArDqruxY+v5mxX3qiGjZB3XfOgCr8pdrSw66kxUMtuDejbp5mfDwHY10fF
 zCQI0ZDNFK+9S/WOM1Hbxcd5yH/0qWvXU7ONSf5Le5A3KW+9rjuy04k0BfTcbu3/mmet
 XGC8oWs1K5tf7YmLbzIKzcM8KyefVwOKmuF3wie5Ho+o9IuA6bU/Fyxn/uiRoT3m+bRR
 Eebv25nps9NK0XiPcgdpdSfcFBRdnw4Xi9NY4g2ew1+VeBBV7NuTgmeFWBG1nDWrgPhr
 T1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=haBFR/tCaEl2/2O5GoOMqX1kri13yg3TjoudYFO4LqQ=;
 b=4UxSUKUONAexeMZrAp6pztpFfBx/AVY2XadpPT7G1NJfYXVh2tdxtPre/VlIGW1FjW
 5jvkVRFYcjyfOKHNPuFO4SbwKOLuX1Ee/eKSc+Obe0xN1qahzYMd0fWCzlRaHkjSKMvJ
 OMZuNQXi+qZygCkfHE3MMEZZTXuT3WjN+Sbmbv/p6oRXN8ntHYvuep7bLsdQ6SgisAiA
 vGMr5sGSF+csHjwunrf9aPD12gqe61xkZPba/+buBmh5vqAooouP57pCLHFP/+BBNqlS
 eJ5Q4zdGR2UbeKdFrKFgXRKG23IGE38u+wDgFrvfK0I5/s4WyEn9YXCSELKO1DqlH5WF
 7VNA==
X-Gm-Message-State: AOAM532/Jen4wfPHUtnAuAp2P2FcMQgOLUviETnsavl9DFdaw74hxEUy
 qFidY2lSQTIX2z2co2XgQPdPAEHXdTQpsNmuoOq3+g==
X-Google-Smtp-Source: ABdhPJzeicc3lJsZsEKXxYsDzAmNcTOhutR6PZdzklTbMPb481q+7u1IpIYS88OnwZFQAA2L5p7TbVk/wMaMrM29Wr8=
X-Received: by 2002:a5d:6848:: with SMTP id o8mr20126878wrw.2.1642428412707;
 Mon, 17 Jan 2022 06:06:52 -0800 (PST)
MIME-Version: 1.0
References: <586FEC07-844C-4E1B-88E0-93B97FFC9010@livius.net>
 <CAFEAcA_=jn1G==9R1=LuU7GF0=LWPz92f1Qx9xO7w+m+TqL1Tw@mail.gmail.com>
 <F140E9AC-F44C-44A9-8670-F60E33046B83@livius.net>
 <574D1950-B892-430B-A450-23262C258950@livius.net>
 <ef5e98d4-d8b2-fc6e-2735-53c075db3f3b@redhat.com>
 <CCB6E84E-5F90-4FC6-BEEB-42A7C591BDBF@livius.net>
 <CAFEAcA9sNksi2=xiFUp_r0_NeCuUKXYU6sd1LDvX=j0+Mh3gYQ@mail.gmail.com>
 <3DE1FD39-B0F7-45D2-BC44-66D9B0533057@livius.net>
In-Reply-To: <3DE1FD39-B0F7-45D2-BC44-66D9B0533057@livius.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Jan 2022 14:06:41 +0000
Message-ID: <CAFEAcA8aMc40ea=F1P7vHHeNF=rqE+B=sz+6QdzrOWGwZU7W6A@mail.gmail.com>
Subject: Re: ui/cocoa.m compile error (Cocoa -> SDL)
To: Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 Jan 2022 at 12:52, Liviu Ionescu <ilg@livius.net> wrote:
>
> Then perhaps it is a misunderstanding from my part, if I try to start the=
 vexpress-a9 machine using the line copied from Thomas' presentation, the c=
onsole shows, it prints "Guest has not initialized the display yet" using t=
he PC-like font, than it crashes with:
>
>
> ```
> Exception Note:        EXC_CORPSE_NOTIFY
>
> Application Specific Information:
> *** Terminating app due to uncaught exception 'NSInternalInconsistencyExc=
eption', reason: 'NSWindow drag regions should only be invalidated on the M=
ain Thread!'
> abort() called
> terminating with uncaught exception of type NSException

This is newer versions of macOS being stricter about enforcing that
some operations are only permitted on the correct thread. Older versions
let QEMU/SDL get away with doing them on the "wrong" thread, which
all happened to work. We had to do some reworking of the cocoa UI
code to handle a similar issue.

> If you think that --with-sdl should work on macOS too, I can try
> to investigate, perhaps it is only a small mistake somewhere.

It looks like it's "code would need to be updated to fix the
problems that newer macOS complains about", which nobody has done.
(I think this is probably code within QEMU, rather than code
within libSDL itself.)

-- PMM

