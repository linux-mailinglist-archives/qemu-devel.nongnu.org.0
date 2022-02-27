Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A26444C5F9B
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:53:38 +0100 (CET)
Received: from localhost ([::1]:49356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOSQ4-0005Qi-Iw
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:53:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOSP1-00044K-MD
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:52:31 -0500
Received: from [2607:f8b0:4864:20::531] (port=43733
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOSOz-0006tl-ED
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:52:30 -0500
Received: by mail-pg1-x531.google.com with SMTP id 27so9867708pgk.10
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+VFvlmFHV7QICwgLUnWWdwwYgDuJ0npNJ7BTubu5ptg=;
 b=QCuKcMnKgA86rv2AYLoTwmeNCKvwQZFW/gNfHqyH3qBVyfegNa6iniTz5h8/fgqEsl
 8l3Tdhbce69M20ut9TWcucfAijsBOVyU75+b25BUFtIyoAjxS2EzMYZKZwzwWb5vwnNk
 dIjOhxqiv7geifLV/sJu9zPYxDrMiaRPUrrd+jjOovTC3o9O6wqkAq2exzAql6OOh0hH
 NOiV4C7fqR6ZUWzP/t33b1YB1TIcKwPyA/u/gvp0Z0/eiOTGHok519HJDidtXi+PYgMC
 QqWxWTV4xqjxcgP50ywSj8Pn/y9q5g7l2PQvLZ2lBO86Y2o9FPoVXOQ93KZb6ARhsow3
 z6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+VFvlmFHV7QICwgLUnWWdwwYgDuJ0npNJ7BTubu5ptg=;
 b=hYhLi7DSN156d6IGPEMwFUeNM2Kx8A9wYAgWqpKXqbsdWOZaawlm81HWK9bng053ow
 U4i7RnfnQ+uBZQH3+uK1EIL3nGqoz8BZlT4l/EwtStKc9P59mlWNl89lqHNnwffPdVH3
 7IwdE77B/t+7fH8IDR8v22srSvAWRolAZH+5BGkXfjpNcS6Trrgq76npZ6awlaFoHGl/
 AkJ0J5mTOdIpdD5g00lFhfGeNKeyFCyidFphhuFsNru1Emq9Kc7GnkyYjjxMnrIwf6q8
 pnRHLsthD7feyBCMyyjHTIRHGYqRGZM3nEnEUbPweR+9zZjYC1QrKMTQvZy/ESrLswbQ
 JwUA==
X-Gm-Message-State: AOAM5315W79ccWjPQUp2owPAlMW2o1ONrq+/EVkyQjptePpwEU266Aep
 we2qSKPm9YWFsyaEnXMqGrU1F+Ms/5U=
X-Google-Smtp-Source: ABdhPJyqPBXHSstcbQk1+Y4jGZvn3GKxmlDuhAlYiVkxNI7+6YNAavJykRlDIzJAeYoGF2osfqp5Zg==
X-Received: by 2002:a63:e59:0:b0:374:a169:d558 with SMTP id
 25-20020a630e59000000b00374a169d558mr14708906pgo.304.1646002346834; 
 Sun, 27 Feb 2022 14:52:26 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 q91-20020a17090a1b6400b001bc8d59a02fsm8566766pjq.35.2022.02.27.14.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 14:52:26 -0800 (PST)
Message-ID: <604738d8-8f6a-9f32-b314-aa97da6d6970@gmail.com>
Date: Sun, 27 Feb 2022 23:52:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 9/9] tcg/loongarch64: Support TCG_TARGET_SIGNED_ADDR32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220227020413.11741-1-richard.henderson@linaro.org>
 <20220227020413.11741-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220227020413.11741-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/2/22 03:04, Richard Henderson wrote:
> All 32-bit LoongArch operations sign-extend the output, so we are easily
> able to keep TCG_TYPE_I32 values sign-extended in host registers.
> 
> Cc: WANG Xuerui <git@xen0n.name>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target-sa32.h |  2 +-
>   tcg/loongarch64/tcg-target.c.inc  | 15 ++++++---------
>   2 files changed, 7 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

