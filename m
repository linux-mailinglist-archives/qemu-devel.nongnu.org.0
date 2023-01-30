Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F267681FC8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:42:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdme-0007yZ-U0; Mon, 30 Jan 2023 18:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdmY-0007yF-UL
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:41:52 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdmT-0002Fw-A1
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:41:46 -0500
Received: by mail-wr1-x435.google.com with SMTP id m7so12718406wru.8
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RFduv5rfzfmRAYqjXpUtM/vVb+taNSGmpbmjKGomVGc=;
 b=XtiPZl+O1Bc2DtlFd0eKSp9X/8GYf2JbyAKEi/JArYXJwoe7lwXP1DnBCAJML5igE5
 q2hQN2cJxzJ7DqLUQta6pBQnTuMOnkMjMvw4FiTcfsjmOa04jAK0j6NdaNLBJLBekxF0
 YB/0D8sBQ85L5yK2sXcXifY7AounbYj8RoGKMQxMCejULPyvPOkVMFD8v95jKI8RDz+1
 j8k7SvJ48yRKyFc7bvhYZmK195Y7okcUw+ON5cyG75eVyCPR2679m7BaUfPPn7W1XLRJ
 TxbRe/ijdaQpYDXXhotFtAUbIX17C6A2Jr+bDn768fi1knGrDqtBgRz5VWoxYJlYQkRg
 iNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RFduv5rfzfmRAYqjXpUtM/vVb+taNSGmpbmjKGomVGc=;
 b=5/m7nKlgwc6WmvzSJBCrGOLqhPw9tkcjgF2El63mGpDBIlCnnFmtIDpR6Fhz3uNkd1
 ccXuimNgSeRDXhmMPRYyqKEDQmmTULEKc+IjU7VH+AeA0WyRG50L5Lg1mgctIOESApJ0
 /V0IO+3lg/oWCdZhED8IpeAbuPUFgJz7kVUs5h5kVPQAfBlvInXeageNbmqSziZqV8Pu
 n1wqUeyvrlaWiNM1lC/Mk4SYYQZXsR5re+PE0cZkplAvD8shIOGo2CdzbRlFJTstOMgy
 ACS7Wz0BhrEjPDwbpct8/JCzDemm5iqaCxWY4HYtpX+3xw3CDJev8uKvIFNBl/XnvZbT
 AICg==
X-Gm-Message-State: AO0yUKUlBjrV9ufx4tyHcrhKGp8LFrBlVjlkZCcMKISiSxWFnR0uXKxr
 z8noZ5yim7MGDmuAxMsnNGV0fg==
X-Google-Smtp-Source: AK7set8Th7Qd6VPqjwN4QITdpwMuGC1SWA3fH39amxoeoU2oKvV8PCH0boYXVbtJ5WVqjMvXEzkwEQ==
X-Received: by 2002:a5d:6501:0:b0:2c1:2a2e:34e2 with SMTP id
 x1-20020a5d6501000000b002c12a2e34e2mr781272wru.69.1675122097238; 
 Mon, 30 Jan 2023 15:41:37 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002bfd190fd60sm12321583wrr.108.2023.01.30.15.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:41:36 -0800 (PST)
Message-ID: <eb6269eb-ccf1-a289-93e2-1f282e7f0419@linaro.org>
Date: Tue, 31 Jan 2023 00:41:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 20/27] target/hppa: Don't use tcg_temp_local_new
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 21:59, Richard Henderson wrote:
> This wasn't actually used at all, just some unused
> macro re-definitions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hppa/translate.c | 3 ---
>   1 file changed, 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


