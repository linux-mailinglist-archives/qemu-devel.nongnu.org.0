Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C134F6FC44B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 12:53:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwKxz-0004eR-B8; Tue, 09 May 2023 06:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwKxx-0004e9-NV
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:53:09 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwKxv-00008S-T1
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:53:09 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bd2d7ba74so57458822a12.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 03:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683629586; x=1686221586;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bbdrwBA2JOzXZ32vpkdNYTLqJqJIjRwIbp6NKSZGdjE=;
 b=MOXsIRwrIsceSVG+uLOkqt4f4HvctveLdG2AYSE//Ue+MQ/Wxq+58fOUaWAMRYS5s3
 rPhau9i0IGQ7z4N+KdZR77xERcIukquyCXGJ4HO5Et/whXcNcqAkJ3P3trIKOMNz9ysC
 aOBHqY1jGB5u6LdsU4aWCAm2IpXPt5pAxrz1eBoUxAlRYLadCGkpJR00EaizPlrg1fes
 P3312ayfVLfFAXD+VMrWiQHNW5VmcpMx3Rk23TAHfCezE+nXraNN6LmJcFGknCq8/k3y
 wfhPB4JmWEwT+BoBgUN12Ky6oMH+Ep4hP4vtQa/gMOFBid6JogKGa1AXKrObtgeAH9VF
 vQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683629586; x=1686221586;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bbdrwBA2JOzXZ32vpkdNYTLqJqJIjRwIbp6NKSZGdjE=;
 b=WCRKld57vLtAq8rjOCYmjhPmVMrhBUaHFK2g+xhlzyal1WjP8cIii1ai9R2hsYAb8k
 nQDHDmEm8s/BWizr9UVlC9ZOJA/EpDz8keMrvpO9kK1F63Gsw7Doy9ba+rf/DWWH9k74
 GT1i4q+JfB1qD5MCf4PqRKy6qx6VtLnfo3vV3uun1nPR+PO1U2/JBcqJGk1luj6WBXvO
 /hKa9asXmzlKPXaEIeT79tzTSc1x3LHwN2GAvu4FcTb4EUCcDpvwxuECvvlQRp/SknwM
 fkdwqhRWNsqZYVIf+3YRpmFHALUXxKVMcEgKTQkxCqWUDZh0xtymS5NKnVeOT9aDAaL2
 hTeg==
X-Gm-Message-State: AC+VfDxxIz1+oZblBxsZwCJPFvynPus51mUSLOvhpAlfFZWpKlsGcIjn
 yOd+0vo+qtuuUkNKDKPprDWAjJ5q7BBtnUFPBzC9tA==
X-Google-Smtp-Source: ACHHUZ52fovFP9mzsYYYlyTcuGPxje0RBe5BIsK0z9RPduiL941+nm06TN8Fv7lRDfu6rAiTGHIpFtjgXTEwnqUvj9Q=
X-Received: by 2002:a05:6402:2c2:b0:50b:c013:f933 with SMTP id
 b2-20020a05640202c200b0050bc013f933mr12122352edx.6.1683629586346; Tue, 09 May
 2023 03:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221018133042.856368-1-pbonzini@redhat.com>
 <20221018133042.856368-48-pbonzini@redhat.com>
In-Reply-To: <20221018133042.856368-48-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 11:52:55 +0100
Message-ID: <CAFEAcA_oh9F7KegOPMaRGtkR_JBGDoXokLk4BsovXb56aPP=RQ@mail.gmail.com>
Subject: Re: [PULL 47/53] target/i386: reimplement 0x0f 0x28-0x2f, add AVX
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 18 Oct 2022 at 15:32, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Here the code is a bit uglier due to the truncation and extension
> of registers to and from 32-bit.  There is also a mistake in the
> manual with respect to the size of the memory operand of CVTPS2PI
> and CVTTPS2PI, reported by Ricky Zhou.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Hi; in bug https://gitlab.com/qemu-project/qemu/-/issues/1637
it's been reported that there's an error in the handling
of the UCOMISS instruction that was added in this commit:

>  static void decode_sse_unary(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
>  {
>      if (!(s->prefix & (PREFIX_REPZ | PREFIX_REPNZ))) {
> @@ -746,6 +793,15 @@ static const X86OpEntry opcodes_0F[256] = {
>      [0x76] = X86_OP_ENTRY3(PCMPEQD,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
>      [0x77] = X86_OP_GROUP0(0F77),
>
> +    [0x28] = X86_OP_ENTRY3(MOVDQ,      V,x,  None,None, W,x, vex1 p_00_66), /* MOVAPS */
> +    [0x29] = X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex1 p_00_66), /* MOVAPS */
> +    [0x2A] = X86_OP_GROUP0(0F2A),
> +    [0x2B] = X86_OP_GROUP0(0F2B),
> +    [0x2C] = X86_OP_GROUP0(0F2C),
> +    [0x2D] = X86_OP_GROUP0(0F2D),
> +    [0x2E] = X86_OP_ENTRY3(VUCOMI,     None,None, V,x, W,x,  vex4 p_00_66),
> +    [0x2F] = X86_OP_ENTRY3(VCOMI,      None,None, V,x, W,x,  vex4 p_00_66),

I've figured out what's going wrong, but the tables here are
a bit opaque for my level of understanding of the instruction
set. The problem seems to be that we assume that UCOMISS takes
two 64 bit arguments. However, the documentation says that it
operates on the low 32-bits of a register operand and on a
32-bit memory location. (UCOMISD operates on 64-bit values.)
This only causes a problem when the guest code tries to do
a UCOMISS on a 32-bit memory operand that happens to be at
the very end of a page where there is nothing mapped after it.
It looks like QEMU always tries to load a full 128 bits from
memory, and so it causes a segfault that shouldn't happen:
you can see that we do two qemu_ld_i64 from rcx + 0xff4 and
rcx + 0xffc, when we should only be loading a single 32 bit value.

0x400000116f:  0f 2e 81 f4 0f 00 00     ucomiss  0xff4(%rcx), %xmm0

OP:
 ld_i32 loc9,env,$0xfffffffffffffff8
 brcond_i32 loc9,$0x0,lt,$L0

 ---- 000000400000116f 0000000000000000
 add_i64 loc2,rcx,$0xff4
 qemu_ld_i64 loc4,loc2,leq,0
 st_i64 loc4,env,$0xb50
 add_i64 loc3,loc2,$0x8
 qemu_ld_i64 loc4,loc3,leq,0
 st_i64 loc4,env,$0xb58
 add_i64 loc13,env,$0xb50
 add_i64 loc15,env,$0x350
 call ucomiss,$0x0,$0,env,loc15,loc13

(this is from the test case in the bug report)

Presumably the table entry should be marked up somehow to
indicate that the operand size is only 32 bits/64 bits,
but I'm not sure how that should be done. Any suggestions?

thanks
-- PMM

