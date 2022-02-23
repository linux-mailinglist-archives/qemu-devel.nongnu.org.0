Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4404C1E5C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:21:42 +0100 (CET)
Received: from localhost ([::1]:49972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN00z-0000a7-IE
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:21:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMzz7-00072k-KX
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:19:45 -0500
Received: from [2607:f8b0:4864:20::102b] (port=54260
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMzz2-0007Od-8Z
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:19:45 -0500
Received: by mail-pj1-x102b.google.com with SMTP id bx5so278149pjb.3
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 14:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=B8D6UODZk6JfMql9QTNIR7QN6ZKf2Qqgn85qheMV4r0=;
 b=OGyd4t8PBXo2jdUFVoh+JidBoiN2pIwtr2cH96h7o/EB+u9425eojhzpQqWIQLtWD+
 3tKaBRSzQAGx7UHbHAfcL/BTfrcW0C3wnrX+92pa6Dm0f3tsXv34CiE++BdRVkSdOSTf
 ORbIxlHqCMMUvrpCvBq5kM3Kzi6XwqEE19+qPiprL8IJ2QJgH3zxJ5FgV0Dr9U2PwnkO
 G/9u37yBTEtIseY11hzrfvre8aBm46zUeNXmzF9i5CSte981zLvsCxstsDlZR9xpA6kV
 M03UKHkMbreC5pzCB7EITuedfAfz4aWGms7KKuLfnNcygHW5vr8goI15Sal8njZM9tIv
 UnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B8D6UODZk6JfMql9QTNIR7QN6ZKf2Qqgn85qheMV4r0=;
 b=DlHeQA2/d9CcbB/yYNyTL+9TwMhqQXlaVk+1PVtuf7iKJDzT3HLQGLs+omXZaNjq7O
 todNERcwuQR9W8nIu/DVinGOo79hMeULbOjP00hwURGIK7xKTBqfw94G4w5MhZn68X2K
 jXS2NdwJ3UWe1HvB3bAi8tbsKhRI25iXCxaVv/RzPIPRCb/TlD9F7hBo0KStt5aHGXwo
 I24LpePgJ1rl0sBIUl44gzGltBRwC603S++KhQ43cCjypMAm8rrdwYHSvVkqhXE7YwUK
 +qOpeyCbdB+z1wExIn5EeoY9GjuFLlactQsQ3yCeN4tl6zLpVJB2JhSa/XkiIgCNuVoB
 i44Q==
X-Gm-Message-State: AOAM5334NXndP5+6Lo/leGAATzpVUKRbA1Qq1WiItJJtyrVOvX0/PUcl
 nbT1CfP33nUis3awWzGK3amIRQ==
X-Google-Smtp-Source: ABdhPJzoy5qSkDyepoN/3vXyn89OsDI7i6B57Vm72EK42bqCh0drD34Ld93imHg04huonTNLFUU49g==
X-Received: by 2002:a17:902:7041:b0:14f:c724:42c7 with SMTP id
 h1-20020a170902704100b0014fc72442c7mr1645351plt.11.1645654777793; 
 Wed, 23 Feb 2022 14:19:37 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id m14sm437875pgd.75.2022.02.23.14.19.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 14:19:37 -0800 (PST)
Message-ID: <cf26c57f-ec5e-daec-b129-cd3f49112c3b@linaro.org>
Date: Wed, 23 Feb 2022 12:19:34 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 24/47] target/ppc: move vrl[bhwd]nm/vrl[bhwd]mi to
 decodetree
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-25-matheus.ferst@eldorado.org.br>
 <9111db3b-f238-7780-a5dd-4350721146b3@linaro.org>
 <a77fcbaa-6810-ada8-3aef-2beb140c00d3@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <a77fcbaa-6810-ada8-3aef-2beb140c00d3@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 2/23/22 11:43, Matheus K. Ferst wrote:
>> Note that rotlv does the masking itself:
>>
>> /*
>>   * Expand D = A << (B % element bits)
>>   *
>>   * Unlike scalar shifts, where it is easy for the target front end
>>   * to include the modulo as part of the expansion.  If the target
>>   * naturally includes the modulo as part of the operation, great!
>>   * If the target has some other behaviour from out-of-range shifts,
>>   * then it could not use this function anyway, and would need to
>>   * do it's own expansion with custom functions.
>>   */
>>
> 
> Using tcg_gen_rotlv_vec(vece, vrt, vra, vrb) works on PPC but fails on x86. It looks like 
> a problem on the i386 backend. It's using VPS[RL]LV[DQ], but instead of this modulo 
> behavior, these instructions write zero to the element[1]. I'm not sure how to fix that. 

You don't want to use tcg_gen_rotlv_vec directly, but tcg_gen_rotlv_vec.

The generic modulo is being applied here:

static void tcg_gen_rotlv_mod_vec(unsigned vece, TCGv_vec d,
                                   TCGv_vec a, TCGv_vec b)
{
     TCGv_vec t = tcg_temp_new_vec_matching(d);
     TCGv_vec m = tcg_constant_vec_matching(d, vece, (8 << vece) - 1);

     tcg_gen_and_vec(vece, t, b, m);
     tcg_gen_rotlv_vec(vece, d, a, t);
     tcg_temp_free_vec(t);
}


r~

