Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F217B3A4769
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 19:05:00 +0200 (CEST)
Received: from localhost ([::1]:49970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrkaZ-0001D3-In
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 13:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrkYr-0000GV-Hk
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 13:03:13 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrkYo-0001id-VP
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 13:03:13 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 h11-20020a05600c350bb02901b59c28e8b4so8566624wmq.1
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 10:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=X34mBUoeaL7sxBjML6NPuN5vY8zvGK/GdmOOyyP2Bn4=;
 b=g3UwsJezCplwFxNEAR2HB8qAO9UD8F4cZhX/rgUq2LHrnjuzAurECjuZUc9cbfnPN7
 LP9F6VkM3OB4yP12MfXerERLDDkSjh8gpDEQlfeSsU/fu/RKb11jmvG+/OkLAAW6dXzh
 xBzsaos0E9yrIJHSsCfjQCUZvz05c3Yeg/KnSO87Ezyc/e0iXCN+Q9gxBykvo2OZauqX
 fyIAbVqYQ7SuKarcWRnAtw2SAFoJvoncQwo1sxckuoUgl00s5UWBm4CcEbbjQJkUCTwE
 SAgXFxMZTzELOmIaNrrQvq991OcR5UnbnkgActaJsJDGsA7Re+rknn5foAR76CoHcFXy
 y4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=X34mBUoeaL7sxBjML6NPuN5vY8zvGK/GdmOOyyP2Bn4=;
 b=poOHxZO8BQ8Pj9Xgbi65d35V8p9ZogYsk6n2ISeQOcI/Unf6HC1is+LDNho9wDOf4c
 Hemc/BNbg5WFvKxLlnJGzhDPyn37OLncpPAQSNwVCzUY9Hcc1VeFx9iUYnsy3RwFeew8
 trFXy3fmIQnAjg4Lo2nM/zuLfYzrI/twvhQ0g+HnO+FS0BS7C9ftGUImX5JwcDDReaJM
 AqKJMbBaI7SZuykWZYWWGLYlA4GyaXt/eLF5q0nHn09XVA0ncRU65AHDda74J9BzW5KT
 57htvTZ2H3TYcuHykFr2+Q7KN2MFfmQFQJChQTTPz5C5I6mBMzqDWZgX5Vbch4kdP8qJ
 cdCQ==
X-Gm-Message-State: AOAM530nmlCCOJuwd/MoRulQSyDBkR/TM5oyjsRLKDGHGR6j/Qtv0Bzv
 Ey1USzzCl8XdmLv2BjSyDSxCAg==
X-Google-Smtp-Source: ABdhPJwe1RTm96QAVkdar226LSZOb8wgmVap1HJpvFOxPUVK2wxRc7vuCJzyQ0kTvf77WsIc/TnLSA==
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr4973911wmj.184.1623430988131; 
 Fri, 11 Jun 2021 10:03:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m6sm9243259wrw.9.2021.06.11.10.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 10:03:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2E5CB1FF7E;
 Fri, 11 Jun 2021 18:03:06 +0100 (BST)
References: <20210610102617.17281-1-alex.bennee@linaro.org>
 <CAFEAcA9yhRS_=zr+76HdDN=iYU=ghDjLPfSaFUA9fzmJ5p3vCA@mail.gmail.com>
 <87im2liz4x.fsf@linaro.org>
 <CAFEAcA9NYv1GdA+2P_7hbqgBwRTv6JFgfp1mS_PzURY-aafkeA@mail.gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2] semihosting/arm-compat: remove heuristic softmmu
 SYS_HEAPINFO
