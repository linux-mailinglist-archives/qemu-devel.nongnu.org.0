Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6665560F5B7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:50:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo0SX-000544-1j; Thu, 27 Oct 2022 06:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oo0SO-000507-GS
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:49:54 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oo0SM-0003Ok-9L
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:49:51 -0400
Received: by mail-wr1-x434.google.com with SMTP id v1so1462661wrt.11
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 03:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h/1BSKWYbnVJgVunMdmyWDVP09r5sddp/Z6Oi1LIxII=;
 b=dGC+lbhc6gJ01lO7CdMOmagoXs0ZIWUDgTSTxbvukdp0uyp72kRaxvGSwUoNfQKlCP
 /+NKN9EuOwH0F9st0tfz0Hwx+wq/GZWxPsBnedNFzSbsPI/HOvAhkb5NFs2TNjAiRVYT
 cIKkZmjHazKXjlKRccTyWv63RYqNgEYJG43C0bT8z6MsILTqootummpJVj0Vh7/LRmpn
 kg8HY4YbOmHtXAWgRIDPxYGdAwU74v86e+hz1dU3Aq4xy9bDTkf+bW0e9Pz4/gfUbk6a
 ZdWIgPsspJ8Z6EArUEIc+Jf1YjqyX9Zo2JTaW3TmuaoiSQbcqwZFeEARwYHSQrMY9W+v
 QN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h/1BSKWYbnVJgVunMdmyWDVP09r5sddp/Z6Oi1LIxII=;
 b=nZEn1AQyNJJP4LRBtJEQishxfvBLVRUyNiF0fOebPSNXYyWbRdDqvE5sNbiSSMBfbg
 ZF/NHfFYg4K5SngLE0Sqk1KK436Dw7zA49KZB0XGMvWKmsKCOI2UypPwE1tvaA89dD1O
 lMPfXeZvdQfvmXnzGKcrR3//WHAwTcKEWU1l7lMOEsXsEC7OIe4u7b81ZWQtMMLRA1vi
 pcv2LvvLUjo28oOg0sLTF4ZW1fWB7rGUCVlyuXdoJ1iN7OvKV9f3w02TmhyEVI1ypdc9
 2uggD8CoGJIZoK6EPJeyFERE1lBaGcCrXRLX1o6f4IT0v1Fk/rxavlGrVzqlNAiIb3zS
 k6rA==
X-Gm-Message-State: ACrzQf3cL42lXzbxQ0k8Rij5g2yJtnt6cSOUJvyTvVaeKRwiF6GswFqM
 BrvnoqCoO7vfd+H+taVnDGW6QA==
X-Google-Smtp-Source: AMsMyM6YiRCzgo7bYL2AWqSKIhu38/WgyhBMhYxdK+keihMzd8nOGAdtrIX/lLHuOUtaIREE63NoTg==
X-Received: by 2002:a05:6000:1f0f:b0:234:eb90:cf91 with SMTP id
 bv15-20020a0560001f0f00b00234eb90cf91mr26459631wrb.192.1666867787484; 
 Thu, 27 Oct 2022 03:49:47 -0700 (PDT)
Received: from [192.168.242.175] (186.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.186]) by smtp.gmail.com with ESMTPSA id
 f4-20020adfdb44000000b00236627c078esm827394wrj.110.2022.10.27.03.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 03:49:46 -0700 (PDT)
Message-ID: <f4415297-d5e4-b1fc-8dc6-e068a07fd372@linaro.org>
Date: Thu, 27 Oct 2022 12:49:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v2 3/6] target/openrisc: Always exit after mtspr npc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: cfontana@suse.de
References: <20221027100254.215253-1-richard.henderson@linaro.org>
 <20221027100254.215253-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221027100254.215253-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 27/10/22 12:02, Richard Henderson wrote:
> We have called cpu_restore_state asserting will_exit.
> Do not go back on that promise.  This affects icount.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/openrisc/sys_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


