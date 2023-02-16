Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB5D698DB5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 08:23:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSYam-00017C-Qu; Thu, 16 Feb 2023 02:22:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSYak-00015N-7p
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:22:06 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSYai-0008MW-J8
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:22:05 -0500
Received: by mail-wr1-x434.google.com with SMTP id d4so812645wrj.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HW+EenpcXxwhDl79dQT50h99rlppkT6TwTdVGDGGtbs=;
 b=WkkutAoSTnAAm7IFe8Zi/47SHujjNhvU9Ip8NciziZTSyu2idKt+yIW+6XWUdRnp2O
 2jNhA8ATiI9P4DeG+hHtlZru/wihQymCOC5AGx9FZGP2EfVaNirjITrdNSRpjnsra45I
 nNkTcywXOhpNixZ+36BDmaIuOLwatYChzXvkjWGKKlOkJBfGcQXfCg/OgGgb+lLcQ8/A
 Gz80Jf/mw1qSxpbDf6secYCzsRup9YVdh9qXpW9FW+LSh6sh1ANjUm3w6CZpNRDzuNAV
 lQq97FEkeOZyxkIafrfZyR9azigSib6EKaOD9oR5QnSOKH2DY6l25cOZTptQAmOqS5dg
 UHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HW+EenpcXxwhDl79dQT50h99rlppkT6TwTdVGDGGtbs=;
 b=p/NXGG6rOlaaL/9dLpMDgFV69d7f8x5x7jQkQdPi1yuwgHi5nQlzM7v2jjjP+blDCl
 bHlS2EarjUGcD9+xQGKWesqQYNsF9oPGO4ivoRA0q2liIg7OU3/HOnfjsRSzq8+SM3G6
 4ShB3WZmwGzD/8f3oCFq5Gq+k2gbAhrmAz63MZ2XkJRvxhV1xT2/aFgx6vwlGJ6Njrcj
 9ACjpD8Vise4DsYcIvz736Iedfze0D/tGudhLeC0884ayoQUhHHStO26qsvVsHvlKpVi
 t0aMGc5MniDs2hllugM8dGOZYM5TYIi+NMC8xTOfF7ylxsagI+6ewhMlkZyhDylTNyWl
 0zFA==
X-Gm-Message-State: AO0yUKXzfDNITRKlWXQQzJHnxvBcDXWA3/oBqgjhq74YjfVimVQXaa4L
 W2WfEfoFvMogzGm8MuM9f44xiQ==
X-Google-Smtp-Source: AK7set8YiQYw31n1Ni4361wb9oYowiiq/QXhiLLnplrEbf6+awVEF8Y/d9x1hxapm63ikNeachYfTA==
X-Received: by 2002:adf:fc88:0:b0:2c5:7c7a:78fb with SMTP id
 g8-20020adffc88000000b002c57c7a78fbmr1310129wrr.40.1676532122794; 
 Wed, 15 Feb 2023 23:22:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056000110c00b002c563b124basm704989wrw.103.2023.02.15.23.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 23:22:02 -0800 (PST)
Message-ID: <b223a63c-9d59-4c9c-2812-1fabeb1703c1@linaro.org>
Date: Thu, 16 Feb 2023 08:22:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 12/27] accel/tcg/plugin: Use tcg_temp_ebb_*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 30/1/23 21:59, Richard Henderson wrote:
> All of these uses have quite local scope.
> Avoid tcg_const_*, because we haven't added a corresponding
> interface for TEMP_EBB.  Use explicit tcg_gen_movi_* instead.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/plugin-gen.c | 24 ++++++++++++++----------
>   1 file changed, 14 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


