Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE15E4127D8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 23:19:17 +0200 (CEST)
Received: from localhost ([::1]:36374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSQh2-0007Yt-Nv
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 17:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSQf6-0006D6-Tj
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:17:16 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:50991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSQf4-0004Op-BK
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:17:16 -0400
Received: by mail-pj1-x102a.google.com with SMTP id k23so12955746pji.0
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j72gP77s+g0jvuHVpgcNi6yEsDYQQs67nMLzrvk6Q+Y=;
 b=TKQFN+kewrwWYjmbzL0ml+KBYXFn6JgIWcptqJBMS7sA8qcQq02XYruiqfJeBScX5y
 ckjJc5hE3ZEF3TdkI3kMM4DefQip+4XotTROXlucmJaPPhLu4zTz/ZSf5NZn4NF9yCkq
 uKrx5Wd10HGsPLNNyRmXPjwy+BhKgoEdmu4R6AjrFClqis1LqxmX7um1oYC5aJmVndI3
 ZTZe75n6EDk0taS9kq24cQ+HaFTxZ848o4WAO0ZCjB8cPh8/Yk8sq6GwY3kPhLqSP65F
 FXnR4BR+T0CLlk1xtpvsr25waCeytzsvXleX6IKB79dyto41UyfrNMrmgVYFx+omKSxd
 mimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j72gP77s+g0jvuHVpgcNi6yEsDYQQs67nMLzrvk6Q+Y=;
 b=Qsr73/Z+SFpUonNIxI0JShU2AVjntsu/gWcl33BcfNb5udPh5F3ZnGL5W9xlV39Jsv
 8kYc3+1pnt+yCZeKZ4CHxoZZUMp/Xon/E0g9SMWQCTaUOjIHXBjBqG+9znKL61LFHCAC
 xiaJnH5VaV82SZ452K9VxNJ32gwDt6FgLduRbfpt0TaYC2D+TspIeo9DzHLOqNbPpg8e
 L015JNtwh5kAS0g8MS0snAUbj5/GbVVVrxCU24hpCEJhnRvIdtdlytXcSsXRPyjT4xFz
 TJIQwOTScFqWeaGoTOUOcaJ2KVFnMlkz9u2evrrcJ5RCWXTKLYURCNspUgxcOVphT4yE
 ZlIw==
X-Gm-Message-State: AOAM530wQN3UnPlUMaZh3j0Q9UtfWsFGk2O52L1iWzT30tRd283Q2zgF
 fTPnFM897oX8JvoXvTtT4HviPA==
X-Google-Smtp-Source: ABdhPJwjYvBHsj5neVF1NSipf6KqKz6h0ht5aq5Bo+QmizpMvdtREakHuGnv514FIJw8xJJD6iB/BQ==
X-Received: by 2002:a17:90a:428f:: with SMTP id
 p15mr1170685pjg.75.1632172632589; 
 Mon, 20 Sep 2021 14:17:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n66sm4488401pfd.21.2021.09.20.14.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 14:17:12 -0700 (PDT)
Subject: Re: [PATCH v6 00/21] Add LoongArch linux-user emulation support
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1631866380-31017-1-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5d524802-1083-7280-97a7-9cd80037d5a3@linaro.org>
Date: Mon, 20 Sep 2021 14:17:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1631866380-31017-1-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 yangxiaojuan@loongson.cn, laurent@vivier.eu, peterx@redhat.com,
 f4bug@amsat.org, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/21 1:12 AM, Song Gao wrote:
> The 'o32' code has been deleted at the latest kernel [1]. This series only support
> linux-user emulation.

I have now reviewed all but the linux-user/ portion.

I see that kernel upstreaming is in progress,

https://lore.kernel.org/linux-kernel/20210917035736.3934017-1-chenhuacai@loongson.cn/

so hopefully this will be resolved soon.

Have you started working on system mode support for LoongArch, so that one may run that 
kernel?


r~

