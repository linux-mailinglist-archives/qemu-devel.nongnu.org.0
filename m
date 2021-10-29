Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8B94405EF
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:56:00 +0200 (CEST)
Received: from localhost ([::1]:59972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbj5-000101-Od
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgbYW-000484-Si
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:45:05 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgbYV-0005TM-5X
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:45:04 -0400
Received: by mail-wr1-x430.google.com with SMTP id b12so14781459wrh.4
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 16:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ju6YP3m4ivocJevjI3JIbPbMUGGUKot7rDhWje9gtsA=;
 b=b3aYr1fSkjV3YNqCic3WgNJSCukRHs+s7aNtFjaQ+Y8sdfCKjOKtp/tn0SgWMJhGhb
 uJ3L6nAAxmMXLJ30HpoWETQDx2OVAIUpNGiC1sHO7JGnK9Fiu1i7c76Z67b5eXGw/JD5
 oyBKTk0Xeit6gwCdbgfCC8V4+Tkz9NEOrq8iRS89gxA/ppGCQDF06BIUTsAus0SOnX4P
 60jVAzQf3/exuEbhJ5W96fA9ZGCD6C5ZsJPqidsjQn4IqTBmz5xgCSeKwg9BjeIr2BMg
 9ffiZpfd8EQbGonwtpcgW+ZNHRxaMP3f3dmBZiPozbkNt5c8MsQ0X9YxxsmvuFoFqNYd
 GQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ju6YP3m4ivocJevjI3JIbPbMUGGUKot7rDhWje9gtsA=;
 b=kszINyxjtbWhCLl3Rn9Cer6dX4sJh8svAkFKGQfMIYiEmkXGE3a8pIZP62d/hoiChv
 5saBuchc3zYquUnc3LkaqeUseMtJ2JzVnAQWwEut2zIoU3zwq1uvuyCjBC+KYa+RZR5A
 CjhAixBDz0ncnFckxOk+2wmhDmOXzB1qtTrFSZq1UU/Jm4gMU7dPnh4xpst/0kVuL5ch
 026Us7DWGj6jc0n2kc2OeNRHdAjWYQ/bT0Tazn0K0qvbc3kM4SLnEh88l06zg3gYmH2A
 2Bsj3SvNThfZk7cm9cx3ipnSeYoKj/QlImEkZsamGCgVNSsEqEfJdS8vh0ItAGrc8lz4
 ZL+w==
X-Gm-Message-State: AOAM532VY2QKts1qRJBu4YyrBSsyXG7RMxd4ojYvcM0m3yp/a8WaoOKu
 LfMSRGAAvBstHAfA6g7E6GWqODJKtlI=
X-Google-Smtp-Source: ABdhPJw00R39ATguDoFsCPsV1UbhoSUiHC1U8Vv5xbEZxzKk5w5gh93vhFbjHY6MoDEPfyr2UVXLQA==
X-Received: by 2002:a05:6000:2a4:: with SMTP id
 l4mr18650016wry.221.1635551099790; 
 Fri, 29 Oct 2021 16:44:59 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z18sm3446549wrq.11.2021.10.29.16.44.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 16:44:59 -0700 (PDT)
Message-ID: <3f07e59c-1e9e-702d-3bf7-8094f562b100@amsat.org>
Date: Sat, 30 Oct 2021 01:44:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 60/67] tcg: Add helper_unaligned_{ld, st} for user-only
 sigbus
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-61-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211015041053.2769193-61-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 06:10, Richard Henderson wrote:
> To be called from tcg generated code on hosts that support
> unaligned accesses natively, in response to an access that
> is supposed to be aligned.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-ldst.h |  5 +++++
>  accel/tcg/user-exec.c  | 11 +++++++++++
>  2 files changed, 16 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

