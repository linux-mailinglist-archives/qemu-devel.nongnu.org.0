Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFA64405D6
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:41:13 +0200 (CEST)
Received: from localhost ([::1]:33832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbUm-0007a5-Bj
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgbP3-0006U2-Na
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:35:18 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgbOx-000249-4u
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:35:15 -0400
Received: by mail-wr1-x433.google.com with SMTP id s13so12034052wrb.3
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 16:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UHQFF232DwJmJHO5uK6MvGr7qtpmXB1LsCeCwVyq0A4=;
 b=d5r5eGurN6x4ydL2kthSTyZaLfbNe7SPYnaETEI5i3yGqNXTnexg7gqcdUCBCrKysh
 SSzq5bzNNOHzS1Pw6a72T1Z2JCwhzMddJ68zynRfitg4iOxK9h51sSMSRtaCdqyVQN/K
 1UlsM3lOOOBQFmBX3uUsLvKdn+Cdzs0BSKTVG0DoGUPLZvfGy9ub55kHII3RCCmq2vqN
 f/b/OZDxjadoJIbS2AlkDADQGfZr5R9/QWWIbk6FCXdkCi4gOMt0xV0EQgVFuLyOYOyh
 PPlplFWjZicqTzGFXdq8DPegTyqca1CAHwckCIPRVYYazaONAMBY7xIB0AUr5e3izyaS
 YqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UHQFF232DwJmJHO5uK6MvGr7qtpmXB1LsCeCwVyq0A4=;
 b=PkiDgl7yTnu+ycYjs9x28wEJexk14F+UWJvj7c1VIOJqqY0mfMf/9m7G/hSUT76P3i
 aD3kVcGuqt90V3RrutBJNHXPcG7Wz4h6EvgWlrTatNJmC2MBYpREDxs8c92G5zeDjtfa
 V+wMRxKPFWzsPlfo7PNs+e4zGNpz/Vms5ium7AWSgPvrIH3hsy6ms1/rJLiBMWqGj8DT
 9UngyIbr6wAHd/l/uEXcmNaakUTOy2NNsvAdAwJtrSByYb+x5ZGYavDvhHauMe1MMExR
 BwrHmQgidASZox56F/zqqWsB3Grlu/msiHzFbmC1CwZL4MDkJKbK3/vKvQLCa7yc0LGY
 F4Lg==
X-Gm-Message-State: AOAM530tKqjkUol8Aukc5+Atj+cYsMT6IZwHBXnaZ1lF5rxTbY0jRefw
 iDrZbYt6fMxIoC8i0ArBYsM=
X-Google-Smtp-Source: ABdhPJx9u5v2opW7J6G9uHxZO5mggwvCJpM8HpRBAthwQONEko7hOz4xqkXjWHY0KGD8ypkvs/uoTg==
X-Received: by 2002:a05:6000:1813:: with SMTP id
 m19mr8086025wrh.51.1635550509618; 
 Fri, 29 Oct 2021 16:35:09 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c17sm7096485wmk.23.2021.10.29.16.35.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 16:35:09 -0700 (PDT)
Message-ID: <c2092d40-c98e-e087-ce26-8937e8eb811b@amsat.org>
Date: Sat, 30 Oct 2021 01:35:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 44/67] linux-user: Add cpu_loop_exit_sigbus
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-45-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211015041053.2769193-45-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 06:10, Richard Henderson wrote:
> This is a new interface to be provided by the os emulator for
> raising SIGBUS on fault.  Use the new record_sigbus target hook.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h | 14 ++++++++++++++

This header deserves a system/user split.

>  linux-user/signal.c     | 14 ++++++++++++++
>  2 files changed, 28 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

