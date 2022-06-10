Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F1A54676F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 15:38:54 +0200 (CEST)
Received: from localhost ([::1]:52394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzeqj-0007uF-M8
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 09:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzell-0004mh-35
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 09:33:45 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:33473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzelj-0000QH-LR
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 09:33:44 -0400
Received: by mail-pf1-x434.google.com with SMTP id w21so23926603pfc.0
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 06:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R3XM31mKA5k7EtIvaTS5UpRWWYsCxDghyA8UpYu9WJw=;
 b=CxjsX7323bMugyxcBvUrMU8tHuhdXHkbEvWiFU7Y4Nso74CdqNXWMV3rK7zbzp5ckW
 IQWWaky3nDHGXNzBmYiR79bIF+DbUoziZ8UCbayESwlK5xGnvy5lmcPN/L1g3TEnY9S8
 Mk1vKA4bcZh8wEJf/KYzwv9kE5BLul54J6chfEy6R2IponFAjO+M87mB6r5JITQwo2ow
 e4f/RlDcoaEpRvRCBoqQWyH+kB6Ok7N95RDPOOdITz6TL5zExSzOq/g40aZz9VI6Uy5s
 rCt7YJVQbWURGWmqRogdcfEbZH9JjMpFmeSIx5RpQRbbBebylbnUJ2OXOYDep/oJV7I9
 Ix7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R3XM31mKA5k7EtIvaTS5UpRWWYsCxDghyA8UpYu9WJw=;
 b=6nU9lSMgUGawub+ild3uo2OPOq3U4otvOqnjsXKreIlozNMNHzKXpE2oDyq9vRK2cH
 DxwGmHu2PXK7cc97lwtAjXVWVIcKknMABKJ/jfPsHXnIM/23tvQYFupqaA0+h1IuTFMS
 Es3U7epoDm/HEzVyQ4C655kWpcZIC6mIzMKlEIoNL3if3KMHq3z/IES0iFSk+Ihfoi43
 4GugePmh1pGpRrrkSqstDZpYmRxt73FtzlWSJ3gxUJ/qq1DIDHE8+XzVy+TbqSXmf/M/
 kr8RT/ZMWwD7dtx5YzsNskJxjHDg52KvkkR0EAoFZH6LkKnP4QWNOXCJ9PK/YBi8H7re
 MjeA==
X-Gm-Message-State: AOAM530n+bX8tl7+yfYrgslIyCSHkxUZqHKdZxAG7DftDv73uvUlXUs9
 QgEBkFRBc+haSlwhXSqciqvhy3TJgyA=
X-Google-Smtp-Source: ABdhPJynwLeK1JkYS5olhgPlMafpqce2LJC3V/lOFC62JBJNmsWxdzes4dSWQz9aF1pgCltnACrB1w==
X-Received: by 2002:a65:6ccd:0:b0:3c6:2ba2:5f9a with SMTP id
 g13-20020a656ccd000000b003c62ba25f9amr40325842pgw.216.1654868022468; 
 Fri, 10 Jun 2022 06:33:42 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170902e9d300b0015e8d4eb1b6sm18786629plk.0.2022.06.10.06.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 06:33:41 -0700 (PDT)
Message-ID: <7842c517-2aed-6317-9a07-58f55f949f43@amsat.org>
Date: Fri, 10 Jun 2022 15:33:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v4 2/3] target/nios2: Move nios2-semi.c to nios2_softmmu_ss
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220608023816.759426-1-richard.henderson@linaro.org>
 <20220608023816.759426-3-richard.henderson@linaro.org>
In-Reply-To: <20220608023816.759426-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/6/22 04:38, Richard Henderson wrote:
> Semihosting is not enabled for nios2-linux-user.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/nios2/nios2-semi.c | 5 -----
>   target/nios2/meson.build  | 4 ++--
>   2 files changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


