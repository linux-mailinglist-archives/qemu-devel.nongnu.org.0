Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC415A83DC
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 18:59:09 +0200 (CEST)
Received: from localhost ([::1]:38302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTR3U-00043L-FC
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 12:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTR1T-0008T1-44
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 12:57:03 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTR1R-0007Ju-B2
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 12:57:02 -0400
Received: by mail-wr1-x429.google.com with SMTP id b5so19071230wrr.5
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 09:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=siap2kjo8tRHTTspo4yN51yej0iuR940TZPNMrLpLXM=;
 b=RHML9Y58BQfcRnFsHq0h6l762me6kJsrheJVqI8gGxeMs1SPvIYLgJZDnqbttt/EXg
 p+JfWwP1447UzE0IFm3wpy1aULHz6ieV82twxQEHnxWcX0W1UXDCsQdU20NvcsgVXo6h
 3j1MoqQ9xtQgQzEd3R6L7G0wwkDarJ4qcnoqTqOAA0uaNDSsLmgqbwoKJCi6U5KWHCnk
 Npm9DhReu+nUqNzd/bMzPanwe6gClXH3Gz1E1ZbDys7VhM+M9BcGqhwKcc5+NaVJBD26
 E0LujDdmVkxoSbGNuKgCZuAKc5ukD9w7DTrQHPY3AbgrIiCp7Mq8QmC3UlnvU0MTgvmp
 KSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=siap2kjo8tRHTTspo4yN51yej0iuR940TZPNMrLpLXM=;
 b=tL1ukhzvgeGJsvTMzd582oOYON1vKVwy29NqfX8qEZNJFCeGUYfo0ljizPnl1rP3Uy
 qc+xJgcvOTshC72g/pp9YLWVu3Vx9bZ0AML9suSt+3HPl+bvutxFiASgKq5lWTXOMLCT
 I9YZZXjEX+jvtRfos2hjGvnCFZU9HgTlJWgJJWL2f/t7EDbDfQ5O9x+BtVKXCSDD0oZb
 XOrWTdl+tbjshaommXQO/FbzhCzDJ+//JTbH5SYXJayz0ugbfn7NPTAmw5nvZ3K/z6iT
 QUBk0Bg8ZqRdvOrD3dGXAbTC6q0oRco860YI5OmeKCVExKnJhwIbGRuQ0WHfpBcwLten
 fX9Q==
X-Gm-Message-State: ACgBeo0+K7r143SLCUOZZogaaHlJVSfn1PspxdCjA1aRBjQ1Sa1S57zX
 rCoJMWex0OPF2NezYw1wFsM8Sg==
X-Google-Smtp-Source: AA6agR6nRPIhIURyZ7YvG6EOyiGkLntz5FFqgcgqac2OOGTzv1NDpuCt8VHVahLdxJYKlLpwavHFPw==
X-Received: by 2002:a5d:5848:0:b0:222:c8cd:288 with SMTP id
 i8-20020a5d5848000000b00222c8cd0288mr12401416wrf.34.1661965019847; 
 Wed, 31 Aug 2022 09:56:59 -0700 (PDT)
Received: from [192.168.30.32] ([87.192.221.83])
 by smtp.gmail.com with ESMTPSA id
 c124-20020a1c3582000000b003a2f6367049sm2600374wma.48.2022.08.31.09.56.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 09:56:58 -0700 (PDT)
Message-ID: <15b13606-f4c7-51b6-8fcf-5c0ebb8c1e82@linaro.org>
Date: Wed, 31 Aug 2022 09:56:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/sh4: Fix TB_FLAG_UNALIGN
Content-Language: en-US
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, qemu-stable@nongnu.org
References: <20220829021325.154978-1-richard.henderson@linaro.org>
 <c2c0edec-c93b-f6fa-b148-9452e4e7b7@eik.bme.hu>
 <ecaee2a6-c2be-388e-425d-3cbe3dda2a4a@linaro.org>
 <874jxsddci.wl-ysato@users.sourceforge.jp>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <874jxsddci.wl-ysato@users.sourceforge.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/31/22 01:30, Yoshinori Sato wrote:
> +/* gUSA information field in CPUArchState.flags */
> +/*
> +   b16 - b23: Exclusive region range (negative)
> +   b24: pc in exclusive region flag (use normal decode)
> +*/
> +#define GUSA_SHIFT             16
> +#define GUSA_EXCLUSIVE         (1 << 24)

No good.  These now overlap

     *flags = env->flags /* TB_FLAG_ENVFLAGS_MASK: bits 0-2, 4-12 */

             | (env->fpscr & (FPSCR_FR | FPSCR_SZ | FPSCR_PR))  /* Bits 19-21 */


the fpscr bits.


r~

