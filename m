Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D960B651C2C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 09:08:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7XeS-00082k-8C; Tue, 20 Dec 2022 03:07:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7XeP-00082K-Nm
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 03:07:01 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7XeO-0007fv-8d
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 03:07:01 -0500
Received: by mail-wm1-x336.google.com with SMTP id o15so8041291wmr.4
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 00:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iFjCmcFBWWzGbvniqR+eUIM+nsdbcnQrZlMlkjvFqI8=;
 b=o5DDDFUqEu9r/D/5zOWg4z5eN0otrn2+5DaTS1qWPF4MiJIihPz+4u3e9pc8Vj2foJ
 rfT3OgInX68MPIZC8GCz3KgtiEgtH+jNXZNRc+gWfpBYwX/y3TyTbNxDwc8yftxtDBJl
 1oBgHy0klRKeJ9BK7HqmNHhGneVP8qpTpyxlXesj9au7zV7WwwTNMmNcxPBo6p4Bm6pU
 ZtbApRFPnq5mRPMtMgGG780qk+hFlb/qNQ+KdSFYiwLlZs+FcD0ClM/4tliuNH7nhTK5
 ej3LkPq86CYY2t+vCJCU65VAo3YsAcAZNLYlCNwzkbvkmiYzgwJczZgYm8EeOZQtZ5LT
 fTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iFjCmcFBWWzGbvniqR+eUIM+nsdbcnQrZlMlkjvFqI8=;
 b=nPns1D4o9YxEhI4MuM5O7mF7WXLlXKUWHkX6fqaYlsNsgUhntUSDVf5SjWQJOUHblB
 9W5fynQlliY5bbbd9UDEdX7JbKAtr+CkJgPZJ29vNtJOezVjKXY+28h3Hph0RdjSA0wM
 4QCdXX/qssg+KYgC3OLCN5quiQ+J4KYNbnSoK7ruKtbRVc29Log62UoostKBicOpPozb
 YjoI74dwyzVlMiOc0kQ4UezaH4/PXgsi/AqR0Ts2ljOue4nmyoVuQFn5bBJxVCtm6uxF
 A34lf+nEAgpU/TbKYyGxah8heaxRT5e2iGsJ+aaM+Ph+e1sr/RRuikOqmn9HFarLb4Ve
 lrpQ==
X-Gm-Message-State: ANoB5pnPGAf25vHP1ymz3hE5FSO5D2p8LOU6AqyTNBkC/Kle4GZplArV
 oqoCa3l3z32SG4d+BtWyCgsyIQ==
X-Google-Smtp-Source: AA0mqf7hoaZasaVsTBhwCxX/XGjwga7ZKnqZUAefBR+I0teVz8FDtoXQ2m4vzXqQNVYh5R0s6O2uxA==
X-Received: by 2002:a05:600c:3ac8:b0:3c6:e63e:89c5 with SMTP id
 d8-20020a05600c3ac800b003c6e63e89c5mr34603219wms.33.1671523618362; 
 Tue, 20 Dec 2022 00:06:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bq19-20020a5d5a13000000b002421db5f279sm12082702wrb.78.2022.12.20.00.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 00:06:57 -0800 (PST)
Message-ID: <80f7cace-9824-f07b-ba4b-22d238300153@linaro.org>
Date: Tue, 20 Dec 2022 09:06:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 4/7] hw/mips/gt64xxx_pci: Add a
 'cpu-little-endian' qdev property
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20221209151533.69516-1-philmd@linaro.org>
 <20221209151533.69516-5-philmd@linaro.org>
 <42cd6a94-5729-7b98-b6ab-5fe2061e4b1b@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <42cd6a94-5729-7b98-b6ab-5fe2061e4b1b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 20/12/22 01:52, Richard Henderson wrote:
> On 12/9/22 07:15, Philippe Mathieu-Daudé wrote:
>> +static Property gt64120_properties[] = {
>> +    DEFINE_PROP_BIT("cpu-little-endian", GT64120State,
>> +                    features, FEAT_CPU_LE, !TARGET_BIG_ENDIAN),
> 
> Unless you're really planning on more feature bits, DEFINE_PROP_BOOL 
> would be better.

I can easily convert to DEFINE_PROP_BIT() if I ever get there...

