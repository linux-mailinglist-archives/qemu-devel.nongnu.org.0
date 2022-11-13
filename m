Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2586A627241
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Nov 2022 20:33:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouIis-0003H5-Aj; Sun, 13 Nov 2022 14:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouIio-0003CU-LK
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 14:32:51 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouIim-00007F-Pq
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 14:32:50 -0500
Received: by mail-wm1-x330.google.com with SMTP id t4so6013807wmj.5
 for <qemu-devel@nongnu.org>; Sun, 13 Nov 2022 11:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jkF5HQ4Azubjwy6qw0TJUQmQK1TPUq7mpHrLa7sbBzk=;
 b=kMhXdJFFG3egdmLaSfOc1Q6Cga9oXrouRh9E35CE9r4e1I2gHDI4lRkdExVTJNn8oO
 ppQO78Zpe7RgbAEK/l1QT450xvhc6AnlZcIrjtBd4SiBIf3RlnhjTLbM57Nsw3ttwRSK
 DKOJkMhMsYWL8jhlDG+g4zXCg4+fDxGPCjNewXtJJvdbnoOdDQ3a2zB8yWRz0GeVCS0o
 WiaZciTAnbkPFgNjVldVQqdmNUCDZf8iz+nDnrVGNVAbZFYVJwVnmJfs9vv0mevkHSkY
 DktdjzDtVJvBNT9rokYVlEnHLaGiKarjX0Od6XLW4d04feEuLTxzUcj33jKBUuUKllqr
 TTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jkF5HQ4Azubjwy6qw0TJUQmQK1TPUq7mpHrLa7sbBzk=;
 b=7bx6EO9ynk+sRG8GRpoSSZiCtt3wcVJUD0G31W73gtY7INa4yVs3MNaTPVgSO35SoZ
 SC7YteMA+u9tI4C5I8JxwSFhcbiNZuJaJZwXSnAZSMNrLBJBcL2aXZdwoYgznlpTo8X8
 niOWuFSDl1YMagoZTUneMS1vqWydor6lQGVgOeGO/MHPGBxioWA3bXhZmE5And8zh8oe
 XHl5m1N3uZSxk583pOAuMXNxmVK8oqePx8YZY7e8/+I1MF9dG07B/Gryt6LaROsgqG4f
 LjaVCbnLOLh+e6saNJm2KfZcIZMXAKRRXIhDeT4E00CkvU1cH+ZXtq08aXqVlGb6iFOD
 +Xpg==
X-Gm-Message-State: ANoB5plpIxEOUvRzOMS7+/Gg4MS4/xhlOZN3nK5oeZx45Y5cC6xBtwp7
 doMZlVKcOresTM1HK5VtDp4ZDg==
X-Google-Smtp-Source: AA0mqf7kOJAAxnlvdhuEv5a46zW7MknBg+fbhjMxt0YLeAgisspiOLG8G30gb4TzELp2M0Mrk5g/Hg==
X-Received: by 2002:a05:600c:1d19:b0:3b4:be28:d800 with SMTP id
 l25-20020a05600c1d1900b003b4be28d800mr6311777wms.170.1668367967097; 
 Sun, 13 Nov 2022 11:32:47 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a7bc4d0000000b003cf75f56105sm11659961wmk.41.2022.11.13.11.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Nov 2022 11:32:46 -0800 (PST)
Message-ID: <56ef5603-523f-f180-55e4-12c9a0b4d02a@linaro.org>
Date: Sun, 13 Nov 2022 20:32:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] qga: Add initial OpenBSD and NetBSD support
Content-Language: en-US
To: Brad Smith <brad@comstyle.com>, Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org
References: <Y2+GO5jyd9E2uCT9@humpty.home.comstyle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y2+GO5jyd9E2uCT9@humpty.home.comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/11/22 12:40, Brad Smith wrote:
> qga: Add initial OpenBSD and NetBSD support
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>
> ---
>   meson.build          | 2 +-
>   qga/commands-bsd.c   | 5 +++++
>   qga/commands-posix.c | 9 +++++++--
>   qga/main.c           | 6 +++---
>   4 files changed, 16 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


