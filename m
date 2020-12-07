Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B832D1D5D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 23:34:43 +0100 (CET)
Received: from localhost ([::1]:44372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmP5d-0001tj-QP
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 17:34:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmP2x-0000ms-FV
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:31:55 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:38108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmP2j-0000XG-4z
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:31:55 -0500
Received: by mail-ej1-x644.google.com with SMTP id a16so21843177ejj.5
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 14:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NOVVsnA5ve3D+g78JaZMEzfPQOXOMxvSwAuq/Diw3qE=;
 b=lwFaToeOwEYkqcWm6i2/PkutpJiPMe//a9MGHHbcby1CJ9mB+x0Us1BFRZJ62IHoSB
 WkIgUIs0QFrAjXXxjBTfxvjSBJ9I6n1IEdX0HQo2j8vj19ETZbKf/ZEqG9IYlXGkmG3i
 h03nZUEEn5R9ZGDqwD9ndmFax/W/JzQZgqdMDDIOSA/3204XcMnPrANUTdUAnWYtYi2k
 9pACOIWh/D0sBjESIpukMWOp+hw5wlTXuvNFMpDUGBajfdFHQEgiYRMu+uNzptWZzDOI
 XX6qHkSV2TWBr1OqZk7RBgo//5ZtHubZOpHh2f7+MJTRWsvOsryj8aV7DCCEH7QD9prI
 hZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NOVVsnA5ve3D+g78JaZMEzfPQOXOMxvSwAuq/Diw3qE=;
 b=U/ZgWq4E1CMIfWTr+dSn1OX+7xzVP0GFNLzZlEqT57te6+3c8xtQRoVqam2Nl4CSIZ
 lyRQ6DBhDHYlytQWkkrqcG/fwZ6mSWXOHiOG4++L+aBKpz6L4OMwe/T3/W+M4Wqi2dTN
 MyucOZlV/uN1C66k/nKhJvSsQfhuEfO+VvmRk5F6WSCGG9rhxY6EVIQGpC5lV7wQaQDc
 mX1imdPpmd2qHUVd47eQEDkYVFmrKZ2LhZ2M821QtCIbOlvzVrQAUyJSUexWfRqTmhg/
 C7KFa7/7K6dZNO7ksbn+otqRWFG5JvGQxYgm9cPCsMQDpGyINHZ4pcZ7Qxzgng4Xg6ve
 w7wg==
X-Gm-Message-State: AOAM530aJ923+Nu8joRa3NbmUDV9l/LQKEfdfHkiI1UllET5xV2pcknv
 0yr7wOeJVx+19xA5uZKYsOI=
X-Google-Smtp-Source: ABdhPJzd0r28fSAXlWlg5mBqcVqFeKykVXALUZkXPsgghqJUqmBMkiLeItCjKsqzzvPGbXT1kGbkmg==
X-Received: by 2002:a17:907:961b:: with SMTP id
 gb27mr20425468ejc.313.1607380299571; 
 Mon, 07 Dec 2020 14:31:39 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id q5sm13679937ejr.89.2020.12.07.14.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 14:31:38 -0800 (PST)
Subject: Re: [PATCH 0/3] target/mips: Add some CP0/MMU missing definitions
To: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20201201132817.2863301-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <42443b61-e1e5-5361-bc93-e203533ae1b2@amsat.org>
Date: Mon, 7 Dec 2020 23:31:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201132817.2863301-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x644.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/20 2:28 PM, Philippe Mathieu-Daudé wrote:
> Add some MIPS3 and R6 definitions to ease code review.
> 
> Philippe Mathieu-Daudé (3):
>   target/mips: Add CP0 Config0 register definitions for MIPS3 ISA
>   target/mips: Replace CP0_Config0 magic values by proper definitions
>   target/mips: Explicit Release 6 MMU types
> 
>  target/mips/cpu.h                | 11 +++++++++--
>  target/mips/internal.h           |  9 +++++----
>  target/mips/translate_init.c.inc | 14 ++++++++------
>  3 files changed, 22 insertions(+), 12 deletions(-)

Thanks, applied to mips-next.


