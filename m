Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB413FB305
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 11:19:33 +0200 (CEST)
Received: from localhost ([::1]:38198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKdS1-0000oi-0l
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 05:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKdQR-0007tX-Uq
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 05:17:55 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKdQP-0000eI-G8
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 05:17:55 -0400
Received: by mail-wr1-x433.google.com with SMTP id q14so21420299wrp.3
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 02:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uP/iPRZ0WRn3kQeHauuDzpSdFFgSiSkej9eChYlBA/I=;
 b=kWtXbKaiOxxFiLX2Hsk5BO+H+A5yddVnz6vB33w70zDshIZpWVoHmffxqi4gR1NWlm
 WPD4EdJPMQSnxtQHy+XCDGjTlMPgXuo0fer1xc0OOT4DdwrYB2xTkT44zgfSsS3N1BvS
 /OsF0LBMuLSwV4WUbpURGEJWPvxfAzrmHIexpHhJ8qYH1kaU7KeyiybkUmf/CrXJpzIU
 dsYSSWKzV9GviQz1XMUh2GmJIB6A3OQPL2B9ORfozbVBiefdR2C+ho42QLi5hTYMfkdJ
 FlBJrZezxg6FCIMVTWMvaDvVvIagscYY9YFNlkjVkTR009Y9KNFYWPwBa1eVmE+p92+R
 3uvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uP/iPRZ0WRn3kQeHauuDzpSdFFgSiSkej9eChYlBA/I=;
 b=GMFR0p+kchweVtpy1gCg/EYZhDwXXKFmWKj9o/PHKIBdk1A3OxYuv21LQppoQfJ43G
 irLu7XFHbq/SlankXMz3YN5ja14J6WpAdzxob7y5F0AhZF2olYrNccX8VQGNRMr3al+w
 ltW0eQlhziVGVwB464fCYk2LJS10ONiFPBSCOFikmWdwiNB1BXESwG3F63YCKwvd1PUd
 4iHT4MR+B2ZK0FMYafWdXRs3AwfvvL/W8Xv0ikZ9d4wubiqyTisapIE+iCjTwfN5Qy65
 W9IwPuzVGmH5EjhVUVhHDXq7mCfWeJRKmZIAVNtxUnN15sTfxsL+l/8AqnFHnF1vv8NE
 YEQA==
X-Gm-Message-State: AOAM530bzzbgZKKIWg1eB/DD7STDuc7XmBMlpqQSylx7R5cJwJmUI5qp
 si0ruRokvu6mir7ez5JESHJZhQD3ZDs=
X-Google-Smtp-Source: ABdhPJwwxg8oOV6VDnTdHjhOuI7VnfKLWAsvvsm2jxIr0rabvSvSt+9gPgBDYqEGunuZjhHjTDHJKg==
X-Received: by 2002:a5d:6301:: with SMTP id i1mr24028340wru.423.1630315071645; 
 Mon, 30 Aug 2021 02:17:51 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id d145sm18725823wmd.3.2021.08.30.02.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 02:17:50 -0700 (PDT)
Subject: Re: [PATCH 06/48] tcg/optimize: Split out init_arguments
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210830062451.639572-1-richard.henderson@linaro.org>
 <20210830062451.639572-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a14e6a05-2836-f1c7-9339-7000a6414676@amsat.org>
Date: Mon, 30 Aug 2021 11:17:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830062451.639572-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.58,
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

On 8/30/21 8:24 AM, Richard Henderson wrote:
> There was no real reason for calls to have separate code here.
> Unify init for calls vs non-calls using the call path, which
> handles TCG_CALL_DUMMY_ARG.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

