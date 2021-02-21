Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329D7320A83
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 14:22:06 +0100 (CET)
Received: from localhost ([::1]:60542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDogX-0005fK-8y
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 08:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDobh-0002sn-1C
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 08:17:05 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDobf-0002wx-C1
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 08:17:04 -0500
Received: by mail-wr1-x431.google.com with SMTP id 7so16194682wrz.0
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 05:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bF4dC05YebCjX2FMy0t9tqkJpS6DLCBqC7PsNFpdIqU=;
 b=ltUSA8EzQqH32b7itJ9LCRUss1ZkJknXp0jrDw/nwyPOiCf4gGssMfTI0jQt8ndBaq
 vSpArhTKZiV0EerimQzA3O7o4ino5AC7MmsvBwDAVQDmosAn2QIVWJvQWV7YXZ+iyJ2/
 LDCbWYGWVL5r/dnMx2q4h8bJMQ7Gwa2d2ydtKGJNy165UQq6ssFcMzRg3I6r5/X0SBwq
 1FZpbYi3+/zhUQMUHTOuQpwA/Qls/y+FUpUoP4oNtTvWkRHqYDcERop8L9d54jQr0dxK
 LzuhFWCv0qjYBblLFkb4flPzWPUpCwfB21vMrrE7ds52VA6dOc0YqLflz20c+e4i11gc
 pzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bF4dC05YebCjX2FMy0t9tqkJpS6DLCBqC7PsNFpdIqU=;
 b=h9YCClyBrQJvaPF5ev4pr1jV6QvzYrwUFDHSW1AdFADZyL+VxY66y7FO9LmrEWLMeA
 3VKceLmM1vDEcxp96Sf1b9BYlwtd1ZWPyU9HIY5hMMnjyPNWcw0UJcOJYnIf3l9dgiWA
 zyCCit7V0A9YmZUWiH0Hjikb7kU2iElKPzfPnL4ank9IJ65Ub8PwlUA9su0Xsx4C2qiG
 kM9H1bWEuKmAE09CtpVGfhX5HD/bluLhtjKQbEwDruBMJ5YO0XqafFQ2cC2O1YrO9cWZ
 qxvBhkV0kl9TMt9zVwpc4uSMqSKjgmTTJObt3i/Iw/FhiIbsJVf6V/O9EoyL9yOXN/2p
 HUaA==
X-Gm-Message-State: AOAM531Ui8mJetVuFbVD+KpP4wFPYKCe0XV5i+9BZftK2Yujleey+sRU
 yYiZDy+TrCAJXN5dh+/g8nBrOODhUeE=
X-Google-Smtp-Source: ABdhPJzCWMgbHQcp4mtONnWA9jq1d8JlURhWYtqMO7Kdfxzmv0FHcKPKau3ir2KbOLzg2N72YYZVAQ==
X-Received: by 2002:a5d:6448:: with SMTP id d8mr17579065wrw.401.1613913421957; 
 Sun, 21 Feb 2021 05:17:01 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g184sm22554188wmg.24.2021.02.21.05.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 05:17:01 -0800 (PST)
Subject: Re: [PATCH v3 0/4] MIPS Bootloader helper
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210127065424.114125-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8f9d92d0-be9f-6c5a-b53a-3fe1ed6d1f58@amsat.org>
Date: Sun, 21 Feb 2021 14:17:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210127065424.114125-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 7:54 AM, Jiaxun Yang wrote:
> v2:
> A big reconstruction. rewrite helpers with CPU feature and sepreate
> changesets.
> v3:
> respin
> 
> Jiaxun Yang (4):
>   hw/mips: Add a bootloader helper
>   hw/mips: Use bl_gen_kernel_jump to generate bootloaders
>   hw/mips/malta: Use bootloader helper to set BAR resgiters
>   hw/mips/boston: Use bootloader helper to set GCRs
> 
>  include/hw/mips/bootloader.h |  49 +++++++++++
>  hw/mips/bootloader.c         | 164 +++++++++++++++++++++++++++++++++++
>  hw/mips/boston.c             |  64 +++-----------
>  hw/mips/fuloong2e.c          |  28 +-----
>  hw/mips/malta.c              | 109 +++++++----------------
>  hw/mips/meson.build          |   2 +-
>  6 files changed, 260 insertions(+), 156 deletions(-)
>  create mode 100644 include/hw/mips/bootloader.h
>  create mode 100644 hw/mips/bootloader.c
> 

Thanks, except the malta part, applied to mips-next.

