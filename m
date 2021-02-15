Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA91B31B662
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 10:26:43 +0100 (CET)
Received: from localhost ([::1]:46794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBa9S-0005v6-9v
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 04:26:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBa7t-0005Rf-5e
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:25:05 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBa7r-00052p-9H
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:25:04 -0500
Received: by mail-wr1-x42a.google.com with SMTP id l12so8066949wry.2
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 01:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+KL+UjRd/zFuN6tktpsTIdR06QjaiEzFYX2aSh0m01U=;
 b=APsArNnaRj0ZdxnrMh1kykNci+ME2ct8JGKJrQgJJdTitf9LTA9ESkcWz3XYPpQjQo
 4Up08CP3kSN+ynSFsA1hsj9OoQuMpyhONtrxoVzrbEgIWPIiH0EpqxadqgQ87b+mIWhv
 7DvbLOqanleoertmLqj+jIThtJhcfvQD4eeaGt6X727/dIN04JpQmMRnGa5l/kpGhhNQ
 YN93zk7pvEo5HaPS/wsyLGBNS/xtn3cN5xD2XZwsApLrpGjkpdKBxh2ADzSIwoQQcGJD
 YNn8xQBhKkUm3lMmDZHGtsv8XwX1JprL+jZNP4lDey6oCXagX+lk5f97fuJ8Rxp52DMM
 ZPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+KL+UjRd/zFuN6tktpsTIdR06QjaiEzFYX2aSh0m01U=;
 b=PYl5tRV5dyk2rvoU/nIp9thrLZuQapGzDiaT0CBrOzYlwBLP+ZVgGYTrhOTAE45hHP
 NYZEg49VGlyLfS+3R1W/xJMdsebHURP6JuJNxKlyplHYSMiRzqswnc3DcK7X6TSmWNJJ
 fMKBw3rDMa8z8XvfbHJO57CQ1zu7GaO/wB5kMsmMIRA0zao08zPt3X5v5r9R7VND5ZZL
 VZjj+KfncQ5ChEoETGmduEPRoQ2p0rLSKdrcgM4yLq9V6109s/tDmRbj61KS2I068nco
 5dEiFrBEuu+tr9rpj08tig+b3RsMM0U+bqxxZxfNFuwswQm7UJubvoAuL3RTOBkveS7X
 mFOg==
X-Gm-Message-State: AOAM532os0IWcdY75J78d4ySKmcv6M694yU2IOn4wRvI0LG9zx7cVlYg
 Jv0KlsABJcOnqzHym2X2Xig=
X-Google-Smtp-Source: ABdhPJz9qLu0w2YfiNNPnD3LmP6ixIhiUGiBenwddzOcqG1OZl2loKyRe9QNwpugMuOALRnWD5j/uA==
X-Received: by 2002:adf:e542:: with SMTP id z2mr17750773wrm.37.1613381101439; 
 Mon, 15 Feb 2021 01:25:01 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h12sm30200454wru.18.2021.02.15.01.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 01:25:01 -0800 (PST)
Subject: Re: [RFC PATCH 00/42] target/mips: Reintroduce the R5900 CPU (with
 more testing)
To: qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b16dbbde-f679-f20d-2957-e5df35131f97@amsat.org>
Date: Mon, 15 Feb 2021 10:24:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 6:58 PM, Philippe Mathieu-Daudé wrote:
> The R5900 CPU was removed some time ago (frankly I don't remember
> why). This series add it back, but to prove it works, we also add
> testing at the end.
> 
> The main motivation is to have MIPS R5900 coverage, but to be able
> to run real world r5900 binaries, I had to implement more opcodes.
> 
> 42 patches are a lot, but 3 are already queued in linux-user-for-6.0,
> and the 11 last ones are pure testing. I suppose in next versions
> I'll split the testing patches, but to show the final objective I
> included them in here.
> 
> I tagged it RFC because some parts because:
> 
> - We'd rather not add yet another target, but we need the
>   ILP32-on-64bit ABI (o32 64-bit)
> 
> - RDHWR glibc kludge for user-mode
> 
> - Avocado patches are only here to show the final test.
>   They are useful for my set of tests, but not meant to
>   be merged in mainstream.
> 
> - gitlab jobs are only here to show the tests work.
>   If the target is ever accepted, it would go in an already
>   existing job.
> 
> I'm OK to maintain 64-bit o32 and the testing out of tree, but the
> TCG opcodes are worthwhile review for mainstream.

I forgot to mention, to debug this target with gdb (the various
multimedia opcodes are not recognized by QEMU disas).

I start QEMU listening for GDB with:

$ qemu-r5900o32el -g 1234 ...

Then start Debian's gdb-multiarch via Docker:

$ docker run -it --rm -v /tmp:/tmp -u $UID --network=host \
  registry.gitlab.com/qemu-project/qemu/qemu/debian10 \
  gdb-multiarch -q \
    --ex 'set architecture mips:5900' --ex 'set endian little'
The target architecture is assumed to be mips:5900
The target is assumed to be little endian
(gdb)

Connect to QEMU on host:

(gdb) target remote 172.17.0.1:1234

Opcodes are displayed properly:

(gdb) x/20i 0x0002553c
   0x2553c:     pcpyld  a1,a1,a1
   0x25540:     li      a2,255
   0x25544:     andi    t1,a0,0x7
   0x25548:     beqz    t1,0x255fc
   0x2554c:     andi    t1,a0,0xf
   0x25550:     lw      t0,0(a0)
   0x25554:     addiu   a0,a0,4
   0x25558:     pceqb   t2,t0,zero
   0x2555c:     pceqb   t3,t0,a1
   0x25560:     or      t4,t3,t2
   0x25564:     pextlw  t4,zero,t4
   0x25568:     beqz    t4,0x255fc

One limitation is we can not access the upper halves of
the 128-bit general purpose registers :(
[Maybe we can but I don't know how...]

Regards,

Phil.

