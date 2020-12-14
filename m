Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A10C2D9A85
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:03:15 +0100 (CET)
Received: from localhost ([::1]:56344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopNa-0007pb-9z
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:03:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kopLd-0006U7-B9
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:01:13 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kopLb-0002Oy-4H
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:01:12 -0500
Received: by mail-wr1-x444.google.com with SMTP id w5so13003804wrm.11
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 07:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=LJIJ4+pRMUODPJruA4OpUhe/H02AhG/uC1x2CC83eLQ=;
 b=wdhkvJMPOWfqkRSmi2M4CURsU3kj0vvo9CoIgAZRhRHpop3zIURs+qcNs/uxTMxLNp
 jlgP8+1pqdXZ/ksCgWK6Hvc1lxxH41JOwrspmYZZC7+qXXWtDC7IupuPqfL87Q0BlROQ
 CbvhNI58o4C2pkVWVe0hxmnimflWcQOpAw/9KIXKizOwg6yVp+167EvdKrhFkB/Ke2ag
 2boaImlYTdplutZKICr774K5wTVsX0QM5lX3Zl73EUe/U53uxXHlV6ciaJRqXI486/f3
 7Vp2aVvfUkgdop2jivKiMGm+N59WTqrDaaLI3cMsStCDzfZcnS5BYQ0fLKGI9InBqpnT
 eOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=LJIJ4+pRMUODPJruA4OpUhe/H02AhG/uC1x2CC83eLQ=;
 b=lfxVlTZdyZ0zYwGu8AUbnxtO6X657DI53bqg1bBDMbky9TTy0l7GH2qbq8BHfzqw6X
 7faYtBiK7ogouxPkOVH43iQpqAeXFTd8FgaziEF4mp24qAcOn0YOOws5IyY4r/0f63fi
 26BjwGtyWdTo5nKBScCFBJemtYTrBkGDYALiJwEpu6oxKq/tF3tJk5HzO0FAEaglWl4D
 2B0O5iQfLLTf9/O9YKwjc4be5KPIbTnMV+OCtZarFtzXuuP2eGpf33URxE3ED6+9t1GT
 /ZzYjtAHEPaoLALzoAoicWQPkCdm04mmjlLXPZugRON5ULId+mGQImAa4CREU7xVsa80
 mtsA==
X-Gm-Message-State: AOAM531xnqziYqbOZ38mc+zVEowQey2MsxGytSetZANHkKs23oxBX6Es
 NW6sNe3+xKM5/29op5nvTxAWUw==
X-Google-Smtp-Source: ABdhPJxA4grzuDavuzGNoGOJkjj6/qFDQoh5Y9E5Tw0luS64wz69o1Di+Iihth2UG7yIKG6raMSxhg==
X-Received: by 2002:adf:f891:: with SMTP id u17mr7660654wrp.253.1607958069224; 
 Mon, 14 Dec 2020 07:01:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i7sm19387803wrv.12.2020.12.14.07.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 07:01:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E6DCE1FF7E;
 Mon, 14 Dec 2020 15:01:06 +0000 (GMT)
References: <20201125213617.2496935-1-keithp@keithp.com>
 <873608vde9.fsf@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Keith Packard <keithp@keithp.com>
Subject: Re: [PATCH 0/8] Add RISC-V semihosting 0.2. Finish ARM semihosting 2.0
Date: Mon, 14 Dec 2020 14:58:12 +0000
In-reply-to: <873608vde9.fsf@linaro.org>
Message-ID: <87wnxktost.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Keith Packard <keithp@keithp.com> writes:
>
>> This series adds support for RISC-V Semihosting, version 0.2 as
>> specified here:
>>
>> 	https://github.com/riscv/riscv-semihosting-spec/releases/tag/0.2
>>
>> This specification references the ARM semihosting release 2.0 as specifi=
ed here:
>>
>> 	https://static.docs.arm.com/100863/0200/semihosting.pdf
>>
>> That specification includes several semihosting calls which were not
>> previously implemented. This series includes implementations for the
>> remaining calls so that both RISC-V and ARM versions are now complete.
>>
>> Tests for release 2.0 can be found in picolibc on the semihost-2.0-all
>> branch:
>>
>> 	https://github.com/picolibc/picolibc/tree/semihost-2.0-all
>>
>> These tests uncovered a bug in the SYS_HEAPINFO implementation for
>> ARM, which has been fixed in this series as well.
>>
>> The series is structured as follows:
>>
>>  1. Move shared semihosting files
>>  2. Change public common semihosting APIs
>>  3. Change internal semihosting interfaces
>>  4. Fix SYS_HEAPINFO crash on ARM
>>  5. Add RISC-V semihosting implementation
>>  6-8. Add missing semihosting operations from release 2.0
>>
>> Signed-off-by: Keith Packard <keithp@keithp.com>
>
> Queued to semihosting/next, thanks.

Hmm scratch that... it fails in a number of linux-user only builds with:

  /usr/bin/ld: libqemu-aarch64_be-linux-user.fa.p/linux-user_aarch64_cpu_lo=
op.c.o: in function `cpu_loop':
  /builds/stsquad/qemu/build/../linux-user/aarch64/cpu_loop.c:133: undefine=
d reference to `do_common_semihosting'
  collect2: error: ld returned 1 exit status
  [651/2871] Compiling C object libqemu-alpha-linux-user.fa.p/target_alpha_=
translate.c.o
  ninja: build stopped: subcommand failed.

As well as a chunk of the various cross builds, see:

  https://gitlab.com/stsquad/qemu/-/pipelines/229443833/failures

On the next re-spin could you include Kito Cheng's patch for linux-user
support and also drop the version numbering from the commit titles so I
don't have to file them off again.

Thanks,

--=20
Alex Benn=C3=A9e

