Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B0F4B1E82
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 07:22:25 +0100 (CET)
Received: from localhost ([::1]:50242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIPK2-0005Jj-1I
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 01:22:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIPEf-0004Dn-3r
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 01:16:51 -0500
Received: from [2607:f8b0:4864:20::102e] (port=35665
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIPEc-00012E-0t
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 01:16:48 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 a11-20020a17090a740b00b001b8b506c42fso11048957pjg.0
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 22:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HhO0xlTeosTLHWwE1NnYNvHs5jekKTbpqXnjB7Xa40E=;
 b=FjpVELIDLu04ggTM1/2YdOzqodwIEcVurIxU3PKLvEV0rKgtYNUF0wpqEpeY+hrDCT
 NEVxoP/c9AGLgJ3NzvXvtCrABSsRbw7NAyx1CngO2LE+p1ycZYMqrQL9mDFvFAtO1nLm
 KKqNiE4YJG+tmC8Qp/HMiBb+TlskK5sgUT5JdGYFPqcFS6/+Qa28+wbmC/52ebDKY0eV
 DXoaTHJ9UGbxRny5Qe0Oji/om/nBva5xIBgZCXh0dn+F18K+QP6V2kgEITEsssMYdSmo
 0G+0U5IxipI4TCkKFpGIk1cC6ne/cXxUZ9pu7XgJ3XNECLYSf/OeJ7T7meyHH64coq+b
 5J3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HhO0xlTeosTLHWwE1NnYNvHs5jekKTbpqXnjB7Xa40E=;
 b=cP4DRmRYw3XA03XsxWTnvQx0T+nvklYGOiK32NesbrcmYW/cuEMjpe0eub9w670tjR
 VRxg6Q2fzBs2QSp1foSYnpU14FNGEvkW556pHD3gAEspcOhcXix0K3O0VWgOMBGs4yTH
 6tb/KBywcZuzjOvG6snFXvwcqp8dxBc/IGnbDDHF7dGU7LCZ1tqRmTsnT11PiEjE3HhT
 hlS5oses8KHU1ViaMuC2os0zOP7QmfStugl5MffluqqKYnr8Sv6BoH7zqZijY5jftiWw
 ICukzGRmLmUI5sSAMVehzj15xfG61V4LbZqG5Gzjqu2tgSlcip91CtjFHumt3j+zOC08
 vBUg==
X-Gm-Message-State: AOAM531NQDNar4PkpuZqCgcEnj4zqMbvwX/lej9EPA3ux4VXOLTj0cJm
 NODIbWKvh68a3zvrI5LpE8jneQ==
X-Google-Smtp-Source: ABdhPJwN8RbYx4hKKs/ETw56xLETVvAgKHXLzcabiK9hVSbsSpb/Lba/Qb9q/KOkS5LXiBo9Q9QLEQ==
X-Received: by 2002:a17:90b:951:: with SMTP id
 dw17mr1167026pjb.10.1644560204480; 
 Thu, 10 Feb 2022 22:16:44 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id g19sm7291892pfc.109.2022.02.10.22.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 22:16:44 -0800 (PST)
Message-ID: <3f0483bb-d039-e558-1b31-ec72d5467e24@linaro.org>
Date: Fri, 11 Feb 2022 17:15:54 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 18/37] target/ppc: implement vgnb
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
 <20220210123447.3933301-19-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210123447.3933301-19-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 23:34, matheus.ferst@eldorado.org.br wrote:
> +    for (int dw = 1; dw >= 0; dw--) {
> +        get_avr64(vrb, a->vrb, dw);
> +        for (; in >= 0; in -= a->n, out--) {
> +            if (in > out) {
> +                tcg_gen_shri_i64(tmp, vrb, in - out);
> +            } else {
> +                tcg_gen_shli_i64(tmp, vrb, out - in);
> +            }
> +            tcg_gen_andi_i64(tmp, tmp, 1ULL << out);
> +            tcg_gen_or_i64(rt, rt, tmp);
> +        }
> +        in += 64;
> +    }

This is going to produce up to 3*64 operations (n=2).

You can produce more than one output pairing per shift,
and produce the same result in 3*lg2(64) operations.

I've given an example like this on the list before, recently.
I think it was in the context of some riscv bit manipulation.

> N = 2
> 
> AxBxCxDxExFxGxHxIxJxKxLxMxNxOxPxQxRxSxTxUxVxWxXxYxZx0x1x2x3x4x5x
>   & rep(0b10)
> A.B.C.D.E.F.G.H.I.J.K.L.M.N.O.P.Q.R.S.T.U.V.W.X.Y.Z.0.1.2.3.4.5.
>   << 1
> .B.C.D.E.F.G.H.I.J.K.L.M.N.O.P.Q.R.S.T.U.V.W.X.Y.Z.0.1.2.3.4.5..
>   |
> ABBCCDDEEFFGGHHIIJJKKLLMMNNOOPPQQRRSSTTUUVVWWXXYYZZ001122334455.
>   & rep(0b1100)
> AB..CD..EF..GH..IJ..KL..MN..OP..QR..ST..UV..WX..YZ..01..23..45..
>   << 2
> ..CD..EF..GH..IJ..KL..MN..OP..QR..ST..UV..WX..YZ..01..23..45....
>   |
> ABCDCDEFEFGHGHIJIJKLKLMNMNOPOPWQQRSTSTUVUVWXWXYZYZ010123234545..
>   & rep(0xf0)
> ABCD....EFGH....IJKL....MNOP....QRST....UVWX....YZ01....2345....
>   << 4
> ....EFGH....IJKL....MNOP....QRST....UVWX....YZ01....2345........
>   |
> ABCDEFGHEFGHIJKLIJKLMNOPMNOPQRSTQRSTUVWXUVWXYZ01YZ0123452345....
>   & rep(0xff00)
> ABCDEFGH........IJKLMNOP........QRSTUVWX........YZ012345........
>   << 8
> ........IJKLMNOP........QRSTUVWX........YZ012345................
>   |
> ABCDEFGHIJKLMNOPIJKLMNOPQRSTUVWXQRSTUVWXYZ012345YZ012345........
>   & rep(0xffff0000)
> ABCDEFGHIJKLMNOP................QRSTUVWXYZ012345................
>   deposit(t, 32, 16)
> ABCDEFGHIJKLMNOPQRSTUVWXYZ012346................................

and similarly for larger N.  For N >= 4, I believe that half of the masking may be elided, 
because there are already zeros in which to place bits.

> N = 5
> 
> AxxxxBxxxxCxxxxDxxxxExxxxFxxxxGxxxxHxxxxIxxxxJxxxxKxxxxLxxxxMxxx
>   & rep(0b10000)
> A....B....C....D....E....F....G....H....I....J....K....L....M...
>   << (5 - 1)
> .B....C....D....E....F....G....H....I....J....K....L....M.......
>   |
> AB...BC...CD...DE...EF...FG...GH...HI...IJ...JK...KL...LM...M...
>   << (10 - 2)
> ..CD...DE...EF...FG...GH...HI...IJ...JK...KL...LM...M...
>   |
> ABCD.BCDE.CDEF.DEFG.EFGH.FGHI.GHIJ.HIJK.IJKL.JKLM.KLM..LM...M...
>   & rep(0xf0000)
> ABCD................EFGH................IJKL................M...
>   << (20 - 4)
> ....EFGH................IJKL................M...................
>   |
> ABCDEFGH............EFGHIJKL............IJKLM...............M...
>   << (40 - 8)
> ........IJKLM...............M...................................
>   |
> ABCDEFGHIJKLM.......EFGHIJKLM...........IJKLM...............M...
>   & 0xfff8_0000_0000_0000
> ABCDEFGHIJKLM...................................................

It's probably worth working through the various N to make sure you know which masking is 
required.


r~

