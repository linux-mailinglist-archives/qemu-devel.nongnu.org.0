Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E4F457CA4
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 09:57:40 +0100 (CET)
Received: from localhost ([::1]:57870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moMBn-0005Vu-R8
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 03:57:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moMAm-0004j3-3P
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 03:56:36 -0500
Received: from [2a00:1450:4864:20::42a] (port=35372
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moMAk-0008Eh-9s
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 03:56:35 -0500
Received: by mail-wr1-x42a.google.com with SMTP id i5so22425488wrb.2
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 00:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5VoitysbIiQehaHxTaQn+gUZ2DwY2bLVYSeqCxwgo1k=;
 b=vC1HuK1OoPZbhkj5WIKmdsuIwHHht61ylvuzsF8qvUmr0W28debxH16+ZqfzxvIuDa
 2jPt22fbwnN83hUtK5PJLVpbHlWDofJINpf830QvlB+XzoEceD86Qro4//R/omRIy8pJ
 jaa52JPSXAbzSrASxZ5gQAIaFxDFUxoezCApeUKwPeh0vxgdXvndjxl+xVW9O6cmfS77
 uCMXj7fAonBaDF6AL/WrWO+fpftDu9Xk1bXZgJPny0gtqidyJE/9xtdZvLBZg9Tsd7C5
 OqB0dYAppdBXZdfTHRmVBaUl2A9xJ6IxFXY0pBxMEbRsD9A2LKjUqRCK5zuEH+zsBbMI
 Q04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5VoitysbIiQehaHxTaQn+gUZ2DwY2bLVYSeqCxwgo1k=;
 b=qt8+IYHLH0SWB8fzRpMaxvGdKHDoO8oiJV6Omq8GNOxCdKO5UhVWSkI/h1f6ALK7et
 qdHu7j6ugiTPJGsIiCjX8lMghIXU94aKIAoRQzKBNZLxLkOKPN7EYiW7BVwpb6V93tFp
 NbDdMOZb+o66Ze76GmFcDko7haSjWkoP7kVO82tNOfSDD7Km+lU06kXaIlQ8Xg/pxwoA
 4a7myy8GitQhryCV6JDAPaxVeYPQqRMWo+XckQWbhnRSxINXCb1wSnC6vd7CWIe00IUN
 MUE3bZ50bpEzpnGalQsY3bda5EaN1VhtGIgkXQnR2d4906bLhS1uVZIvnvUkDkmhId10
 N/0g==
X-Gm-Message-State: AOAM531p7HOCp1EygqOhPFzL1ENqxWrrE/d9Ur5CZLL4Ei5eX7jGsKim
 LBAIlxCwkzWPhRyQiHbIhbRhoA==
X-Google-Smtp-Source: ABdhPJwPn1q3zueXpIxRLURrxPQcIrSnaVmT+iWOYAWg4l7Ua3Oh6wPdcP2EraKx/r/FDthm8fMR4Q==
X-Received: by 2002:a5d:624f:: with SMTP id m15mr16049787wrv.13.1637398592828; 
 Sat, 20 Nov 2021 00:56:32 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id v15sm2091561wro.35.2021.11.20.00.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 00:56:32 -0800 (PST)
Subject: Re: [PATCH v11 04/26] target/loongarch: Add fixed point arithmetic
 instruction translation
To: gaosong <gaosong@loongson.cn>
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-5-git-send-email-gaosong@loongson.cn>
 <6ccd9c56-9db6-7a40-d59c-22bf3fc2f6b0@linaro.org>
 <b6259138-0f0d-c0dd-c4ed-632f76e507fb@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e7b647bf-bb0d-66e0-ca9f-f96eb2a2550c@linaro.org>
Date: Sat, 20 Nov 2021 09:56:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b6259138-0f0d-c0dd-c4ed-632f76e507fb@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/21 9:52 AM, gaosong wrote:
> You're right, gen_set_gpr not need EXT_NONE at all, and we need not condition around gen_set_gpr.
> I think that if we know the dst_ext is EXT_NONE, we do't need gen_set_gpr.

But that assumes that gpr_dst did not return a temporary.
I think it's cleaner to assume that gen_set_gpr is needed.


r~

