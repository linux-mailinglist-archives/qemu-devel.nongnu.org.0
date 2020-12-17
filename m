Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F702DD671
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 18:42:42 +0100 (CET)
Received: from localhost ([::1]:45308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpxIX-0007M4-HI
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 12:42:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1kpx1y-0002O5-Eh
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:25:36 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1kpx1t-0007d5-NA
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:25:34 -0500
Received: by mail-pj1-x102f.google.com with SMTP id lj6so4027518pjb.0
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 09:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=E4FnEq0N6E9+/yf/onWrHYhBr5rr/hsxLviV2xg3oak=;
 b=Q0Wud+5fLdVDI5eZnB5KG6GGQDLj5SkapMCgzQEMPjvow6PHujLP2Do2j4LeLqZ66z
 HwjCqBBhPJcuyrEmrIMpUQBpM+IsP4XnRYzp8xsLPdhRr0r4CWr5CochBg/ZKBewMydl
 QgJNobaVwZQq7GS0d+la7GwQ0yiw3Qp+BaMfkBY2E/Z4hCseltlHE7AwHkCeRBi9t2Gh
 Cdh4F5fGFQAba9HR14neqwsQimCWd/C4SVJWhNzEHxQ3SqtRIsdrm504MTVwC+vUp0MB
 K8vZ9umTe41d2wrkk3B+OIYvDa1Yvetry+uvRwCseAAdDO1cNe8ESAsmHfj/bd9ENulN
 jxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=E4FnEq0N6E9+/yf/onWrHYhBr5rr/hsxLviV2xg3oak=;
 b=r7ULBsxVp+JSDJ0G6W/jE7sQBSnyFgeGySH3/TJ/xFw76g8QkWDMidXwB3QDIKgfKK
 z8zYd9EdryyBd6mJAan3Uoc5TM0XFMOHN0F38fyuWkGX++eunGzkL042J+QMxtKftZTP
 69e+EOe3skb5pyFei+TE9l1sxVSESaaLCvOlRZ6pB80QuZiE5VfBLezccSQyuguQcxgn
 E7j5PpDJZQ7CI6YvFHPDcNmg5ZcRaiFYvoH2HpWqMe1n/HvsUBlC98gK1/u1SLjfNsSD
 3FTCo6vyghh/awdLnfivpXtJKXx4sSYGfGS2nGlXY2mxVY7CcvmYl7jxDz6SV4fQsePO
 Zcjw==
X-Gm-Message-State: AOAM5332KtWc+cVbhPc4DH84oKspEk6teLX7oZQtSkgiXVn1vFLVYerB
 IQ7K8DzA9lChBblANwC7WbzOeg==
X-Google-Smtp-Source: ABdhPJykDwJNWd/eHP7jwwGbKe2w6eZEdY0mNvQEL6UgbhvbAoM5c/bOoNznbJXwXF9j8qkxuXY9XA==
X-Received: by 2002:a17:902:9b97:b029:da:4299:2214 with SMTP id
 y23-20020a1709029b97b02900da42992214mr228501plp.37.1608225927493; 
 Thu, 17 Dec 2020 09:25:27 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g17sm2514980pgg.78.2020.12.17.09.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 09:25:26 -0800 (PST)
Date: Thu, 17 Dec 2020 09:25:26 -0800 (PST)
X-Google-Original-Date: Thu, 17 Dec 2020 09:25:25 PST (-0800)
Subject: Re: [PATCH v4 16/16] hw/riscv: Use the CPU to determine if 32-bit
In-Reply-To: <7d2b4053-dbca-faf8-04b2-8da0aab70f29@linaro.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: richard.henderson@linaro.org
Message-ID: <mhng-18cffb57-6f85-430d-aa0e-bf19e4698c9a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-riscv@nongnu.org, bmeng.cn@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 05:58:11 PST (-0800), richard.henderson@linaro.org wrote:
> On 12/17/20 12:44 AM, Bin Meng wrote:
>> What happens if something like ARM big.LITTLE needs to be supported on RISC-V?
>
> I'd say it's the board's job to pass the boot heart.
> (Though even big.LITTLE doesn't mix 64 and 32-bit cores.)

I guess we can't stop people from building crazy things, but it does seem like
building a system that mixes up base ISAs is unlikely.  IDK if 32-bit
compatibility on 64-bit systems is ever going to be important enough to show up
on RISC-V, as 32-bit might be defunct in portable systems by the point real
RISC-V systems are availiable, but one could imagine systems where only a
subset of cores have 32-bit compatibility.  My guess is that they'd all boot
into 64-bit mode, though, so that sort of stuff won't be relevant until one
tries to get to 32-bit code.

Regardless of where that sort of thing goes, it seems reasonable to just ban
people from spinning up mixed machine XLEN systems in QEMU for the time being.
IIUC that's always been impossible (as it was a #define before), so it's not
like we're regressing on any functionality with that constraint.

Other hetergenous ISA/microarctucture stuff seems reasonable to support in
QEMU, but also not a high priority.  It doesn't seem that hard to write the
early boot stuff in a way such that it only depends on the base ISA -- that's
essentially how we're handling stuff like F/D in Linux, you just either probe
or handle the traps.  There's already some simple hetergenous stuff floating
around (like the non-MMU cores in the SiFive designs) and that all seems to
work fine so my guess is we have enough stuff there, but I'm sure there'll be
more work do to as more complicated designs start to show up (doubly so as
there's no specs for any of this).

