Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129422CFB88
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 15:19:34 +0100 (CET)
Received: from localhost ([::1]:36236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klYPL-0000vr-Ov
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 09:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klYO0-0000NO-FF
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 09:18:08 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:46879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klYNy-0001uQ-IR
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 09:18:07 -0500
Received: by mail-ed1-x541.google.com with SMTP id b73so8852933edf.13
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 06:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XOXKNllMyG/B5Y15ZpPDro/Cl41ZpR9zzfuA3QrDbIw=;
 b=FeODeVT2H1cf+qL7xI6dEWWXpGV/FUw848N1Y6FbsG7/kmd643UkfGeyZbaVJVnrJa
 PMxeL3xI+Hb92aexMcLG+wrk+e+vuccFFzIbVDXjuOopyXkGshRq19w450wbwsGQJ7xh
 tjnlLYm8BcQMzI+iqEQVKNKdnI26/6UjnOfzlkyIlD01jFFbuDRbly4qfDiZ0Ev+PG1i
 UAb/NcFPNoiySb0w59Gm6F85lrrLrlJDAcLcnWSxPJi6r80WkWVrevFomNiNnvYwmFVY
 iXD0mgd0jYV+XN1KxwtsQ2zmDqA8EHnPsEd0KfbYZ1cUrPduXK219D1Dr56YbNCV5Q2o
 17yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XOXKNllMyG/B5Y15ZpPDro/Cl41ZpR9zzfuA3QrDbIw=;
 b=nK0xzYIKpbTTMdxPFp8is27+QOH2KAYIrNB4GKTcKSGaFF5j87Z0lX2Rgs6rdS6Bam
 uiUKKBbuNk8ndDVN5sDuQ14OyxjNDgNt1HjdQqMoJ5DQvavLLxM0Ys4mdgMVIDzoL/A5
 O9a11X7KsSBnEs7PSc7QXXfChudCJsA9lUH1jbLom905uouSn8xB9zWf4mHngLK7XIaq
 piga26JhilGSrnvMv37bE1vk1FIiX0wUo3RvIcqvKq4kEO8H0hP2Od5ujz7h7GlwWrxC
 wQHhs/0qpWmErb4LvNrBOmZKlfRG4jhNTtuRQZZOwbh8jVnlBfxvljAJ+sLB7dkTnGGi
 wrKA==
X-Gm-Message-State: AOAM530ciLv3h7H/wn9X+68BDTTb9pdNC89P4PzQ6chcTpKRR1nZdqBr
 DjM582/6JSZZCdmt/RXKHsA=
X-Google-Smtp-Source: ABdhPJzjswGAUk6SklbzEALhYAOgRtztvQKXdQLcxPtWIVjSmCg/vLupNpMefvADSjXtYckUsi25sA==
X-Received: by 2002:a05:6402:d09:: with SMTP id
 eb9mr12006865edb.71.1607177884098; 
 Sat, 05 Dec 2020 06:18:04 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id ov22sm5414254ejb.23.2020.12.05.06.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 06:18:03 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: chenhc@lemote.com -> chenhuacai@kernel.org
To: Huacai Chen <zltjiangshi@gmail.com>
References: <1607160121-9977-1-git-send-email-chenhuacai@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fdc553b5-af0b-1705-7f33-a7fd2d524fb5@amsat.org>
Date: Sat, 5 Dec 2020 15:18:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1607160121-9977-1-git-send-email-chenhuacai@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x541.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/5/20 10:22 AM, Huacai Chen wrote:
> Use @kernel.org address as the main communications end point. Update the
> corresponding M-entries and .mailmap (for git shortlog translation).
> 
> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> ---
>  .mailmap    | 2 ++
>  MAINTAINERS | 8 ++++----
>  2 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

