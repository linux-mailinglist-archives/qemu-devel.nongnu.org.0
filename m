Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F9933A074
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 20:28:41 +0100 (CET)
Received: from localhost ([::1]:43714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL9wF-0007Fe-Tk
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 14:28:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL9um-0006mc-2d
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:27:08 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL9uk-0005MI-DT
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:27:07 -0500
Received: by mail-wr1-x429.google.com with SMTP id o14so2801389wrm.11
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7FiO3nsPC9oYLV0sctguvucRy666z6EVZHDo/z7LAAM=;
 b=eX19ea+ZDKZD1ZcDoQ0e/IsyFPQPy/WGsfcY8bEJznWk2jEgYqirrDxMsSfRPXJLHf
 gtm/GCEJ7YcfeSIWbTDqaswQL8pktIjLhz8Xy4o3dZIa26Ia2jJqHFoyrrQOBQ5o7KHc
 m3XwjrS5STseNzKtzi7E2hhJGO1Cl+DHpmVW1nq095vAWT9wDRn1ni7Y/sPqvNAuTyJP
 ZYOY74EpfnHrO9TZDzhrKzc3Pm5wFqT+3ln+JSxnzNq/bLRZ5hiSZ9EeYYul4MgNRU1R
 MKOEJOgQffE3q28GstRvXGbWc26rUOpOexB+m66iU5h1F7AUvb/2JvuZvWTlEohMYmTw
 0OpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7FiO3nsPC9oYLV0sctguvucRy666z6EVZHDo/z7LAAM=;
 b=VjniVN5h9FylQF4pqALXuFUwylAucG0pOUANrEeMlvjJzy8I5cQCg5YpwpPi1O+CPd
 qDukgwlXoP+QSv2HEhXmrtIduexhDlPqlKVJmUXFlPThXZPK0BMD5hjSSu5P+6uEh6rB
 wE1D5aadm2qCKEOWoWMhycIYhm/CVWB5tAnPKCN7XJsAMa2utxEn3o06vY+hArb5tRd0
 BFkDHzUOojxzm5PPWf+Hz7IfnthTAWKiA6VBmbAjWBK4/aw8UQihzizZNGNSjkhbV/uq
 16ZITWQSVN/uscZLBb5OJzfKqbtiMEW7tZboPSEK1xEcravLSPpeOcCAl2/lRmpLdPKP
 ym4Q==
X-Gm-Message-State: AOAM5316HbOU2FrLP/09vCNAWAVlORTSWYyXuzW3ZcF0Mg36vvvbh/0z
 Z/dA/dbXvo3jvSF9JzSk8y8=
X-Google-Smtp-Source: ABdhPJy1PPKrkqjMVJt0HpFaxfiDu2JZTRIC6VqyUui2ecUxMs5d6lukc/XdR53QQo70V+upE5+4lQ==
X-Received: by 2002:a5d:4485:: with SMTP id j5mr19625562wrq.339.1615663624723; 
 Sat, 13 Mar 2021 11:27:04 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h25sm8406381wml.32.2021.03.13.11.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 11:27:03 -0800 (PST)
Subject: Re: [PATCH 12/26] tcg: Create tcg_init
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311002156.253711-1-richard.henderson@linaro.org>
 <20210311002156.253711-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8a27a7b2-cc9a-3cf6-e89d-6688d9d41c0c@amsat.org>
Date: Sat, 13 Mar 2021 20:27:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311002156.253711-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 1:21 AM, Richard Henderson wrote:
> Perform both tcg_context_init and tcg_region_init.
> Do not leave this split to the caller.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h         | 3 +--
>  tcg/internal.h            | 1 +
>  accel/tcg/translate-all.c | 3 +--
>  tcg/tcg.c                 | 9 ++++++++-
>  4 files changed, 11 insertions(+), 5 deletions(-)

What about uninlining in_code_gen_buffer() and restricting
tcg_init_ctx to tcg/tcg.c?

