Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6A0355D23
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 22:49:03 +0200 (CEST)
Received: from localhost ([::1]:60570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTsdB-0003GA-No
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 16:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTsaq-00029N-7k
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:46:36 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:38506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTsah-0001Uu-IU
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:46:34 -0400
Received: by mail-pg1-x533.google.com with SMTP id w10so5781304pgh.5
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 13:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NDq9w7TheeDKzYhBYExuw7V6NY0pfwnKBmTrCZvjyP0=;
 b=PseW67dzWp3429MybF+hzYFsrSj3XDiviin0Ou6AL0oI537pfoNToCU2gl2sa/hIyc
 uB4Vv983MmgmuvgXbIvNjrLXZ48UjjvAEqCcGV1lsjM5if/jISo0VYCOGlokvvhaVyvM
 p9mkRz6g1iLG7JwM6BTjUF9PMgoF3RjEurS5tyYNzhoho/15qs3sBVN9EbXMmRT3wHpJ
 h9h2X/qx2r9f7mGlku4SjMp3iG2Is8nFk7IihIxrUTcxOcxHgW2fK5pcIDENeapO8Ipz
 4IUxJtJUzVo5UccwN6x0TjCUF10ochydfrHOWQyPOP67PGJBT2NdlT/OdjheGEJo0SE7
 3g6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NDq9w7TheeDKzYhBYExuw7V6NY0pfwnKBmTrCZvjyP0=;
 b=JxlZ7mCurdD/xeVx7XevCOyu/pzkKRO55CMs4iELq6GTNyJuWSFnAsi9DMM8bbkJ2M
 J/fKUzEtRT4yW8CN5SO7yoxZaIe1a17fEmmvg+pFTWigIlaslWIKVuMpmlnnLngiVJX3
 6aiq+8LGTYxanNF3+PI6lL2AB4iZJglH0Au3dDPDBEY5xxK5e0+a9WZVUU7MlLY4oNFv
 Cto5ejBD6qUyTV+2ZwKpTM7cgWOIoVNR9+IQpW6km/5fmlD22U05eEpnk46dS3nxTaTC
 sdut75TCl8JeIB7wv2/97YiZvJ6tMRaTam3sLEkHnybJOlgrk0zsxN2rCfe1/sVwyWij
 KNvg==
X-Gm-Message-State: AOAM533CJI8mibH+2fMtbyyfWqT7Wd8JpA5HVRwHN6ttc3RzbioJeiS/
 F6l2LImv1ztsYSwymp8WSXGu+A==
X-Google-Smtp-Source: ABdhPJw7jQq3c75hSykzDbyep8Y3t1Op/6i0E+TtJ9Fmm/EC8kchWPzDuUrh0nhlrG+h3YxOXGCl4w==
X-Received: by 2002:a62:7a97:0:b029:23f:44a1:ac86 with SMTP id
 v145-20020a627a970000b029023f44a1ac86mr4391283pfc.12.1617741985773; 
 Tue, 06 Apr 2021 13:46:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id a15sm3076654pjs.47.2021.04.06.13.46.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 13:46:25 -0700 (PDT)
Subject: Re: [PATCH v2 12/21] Hexagon (target/hexagon) add F2_sfrecipa
 instruction
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-13-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <13945cfa-a211-8d4d-df64-3df7b8304b04@linaro.org>
Date: Tue, 6 Apr 2021 13:46:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617249213-22667-13-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 8:53 PM, Taylor Simpson wrote:
> +int arch_recip_lookup(int index)
> +{
> +    index &= 0x7f;
> +    const uint8_t roundrom[128] = {
> +        0x0fe, 0x0fa, 0x0f6, 0x0f2, 0x0ef, 0x0eb, 0x0e7, 0x0e4,
> +        0x0e0, 0x0dd, 0x0d9, 0x0d6, 0x0d2, 0x0cf, 0x0cc, 0x0c9,
> +        0x0c6, 0x0c2, 0x0bf, 0x0bc, 0x0b9, 0x0b6, 0x0b3, 0x0b1,
> +        0x0ae, 0x0ab, 0x0a8, 0x0a5, 0x0a3, 0x0a0, 0x09d, 0x09b,
> +        0x098, 0x096, 0x093, 0x091, 0x08e, 0x08c, 0x08a, 0x087,
> +        0x085, 0x083, 0x080, 0x07e, 0x07c, 0x07a, 0x078, 0x075,
> +        0x073, 0x071, 0x06f, 0x06d, 0x06b, 0x069, 0x067, 0x065,
> +        0x063, 0x061, 0x05f, 0x05e, 0x05c, 0x05a, 0x058, 0x056,
> +        0x054, 0x053, 0x051, 0x04f, 0x04e, 0x04c, 0x04a, 0x049,
> +        0x047, 0x045, 0x044, 0x042, 0x040, 0x03f, 0x03d, 0x03c,
> +        0x03a, 0x039, 0x037, 0x036, 0x034, 0x033, 0x032, 0x030,
> +        0x02f, 0x02d, 0x02c, 0x02b, 0x029, 0x028, 0x027, 0x025,
> +        0x024, 0x023, 0x021, 0x020, 0x01f, 0x01e, 0x01c, 0x01b,
> +        0x01a, 0x019, 0x017, 0x016, 0x015, 0x014, 0x013, 0x012,
> +        0x011, 0x00f, 0x00e, 0x00d, 0x00c, 0x00b, 0x00a, 0x009,
> +        0x008, 0x007, 0x006, 0x005, 0x004, 0x003, 0x002, 0x000,
> +    };
> +    return roundrom[index];
...
> +    if (arch_sf_recip_common(&RsV, &RtV, &RdV, &adjust, &env->fp_status)) {
> +        PeV = adjust;
> +        idx = (RtV >> 16) & 0x7f;
> +        mant = (arch_recip_lookup(idx) << 15) | 1;

Why not just export the table and not the function?
You're already masking the index at the single use.


r~

