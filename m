Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14425F31F9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 16:30:33 +0200 (CEST)
Received: from localhost ([::1]:41622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofMSm-00015A-Me
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 10:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofMK2-0007f3-AA; Mon, 03 Oct 2022 10:21:30 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofMJs-0007kY-Kn; Mon, 03 Oct 2022 10:21:29 -0400
Received: by mail-wr1-x42a.google.com with SMTP id f11so14334770wrm.6;
 Mon, 03 Oct 2022 07:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=ByT9Y77FxfMZuu8f7KCsxN7jk3aUMIVuZBUoVsuEjb4=;
 b=csPMcCsd7ac2lcWXa0/1REO+9wtEIsLsvwYhGY/2B3HyrUq//2n9r38JzefLFdSCOE
 MnMtRxxKnFHJrv9ZntnwxmrzZ6PXvrH4M+t9p/ry6cqyTWJnrAm4p9thHwNfXZzQRMXg
 OOINnjntAGWkXn8H7nwsHB/rMlY/InL3u1ZwYZFZBwD9qd/UkZo8GhYJR6UbrijBhXVj
 vIRYRfpo5rYYVqh2Ez/qxTCoi++WM6KZJzRgUDZ/A4ZhyQQQrfrooBj/v0BavGG5+z0+
 3wrke/NSnXeIPmxAhHJUdJLHC7FmKCOOv1r5z6d1Akm1RkmgZ9hi+CKVi09pRfMTHNTG
 I9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=ByT9Y77FxfMZuu8f7KCsxN7jk3aUMIVuZBUoVsuEjb4=;
 b=I1tLC0LG2dzBS0fuk2JZ0g6QrukcyF3ctEsNzVlzRQTsUaaZDrszBVX/IITFUkdhhv
 GXd6etMysyH7qU2KYgeRoxGOznVr0h9tBGhPD+5/+tuhIQ+flVu0n9S55PsnkfVqSOWi
 tQRCKQGq80J7RIc/F0B3JwvTTIp049jERxlTmeLR+GWXSKVRU39JJgAJVViC4Kf0r7rM
 eDIfo9z7VAglurZ0gqs39RzIbgQrQvc2fbrH72sUaQxdPg4MJCk54EHtN6hSms4QKVj6
 m4iU9BkMK4RJfuxI/kveQiEwHOXJecLCQ+SkYgC8pdLPQVjXUOtlsAU7kqK/L0OWEouD
 falw==
X-Gm-Message-State: ACrzQf2qg2q6DLiy7WOapW/ofsWF5C3o6B7ca2vn0uHQMdHqijMv1B7A
 2UUGtizqzpl/uI47wSU3AQA=
X-Google-Smtp-Source: AMsMyM5RlEyGwixteZb7qxgum3XZ+nXVSTW9DHu/aTUZfE+wvVvt/zgR4ruF9yb2qki1DjVEgT8Pug==
X-Received: by 2002:a05:6000:1f1d:b0:22a:feb9:18a7 with SMTP id
 bv29-20020a0560001f1d00b0022afeb918a7mr12438509wrb.152.1664806878993; 
 Mon, 03 Oct 2022 07:21:18 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a5d5904000000b0022ac38fb20asm9636643wrd.111.2022.10.03.07.21.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 07:21:16 -0700 (PDT)
Message-ID: <620adecb-309e-c1d1-297b-022954c18f5b@amsat.org>
Date: Mon, 3 Oct 2022 16:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v5 4/9] target/arm: Change gen_exception_insn* to work on
 displacements
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20220930220312.135327-1-richard.henderson@linaro.org>
 <20220930220312.135327-5-richard.henderson@linaro.org>
In-Reply-To: <20220930220312.135327-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.467,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/10/22 00:03, Richard Henderson wrote:
> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/translate.h        |  5 +++--
>   target/arm/translate-a64.c    | 28 ++++++++++-------------
>   target/arm/translate-m-nocp.c |  6 ++---
>   target/arm/translate-mve.c    |  2 +-
>   target/arm/translate-vfp.c    |  6 ++---
>   target/arm/translate.c        | 42 +++++++++++++++++------------------
>   6 files changed, 43 insertions(+), 46 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

