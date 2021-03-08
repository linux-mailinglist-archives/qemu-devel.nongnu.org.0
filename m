Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742ED33058A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 02:04:54 +0100 (CET)
Received: from localhost ([::1]:57792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ4KL-0007vT-0y
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 20:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJ4Ir-0007TL-BT
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 20:03:21 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:52055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJ4Ip-0007MJ-Mz
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 20:03:20 -0500
Received: by mail-pj1-x1029.google.com with SMTP id jx13so2113835pjb.1
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 17:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=U5LK35/0ELwZDA4+SKBVeAtKXBTbXjFqOpP38E+2gIM=;
 b=UR+jBLYCHFss/sOqXqMHEvmICzFn7EGEDManH5amXQZM3d3celpCJKEUjh0DpaRFyU
 daPfIXaPz6uTUZ6fBZJnBy3wqKjBrq3ElsNmHHgByo9YNvAiFfkXIaOuFa74aAxKD2B/
 YMNrAUzJKBjYB/CIq3YtzEWzVsFZs/rXSPSAiY0fXOoSoqjKEHuseCduTWPwMv6F5aRJ
 SsJHUp1+cm60NFkY5H0YC9M60JJx+4Ppno4BGpA7kw2tOHkon77Y4ZQkdRhYkvUIHgiv
 xAoUjgKqm3rkBibXY0BdzcYrQf3ThGDvdyJQ7bMSl7uEgvF/ZvwzIYrBkqxSuPiopNAu
 C8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U5LK35/0ELwZDA4+SKBVeAtKXBTbXjFqOpP38E+2gIM=;
 b=oAfh/BL+PKVMG+z5BM6zwlYTkQ1G6fo0iZ97kXvy1l6G1Fp/u3W9UQzoN3tCRvYndK
 ORvYx+0+3AAYTani6lz3Qy2TzedYWyLMIlMgPKKk51pBkD+zoe9XmmecBOuUT8A6Lzfe
 ZCLL33/v+1BHa3IZK3sK+q31uto94px0qK2iBdq+z/XBNX5K2rkfCppbiWw8CWNc0QIN
 hT6YkPdhvCCZ9q3R4pmk++RIOKVjugNsUXcXrVpzyPr1Gyzsuu0cMAOC251GPfM0qTuX
 BfIAtvt2VCWdlu2MHsZ9TY1XqIGitxd14og8rxwry0GAWDspA1uzzeyAhc0n03VJq65B
 3Lnw==
X-Gm-Message-State: AOAM533VmWBc4qjH4c44g3SFwrMMzP3vZFu6SjK0PZLg98ZzGCrBV4UQ
 ZnRiqmgoL4m3qFdp/G8u9Db5Aw==
X-Google-Smtp-Source: ABdhPJy5omi2l4fQ2kwEtZuSB4lS9o0MV9b6k5Zy+YBCSYXyHb+EA1yU82/CKzu7uSN8Yhjp6eCyXQ==
X-Received: by 2002:a17:90a:7e0a:: with SMTP id
 i10mr21310183pjl.152.1615165398000; 
 Sun, 07 Mar 2021 17:03:18 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z12sm8424707pjz.16.2021.03.07.17.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Mar 2021 17:03:17 -0800 (PST)
Subject: Re: [PATCH 2/2] target/m68k: add M68K_FEATURE_NO_DALIGN feature
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210307202607.27745-1-mark.cave-ayland@ilande.co.uk>
 <20210307202607.27745-3-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <301be535-ae3f-4c09-3be5-8efc4c799ea1@linaro.org>
Date: Sun, 7 Mar 2021 17:03:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210307202607.27745-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/21 12:26 PM, Mark Cave-Ayland wrote:
> According to the M68040UM Appendix D the requirement for data accesses to be
> word aligned is only for the 68000, 68008 and 68010 CPUs. Later CPUs from the
> 68020 onwards will allow unaligned data accesses but at the cost of being less
> efficient.
> 
> Add a new M68K_FEATURE_NO_DALIGN feature to specify that data accesses are not
> required to be word aligned, and don't perform the alignment on the stack
> pointer when taking an exception if this feature is not selected.

How about a positive, rather than negative name, like M68K_FEATURE_UNALIGNED_DATA?

This points out that we should be raising Address Error without this feature. 
This requires a moderate amount of cleanup in translate, manipulating 
MO_ALIGN{,_2} as part of the MemOp parameter to tcg_gen_qemu_{ld,st}_i32.


r~