Date: Fri, 11 Jun 2021 18:01:34 +0100
In-reply-to: <CAFEAcA9NYv1GdA+2P_7hbqgBwRTv6JFgfp1mS_PzURY-aafkeA@mail.gmail.com>
Message-ID: <87y2bggwqd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 10 Jun 2021 at 15:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> > I'm told that the Arm C compiler C library always assumes that
>> > the "stack base" value is what it should set SP to, so reporting 0
>> > for that will break binaries that were built with it.
>> >
>> > As the TODO comment notes, the "heap base" is a bit of a guess,
>> > but putting stackbase at top-of-RAM seems generally sensible.
>> >
>> > What bug are we trying to fix here?
>>
>> Having newlib use a value that's wrong and therefor plant it's heap in
>> the middle of the loaded code.
>>
>> > I think one possible implementation that might not be too
>> > hard to make work would be:
>> >
>> >  (1) find the guest physical address of the main machine
>> >      RAM (machine->ram). You can do this with flatview_for_each_range()
>> >      similar to what rom_ptr_for_as() does. (It might be mapped
>> >      more than once, we could just pick the first one.)
>>
>> Currently this is done by common_semi_find_region_base which pokes
>> around get_system_memory()->subregions to find a region containing an
>> initialised register pointer.
>
> Yes. I am suggesting we throw that code away, since (a) assuming
> any register happens to point in to the main RAM is dubious and
> (b) iterating through the subregions of get_system_memory() is
> not guaranteed to work either (consider the case where the system
> memory is inside a container MR rather than a direct child of the
> system memory MR).
>
>> >  (2) find the largest contiguous extent of that RAM which
>> >      is not covered by a ROM blob, by iterating through the
>> >      ROM blob data. (This sounds like one of those slightly
>> >      irritating but entirely tractable algorithms questions :-))
>>
>> Does that assume that any rom blob (so anything from -kernel, -pflash or
>> -generic-loader?) will have also included space for guest data and bss?
>
> Yes; the elf loader code creates rom blobs whose rom->romsize
> covers both initialized data from the ELF file and space to
> be zeroed.

Hmm I'm not seeing the RAM get bifurcated by the loader. The flatview
only has one RAM block in my test case and it covers the whole of RAM.

  Semihosting Heap Info Test
  find_heap_cb: rom:1 romd_mode:1 ram:0 0000000000000000/0000000000000000:4=
000000
  find_heap_cb: rom:1 romd_mode:1 ram:0 0000000004000000/0000000004000000:4=
000000
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000008000000/0000000008000000:1=
000
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000008010000/0000000008010000:2=
000
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000008020000/0000000008020000:1=
000
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000009000000/0000000009000000:1=
000
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000009010000/0000000009010000:1=
000
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000009020000/0000000009020000:8
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000009020008/0000000009020008:2
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000009020010/0000000009020010:8
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000009030000/0000000009030000:1=
000
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a000000/000000000a000000:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a000200/000000000a000200:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a000400/000000000a000400:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a000600/000000000a000600:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a000800/000000000a000800:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a000a00/000000000a000a00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a000c00/000000000a000c00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a000e00/000000000a000e00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a001000/000000000a001000:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a001200/000000000a001200:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a001400/000000000a001400:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a001600/000000000a001600:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a001800/000000000a001800:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a001a00/000000000a001a00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a001c00/000000000a001c00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a001e00/000000000a001e00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a002000/000000000a002000:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a002200/000000000a002200:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a002400/000000000a002400:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a002600/000000000a002600:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a002800/000000000a002800:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a002a00/000000000a002a00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a002c00/000000000a002c00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a002e00/000000000a002e00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a003000/000000000a003000:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a003200/000000000a003200:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a003400/000000000a003400:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a003600/000000000a003600:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a003800/000000000a003800:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a003a00/000000000a003a00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a003c00/000000000a003c00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a003e00/000000000a003e00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000000000000/0000000000000000:2=
eff0000
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000003eff0000/000000003eff0000:1=
0000
  find_heap_cb: rom:0 romd_mode:1 ram:1 0000000040000000/0000000040000000:2=
0000000
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000000000000/0000004010000000:1=
0000000
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000000000000/0000000000000000:8=
000000000
  info appears to be inside the heap: 40211fe0 in 40000000:60000000


>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

