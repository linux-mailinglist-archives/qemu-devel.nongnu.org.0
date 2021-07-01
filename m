Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1863B94D6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 18:45:24 +0200 (CEST)
Received: from localhost ([::1]:42090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyzoa-0005jL-2C
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 12:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lyzmm-0004kk-63
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 12:43:32 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lyzmk-0000Ht-Q6
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 12:43:31 -0400
Received: by mail-wr1-x429.google.com with SMTP id l8so9019793wry.13
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 09:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MuayQy6Xy+zHK96FgE2KP1CxqCrMJGtlHphEPcGlW78=;
 b=ZxxytJQ6kmIV2wszbBhhgGb/xLWlhVDBq4P0BaaSYjc/40aka+d7O5szZqTnrFiuax
 HHiQWNVWnAFhuCuXZtcDDf/H9fJhKXQLiQXyNL2U4bMOM+ItjWijRYNHW/G54kUZKFWK
 jGxA+1P69jWElTAP9iCT8KQFSCgovajFEuwH1h8XQIr0FdeSLxHCYem0YtjISF2ZgZiJ
 DNy76NpnQBJdC+QP1WH88cbPQChdyYQAX09ZvY2aQkoVlKXrB773/nS3JP/Fp7Os/iIA
 Hjf0UvVPQGqzcUddtk0gVp7zPh9PQHh2aPJaUpQm6FNYT26IZMo+5iab9cqvilfYRt/n
 VF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MuayQy6Xy+zHK96FgE2KP1CxqCrMJGtlHphEPcGlW78=;
 b=l0wg+pAlMuWBlQVupdgkrQ/Fd8HsJlpHpMXSB/BeLtCOXdlbB1li2kxTC0u4uBSlEP
 FN0kAFDQrzGg+ctYhz/+WHKvQo3qjWVvmL9quxJNqLUaDf/Iqt0yelQOMcH2jbMusyhV
 UR/bN6UhuR66OTJPp5SwvbH4JL35P9P8jMPioMpGP80anzRYucSB3M8nIbsjBY+rcs76
 D8F9pU1c/WVAioYZs2j0mQ7SzZ3sukFo9M/agkGqwKkVgbQ8s3Qsl3xfGyhjrzfwKkVh
 DcQL/AiZK2Y7NpHhD22Y2wXOQ232qgm2whTlirsLWNpzpFEHnewnjRPfdjAo7DFWYl1o
 Yfow==
X-Gm-Message-State: AOAM533hPL+Sl8AKWQNC9zNdZ7uZi7xznIlPa/xgRLSrSgxFjpke7Ahb
 fZwF2xOP0Ouky3gt1H4MYMU=
X-Google-Smtp-Source: ABdhPJyulm7DEan80Yh5FesAHL2VhF+y21NbxvpChSTsupTeSrgH+TGQQ8pOwQzmelFSdvq0kb2JpA==
X-Received: by 2002:a05:6000:12d0:: with SMTP id
 l16mr697369wrx.189.1625157809321; 
 Thu, 01 Jul 2021 09:43:29 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-151.mobile.abo.orange.fr.
 [92.184.108.151])
 by smtp.gmail.com with ESMTPSA id f9sm502404wrm.48.2021.07.01.09.43.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 09:43:28 -0700 (PDT)
Subject: Re: [PATCH 17/17] cpu: Add breakpoint tracepoints
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
 <20210701152537.3330420-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <02e3cc09-fe5c-361b-34df-85ef48479a34@amsat.org>
Date: Thu, 1 Jul 2021 18:43:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701152537.3330420-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org,
 mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/21 5:25 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  cpu.c        | 11 ++++++++---
>  trace-events |  5 +++++
>  2 files changed, 13 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

