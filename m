Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC9E36D0DB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 05:27:19 +0200 (CEST)
Received: from localhost ([::1]:40470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbar8-0006Gi-H4
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 23:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lbapb-0005rb-53
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 23:25:43 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:39698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lbapZ-0003UV-Ip
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 23:25:42 -0400
Received: by mail-yb1-xb32.google.com with SMTP id z1so72021747ybf.6
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 20:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b9QRWBn1sNL/LURhRdlj0mKDd0hrlKd1TUE1j8dMHg0=;
 b=KnpsS+GaPcTWZgeG8+vuf89/cHu8MieOYM7s3zzXw6z9I/4HhomhFAlQAEf72+IJul
 zuSJGnzfoRSIqg/qZ8afCj9s5aS4yaZVLcdejWzCHATdJ3S3dPvWMnZnNZfWRVP9DCeL
 miI44gv7BNnJHtaHh4mps2BOvlUk0JoXUuy9YQdZY3+rH0Kjwx0UIj+lwyuT8o9TbRkv
 m2UeaS94ZNhPMt+w3oTEm5EKcm0R4wv/+UsHBJW3hU5K+qmVOFuKXYFd43RK1tHRKnsm
 Yb3FNxFOGV/tzTp+WggeaCfAkawXI9K+4dNShx7QgJdTGahbsmI7PWRHvvwt6hG7PTeG
 lnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b9QRWBn1sNL/LURhRdlj0mKDd0hrlKd1TUE1j8dMHg0=;
 b=i6HK0qkrjvTpCpMUlcwnhdt0/usACagzxphghixvGUmIHzHpOVFLNXJ8B+Mt9E917u
 68uLS0DkfmuDUmWk3vAXfSVK3QRKSLJlQ6xFRNNmMcZHurEDskKaoNVkw/KQtdq4/NOL
 k6GX1l3b+u/oPfiSEXGnLTLfnw2UP59SZavYaFFsigyVTaQpFC8IeznFjfSo3jvGDNHj
 pPP2363Ne35s6Nz06wTIz8XQ7JJ0QG725qFwPQLIRunYclG8UxgpeRpyu6zmeNfzno6t
 7voOQr2PZIvMfYx8ERyH2HO/GmYCBtsGmvOBeXgdNp1PLuy9Sll3FUKP7roo19N4Q/Ze
 yS2A==
X-Gm-Message-State: AOAM530hwJxqaIDppqtoeqCm1RK1hesDaGuzleFKX3rGEcp7cxk/t1LA
 HVeVCQw8qUMMCYDLHx3ktKvp1gFat2RIxCTE+qo=
X-Google-Smtp-Source: ABdhPJwPH4VR201BbPJeMNWPi5+CuXF1l5J11bNY3oMYhfy5u1hUHESYX0wZ/PaSedbYKbV3/I9y6PpxSCBrb5YMHe4=
X-Received: by 2002:a25:424e:: with SMTP id p75mr22218024yba.161.1619580338679; 
 Tue, 27 Apr 2021 20:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210416153430.92187-1-ziqiaokong@gmail.com>
 <dcca83eb-40e7-91a2-c8dc-73a5a51d23db@linaro.org>
In-Reply-To: <dcca83eb-40e7-91a2-c8dc-73a5a51d23db@linaro.org>
From: Ziqiao Kong <ziqiaokong@gmail.com>
Date: Wed, 28 Apr 2021 11:25:27 +0800
Message-ID: <CAM0BWNCX8qqoAeKe8aPk4aih6m_fyrG_T=-H7tP8GsVbVWCXpg@mail.gmail.com>
Subject: Re: [PATCH] Set the correct env->fpip for x86 float instructions
 [cleaned]
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=ziqiaokong@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for your review! I did a full re-read of the Intel Manual about
x87 programming just now and would send another patch to handle
FCS:FIP and FDS:FDP.

Ziqiao

On Wed, Apr 28, 2021 at 1:49 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/16/21 8:34 AM, Ziqiao Kong wrote:
> > +++ b/target/i386/tcg/translate.c
> > @@ -6337,7 +6337,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
> >                   goto unknown_op;
> >               }
> >           }
> > +        tcg_gen_movi_tl(s->tmp0, pc_start - s->cs_base);
> > +        tcg_gen_st_tl(s->tmp0, cpu_env, offsetof(CPUX86State, fpip));
>
> This placement is wrong because it catches instructions that should not modify
> FIP, like FINIT.
>
> It might be best to set a flag around this case like
>
>    bool update_fip;
>
>    case 0xd8 .. 0xdf:
>      ...
>      update_fip = true;
>      if (mod != 3) {
>          ...
>      } else {
>          ...
>      }
>      if (update_fip) {
>          ...
>      }
>      break;
>
> and set update_fip to false for the set of insns that either do not update FIP
> or clear it (8.1.8 x87 fpu instruction and data (operand) pointers).
>
> I notice you're not saving FCS to go along with this, at least for
> CPUID.(EAX=07H,ECX=0H):EBX[bit 13] = 0.
>
> And if you're going to this trouble, you might want to think about FDP+FDS as
> well.  It should be about the same amount of effort.
>
>
> r~

