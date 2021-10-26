Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456B643B084
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:51:28 +0200 (CEST)
Received: from localhost ([::1]:46224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfK3D-0007fU-9H
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfJtO-0008BM-E1
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:41:18 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfJtM-0007W5-RX
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:41:18 -0400
Received: by mail-wr1-x42d.google.com with SMTP id o14so1097984wra.12
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=57YjSLv+u84kOeYsInMqDfeoLPvE67VyOLNno68S+M4=;
 b=fI4bw5m4+XS1Z1DGkThlv0LLHNreLM17MNrtVzICs2/Kux9oJ8gVdtg+dTyJqhm1FW
 UMdH/KL9IJwati3oGrCcUAQBvu5y600Ks5w8F/3B7D/ugxwrDrO+rmbJdRLBYvgY+eh3
 P5zJaN8sJLH2iOwJz3teLTvnVLC/lRL43aW6qZ9C33QYgPwTm9Sd4jtExLg9cbVJE3hC
 kqnZe/Lyak+kzkITHqHRd2+SCnjWWD13pJudvF5Zn2KtM5gIY8SZAA6jpH3Arwwex5i6
 mts69tIxFWaxcDSYBBYW9robjGcXFf/vfgczdUIhyE/wgwv/wMCjlajgVNcGar8wvvI/
 KPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=57YjSLv+u84kOeYsInMqDfeoLPvE67VyOLNno68S+M4=;
 b=eWnTkjkcyebUVfJmLHnUByxXhxFE5Iw3GwczsTCJEdUq0HtWR6iJOiy0Qy8Lki0E9X
 TDtKzxSFg2dFXulVvGVrpBwi0NR9PnLser+8TumjEwBWFhxcoJQw43Y/fdwhLjPHUBs5
 LzX4wpE4G8W4qAAJ9zg9kqD7Gkf3a18gGpOu99hG6/lkQ2WaJc3SW9AVXYitK1pVyVcx
 V2k+8fKvm6exdG6/1SDY6zV6MQYeRCFEoZCMhfekTG6BRjEHO44vtwY1x7zhRyvKhnVj
 Srt0QgU15++VJpfC/PCb/g2WCQDlEBad2YhuGtDqCQXw1lA0zB5UFSm1iNdyt0oRQ5CJ
 ZbZw==
X-Gm-Message-State: AOAM531+/xvJjX08RL4kodekg/nRmu6BT1/hjG7hFx5uIHyf+5YYj/2s
 Ck9zho/DxsoT31ziE056a+K7UDy2Ei8=
X-Google-Smtp-Source: ABdhPJxQzRa/qZdC7Z+PC7+QjXAYhb7XoEAYItxMJwlHENOvlJ9D0UqAa3FOYfrTvZMaA8iKse00IA==
X-Received: by 2002:a5d:4a12:: with SMTP id m18mr30325767wrq.203.1635244875414; 
 Tue, 26 Oct 2021 03:41:15 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f20sm285000wmq.38.2021.10.26.03.41.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 03:41:14 -0700 (PDT)
Message-ID: <2599172a-e485-4b11-5edf-16fe60019aeb@amsat.org>
Date: Tue, 26 Oct 2021 12:41:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 08/28] tests/tcg: Fix some targets default cross
 compiler path
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211026102234.3961636-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com,
 aaron@os.amperecomputing.com, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 12:22, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> We do not want a shell command substitution, but a parameter
> substitution (with assignment). Replace $() -> ${}, otherwise
> the expanded command return an empty string and the $cross_cc
> variable is not set.
> 
> Fixes: 634ef789f8e ("tests/tcg: add more default compilers to configure.sh")

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20211023164329.328137-1-f4bug@amsat.org>
> ---
>  tests/tcg/configure.sh | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

