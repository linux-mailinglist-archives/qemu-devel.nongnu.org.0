Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E3B4AB24C
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 22:19:17 +0100 (CET)
Received: from localhost ([::1]:51222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGowG-0006g9-VL
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 16:19:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGou1-0004Tx-12
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 16:16:57 -0500
Received: from [2a00:1450:4864:20::435] (port=46690
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGotz-0002ox-Gg
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 16:16:56 -0500
Received: by mail-wr1-x435.google.com with SMTP id r29so3551180wrr.13
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 13:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1452MEhxjQUCP28Zr3QjS9BPuQv0w89FjDEq2YM3mfU=;
 b=IhRpihGxtsBDBgLd65giEHTLrodr2bjFrZYDVfXpX/nYnmaWNTg8G82unmJFJLQ+jV
 nQJtIZZQeNQRtNDoqU3FYayrqQIz3Do/LlF8LEEG4o4EUby+6ODYq3zpT6RNJz0qiAyW
 u+LeRRDYzCTlPmUXEG4I2w1pBNceGZcM0hIzeRkLRf3mAGvn4oAIb0JV2C3zJRnHvW7+
 ZvpNZcKL/Y3Fiq/h+q5Y+N+yJvGIrOkTzQlVjF+176Mgjbx8VCdwP2I035C5t2AiuC7c
 FzJyaUIwSGw3GCEsTM4sMQvhYd5dpEwY3FCqjcZClN2tnd52u9q0M+FEoXf609kNR4FH
 VlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1452MEhxjQUCP28Zr3QjS9BPuQv0w89FjDEq2YM3mfU=;
 b=g0Ow74ZWGEk2ntCeSZnuvNigOT9L7EnmNa0nj8gTn0Mw2K6r5lURlDd9nro5ADOs3G
 SfS5tnCcMNxHUun90OaKjvOwZilxlrt/s+CZy8LDM7v3wmPy/NKogETroQTDh72AYUCN
 i4yuOKs9hSEmqK2wFob0lrLEEa2Bhwzei9v7LMb2x0JcuX10QCwlPwz3hSb9W/mnj7pi
 6dM1ALVw3ZOgMlfzEhs13eIb0cr03oPvmvGJOLUMJtxTFBL8VUp3qmgT1hJiR58zBi51
 S73HRoNmUdcPDk8AT4jTENLqBwNvtwo2U+8uiveerCyBJYLQIOkAmS4ZuOyNCQ6ra68h
 cDzw==
X-Gm-Message-State: AOAM533dnl55RUuLbZpBhm4X3Z5cFDRTpig+sm+lFTPGUsOvXbYoQPyt
 U9Q8jBPj5N1rFi6zyUBi1C2Vcby5bzg=
X-Google-Smtp-Source: ABdhPJxZwCaNuz0EuRN3HiEJkme51zK7huUsX74i59oz8PmDjiL6lD8WOGXYNE1Ir+cbn4I9VTVpBA==
X-Received: by 2002:a5d:604f:: with SMTP id j15mr7678889wrt.404.1644182214124; 
 Sun, 06 Feb 2022 13:16:54 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id f12sm8132813wrs.1.2022.02.06.13.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 13:16:53 -0800 (PST)
Message-ID: <95250424-afe7-a5c3-6960-fb11b5da374c@amsat.org>
Date: Sun, 6 Feb 2022 22:16:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v4 02/11] 9p: Rename 9p-util -> 9p-util-linux
Content-Language: en-US
To: Will Cohen <wwcohen@gmail.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220206200719.74464-3-wwcohen@gmail.com>
In-Reply-To: <20220206200719.74464-3-wwcohen@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 6/2/22 21:07, Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> The current file only has the Linux versions of these functions.
> Rename the file accordingly and update the Makefile to only build
> it on Linux. A Darwin version of these will follow later in the
> series.
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> [Michael Roitzsch: - Rebase for NixOS]
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> ---
>   hw/9pfs/{9p-util.c => 9p-util-linux.c} | 2 +-
>   hw/9pfs/meson.build                    | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (97%)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

