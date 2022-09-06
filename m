Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821F15AED7C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:42:47 +0200 (CEST)
Received: from localhost ([::1]:37188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZmn-0006As-KW
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVYFr-0008Tf-2T
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:04:39 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVYFp-00046H-2z
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:04:38 -0400
Received: by mail-pf1-x42b.google.com with SMTP id y127so11323414pfy.5
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 06:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=KuMquGC5OX5BKTU3yDEU6Pdm+xOpeF9LeFDs4ntwXQE=;
 b=P4Zli62P80myETh7Xi7PbdUqIXJ+hWmxWKn69b3iNpQ6WnMlmcZ86cf70oxfhMlS7s
 zfAjdxcNkHrRU0fzMKn+q6P5y0uuuVP7NWJDWqOgVXfvzwjYwxEgw8tYmHMHFEUmcmnb
 MBhm6Bthu/9u8hqKl7n7HHxVvB0Ll+KfgCXKpaO9+Lx+jtVakOUpi6Kh3x2SwAFyhFR9
 O6XKAdG96qiJGNcJi3DN7/bSioDO4GhedyuXZzHSZtj+AUDHstQWBCAyIYiGdQHp1kPV
 LnUBPa74AgykH7bnN8ulfgINFDtM+PKU8WrH44q6BkKdDWtdICJsi3oNT7tplNDMeAeZ
 5ezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=KuMquGC5OX5BKTU3yDEU6Pdm+xOpeF9LeFDs4ntwXQE=;
 b=1hvcn1j8hOlcMG4CBrkRcb4/7C4T8eXeP+3NROv8qiLggCvga00lc40ktkAsPxSkZR
 wXSYeHXeljAEoS9zt6MQw4nXhnQQa96wvhXlXvxX+boGhkliCe4xg52v4kBYfmkYDOMX
 6WObMbxkmeI26OEPpCCpzr6U/1w4rzGRROCMoV7J+iPvnWGexStXHXeTq/plHMevvaI+
 QtKjXzz5WaN+1etkAmY770ChXwT+mMCQvqyYI1I6fDKAhg0W6EztoJ+4MtnYztYHZ0FG
 Nby1D0Ky/N+GY1pXMoDpH6XcbWdofLLgLfO0usbEHCxE+LPvOCfUCLWVX4oCCSqRWGn1
 +hmw==
X-Gm-Message-State: ACgBeo0g2+1tuMpl7sy3CaTivJA0aKsFLaCok577TyDPqY2L3A+0HL/h
 YpXEjx3/a9pL3cjs1Bn6Si0=
X-Google-Smtp-Source: AA6agR5X+Y732Sc/Kb1YBIVoY5Q4Y/MEVkzjwcGHlQP3f3srZoBDHIopS3eeCJOiJvCQgr3kFqNutA==
X-Received: by 2002:aa7:8054:0:b0:53b:59ba:2b27 with SMTP id
 y20-20020aa78054000000b0053b59ba2b27mr20404696pfm.0.1662469475409; 
 Tue, 06 Sep 2022 06:04:35 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a170902f64c00b001749e8eee4fsm9727452plg.226.2022.09.06.06.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 06:04:34 -0700 (PDT)
Message-ID: <53699d50-6041-7ccf-2a73-b7dbe042910a@amsat.org>
Date: Tue, 6 Sep 2022 15:04:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 1/7] accel/tcg: Use bool for page_find_alloc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220906091126.298041-1-richard.henderson@linaro.org>
 <20220906091126.298041-2-richard.henderson@linaro.org>
In-Reply-To: <20220906091126.298041-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.752,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/9/22 11:11, Richard Henderson wrote:
> Bool is more appropriate type for the alloc parameter.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/translate-all.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

