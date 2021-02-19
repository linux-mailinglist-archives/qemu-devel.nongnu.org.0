Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C10131F33C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 01:07:42 +0100 (CET)
Received: from localhost ([::1]:40596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCtKf-0003Bn-Mh
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 19:07:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCtJf-0002L7-2F
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 19:06:40 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCtJc-0004VK-Rt
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 19:06:38 -0500
Received: by mail-wr1-x431.google.com with SMTP id v14so4841382wro.7
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 16:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1DLswLkZkDna1OPzDX7dRepjCg6bkgiuc/ZsmG7yjcs=;
 b=b19N7U4R7bRASgwHfhfP8fnN/Ky9+xe5JOXV5JgSBlhNx6SGew5odnDRH0jYZaEFPk
 zU/Sv9Dtx5+T+VoFLYFiGoV2TTtxqaUhNsKYNHMAGbZ2NaUFvPcqNKbgu3ArBWfiWIhs
 0i6H77wOnhmsKf45oZr9oXqhlvC+D7l/aJZJblVKI8sZMCWR5yH9l5S5ADfh14mNEbsL
 xhDmt9cFFG8N1s9HexkzmrS+WvR1inn5I3TlqiFuEbI8Kmu1flnfJPxM9pG33GRi+GQ9
 mKJzd8GR18+vHapMyM/afrFUzo/LN99rp1dbbgqKjF7VNOKwkFaaiBWPmXK01Hqxwm9W
 5fmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1DLswLkZkDna1OPzDX7dRepjCg6bkgiuc/ZsmG7yjcs=;
 b=a1eDADuO0qZxYAKor+ikm8L8BBbgBLGum8ZvUkXDQE9qi6npmFGZ0lQOlqrO2cjws6
 QRwhMHlFsUz0TUFkU05wg/v9J5VwpOLdW93n+cSgqsdNsXd4ODzYzUlchwTYqLehpDPD
 l9SKVYac/vVs/lffhggQb7tcUF+ZDPyueYOdztIAYRYPY5S3cvef7o5qGtiAPsdEZZjR
 KxzNZKEZyfZ4cAGk4zDfJIedc1lqbgiZ3/zXJGg4UMPk/FZ0xqbEIVf9vtTyKc9Ydyfs
 O2ZJeoMeJU6yi42Lna5TvN0JmDPN5HfIUCcq5THeMh7UnEWiSkzfa+Aaj9QRvDJDslZj
 OCgw==
X-Gm-Message-State: AOAM533aw6zkp9TK6z8e+gfwMFHYEv7TPRj2gZI66hjW9aHiRaJw68j1
 LZlQXbHPlUiveAvRIVBt5PGfpPb27P8=
X-Google-Smtp-Source: ABdhPJy3PmNv7RzDLRVvEV7IZuvM4XEGLI2sFH5AX/cwykl9plYAoKGTx6BAitPRh89Gs6QofByyWw==
X-Received: by 2002:a05:6000:1788:: with SMTP id
 e8mr6524586wrg.171.1613693194882; 
 Thu, 18 Feb 2021 16:06:34 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i8sm13873767wry.90.2021.02.18.16.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 16:06:34 -0800 (PST)
Subject: Re: [PATCH v4 09/71] tcg/tci: Remove tci_read_r32
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
 <20210217202036.1724901-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <64d5b9c5-6681-53d3-4e8b-742c85364c22@amsat.org>
Date: Fri, 19 Feb 2021 01:06:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217202036.1724901-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 9:19 PM, Richard Henderson wrote:
> Use explicit casts for ext32u opcodes, and allow truncation
> to happen for other users.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 122 ++++++++++++++++++++++++------------------------------
>  1 file changed, 54 insertions(+), 68 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

