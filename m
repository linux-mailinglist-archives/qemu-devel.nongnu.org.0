Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B6F60D0BF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 17:36:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onLpR-0007CU-O5; Tue, 25 Oct 2022 11:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onLpL-00077y-BE
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:26:52 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onLpJ-0005pS-H0
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:26:50 -0400
Received: by mail-wr1-x436.google.com with SMTP id bp11so21149789wrb.9
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 08:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SOs7NWAjsWnx9Pcm6z8K9Sd+1NLPfSaS1isgnww5quA=;
 b=A8wBCh+p6SVS+8FWSzzVSV+tWyuU558rPO+x8U89meF/BMp1rlU36pmmCKEpCHuYnI
 3SkyX7tbsrsE4x+SCVdCOK5X/xhZOiHLnOuh2Pt2kwClslWNwzDLmwpMeSmK3sIoDlnI
 WAS7x890zn9sEdko3M06/i1KZcDoFC2lAe3Ai6arsQQMhoi9gOIwgQ9xmoPh/fkd7Xy/
 RG+fqAEFGDNaexX31dbfNDDI1pDP79ntxwb0LwY8HnG04cw9FqCwRt6ebyY8dgEanSRn
 vhYGAGreglGUQQQNEHmvNKmsoh+LKjQCXEiLB8fNY9fdJqa6TdJOhKvwf5PoyfrswyFY
 V7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SOs7NWAjsWnx9Pcm6z8K9Sd+1NLPfSaS1isgnww5quA=;
 b=YGU0tTb3k+XxdiHq+sx9qbIp7h94HaUo/OB20h5+vK6acW6UDOJO14Bga2oeZkTXhO
 NGUCAE6SzKNV8kbpvaq7LBZEkLLC6Rh8fSOnZ/tiey5evyisnry//QW834ezhMFncEui
 vDJB2lpdYnLcksN9hhM5ApQeLBBcspAar0d220za+Lpc+6fKrzmy68dE4czgqh06GDXY
 y7DrRp8m21BJmNuITGtG9bO/BbmCf7hFrMxP98sjUB8G6Rudr95EGAZPpfLKrZbrCONU
 Husyfq3e9jGl4sv26EibRtYOzRIUznatc9RkTH29imoNTyaQXPo+GT4/E6GP8yQvaPKz
 gOmA==
X-Gm-Message-State: ACrzQf3wpEuJ2smGJr43U3+7GKCcOrC3z9IXWPWzL6Y8Hby3TnNUBtK8
 cxixumi3ldoBSmJkdPtrcHfmTQ==
X-Google-Smtp-Source: AMsMyM6uRGJXZ02zVPKmQQ0KErsgrDmjQXNG9/O6oAqX4FIdVcNklXBbkcGp8OLFAb5Z211otmQWiQ==
X-Received: by 2002:a5d:65c9:0:b0:235:7110:bff2 with SMTP id
 e9-20020a5d65c9000000b002357110bff2mr19479070wrw.46.1666711607995; 
 Tue, 25 Oct 2022 08:26:47 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a05600c191100b003b47b913901sm3361204wmq.1.2022.10.25.08.26.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 08:26:47 -0700 (PDT)
Message-ID: <af32b989-6e13-a587-403a-05c3866798bc@linaro.org>
Date: Tue, 25 Oct 2022 17:26:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v2 02/36] tcg: Tidy tcg_reg_alloc_op
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
 <20221021071549.2398137-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021071549.2398137-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/10/22 09:15, Richard Henderson wrote:
> Replace goto allocate_in_reg with a boolean.
> Remove o_preferred_regs which isn't used, except to copy.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c | 45 +++++++++++++++++++++------------------------
>   1 file changed, 21 insertions(+), 24 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


