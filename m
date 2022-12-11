Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B066494F6
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:47:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OXt-0004Y1-UN; Sun, 11 Dec 2022 10:47:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4OXj-0004UZ-EI
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:47:16 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4OXh-00086u-9m
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:47:06 -0500
Received: by mail-ed1-x536.google.com with SMTP id s5so9588317edc.12
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+9trWxS+fOgvCFJCyXCFgYxDAz8Lhxsiw/aRsxazueI=;
 b=tW32kOaHOoQNqG5tm4wkl8XxtqOQlBuGkIx3CBfcIf9rEfNtXIWUP9ythA+F4A3U13
 p4xeuwywD7xlSUzjFho7TD9B8jTRsI4bTHIZpXfLoeC2NbHmguV1WP+BWDEGmdJ/x/Qk
 YNVJ4/62S+Qsoo2kPKz34wDEXtrrKUtnOpeOsl4aIlUHBum9U4Dc9F8UwZnMli9jesDd
 lB2c5DvHx07yyl7BFjgYVaYc2sHPxZ1HX74VkiVvb3m3nwE+QFu1IoB9ZXmcwRN0LBW8
 RfySabETKS+2l1cvcE7oKpXIxydp5VHMqGMxsczNKjMjVHIX9w7nysy2HsO6rDtUca9h
 Qv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+9trWxS+fOgvCFJCyXCFgYxDAz8Lhxsiw/aRsxazueI=;
 b=RGc0WTU1iY9eLfSozdKuD48YNJmu10YI8yMIo8jCZNuipZv4RQU/n9jR+xocg6Feep
 /m6fdjVqHm2WhgKucTvrmJLlRsA1pHOsrEDCnTo1CaDZrIvT4aYWW2A1sNLuf6FKeGnJ
 JTeY+x4ghFTQWXVns2VqMNPwYykqCy2Kbs3M2TcIPI8yc/r+vShYeN9iN+73K1BbYAhF
 qECzqXCZr9WX814qSzi9ddmIOMGON5YeG8FceVmEwtT2xe8aK2HMnTVycvulYuYIL3T0
 bf4uWz+LG9gKV9o5KbC+QEppG45PH6z/+dItuCrXZ5Pr6EB3/IAyDExP8aqDrZIU2Kzq
 skkQ==
X-Gm-Message-State: ANoB5plJQpMEByjBadQygZiH/Vbxf4dNIaIUhWojW+CtlBrjFuihEZdp
 Xdy0nlcMQRSIvCvuGWxu/mJ69A==
X-Google-Smtp-Source: AA0mqf5g6nQwCvG2H2akdTx3M6WtZd7d5WWDuEcpWOlhInsZLGIuC4PSHlgzcA1d8FLCRy6hxH623A==
X-Received: by 2002:a05:6402:22da:b0:46b:c11:c8d2 with SMTP id
 dm26-20020a05640222da00b0046b0c11c8d2mr11399631edb.40.1670773623182; 
 Sun, 11 Dec 2022 07:47:03 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a18-20020aa7cf12000000b0046cd3ba1336sm2847754edy.78.2022.12.11.07.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 07:47:02 -0800 (PST)
Message-ID: <fa87fff5-3b8d-854e-4d48-801627c36043@linaro.org>
Date: Sun, 11 Dec 2022 16:47:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 07/27] target/s390x: Change help_goto_direct to work on
 displacements
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
 <20221211152802.923900-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221211152802.923900-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
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

On 11/12/22 16:27, Richard Henderson wrote:
> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
> 
> Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


