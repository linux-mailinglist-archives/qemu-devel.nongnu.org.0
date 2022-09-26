Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A385EAB41
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 17:38:20 +0200 (CEST)
Received: from localhost ([::1]:43890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocqBX-0003bD-St
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 11:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocpBn-0008Qi-UK
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:34:31 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocpBm-0005lZ-8g
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:34:31 -0400
Received: by mail-ej1-x634.google.com with SMTP id z13so14519169ejp.6
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 07:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=Wx1S3Igs58VzDESNamzMgnXVPNzPs5LzlY97a7v4iaU=;
 b=cNudQFDBeHyKYeum50rnmY+j28kDvHVU8oIJO4mOFuRckrTig5g7NNSJ3qfwt5035a
 15UPaUSkfdCQE0mgg7Z87psK6W25hKJbr9521TjSTm7mQ02+fb4Q5wZCIxKezT9muvve
 OxefeHCEI8NuDnYSF2B19uHq242vzwiJMIB6FOlCXLbyiNtbexk3D947MSGA7p43AAoe
 x+hV6E42itXFAcBp+s4IrPDSZ3Sxz+MPnnNmZNmiHUTcq7RE8rm8qxPBKgxo/vGFJRlj
 geojtOPRLqpa2HCNrnD/8oHilQAk6I23z16DmE09C3GSL0C77H5hL0kbH9rPm0YT1DH3
 /ZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Wx1S3Igs58VzDESNamzMgnXVPNzPs5LzlY97a7v4iaU=;
 b=kqOzdoEE5ASqTPNv9F1YumoAo1nnhoN/rTENn5dHIHdi13Tk073HatIVYqELlcZuSZ
 fg6JEeWC4LrS2Q0pIOJI60KeAxqgZRfJNb9EQ/a08fP8M3XRm7YMQ/AP00FEXdQuU/ob
 XKbpuA92bk+s3BWfCU1DvmsOWGK/MRYgpFcegPSQiBh3vmhS2oqLIUcdLScEobjivSxx
 2J3thMji3TY5Jp/YKpg4I1VzRU/WSffJfHyYo2WXxpenQhR554Zs3jpZR7SeYiIor3vK
 JZAJk6yte4bhC4o9tKQibm02naCD9A5d69jHBE5+aZ9HLRukYosGHCBM1ybP19clTazf
 haoQ==
X-Gm-Message-State: ACrzQf0QmqAr81o9xZCzpBQmuf+T9uu//3XjFP3jvnUFoy3F9L8ry83d
 dJFhTBGv6B0n+dc9050AXZpjv/7EsMfVPGZjDg/zpg==
X-Google-Smtp-Source: AMsMyM7JBsaLr4cL7H0UZiQk5j20JuRrBKzsbkQLqY4PC8A3wPGhoyPc4zdgaUgnVXslRLpH5U5UfgtLsPXWrGA+3oY=
X-Received: by 2002:a17:907:728e:b0:782:8e91:64c8 with SMTP id
 dt14-20020a170907728e00b007828e9164c8mr15471198ejc.36.1664202867490; Mon, 26
 Sep 2022 07:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-2-alex.bennee@linaro.org>
In-Reply-To: <20220926133904.3297263-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 15:34:16 +0100
Message-ID: <CAFEAcA_QS8ODmQqHY=rFEMom_PoGL3eTdaLUyki4_0D5jFKaQw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] hw: encode accessing CPU index in MemTxAttrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, 
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 26 Sept 2022 at 15:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> We currently have hacks across the hw/ to reference current_cpu to
> work out what the current accessing CPU is. This breaks in some cases
> including using gdbstub to access HW state. As we have MemTxAttrs to
> describe details about the access lets extend it to mention if this is
> a CPU access and which one it is.
>
> There are a number of places we need to fix up including:
>
>   CPU helpers directly calling address_space_*() fns
>   models in hw/ fishing the data out of current_cpu
>   hypervisors offloading device emulation to QEMU
>
> I'll start addressing some of these in following patches.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v2
>   - use separate field cpu_index
>   - bool for requester_is_cpu
> v3
>   - switch to enum MemTxRequesterType
>   - move helper #define to patch
>   - revert to overloading requester_id
>   - mention hypervisors in commit message
>   - drop cputlb tweaks, they will move to target specific code

I still don't see anything in this patchset that updates
the code which currently assumes requester_id to be a PCI
index to check that it hasn't been handed a MemTxAttrs
that uses requester_id as a CPU number.

I also still need to go and look up how hardware does this,
so please don't queue this patchset yet. In particular, we
should think about whether we want this to be:
 * a CPU number, but only set opt-in by some target archs
 * a CPU number, valid for all target archs
 * a unique-within-the-machine identifier of the transaction
   master (i.e. which can be set by DMA controllers, etc,
   not just CPUs)

I would also like some input from Edgar since I know Xilinx
have some more extensive out-of-tree uses of requester_id.
We aren't obligated to not break out-of-tree code, but that
seems like a bunch of experience and knowledge about how
real hardware works that would be useful for informing
how we design this.

thanks
-- PMM

