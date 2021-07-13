Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FCB3C7495
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:33:15 +0200 (CEST)
Received: from localhost ([::1]:58298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LLO-0008WL-3q
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3LIV-0005f2-Gb
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:30:17 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3LIS-0005rS-A3
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:30:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id f9so25617908wrq.11
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TnsHP+LgslSo6I/gLOAu+N9H8xnL2F0P4OMd3cGG+CI=;
 b=QOk+hBqhD7c2mjgbK4XxjbYA1+eQzF8fwq8opyAbdhRYGjXRFdd8u5d4IGOi0Q72x6
 leDIsoFotoJ7oWuKsXuhjlpUh/prgbCI2ch4gjCnmHG2GjNC5KM18W7g1WLJ3IVF58pA
 YVGjPGDFYfB1av9X1hwH4aXmbsUq/eQ3owTSlvWA5oxpO8HnVSEwo0/8a9arb4w6PQlc
 NQZFQun7WZZBDDHOlVRyw7qmXH1r6S3apUU97ELKtyjzU6E9ujg2HytKybIHqb0AkAQ/
 rerhbhfZv8+/Z4gGIhbU6FTderFs0MeiLtokd40f8mWO8OwCmBaIzZP531M2msTkR9Fg
 IT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TnsHP+LgslSo6I/gLOAu+N9H8xnL2F0P4OMd3cGG+CI=;
 b=aKGXEgz6WZzahFpZfFGzksgx/2GHKgIj6vouyM02tWMItYxTi2H08hFgK55snnsT8m
 o0pWE/2ziTT1vaTm7b2nPZEACqqQoICVqs85YnMJTPQ+msABy5uMihqPyxWmt22d4crY
 E0f1W6I5GePldHNFtk55uJHzmiQpSHqznSuv8a4O5A+hghA/dA3lATRa/50cXy4XMpOO
 A4YvtQfC9So60t229jGrdzt9TT2CpWtIxu8JuOPoerL38z2GTb2R7+B3MZDFmTW/ibgD
 sqXBElkelNRvt95pYRTdoFqH3Cv8plMDDaNeOo5AzeY5uoaTqpkGXiDHorpkemPWYm+2
 YdvQ==
X-Gm-Message-State: AOAM531mwo9hRUpacrb7Veq0PTlKPo0r5q3R/SsfwPrn76UH4V0/qJoI
 R6ZnU7sqksCQFfSwgZIPBvtUIWX2wNgPhg==
X-Google-Smtp-Source: ABdhPJwvcnr0YJNSHv3tNAjh8WBSG/885RR8cJiEdCH3oEWuGksIPYxrgvX64vY7xiU4OwJMp6+GjA==
X-Received: by 2002:a5d:5609:: with SMTP id l9mr6859023wrv.123.1626193810558; 
 Tue, 13 Jul 2021 09:30:10 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id l34sm3273011wms.45.2021.07.13.09.30.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 09:30:10 -0700 (PDT)
Subject: Re: [PATCH 09/11] tests/unit: Remove unused variable from test_io
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
 <20210712215535.1471256-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <acf73bfa-11f2-f9ac-3132-d93bcc8d7053@amsat.org>
Date: Tue, 13 Jul 2021 18:30:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712215535.1471256-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.368,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/21 11:55 PM, Richard Henderson wrote:
> From clang-13:
> tests/unit/test-iov.c:161:26: error: variable 't' set but not used \
>     [-Werror,-Wunused-but-set-variable]
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/unit/test-iov.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

