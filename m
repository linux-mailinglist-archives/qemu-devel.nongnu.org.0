Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A013CEF91
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 01:07:51 +0200 (CEST)
Received: from localhost ([::1]:42124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5cMY-0004ug-Op
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 19:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5cKx-000384-J1
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 19:06:11 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5cKv-0000vC-K3
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 19:06:11 -0400
Received: by mail-wr1-x435.google.com with SMTP id d12so23886535wre.13
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 16:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g7Om/tQSk4a/M4aXnq5nF/KThq1IojjQD7LIos3LeuI=;
 b=AFde4/cdIQlkvz4vvnu79xNbVDwG0RCuSgyxDEWb6A0QiPNsECO3iYkdn1JnDyUJ7E
 Yo/xvHepiawHOeUnpb+3+c7J9UHp17GwcUDTAD7Eq5c/dbf49xMAqMr42fk5Nftb3+7B
 jiL+Pnp2EPOWloceJnjxEurVQJUeJFEz+lg2rmFUFuwKtrXPTuWx8E0bM3FRX2gEHD6S
 JdKGTzMtVx29ivlaN1mHZIZaNlW+Hgdl8B6yX7uN7ExgYwVsv/QOKlc8836kgEx6XHPS
 R2nPw0IPsLKLluT8vjXwixB/9fxWymeZcWGujqQpbKwqaZyG6ana5qKe1/MgbCBVlnxg
 RDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g7Om/tQSk4a/M4aXnq5nF/KThq1IojjQD7LIos3LeuI=;
 b=T2EqIy5WXz5FPuq6zyErtJukpwAqVONJ1u7jx7M41XGre1atF+x208d2I0TK3q5bzO
 geCKlYnUChS1rLrQ7xhXd7voG5EsLZnnUXN4HNGi628E4z31DK7ADAdGaHzd+RCrpjMZ
 CM5tv0hycA2k2coq9b+Cqoy9UQAsGmE0uKlMMfntkPl5ObFWgroOegorjrUaZlcupNC8
 vMjQ7gkDGNPXpla/RpVA8wVq7K7W+W/bbBhqOb9xd//zK/DvJhJQeKg2Q6U2uv8dtpwv
 ItXczO9TQJUduEH0rYsoSC0tsPKvuEbha9gO/4GleA/cyOczOhOZmoLBY6KmB426D9MG
 EwMA==
X-Gm-Message-State: AOAM532BGbptsoS/1gTUaKiaCz5COh9IpnEYYVLV59XC+gD/xREzh69y
 Ox8Kuc1GTLAwRSYoDT75JBA=
X-Google-Smtp-Source: ABdhPJxSEoPJYug4RtrcLmWnA+HOlPC9AsmcAGB40kXxOdcFvHepiBCTUc7A6vNdHv+UoUrWtoJ7yw==
X-Received: by 2002:adf:e488:: with SMTP id i8mr32527887wrm.285.1626735968336; 
 Mon, 19 Jul 2021 16:06:08 -0700 (PDT)
Received: from [192.168.43.238] (126.red-95-127-153.staticip.rima-tde.net.
 [95.127.153.126])
 by smtp.gmail.com with ESMTPSA id y19sm774945wma.21.2021.07.19.16.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 16:06:07 -0700 (PDT)
Subject: Re: [PATCH v3 02/13] accel/tcg: Move curr_cflags into cpu-exec.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
 <20210717221851.2124573-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fbf85b07-4c54-b807-f620-e26bed49f952@amsat.org>
Date: Tue, 20 Jul 2021 00:06:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717221851.2124573-3-richard.henderson@linaro.org>
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
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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

On 7/18/21 12:18 AM, Richard Henderson wrote:
> We will shortly have more than a simple member read here,
> with stuff not necessarily exposed to exec/exec-all.h.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h | 5 +----
>  accel/tcg/cpu-exec.c    | 5 +++++
>  2 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

