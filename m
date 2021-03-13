Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1535339F96
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:43:19 +0100 (CET)
Received: from localhost ([::1]:48076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL8II-0001UY-MV
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL8CJ-00053D-ED
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:37:07 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL8CI-00075D-2b
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:37:07 -0500
Received: by mail-wr1-x435.google.com with SMTP id a18so6470420wrc.13
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 09:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C7W9ad6B7hh3+MBQW5xA1FLIjFbcOl0PNRck7C/h/mo=;
 b=H5KsySyTGc109DrUUyTrEIbldacxUQBlCueMwnMPQqbfrvHy+KC7Ay+b7a46KeTJQ+
 EGq5QmGTDziCotpf1gtfo1glSBuSOCV43P0VTgcpL7/VjBvYXD56e7euA5SZM/ZCNljm
 RwM8dtM0t6MvfZ1lZaISfNXHjeik16Y9o9IEeKGoww557rruT46NOb/l8f7snJPzEc7y
 dbkprrxoaMvjjPrwN1YYLS47yLq2AMd2wfmVJeSpG0UY+YGhvHuufUNil+0fS5P2j+hW
 2zT6BQSYOdCxPCTBLK2kI+FCq9PMzKECT9jGGzXm5v0ajYCDwSg9wPRWzJOV/ZkUdPUR
 o93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C7W9ad6B7hh3+MBQW5xA1FLIjFbcOl0PNRck7C/h/mo=;
 b=iKYjhmNhbLdb9l+aFeJ7O/aVg6ohUiSW5t8E+QhU+xVHOCtGd9w1VtPDD8hDCkyNAw
 Zzd6UTyZvDdnNi/+dQIBeak9+TCGSOfiN1RT91AXbkXlgAPs20L2bPP9YMTCRU3T3VVY
 Rokx5HUcx2DpDwZECLzMqWM2zUzcHoBc6IQna1gz74QHjak2igkAZT0WeKtSwZlxPmlv
 asUZgrDVuNGCn1voeGjrbGdtZS9xYLntF30glViWCuOPPInxI7t0wcNAMgvQ88hvaWcd
 6kQRcakzFI0UfFZxw3hhFQ5NAlABZJtgajRM8xr+bfFFDMrPT6AtYX1j45Ax5+a97SjQ
 7zcw==
X-Gm-Message-State: AOAM533IDFSHZzymtLNlhsc1wN+kvFotOhRUYRVQAAIKEDHlIhTszZeY
 LQQnbKrop1WUOrPgSi/tWJootQggaQRu2w==
X-Google-Smtp-Source: ABdhPJwN0mikq9lMAbeJbYcXXgOvqwcplSflB2/KeHZ8n6KAd/MRVlOQ/BQnBiPVGOURG2avhnKMHA==
X-Received: by 2002:adf:b642:: with SMTP id i2mr19235212wre.8.1615657024799;
 Sat, 13 Mar 2021 09:37:04 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a3sm12571380wrt.68.2021.03.13.09.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 09:37:04 -0800 (PST)
Subject: Re: [PATCH 03/26] meson: Split out fpu/meson.build
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311002156.253711-1-richard.henderson@linaro.org>
 <20210311002156.253711-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b117b14a-fc41-9045-38c1-f68ca53623f2@amsat.org>
Date: Sat, 13 Mar 2021 18:37:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311002156.253711-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build     | 4 +---
>  fpu/meson.build | 1 +
>  2 files changed, 2 insertions(+), 3 deletions(-)
>  create mode 100644 fpu/meson.build

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

