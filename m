Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1CC4640D0
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 22:55:54 +0100 (CET)
Received: from localhost ([::1]:36616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msB6O-0004xj-Ir
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 16:55:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msB5E-0003w2-US
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 16:54:41 -0500
Received: from [2a00:1450:4864:20::333] (port=44861
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msB5A-0000CU-Rh
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 16:54:38 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so15800147wms.3
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 13:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z0yB7MPv5A7cxZNr7kn2J27FDGVqeqEoREr8z4D/pIc=;
 b=XUIiwpO4YLv3ojHLoW2VgngX31kdBJj0UXbS9tQ7inRvsDnMXhB5FH2c+Vms2HiaMH
 Nj7tr3K5BTyMY77VJkducXMOG3ySMYEPqH/Chc8k27S177sEPa2+Cz3zsEYZXeTrXJ54
 Spe2iTWyU9saLRCuaDgYzPEu1CGZDQobP1c932h+YIZ4KdPiobJ3NKO1bTe6j3GggPN8
 VLFoDh2wIBb86Kab0ZFOtfeuhlA38Z9LbbgRxJtpDx444MhCrZJnFSj9ew08KFeupj7D
 ReBRP5GTtQrWu0gC+Mu9J8U31JUV7M9jdZSR48RhEaSuAvBaZbcdpbNKMk8mZzUhzwxR
 JrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z0yB7MPv5A7cxZNr7kn2J27FDGVqeqEoREr8z4D/pIc=;
 b=imjmLJLQeppJ8tUOSV0vIvhlWmM/D8XdnvkU6Bpr+i6z7fXRw/Fsw7tSjL8gNmGsYp
 R/NId4XTw4So55FDH1SSXHXQpKKSS/p3Q9Ri4GITOqYnnKo505mxrM0dbxt9n9bX743g
 vdpCKcuxjkgcgDdbHmppsQofZiivxPKFh9goNtcoxKGwMpVrWT2ckbR2LtedQtqb3PjC
 CSomD7yKItGtYBDAbni0LIV6tHPugW1Xx9KAtSAkianURHqIRWFW9ha2wk4MZ+YiCShQ
 v5c9jlKSiN4MiVNZrXjFakrvAjLU5MGrr/DjXulzYi+LwnqWwlMrYBbVvcjSu/I9FsLw
 lzBA==
X-Gm-Message-State: AOAM531zO8/EfR8iUxGp6PzUqK3r5I5hhM3IW0Y1mHoi/ZG/JTGNmIQ7
 60E3BUosu2TbOOKmQJDz1ol976pfWDHANQ==
X-Google-Smtp-Source: ABdhPJwQ5DMx7YZbDkaW9T+WGDlFme9VHdnX7yNYDqHnGf4d+KYNwe0zIOGE3XWpStTjhl1eP7FVLg==
X-Received: by 2002:a1c:7e41:: with SMTP id z62mr1814219wmc.62.1638309275065; 
 Tue, 30 Nov 2021 13:54:35 -0800 (PST)
Received: from [192.168.1.34] (abayonne-654-1-79-213.w86-222.abo.wanadoo.fr.
 [86.222.222.213])
 by smtp.gmail.com with ESMTPSA id p13sm3558770wmi.0.2021.11.30.13.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 13:54:34 -0800 (PST)
Message-ID: <942d7a81-440a-adf7-14a8-fa0410cb4c99@amsat.org>
Date: Tue, 30 Nov 2021 22:54:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/2] hw/mips/boston: Fix load_elf error detection
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20211130211729.7116-1-jiaxun.yang@flygoat.com>
 <20211130211729.7116-3-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211130211729.7116-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.211,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/21 22:17, Jiaxun Yang wrote:
> load_elf gives negative return in case of error, not zero.
> 
> Fixes: 10e3f30 ("hw/mips/boston: Allow loading elf kernel and dtb")
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> For 6.2.
> ---
>  hw/mips/boston.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

