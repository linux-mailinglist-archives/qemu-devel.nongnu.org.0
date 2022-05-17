Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6169752A807
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 18:35:07 +0200 (CEST)
Received: from localhost ([::1]:53498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr0A6-0004IS-Ae
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 12:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr078-0000TP-6O
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:32:02 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr076-00045j-Ha
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:32:01 -0400
Received: by mail-pl1-x62b.google.com with SMTP id bh5so6012101plb.6
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 09:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zw1SA+HbLwcSAJMPD2MgLjHqnharTAqYEu6uGUDbrSQ=;
 b=qE7KPCSkLzzV1PoUnFPue40EG0J2fr1loIWdE24s5kJzrpqVlm5CQo9LDqyF2gPgb/
 XYh2VzauuJmgZMiZd8WBmJo6+U3vI/GO6Vvvaj6cYZ3eR1gGr7La5ke1wUY/WVUv4hPM
 29WsZIUXh0vETfIrpbBzcHCJqheq+NiIGEr8vVQCZWwyjD3xQdNpzcX3aBahqaCVV7jC
 WrjDTN4xOBBUbPBQpyLsLVFxuAseVZTJOt0uUc07Dm03rWAIFhhghxCGR3GBoIoDFBGB
 OgkYo8RL6K3lrfhl/72SHK+UGocM8pt8ujcOSa77gINqC743ZF0L2Ef2vF4qwEMnMokR
 mHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zw1SA+HbLwcSAJMPD2MgLjHqnharTAqYEu6uGUDbrSQ=;
 b=CvMVIVabdcIJkEdgCGqZXZwatt/o9OGtnFd8FcTRoGU0cGwDeRkqn3Ll91oWi4fy+b
 VXehmFddRxZLanqSHPHx4evxwXDN3X1HXBaLmuRumqxiAqTESs/T8KyT0FsyzYqmwKp9
 fDBuXkoIoudG8Iie+tUDyoUKLIOa5f0VSV+d5+BeA3SJI7jizPJb0G1/oXv5a0n723Yr
 FAuANEKJYfresHxfXVcA2gZw22Fu+GG4qrn5kbrZ+nSEFFxG73auxN5xMo2lzL0jUZRx
 3jCNs06O1JjxuBC6Bw7rDUIXhDncOV50K7YBUH1ozgmp/THby5hbYviJQjpwmKi8Sz9C
 cwew==
X-Gm-Message-State: AOAM5338WANrbq9Zb5qBsatYnvLBXGmG9IPcwKubuFT8rBWcsAvLUKNe
 fsGp9hxLJnfKBbDAXCmRNJ0ayA==
X-Google-Smtp-Source: ABdhPJwq6aMBmV1C7QzpCdLhyaF8Nr6wfteWUj9WD5kytJVTCO0ezOmzPVwIXlpBO80A91ReMZAaIA==
X-Received: by 2002:a17:90b:4b42:b0:1dc:15f8:821b with SMTP id
 mi2-20020a17090b4b4200b001dc15f8821bmr37418104pjb.131.1652805119031; 
 Tue, 17 May 2022 09:31:59 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 fa3-20020a17090af0c300b001df239bab14sm1873751pjb.46.2022.05.17.09.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 09:31:58 -0700 (PDT)
Message-ID: <4efb5ec1-e494-017e-ae2a-60b52d5e77bc@linaro.org>
Date: Tue, 17 May 2022 09:31:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 02/12] target/ppc: use TCG_CALL_NO_RWG in vector helpers
 without env
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
 <20220517123929.284511-3-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517123929.284511-3-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/22 05:39, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Helpers of vector instructions without cpu_env as an argument do not
> access globals.
> 

Perhaps better worded as "cannot access".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

