Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3AD60B1ED
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:40:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omywQ-0002N9-Cl; Mon, 24 Oct 2022 11:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omywM-0002Mo-Fv
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:00:35 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omywL-0003xG-2a
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:00:34 -0400
Received: by mail-wr1-x42d.google.com with SMTP id bu30so16712591wrb.8
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 08:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=20sbQ3nzTUk05QVOoW+DXKk7JWkD36vU2xeWEvuGtYY=;
 b=Es8oYmG4c+GPnvGoizExxFLWlE/+0m+w2WZpsXDytHcKNxSlu8kn1JPzDBFPmVShFa
 LY8nnzxioAiOvlOzUoBYYttgpivqVj7AkothVWa+fzxUyIu+YBertMn6YWDoyJFV1GeU
 FZFaVBN8Pd8awSxkRpZTtcNLYB/otmtthaPEi0PL5lTprIqmkMJl6ZXIf+AlTdUCTN38
 OP/2V45IuzlAIcgRz07Jbg1NYlZLeLXPJt440qaMMLQyueQhI+ZQbkLvv96SVIwPyP4j
 PqyT5aWwV6wl8DxylIq3QwZlpro9smKcoTNbutDzmnMEkrY5wQTigKlCJMdsXIE5ig40
 C3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=20sbQ3nzTUk05QVOoW+DXKk7JWkD36vU2xeWEvuGtYY=;
 b=z+PHl1JePUS0xdqajwj9qIq1vdMrhLtnb+TMt2i6MOIgNRONpkWf4JxlTc+wU/qET4
 fV6EsI4n3mvAnHH3DPrWZESK4m0jQVXBuQZCt03slhgvVjLEggPKrPPM4r78Z+GVQMeC
 3hLVpVNC9ozvB01I3iWZrFYQnFfu44mCNoB14d5qCc3lIEFH77tjNWVwTzm2fdzqJlSU
 SyAeLf98A6XZPH0/QGoqg72Y1vgxOX053K9DzXzJSgeryXlYmntth5rOvnF1TD0nwHYH
 I8wuZeeJfpoOJiX/ukTVHiGqaq2QO1id7donb7FGOI1aO6y2ueJS4+LTrxgl8+aWXpV/
 XRaA==
X-Gm-Message-State: ACrzQf1boRareqWbWpet7NVcQocs44BV7VRTLq4RyRe1/8cXbSapwGSk
 MOcjCIVe3R6syBi0uhenXJok+w==
X-Google-Smtp-Source: AMsMyM5nN3k8Ho3fZ5ec9/ehpnBUZwOIMNpsMsfuT9ggyl3gE2uFL5HR72WqUcBaXqvFRkS4DSMzlg==
X-Received: by 2002:a5d:47c2:0:b0:22e:4911:6925 with SMTP id
 o2-20020a5d47c2000000b0022e49116925mr21834187wrc.403.1666623631637; 
 Mon, 24 Oct 2022 08:00:31 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c3b8900b003b4ff30e566sm20343679wms.3.2022.10.24.08.00.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 08:00:31 -0700 (PDT)
Message-ID: <8c90994e-41c0-8502-10e0-b3f10edc2d10@linaro.org>
Date: Mon, 24 Oct 2022 17:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 14/29] target/openrisc: Convert to tcg_ops
 restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 24/10/22 15:24, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/openrisc/cpu.c       | 13 +++++++++++++
>   target/openrisc/translate.c | 10 ----------
>   2 files changed, 13 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


