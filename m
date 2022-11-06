Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CCA61E530
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 19:01:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orjws-000165-BA; Sun, 06 Nov 2022 13:00:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orjwm-00013U-Ud
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 13:00:44 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orjwl-0003jd-DC
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 13:00:40 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bs21so13327142wrb.4
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 10:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NS+4ouzzYBqOKpbBBbc4tUqWOFaP+W2g6HMbc9bRLx4=;
 b=WfeGgkc56wKQTGcXmfKJMYPKM497zS04C45eAKVRSHWYAu8bU7/fbJ6Y1yAbDixGO2
 F36OVqPO9QfJLfwoWA6g4Rq3kBFNYetTWaIbnORvnD7Xm2rtdnnzDrB91a+RBC8FU8La
 Y71tUY057UKz3rqHqLMpmSD0gX1OFzM442j4Ek2bLwMqkAmNX3WdGGjZprCh52MzZFnj
 bxQuf3QbnwLdtq8q7/UrQDVSkF9J8zoJKmsk2vwFwhElaC70Pu08YzlKIoQ5mLLlq15G
 6I3vqLnBtVK7abm8YeT/rp9SCxPzF+oOv8iFbz+nrH/duDbiqMW+qbNV0E0h2iBwhCMs
 Q46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NS+4ouzzYBqOKpbBBbc4tUqWOFaP+W2g6HMbc9bRLx4=;
 b=6lskiaKWP2MGxYdjhaunRzQGKaDFrmtDA3IkTNP+Ynsvv6oIvQ0ak/sXLSlSBESdxa
 /3XaWgNybDLedMCPzPC7CfixhFHOe/4/67ESj25wkwmEphm5+cORWV14P7azN98vWPyY
 frNK/2GbhnluOUiTSawXPYEmh1Xz5eG7xbfiw5kOs+TNAPfn2m5ftZp9OctxjXLGGXAR
 OEeh6TNCcHWTNYGmHA7ruSHIgBMrelR2URA3i6DfJWMXUMYcBBGf9RMe7VIoSjP+B6T1
 fk2m3lAS/BhxNixcuZZfdH+/pwr9ORnjDqIHbFSsE8EF1yBrRQ5tf5/XOSSU1LFNbv/5
 4ybw==
X-Gm-Message-State: ACrzQf0Hr98Hf8i1/hLTAzLVve5rWTF63wB4LNm3TQxdmv4Wr+cs2YF/
 nCLuNQeT6205Tu6BzZRt+jRcnmrjuC4LdQ==
X-Google-Smtp-Source: AMsMyM7LMnrBJPrXTc4+ABqWG5K+4XgxMT/ISohon7urRwP0rGNHIFdxS6F6jQVvgNnJbA59C6Rgow==
X-Received: by 2002:a05:6000:42:b0:236:6c52:bc22 with SMTP id
 k2-20020a056000004200b002366c52bc22mr29500277wrx.692.1667757637966; 
 Sun, 06 Nov 2022 10:00:37 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a5d48c7000000b0022cce7689d3sm6162837wrs.36.2022.11.06.10.00.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Nov 2022 10:00:37 -0800 (PST)
Message-ID: <f167e9a8-184e-fc7b-61bd-634ea3164647@linaro.org>
Date: Sun, 6 Nov 2022 19:00:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [RESEND PATCH 1/6] disas/nanomips: Move setjmp into nanomips_dis
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de
References: <20221106023735.5277-1-richard.henderson@linaro.org>
 <20221106023735.5277-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221106023735.5277-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 6/11/22 03:37, Richard Henderson wrote:
> Reduce the number of local variables within the scope of the
> setjmp by moving it to the existing helper.  The actual length
> returned from Disassemble is not used, because we have already
> determined the length while reading bytes.  Fixes:
> 
> nanomips.c: In function ‘print_insn_nanomips’:
> nanomips.c:21925:14: error: variable ‘insn1’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
> nanomips.c:21925:25: error: variable ‘insn2’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
> nanomips.c:21925:36: error: variable ‘insn3’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
> nanomips.c:21926:22: error: variable ‘buf’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   disas/nanomips.c | 44 ++++++++++++++++++++------------------------
>   1 file changed, 20 insertions(+), 24 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


