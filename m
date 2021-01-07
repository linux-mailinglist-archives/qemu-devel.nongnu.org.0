Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD552ED6F6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 19:50:43 +0100 (CET)
Received: from localhost ([::1]:59104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxaMn-0003W9-K4
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 13:50:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxaL3-0002GI-GC
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 13:48:49 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxaL2-0004Xm-0r
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 13:48:49 -0500
Received: by mail-wr1-x433.google.com with SMTP id 91so6655188wrj.7
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 10:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+QkLZuOghI2DHJFmXuvxiBRC9JmUjKAx8um2+RT8rQ4=;
 b=qeOpCDLQj6BChYJy8y1OHnefhpf3D+PUvS3kiCrWbK5/3nsgO3RsEUbv+ugHyY7Un0
 Bke8Q9Wy3tp1i7iQB/BXNlywf0hYphtLFA48ApdBTnKUD/r7P7eBZc9e86QMfyOL/6wP
 QCwWquokT848C38IOJ2JA8vPKUjstNKKiTLhdpn+fUH49zZ/fS5kNr1MUA8Jn0DgGDv8
 qbqj7yE1gEtiA1aFSkBi6KnipqYuo17IQG8SY8R/OtzHwHI9/uXmkQZ/Nu6g2nFa2idt
 z8aeXO1LOYabed6iG8Sypb0b0xMHvOFWlCcvP2JzUI3dkZEN0GElego3nSCYnH++xnWp
 E5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+QkLZuOghI2DHJFmXuvxiBRC9JmUjKAx8um2+RT8rQ4=;
 b=Mhn2zuCNk2gZABRIaL2BgQ736EH2/3zFIkBXTcZnmdy95a23a4lLbNB1PNHDWMQmiI
 1b7HDOWY0Cav2MqbC12QFc3xuKUh8gmOJtslyi/2cMnwHFmUm/BLvkP2xAszCfw3GsIz
 YjxvP8nlvuM4kzkroAVuf/KXc+sg4BFBRNPZxbzot2ohvL4pm5ciu11GnzFpCzOedQuF
 n7roekXQlPfD4KwGW2xC7yclcxajB6ZadgGkYvcnuGoe/n+otsTaYVWyG8RRBGRRILZf
 109MRMEwh7arJwPTVHrY2Fe3ea+H84uUGNChbt7gDfoQz4n3bBOoTjoZ5mJdtBx3TVFx
 iqYQ==
X-Gm-Message-State: AOAM5317wAfR4ylWD++WRADgm5fGghtDPnapv5vsa+ogdA+KFrr2bhR5
 qSmEOHV3AVNwX2Jys+6Nk+0=
X-Google-Smtp-Source: ABdhPJzNIg0oXSB5DMHPM6qMoFDPUGhz1f5wQwoYS3j7doJ9mlpgM+JoFuf9hviWe6OGGvrTNkI09A==
X-Received: by 2002:a05:6000:1152:: with SMTP id d18mr75928wrx.6.1610045325010; 
 Thu, 07 Jan 2021 10:48:45 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id i16sm9386688wrx.89.2021.01.07.10.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 10:48:44 -0800 (PST)
Subject: Re: [PATCH] docs/system: Remove deprecated 'fulong2e' machine alias
To: qemu-devel@nongnu.org
References: <20210106184602.3771551-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f6fd4521-be5b-adfe-a503-67542aa00f7d@amsat.org>
Date: Thu, 7 Jan 2021 19:48:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210106184602.3771551-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.267,
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
Cc: Thomas Huth <huth@tuxfamily.org>, libvir-list@redhat.com,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/21 7:46 PM, Philippe Mathieu-Daudé wrote:
> The 'fulong2e' machine alias has been marked as deprecated since
> QEMU v5.1 (commit c3a09ff68dd, the machine is renamed 'fuloong2e').
> Time to remove it now.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  docs/system/deprecated.rst       | 5 -----
>  docs/system/removed-features.rst | 5 +++++
>  hw/mips/fuloong2e.c              | 1 -
>  3 files changed, 5 insertions(+), 6 deletions(-)

Thanks, applied to mips-next.

