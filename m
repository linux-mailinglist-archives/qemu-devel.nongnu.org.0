Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DF03A2DC2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:10:59 +0200 (CEST)
Received: from localhost ([::1]:35312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLOc-0002yv-DA
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrLMk-00016w-52
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:09:02 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:50869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrLMh-0001KV-25
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:09:01 -0400
Received: by mail-wm1-x32e.google.com with SMTP id d184so6285861wmd.0
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=C7UPFOSxI1oq/X+1vmme3Dr6P4rsVuzYzuRGnQaqTJ8=;
 b=WJE8ocfHnBL7LGesnh/BiLMUXIA74Rl3oev0aQkSt6Mpowd/LDq8bggi912sN2/gAv
 D2r7WzsWsbaJzCwIzoP4HCT5c2V4bj+r5owcDH6w9NGsYEp19zW5PeyzYQADitIJEeKF
 p5clNVVUm7M0dES1EvA4UAgvU3nnSquD4f8Tjq8Tf3Sm6oxPnGzn6pLoF92FCXTIswI+
 mCPfjF+gZT6LF1F/V+KyVrWVps6fssUKrWASr86LZKPEgQRrn44M8pHW+d3XVb/rQn70
 sA7lVyTk0/ipoP8umf2hUoIKJxYVXDWXnA485Pqi30/6ZGgBqOTr9SlOWhfXGJiq+ihF
 h0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=C7UPFOSxI1oq/X+1vmme3Dr6P4rsVuzYzuRGnQaqTJ8=;
 b=Hqd0KhKckpgtkv7YlQe85rZYXrcwnGMnp6ZCf9Ncr6lklSePZerDHDgibz2OQp0Mnt
 IOAZB+SXX/YRJAxNMFzBOA6H76Hom/MNsXIy/WRgYA9osbg5xOln4+19kCHlYArylfde
 ODuKWepiSyPg3QRK9R4fqQacfi34Ef7gfxG1CtZNcUY1AakH5EahHpxEJw1x9apf7Yos
 aFk4woW8iqARD9Cd+MLId2BHoM4uT5sW+lKyQLM5OVTRXVMEy/44Xab+DIVqNpUXpMaf
 GHNHBiGOXYqU4qH1E0fExWtbh73OmxNa/YmGMgLCiz0ZsSNNmKsbqX4WIP/I0et29k+s
 Ls5A==
X-Gm-Message-State: AOAM530EO2qksLh9KMAA2FBiAPmOMob4tJHhz/Gf/f+Bpif8yHxW8qcM
 ohMJNmG5M4hJZXt4LKhGc08VFA==
X-Google-Smtp-Source: ABdhPJwwKpjg8eFxyZjN7M/9/bJ/Iab87z20WsBfe5esxNNxWg/NRKi6SUaziuKiHyJkIwtG9aUHnA==
X-Received: by 2002:a7b:c013:: with SMTP id c19mr15164080wmb.158.1623334136191; 
 Thu, 10 Jun 2021 07:08:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k8sm3720433wrp.3.2021.06.10.07.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 07:08:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 58A001FF7E;
 Thu, 10 Jun 2021 15:08:54 +0100 (BST)
References: <20210610102617.17281-1-alex.bennee@linaro.org>
 <CAFEAcA8O1Cca2BnNp5c=0yYbKExYH1sUYe68C_msG_oBSUGW3g@mail.gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2] semihosting/arm-compat: remove heuristic softmmu
 SYS_HEAPINFO
Date: Thu, 10 Jun 2021 14:55:24 +0100
In-reply-to: <CAFEAcA8O1Cca2BnNp5c=0yYbKExYH1sUYe68C_msG_oBSUGW3g@mail.gmail.com>
Message-ID: <87lf7hizgp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrew Strauss <astrauss11@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Nick Clifton <nickc@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 10 Jun 2021 at 11:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The previous numbers were a guess at best. While we could extract the
>> information from a loaded ELF file via -kernel we could still get
>> tripped up by self decompressing or relocating code. Besides sane
>> library code like newlib will fall back to known symbols to determine
>> of the location of the heap. We can still report the limits though as
>> we are reasonably confident that busting out of RAM would be a bad
>> thing for either stack or heap.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Tested-by: Andrew Strauss <astrauss11@gmail.com>
>> Reviewed-by: Andrew Strauss <astrauss11@gmail.com>
>> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>>
>> ---
>> v2
>>   - report some known information (limits)
>>   - reword the commit message
>> ---
>>  semihosting/arm-compat-semi.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi=
.c
>> index 1c29146dcf..8873486e8c 100644
>> --- a/semihosting/arm-compat-semi.c
>> +++ b/semihosting/arm-compat-semi.c
>> @@ -1202,10 +1202,14 @@ target_ulong do_common_semihosting(CPUState *cs)
>>              retvals[3] =3D 0; /* Stack limit.  */
>>  #else
>>              limit =3D current_machine->ram_size;
>> -            /* TODO: Make this use the limit of the loaded application.=
  */
>> -            retvals[0] =3D rambase + limit / 2;
>> -            retvals[1] =3D rambase + limit;
>> -            retvals[2] =3D rambase + limit; /* Stack base */
>> +            /*
>> +             * Reporting 0 indicates we couldn't calculate the real
>> +             * values which should force most software to fall back to
>> +             * using information it has.
>> +             */
>> +            retvals[0] =3D 0; /* Heap Base */
>> +            retvals[1] =3D rambase + limit; /* Heap Limit */
>> +            retvals[2] =3D 0; /* Stack base */
>>              retvals[3] =3D rambase; /* Stack limit.  */
>
> The spec:
> https://github.com/ARM-software/abi-aa/blob/main/semihosting/semihosting.=
rst#sys-heapinfo-0x16
>
> doesn't document that 'return 0 for "I don't know"' is valid, so if we're
> going to do it we ought to at least note that we're deviating from the
> spec here.

That comes from newlib who state:

	/*  We skip setting SP/SL if 0 returned from semihosting.
	    - According to semihosting docs, if 0 returned from semihosting,
	      the system was unable to calculate the real value, so it's ok
	      to skip setting SP/SL to 0 here.
	    - Considering M-profile processors, We might want to initialize
	      SP by the first entry of vector table and return 0 to SYS_HEAPINFO
	      semihosting call, which will be skipped here.
	    - Considering R-profile processors there is no automatic SP init by ha=
rdware
	      so we need to initialize it by default value.  */

that doesn't come from the actual semihosting spec but the ARM Compiler
Development guide (ARM DUI0471M) which has a more detailed entry:

  7.13 SYS_HEAPINFO (0x16)
  Returns the system stack and heap parameters.

  The values returned are typically those used by the C library during
  initialization. For a debug hardwareunit, such as RVI or DSTREAM, the
  values returned are the image location and the top of memory.

  The C library can override these values.

  The host debugger determines the actual values to return by using the
  top_of_memory debugger variable.

  <snip>

  Note

  If word one of the data block has the value zero, the C library replaces
  the zero with Image$$ZI$$Limit.This value corresponds to the top of the
  data region in the memory map.

  Return

  On exit, R1 contains the address of the pointer to the structure.If one
  of the values in the structure is 0, the system was unable to calculate
  the real value.

which I think is the basis for the newlib fallback behaviour.

--=20
Alex Benn=C3=A9e

