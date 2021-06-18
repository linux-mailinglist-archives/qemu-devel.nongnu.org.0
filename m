Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F09AB3AD0CB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 18:56:52 +0200 (CEST)
Received: from localhost ([::1]:46036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luHnX-0004DC-HK
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 12:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luHmB-0002l5-72
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:55:27 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:39693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luHm7-0005Pr-Dm
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:55:26 -0400
Received: by mail-ed1-x52c.google.com with SMTP id c7so8598498edn.6
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 09:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lw7IeOdWe+kKsmBcgwpRgjAY48lKE3ebyYwBJeSi5fo=;
 b=Lxqi3WJelgjYaNcvjK2iogGotqWDtslko/uE9tDSVNAhG9Y+x6E9yQPTxOc2DK9R+H
 6oKgsG90iE80oe1EEss4pAw/Ecbe9/3pIjWN+nrZnBqxBTpT8+AcBWqKgqREA+EAU2rr
 mz3mMt92sf075RJyRkso0MJhDgXG5G4ZM7yeQ3W0kHBWgvmeM5qtb2OK1Bi3w2OPluos
 2dJrVqPPmUtwArlAmy07DBJHbLXGTMdMN1N86jjTFlDr+CjlozMZeun8So1spn0KscHH
 /esjpUusxemZkbDrc/BSeWNBMehkg7BtCNT46FUwS7Rnk/b5eQ8a9GLGv+h9kUwDCGGc
 ti6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lw7IeOdWe+kKsmBcgwpRgjAY48lKE3ebyYwBJeSi5fo=;
 b=tSyxQKypWU8XZ8RhjN03VQTYs7RDYqQvDbjx/esHi15ayB8abhWSS0a4WXhyFDXeI9
 pHDGPzNkYRQwCZrXq2shMZysryhGj89Ofh44l+E+mkI/iCdU59bCfb3/DsaUIthHGEWj
 OSKpZwwJGmuWRddcUW/rPVnEQMLbEYAqNbqIGKLcFRWsAfcmN63UJ52iSnQj8PVVPt4i
 /EXbqbV5pCnI1ZA9258bKZ880BRfSWtYgC0UiohECJPKIDFOHNP03oTDxIl4I0kxFW/t
 Oi5uamk4bn6QNsmeQQopvtRr+fIGQnWxZI5fJvQ8PnFeWpNsv0+A0tafep6ho0ohx0dh
 rY8w==
X-Gm-Message-State: AOAM532Vp+JLiBCT+rO0ucmlxI1pKcUmbnH/w4l4y00Txpq4yyKncq5Q
 C2wTtoTIjhAFmSLclR6KpnwVh6tSQHA+bCmBW7rUtg==
X-Google-Smtp-Source: ABdhPJwvvo53HgWgXRTnP9kpKjsSZ+bUtTTLpGPUBWzl/q3FxmhHR2UziDzIqQ2ULeKJfE9p8AqeUCWmMWZnJQE6hJE=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr6282077edt.100.1624035321326; 
 Fri, 18 Jun 2021 09:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210618141019.10671-1-peter.maydell@linaro.org>
 <20210618141019.10671-5-peter.maydell@linaro.org>
 <73b67dcb-6d84-03d8-cc37-f8b8b3f94905@linaro.org>
In-Reply-To: <73b67dcb-6d84-03d8-cc37-f8b8b3f94905@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Jun 2021 17:54:46 +0100
Message-ID: <CAFEAcA_qQ7SmbRifq5U-YQL9fF956MxXE1fouKkzRniLCSuefg@mail.gmail.com>
Subject: Re: [PATCH 4/7] target/arm: Handle writeback in VLDR/VSTR sysreg with
 no memory access
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Jun 2021 at 17:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/18/21 7:10 AM, Peter Maydell wrote:
> > @@ -633,9 +665,11 @@ static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value)
> >           gen_helper_v8m_stackcheck(cpu_env, addr);
> >       }
> >
> > -    gen_aa32_st_i32(s, value, addr, get_mem_index(s),
> > -                    MO_UL | MO_ALIGN | s->be_data);
> > -    tcg_temp_free_i32(value);
> > +    if (do_access) {
> > +        gen_aa32_st_i32(s, value, addr, get_mem_index(s),
> > +                        MO_UL | MO_ALIGN | s->be_data);
> > +        tcg_temp_free_i32(value);
> > +    }
>
> So, this bit looked funny at first glance -- are we missing the free of value?  But of
> course value == NULL when !do_access.  Which made me wonder if it wouldn't be better to
> just use value == NULL and not add the extra argument?

That was how I thought I'd do it initially, but of course you
can't do that for the fp_memory_to_sysreg callbacks, and I
preferred to be consistent across the two.

-- PMM

