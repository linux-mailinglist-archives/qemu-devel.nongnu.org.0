Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2463066D1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 22:54:09 +0100 (CET)
Received: from localhost ([::1]:35986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4slM-0001Iq-DP
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 16:54:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4sjZ-0000WK-4q
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:52:17 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4sjU-0004ET-6B
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:52:16 -0500
Received: by mail-wr1-x434.google.com with SMTP id q7so3422400wre.13
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 13:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=sJ3krzR8qTEoWwqTIQx2csij37nYJrZafAsa00y/BJQ=;
 b=jd9uwhobrOohDaiYi+p3F6h7BE4dIVLcdf9fWfj8uCHQpM848h9k/TpAvPLtcQTAAY
 gmqmYm3eVKyk3qkpXrK4HGAFg/rTPGPVIA1zXYGBp4r//MYyC6cQ/1oSoCaXNsKj+Yxb
 exuJ/hqELBX88YuRSBEOCkXilWJ8RV/DXVAnVz1XPyln7hp1FEhjlGJxhO2/dgeVsECt
 t/H+gNQGTPr9hjalYx6v8V60I/QJQjMGwlcG3OZ9I5bGkN4S2D+ML7fG/2knCQaOTwr6
 XLD5cM44PV6POO0eN3cKSlR/YbBEG+j2d8V+9YWKgCOQ7Dn/uj8qpf6jTRYzEbydE19o
 F0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=sJ3krzR8qTEoWwqTIQx2csij37nYJrZafAsa00y/BJQ=;
 b=JdPLoz7I0EmpeOqka+pYegPHkdrS1GnAfnm2c6QqM+VaIGjTx2ACKPWUIjHxJhdiGf
 P5yNU9aiadN6LcrIARhchtgk/lBLvaE0dgaxnISKig1xMGahwXjCYYHcz/YbIEnfHdP8
 UTy9rb1GIWQSi9Yp9lrZ/FbvFoRHpwKHqbkvBVQfZZPL+QWdpsicFdvGsA2+bM1jAaht
 DsJcCwVlGGkJlU01bnhh6YPZcC9gCrW7ahIuEbwAB1mh6Q0yrX7fRD47ijcOnvG/49Dp
 +WzdqbHfNamnriUackanaob8kOpaVV4x3ikd+lvC6CIDpWGg4vTFX/Oe1wwKUGrIlRIt
 jDyw==
X-Gm-Message-State: AOAM531xNPKJQt2bhmc1rTrJwgkHlejkwktejoXKP6hTV9u3T6gVfXPv
 530Bw5reztnX/g4DXlRMbLg+Sw==
X-Google-Smtp-Source: ABdhPJyTY75+qAeP6D1YBbRbOCN/QN+yzqz+ual7gWXj8oS6kXf7x4azHNPfO+nzTO2xVDBKjYrKnQ==
X-Received: by 2002:a05:6000:1189:: with SMTP id
 g9mr13099141wrx.230.1611784330021; 
 Wed, 27 Jan 2021 13:52:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l5sm4370804wrv.44.2021.01.27.13.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 13:52:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 372671FF7E;
 Wed, 27 Jan 2021 21:52:08 +0000 (GMT)
References: <20210125144530.2837481-1-philmd@redhat.com>
 <20210125144530.2837481-5-philmd@redhat.com>
 <20210125164746.GE3538803@redhat.com>
 <992cbe66-dfae-7950-0d92-516b2f0c9717@redhat.com>
 <9f22d4b0-34ca-6798-3661-36057609c152@weilnetz.de>
 <30cc0c14-fbec-bb21-2b6b-8e295029bc1f@linaro.org>
 <8f1f2dc6-5ad2-7d48-c2f9-9afa1e4d4065@weilnetz.de>
 <81c810b4-1bd3-631d-4b5b-7e54a27a5b4c@linaro.org>
 <cd9265f7-4887-63bb-e36e-ace708d062c1@weilnetz.de>
 <875z3jy3tt.fsf@linaro.org>
 <89209f1b-29ad-e5df-6d45-b2480db4775e@weilnetz.de>
 <bbe4adfe-5bed-c37f-78c6-b120cb192aae@linaro.org>
 <a8aaa601-dcb4-ed87-d7ba-f6362942b596@weilnetz.de>
 <87wnvyw3eh.fsf@linaro.org>
 <d265dadc-45e8-3813-4e2d-cde007c389ac@weilnetz.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v4 4/4] meson: Warn when TCI is selected but TCG backend
 is available
Date: Wed, 27 Jan 2021 21:47:50 +0000
In-reply-to: <d265dadc-45e8-3813-4e2d-cde007c389ac@weilnetz.de>
Message-ID: <87tur2vyif.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P?= =?utf-8?Q?=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Weil <sw@weilnetz.de> writes:

> Am 27.01.21 um 20:52 schrieb Alex Benn=C3=A9e:
>
>> For example - debian-buster (arm64) running ffmpeg:
>>
>>    alex.bennee@8cd150a4b35d:~/lsrc/qemu.git/builds/all.tci$ ./qemu-aarch=
64 /usr/bin/ffmpeg -i theora.mkv theora.webm
>>    TODO ../../tcg/tci.c:882: tcg_qemu_tb_exec()
>>    ../../tcg/tci.c:882: tcg fatal error
>>    qemu: uncaught target signal 11 (Segmentation fault) - core dumped
>>    Segmentation fault (core dumped)
>
>
> Thanks. All I tried to say is that I prefer to replace those TODO=20
> statements by working code as soon as there was a case which triggers=20
> them. Most of those TODO statements are very easy to implement, so=20
> anyone can add them when he/she detects a missing one. If I get=20
> information about a scenario which triggers a missing TODO, I'll fix=20
> that of course. I just don't want to add that missing code blindly.

Your just going to end up playing wack-a-mole:

  TODO ../../tcg/tci.c:620: tcg_qemu_tb_exec()me=3D00:00:00.00 bitrate=3DN/=
A speed=3D   0x
  ../../tcg/tci.c:620: tcg fatal error
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  Segmentation fault (core dumped)

> Using `make check-tcg` helped finding and fixing one of them, future=20
> improved CI checks can find more, and so can examples like the one=20
> above. The error message tci.c:882 is INDEX_op_ld8s_i64=20
> (https://github.com/qemu/qemu/blob/master/tcg/tci.c#L882). The missing=20
> code is nearly identical to the existing code for INDEX_op_ld8u_i64, but=
=20
> with *(int8_t *) instead of *(uint8_t *), so maybe you can try that and=20
> confirm whether it fixes the reported problem. Otherwise I'll try to=20
> reproduce it with any mkv file.

ffmpeg is a good application for working out the SIMD code because it
features quite a lot of optimised code for each architecture.

> I recently tried running tesseract with qemu-x86_64 because I had=20
> expected that it might trigger some unimplemented TCG opcodes.

qemu-x86-64 is a poor choice as a relatively under maintained front-end
doesn't emulate a particularly new CPU or take advantage of the new TCG
features. ARM64 is pretty good because the default cpu for linux-user is
CPU max which a) enables all ISA features we have and b) exposes them
fairly easily to guest detection routines which probe feature registers.

> Instead=20
> it showed a general problem for native TCG: qemu-x86_64 allocates too=20
> much memory for tesseract and gets killed by the Linux kernel OOM
> handler.

Do you have a command line? That sounds like something that should be
fixed.

>
> Regards,
>
> Stefan


--=20
Alex Benn=C3=A9e

