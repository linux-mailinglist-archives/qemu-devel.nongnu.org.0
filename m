Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A86569D392
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:59:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBNA-0005n8-1P; Mon, 20 Feb 2023 13:58:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUBN2-0005g1-Nt
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:58:42 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUBN0-0007Wg-2z
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:58:39 -0500
Received: by mail-wr1-x42d.google.com with SMTP id 6so1806071wrb.11
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i83hVbYglmB3maWAdz8Kv4+aifm2v7i+Dva3N5vVxsQ=;
 b=lrn24KjRkx12WRu7Y2MSwhAuojkc/9b9iY+pzIIi2QZ1a5fuxpKLaejSl17BBYZ05k
 1zIVDCkQJMi8iDZcyXJqNT0b0kPo8URyYUrAo/AWsHKm0K0rf4ei+Ty5TfRNom2tknGi
 Q/Ia7s42vmLycZ8Z2OdKp/oZPEXb9UTZI7rRkRs1OW/Ja+rKfX8yeTipSPGty5fmTUpf
 6O2hMRIzXBtklIW45yVg52UL7rTUUxPw1kPrHOZu9Htprq6wlyCV9uSEhw3tGrh9J94a
 yqtvIatv6SwacMk0JtrNdALu6ZSFzTjCODlatjRfcdNKlgYfPwv74Zwu9z2WrSl5mpPd
 Oi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i83hVbYglmB3maWAdz8Kv4+aifm2v7i+Dva3N5vVxsQ=;
 b=5RbSrIXf1dk7oAM8j6hnR0UrLJfYD2GpkDDmeFvwgq7E1mjPWMqHfr7eWw5+/Hyq87
 0PIY6nouiaaC7XQgVyB9t4OtiHcg6kxrDrpL4zyfJvyZAa6PLKYt9V+45KqIesL8zRGj
 O4A5ta/PFeUtT3G6B4pYi+2vfPUzN1EF0KXOoMkhoSZ7bNuABtA3lTzJIt4jn+mnOIah
 0mFdpyPsmpCjF9y8hVpNgj4iMGjls4fsvm3Jkce+fJ/biD1Pl7bak3oX0/7ofZao4WMF
 PxgAkCD1KYpSL/RlpCvfZ1B77UaZqJBlQVuHjNMDf0EJpfvZw7IItxwAPJCC/K9ct+HR
 n0+Q==
X-Gm-Message-State: AO0yUKW7aCIrBrhe13Yiv1cdAZITHDGBlLJg2RDfqGb6ipPudE3Psy1h
 O2o/U7D0Ua5KHEfRLHIZElL3tg==
X-Google-Smtp-Source: AK7set8cqro2zxjW0TWTypvcQNOrelGYg3pRIZZtI35kJS0rLQ3JnKAWgzXHCZcBiq1BRCvf0NHACQ==
X-Received: by 2002:a5d:6992:0:b0:2c5:5878:e5a6 with SMTP id
 g18-20020a5d6992000000b002c55878e5a6mr2859603wru.61.1676919515863; 
 Mon, 20 Feb 2023 10:58:35 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a5d4c4d000000b002c55de1c72bsm6005556wrt.62.2023.02.20.10.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 10:58:35 -0800 (PST)
Message-ID: <874aa225-f86d-bbc2-4c46-c3fc099612b8@linaro.org>
Date: Mon, 20 Feb 2023 19:58:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 20/27] target/s390x: Split per_branch
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
 <20230109200819.3916395-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109200819.3916395-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/1/23 21:08, Richard Henderson wrote:
> Split into per_branch_dest and per_branch_disp, which can be
> used for direct and indirect.  In preperation for TARGET_TB_PCREL,
> call per_branch_* before indirect branches.
> 
> Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 30 +++++++++++++++++-------------
>   1 file changed, 17 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


