Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAF4698A2A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 02:40:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSTEy-0007fL-Vw; Wed, 15 Feb 2023 20:39:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pSTEw-0007em-VZ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 20:39:14 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pSTEt-0000mD-Qy
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 20:39:14 -0500
Received: by mail-ej1-x630.google.com with SMTP id jg8so1580758ejc.6
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 17:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w7GyCv0Y4u4vnOGArpLDXTPYtw3XwKh7OlLF97IMt94=;
 b=qZDbDvzMhU140E9R3UV84Z1i8q02TY5DWi4yTaXt0Z+8/OnXndBtQVqAWepsriRhGP
 0sM7lJ9rHFz8vUImDgTRFSmj7dspyZvdH06RtNYbTboesobJUon3Wgow7mKXRgQA2pzq
 kFfsQPHiZPY20cb+204tuSne80fXUM+rhb59UEin31y6X/Eo2Ck1fUIUuRtCtkIKXu0Q
 YeI5zfl2AXITK9W3nlTXhzySqjSHbfhTFw7dsyBdptWsyWO+vnoWFbxjQbO1LrRV15BJ
 tQE/l0MjISTU4XS+n/td4+6+VxpGseWeXBNrZJV7x2UyJ7pKmeSn3oatDUes1zuIqcg6
 rAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w7GyCv0Y4u4vnOGArpLDXTPYtw3XwKh7OlLF97IMt94=;
 b=OQGzOAELHF7McmWxykLXJmqHUZSAjdYr2TuY+iGDXu1OEYF+2OwuADVVxUxDoUCS4N
 AjxTpjOneErBWix/zcmV8d6PTxlbCZT/+Upt7suaR1EBUdfkbpc+dABZSJzBGBSakI1g
 P87Mq88WV7wkNEV5Bnna1smBdv+G4jPTlZjJAWoS6wSJ8EyqPUgd8WpEo/D0mTNxmf3w
 Xce2XMboJHXyoKWVVNSe7i/41bOr/y6WfL0m+8fzocenMNgSPjxcX0bOCJAeZ38+Tfu+
 E5wSrM5QRrETD7x7eXsek2cIvS7I+NG78F92IPJs5apQbVVki9rb1SV/4MmPbzFANkeF
 yLAQ==
X-Gm-Message-State: AO0yUKUKzQQeMECzvPVr/6cvl07vmT1bKtNOHYYdqfQKlhoHTPfJD/Nu
 Q6SsYPYh8Cbgjgr+5uUib099pC7zDK808ND5ZT6kNw==
X-Google-Smtp-Source: AK7set/HjVDzKaeYF0sacUwvb3dEeuknmFXqr2WoSBp+GS5uUIA/7s3iR0SGVFrICYI/SPnrqnTTmz/NGbskO5rYT1Q=
X-Received: by 2002:a17:907:d13:b0:878:8061:e114 with SMTP id
 gn19-20020a1709070d1300b008788061e114mr452156ejc.0.1676511549543; Wed, 15 Feb
 2023 17:39:09 -0800 (PST)
MIME-Version: 1.0
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-4-debug@rivosinc.com>
 <f68da758-a418-c528-6f7c-e6e0d0246255@linux.alibaba.com>
 <CAKC1njTbP0=H8w=izkMkEwVjq9=6m_Rw_ymgremjtbFYDGTrow@mail.gmail.com>
 <d9f692af-eb86-421d-f0cf-495f2a2e01b4@linaro.org>
In-Reply-To: <d9f692af-eb86-421d-f0cf-495f2a2e01b4@linaro.org>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Feb 2023 17:38:49 -0800
Message-ID: <CAKC1njR44uKkeqT52mn2wg4PzpF6cvwCEk7cGn=gCVjwjVA-6Q@mail.gmail.com>
Subject: Re: [PATCH v1 RFC Zisslpcfi 3/9] target/riscv: implements CSRs and
 new bits in existing CSRs in zisslpcfi
To: Richard Henderson <richard.henderson@linaro.org>
Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, Kip Walker <kip@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=debug@rivosinc.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 15, 2023 at 4:02 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/15/23 13:33, Deepak Gupta wrote:
> > On Tue, Feb 14, 2023 at 9:47 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
> >> And MSTATUS_UBCFIEN field change don't need flush tlb.
> >>
> >
> > TCG code-gen would be different depending on whether ubcfi is enabled or not.
> > As an example a TB might have code generated when bcfi was enabled.
> > But if someone disables it,
> > translation needs to happen again and zimops implementation should be
> > generated this time.
>
> tlb_flush does not affect translation.  TB are tied to physical addresses and are only
> flushed by writes or tb_flush().
>
> The correct fix is to allocate a bit from FIELD(TB_FLAGS, X, Y, 1), and adjust
> cpu_get_tb_cpu_state to indicate when CFI is active in the current cpu mode.
>
>

Hmm... So this looks like a major oversight on my side.
I had been under the impression that tlb flush does TB flushes too.
I was trying to save on TB_FLAGS.
I saw `tb_jmp_cache` was being cleared, didn't dig deep and assumed
that tlb flush clears up TB as well.
Now that you've pointed it out, it looks like that's a different optimization.

So looks like this definitely needs a fix.

Question:
I'll basically need two bits (one for forward cfi and one for backward cfi).
But I need to throw away the TB if cfi enabling bits mismatch at the
time TB was generated and the current state of enabling bits.
Reason being, this needs to get translated again and zimops need to be
generated.

What's the best way to throw away a single TB?


> r~

