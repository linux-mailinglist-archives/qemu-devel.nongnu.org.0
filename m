Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0F9649991
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 08:31:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4dHF-00057c-0U; Mon, 12 Dec 2022 02:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4dHA-00057Q-Px
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 02:31:01 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4dH6-0005jY-NV
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 02:30:58 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso4355254wmo.1
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 23:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9YJ3ni0PZO31j0SOhbnRJnCN0TJNSiNIOSxI11FW55Q=;
 b=U+fBDzhr6Hi9RijchaFHSi0Yqh7B8LdCFArXnxMstGw0j9VUxiRrTJndqehftYsKCw
 6/SaHfKdtfIM0wA+GhPz5w0AqYz/9A+nuG6hyO3r9FG3vRJWSMFCzWVah1MhnPAfn/p0
 gucUMmUaRSSpqvFpvYDr2ZibvHbwvM0Ztue/i0fMgPe+ABwy9+9aVJzzXwIw3CAx/R7y
 nehtWs+soD4oIL+xHpSusZ3st1fAY/gTO4KXLvHpIQU92wirbBRqnfDEFVhYLR8IuFY1
 MkmvWPbtSbqgI/xv/n6MVATqwU8faFdJsZQ/N9qlkAN2fsvYvwXEbulSD3ytmxuc+Xsg
 LWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9YJ3ni0PZO31j0SOhbnRJnCN0TJNSiNIOSxI11FW55Q=;
 b=HIdPXWQmOyF8KLUhWjMq2lq2fZVg6+2wyJ/bn1YDppdlVhzHd5u68tk8Iliq9XcdGN
 6DEs1S2nuwk9tQnE+0mhglXx7gf+Puk+KX4FbVt15JsDmyEIFX0LxIZpvqM3LW11SFXF
 1UCLoKsaYUgeBmeEEmdPwws3cTq0q829KckMjJVEIsl2NTMHMTA4XKPaJlFxGkqNee6k
 GCnzLLuPvXVoBK7gGE4D0MbnYbNcmevJzAM9RzCvrp6KtRBZ4UGqGSIyYQGxmr4Qlf1r
 hduxQeBWPcG+yJ400V5QY/Ca6xynG1FkAGQ1zS1brkvZY1i6EN0lIaX3tKuics+G7HiQ
 R8nQ==
X-Gm-Message-State: ANoB5plSI4UEGqzsQkeOhFx/AScDljoKTWWhCa8NWDQM+yBDfqkfvq0A
 qmWZIH6ojSzkvEt4XevPRUUCbQ==
X-Google-Smtp-Source: AA0mqf6TgBGcLKar0GC9OV9tks6c44XY1O3OXLoAP2ATkYXraoHWPnF6fCgiRxCA0sKo11+LKOkgAg==
X-Received: by 2002:a05:600c:2215:b0:3cf:6d5b:875e with SMTP id
 z21-20020a05600c221500b003cf6d5b875emr11591177wml.12.1670830255046; 
 Sun, 11 Dec 2022 23:30:55 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 az25-20020a05600c601900b003cf9bf5208esm8486426wmb.19.2022.12.11.23.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 23:30:54 -0800 (PST)
Message-ID: <897f5285-30f3-a258-9491-1abbcf7d331d@linaro.org>
Date: Mon, 12 Dec 2022 08:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 0/7] hw/mips: Make gt64xxx_pci.c endian-agnostic
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20221209151533.69516-1-philmd@linaro.org>
 <93CA6FDA-BD55-4092-B827-948D0F1A6C68@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <93CA6FDA-BD55-4092-B827-948D0F1A6C68@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 12/12/22 01:55, Bernhard Beschow wrote:
> 
> 
> Am 9. Dezember 2022 15:15:26 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> Respining an old/unfinished series... Add the 'cpu-little-endian'
>> qdev property to the GT64120 north bridge so [target-specific]
>> machines can set its endianness, allowing it to be endian agnostic.
> 
> Hi Phil,
> 
> Did you intend to use three different E-mail addresses in your series? At least your former @redhat.com address bounces...

I cherry-picked some old patches which came with my previous address, 
sorry for that confusion.


