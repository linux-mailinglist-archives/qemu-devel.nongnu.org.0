Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7A73077BC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:15:22 +0100 (CET)
Received: from localhost ([::1]:46568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l584u-0001tD-UZ
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:15:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l583O-0001T0-WF
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:13:47 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:47074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l583N-0005aO-Gs
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:13:46 -0500
Received: by mail-ej1-x62a.google.com with SMTP id rv9so7926267ejb.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xHH8xl4DQJEa8Zbc3UMN4ICRTsjrI2A+4OepZSLp2/w=;
 b=JLvVGqERgccL0KMtxhryg35/Pr1kKhYKd/ZXuCp4uOpwq2bIMUa7js7k8pZg1HdnWj
 cUFRBzMLresiW92tE1KDa/yJjU/aHjUjBLETOWsloRrZxsDCO24Rn5H/HdN0HDWP+d8o
 ODJU7nBYKc+CfIrrCi4og/QCVQl7ChE7Nnpoy8jMEAarWUzr8t2ZB4OgLaORkK72XGiC
 VFUOuF0aBuuUc3TJva9Z+LhVK+ZH3bFvVXF6quE6ER/hm59JQUDeSbnH7VtKPO+4Li9w
 KkJW+CcdR7Jj0eH8Jse6zLa3XQap169BepxF39lkbCz0cWjxK9rLJwwth64Ek+ShRXAm
 Mrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xHH8xl4DQJEa8Zbc3UMN4ICRTsjrI2A+4OepZSLp2/w=;
 b=k2ohK2TfEIekfTzR23qFxAgeu/ZZX/C3noXmqmo1DLQN/7NootgPw+/MbqiN55vlbM
 4DuRLLtjDoncuBnAF6Uun9F1WoKoNoJix3KfNsxN2tPktc7RfU1v9rIbfdL34mTTDdhv
 2EQYu6uD+X7DyfjAREX0ZLGwXWfE2V9XbhxeoINTEdHNlM4aMlon4OVna4bBZm4zdiRg
 Yjc/6xkpmMNqQf0rMUzf5Kx0yVbjdiwMiNjJZizk1SjZD7CRZrs1HRneNG6tVxtR5Vjc
 133aX8VCegSJ5HmC5sYKlYa143FrGaM4NS8lkQoqT/H+wW8RKJs3s4AC0CQS321m6plr
 kz7A==
X-Gm-Message-State: AOAM533bmHHQW8nWRo0iZj5FDeFOI5LUuyQkcRN5KWZJH4tLR2ywWEla
 XXQ3daWS5d4QMqT3UN5V1c0iu7IEIK4=
X-Google-Smtp-Source: ABdhPJzRB+oS/s9ayMMTYHKCOMw96gRUCP2/VNQhK4Aq5mHLB95ZLOn0eVBVZd8D/JwzEe5uaA4WjQ==
X-Received: by 2002:a17:906:35c9:: with SMTP id
 p9mr11685973ejb.310.1611843223808; 
 Thu, 28 Jan 2021 06:13:43 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k6sm2330128ejb.84.2021.01.28.06.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 06:13:42 -0800 (PST)
Subject: Re: [PATCH] tests/tcg: Replace /bin/true by true (required on macOS)
To: Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210128135627.2067003-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <abcde88a-b25d-0bde-d0fd-0caa32665d44@amsat.org>
Date: Thu, 28 Jan 2021 15:13:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128135627.2067003-1-sw@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 2:56 PM, Stefan Weil wrote:
> /bin/true is missing on macOS, but simply "true" is available as a shell builtin.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> A similar change might be needed for tests/qemu-iotests.
> 
> Regards,
> Stefan
> 
>  tests/tcg/Makefile.qemu | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

