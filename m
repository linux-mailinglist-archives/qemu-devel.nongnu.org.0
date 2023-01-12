Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE83666B88
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 08:20:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFrsG-0005ux-B5; Thu, 12 Jan 2023 02:19:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFrs7-0005qb-18
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 02:19:36 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFrs4-0007A4-Me
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 02:19:34 -0500
Received: by mail-wr1-x432.google.com with SMTP id e3so7942158wru.13
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 23:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PqproFjX7Lt7s/rfVO8hJurJLj0uCKEebU8kafs+s1o=;
 b=vjF2kYc3djmDoGGILl3iT/rVPINcE/zegPklEW+sCROsV7bcSnxiZ41vYh8+mQrJu/
 KVQLCv2YDGFIsL31K756Qwp2xeIb9ClKQEtobJzKv11k4MwbasAM4d1lyr4N7iDi08lC
 BZZXOBIZTK1sSKx1nDQE7V545VTeLQ0+CZWESJcokBPj1XZFg8bxji0S16taO97eKWAc
 sNVJX2Vsu5SOAUmMcSLPJ7Y3KNGxjmgHxHZLbU2WW4ykxjujPfr/BchppZ/Jrqug03h/
 JYmTE9ZDngUYIe/9nr6M0v4H6Tljg69aTV6AlTNUhqEMMTVCKfgITnC48xFAGfjQvM62
 9THA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PqproFjX7Lt7s/rfVO8hJurJLj0uCKEebU8kafs+s1o=;
 b=vhk1WO+w1elQjVm0wALbe6BE0YDkCcEo6bI19TBoMmtiLTenx2Ws/HZW5fyglRzDjL
 cNm/yHRcbQVNb/3pCyQgrsQPwCDBrRlKDmeCDPuirTEwBo6yVj+dbNVmg1W2g2nGyKCj
 bl4PCaBPBRD2SzO+KTIJacPr1D+mkDoFB5+bM8w62mnOgupufzhI6oYq0c43p8Gg+QRF
 aQfQfAVVXSn+mqukQooCuooPC+6F9dS00ghqPF0BVP/auONPEigz4OpmCl4PWoUferfj
 pFDxvskGg3xwjBntYMFHOju3NQGTf0LFrNJpoxurbKMFNbIUymVBCn6lakSmMIODXlqh
 6N9g==
X-Gm-Message-State: AFqh2kpBXkcM/xFXbZ15XCPU6QIY2PD6bvrRX3ZXAkZOwoWP2FuZTCSQ
 LmlRYlwVN9ru053DJpFxIWVstg==
X-Google-Smtp-Source: AMrXdXtsSZfPk1synOAl3fskoRoxtlOQ6fkKCIhT8P5l2FUz1p53/dKLbnAsMMOgXljfrFtaWKXw7Q==
X-Received: by 2002:adf:f746:0:b0:2b8:bcd8:1818 with SMTP id
 z6-20020adff746000000b002b8bcd81818mr14258103wrp.1.1673507970610; 
 Wed, 11 Jan 2023 23:19:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i10-20020adff30a000000b0024228b0b932sm18830845wro.27.2023.01.11.23.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 23:19:30 -0800 (PST)
Message-ID: <b80a3904-1a5c-dc73-433d-b67acb2e5503@linaro.org>
Date: Thu, 12 Jan 2023 08:19:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] hw/mips/boston.c: rename MachineState 'mc' pointer to 'ms'
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20230111172133.334735-1-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230111172133.334735-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

On 11/1/23 18:21, Daniel Henrique Barboza wrote:
> Follow the QEMU convention of naming MachineState pointers as 'ms' by
> renaming the instance in create_fdt() where we're calling it 'mc'.
> 
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/mips/boston.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


