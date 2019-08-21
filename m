Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B0898826
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 01:54:54 +0200 (CEST)
Received: from localhost ([::1]:37158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0aRI-0002DG-OB
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 19:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51970)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i0aQ9-0001FN-GU
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 19:53:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i0aQ8-0005jd-CW
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 19:53:41 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:40557)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i0aQ8-0005ih-5G
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 19:53:40 -0400
Received: by mail-pl1-x641.google.com with SMTP id h3so2252307pls.7
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 16:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BWhUoFGMnkuFVUSfFjxK/rkl3W9VTXI+CM0vz9DXaLo=;
 b=zqqM055e+J78XQAGErsfKHdEPEHb9c3NwBHv2flJLKb4jWe3tE8lMz2YiERgO4j6LP
 1NJPSC4DOFgC/7vvxcPFryP0JdVTMuTdavDT855cEWUVO0enUI4zi6wNFG8h5KXU5T7t
 bRUEvVbAatdYwZiKN3VxlXZskZPlv0u6kVV5GyOtbsAlh/HKa9jZcgjDfkG+/XIM03S4
 q4sUG0oh+0/BG49FqnCUUrJttv5DOsMCQPv8xjFuIYJNEJ0PQ2UW94Z1ycgwNd641cBs
 Qlf2N2Z/YsoHmZar2hQTXmp1uv9QRQBUuv1dqYS4BC4kkHY6R5M1dvE8gnBevg7QTOKl
 NOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BWhUoFGMnkuFVUSfFjxK/rkl3W9VTXI+CM0vz9DXaLo=;
 b=E1xTEXa2cKWfYOom2QsBynYFhnaDuJ6A5pguIVyaJgwwBiZOFvPcIzcr3PWdbMtmmR
 qRSLS7o3ALhXIq4Xdu5P91DmnErXuiqBP3JMs4ZNIJ+iC1GYkutxrcITjuXmn/FewB+1
 vplCQchI/X/YYAVr8Bgvo3IgpoQ/nSmZ7bQMy4fbpam8svhIJd/YA4JRUKae0F2s2PfB
 fSoXoCHVO/Ccl+GB4NOAKvRZKpngZB0Ctrsz6haIt6eHcIPioLzIbxD15NOcLHl3hTJp
 v+oMzd1X4rCVzuOZHBd8JES8W9riglQQLP3sH704VJJt7YW2KED23VWIgcLdYbO+A2x9
 aOUQ==
X-Gm-Message-State: APjAAAUS5DfHboVy/qz5NBDvjz3CjyCkIF7FOCZC3D+7wlc1C3rKWSJ2
 RxEhzShjuT2beaxXo9tuQwkI1A==
X-Google-Smtp-Source: APXvYqwpI/T+IQ/GSgIca5P2HxnNHPpYyfUMtVlYPtUqjfe5UU7lhOd+Y1460+RlTYlQTr6LUQM5OA==
X-Received: by 2002:a17:902:9f8e:: with SMTP id
 g14mr36830483plq.67.1566431618927; 
 Wed, 21 Aug 2019 16:53:38 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d189sm31171157pfd.165.2019.08.21.16.53.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Aug 2019 16:53:37 -0700 (PDT)
To: Jan Bobek <jan.bobek@gmail.com>, qemu-devel@nongnu.org
References: <20190821172951.15333-1-jan.bobek@gmail.com>
 <20190821172951.15333-76-jan.bobek@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5fca852c-7824-ca02-8837-47979a509edd@linaro.org>
Date: Wed, 21 Aug 2019 16:53:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821172951.15333-76-jan.bobek@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-devel] [RFC PATCH v4 75/75] target/i386: convert
 pmovmskb/movmskps/movmskpd helpers to gvec style
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/21/19 10:29 AM, Jan Bobek wrote:
> +    for (intptr_t i = 0; i * sizeof(uint8_t) < oprsz; ++i) {
> +        const uint8_t t = a->B(i) & (1 << 7);
> +        ret |= i < 8 ? t >> (7 - i) : t << (i - 7);

You can avoid this variable shift by doing

  uint32_t t = a->B(i) >> 7;
  ret |= t << i;

> +uint64_t glue(helper_pmovmskbq, SUFFIX)(Reg *a, uint32_t desc)
> +{
> +    return glue(helper_pmovmskbd, SUFFIX)(a, desc);
>  }
...
> +DEF_GEN_INSN2_GVEC(vpmovmskb, Gd, Uqq, sd1_ool, XMM_OPRSZ, XMM_MAXSZ, pmovmskbd_xmm)
> +DEF_GEN_INSN2_GVEC(vpmovmskb, Gq, Uqq, sq1_ool, XMM_OPRSZ, XMM_MAXSZ, pmovmskbq_xmm)

What is the difference between these two?

Given that we aren't attempting avx512, uint32_t is sufficient for all of the
bytes of a YMM register.

I have a feeling that some of this should simply use target_ulong, so that a
direct assignment to the general register can be done without extra extensions
within the generated code.


r~

