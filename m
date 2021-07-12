Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B924E3C4676
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 12:23:22 +0200 (CEST)
Received: from localhost ([::1]:52314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2t5t-00036F-MF
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 06:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2t54-0002Q1-Mm
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 06:22:30 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:56308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2t53-0006A8-2H
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 06:22:30 -0400
Received: by mail-wm1-x336.google.com with SMTP id j34so11034493wms.5
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 03:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b8b0QZT3xgaNXdz31jbzkopG7p0cTVaBNd9N9XeAeI0=;
 b=dAw4qhENFoMO/Ra3U7vkSEdmJCqiDK3o4i23RkqrbIy479jUMVdgqzCiqRG2oS/5wP
 xdysftg1tHyN22ccM/NzQn/E5Id3FvCjb54xjoDSIV32eQ7klNCWeGPYYQpxqBoRe2BU
 WcnxbZt+YFe5MtX/kMIAcbWfwTk++jo+WajmhpUF2anrm8WBEak+1Yj13HfdpcMouxMt
 u+mRW6n5OghpKdB/3lhSgKGTkOSdjs7Y09qAfCYuM3WnjJAR+b4ULKmNzwCmRIomRWlB
 MVzLIzZ+els5YCbVdt6a6gwtHjMisybdzlJzceflkWswpUr+/HS94QlDdJ7q3DbGcfTA
 v61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b8b0QZT3xgaNXdz31jbzkopG7p0cTVaBNd9N9XeAeI0=;
 b=Q/5wYMGM9pJ1Vc3gMezYlvLnd3Svftws8vtT2+GFz0MosBtYR3aSCUisfLKz6E0iKV
 ngXNRwjIgkxwblm6a9LoZJ7Xfk4+i7VSK7t+/LHSpzYswj0T2avGZL80rH+3JaVLIaiv
 IxeD/yIlXyhvlxx8e00BV+8+r//98HmglNh6kz8uAxH4V8pn8DsGXENdc7yX6rLSNayR
 K51FYqJ0oqQDwK03Ln9oYa8wPKruc70+QE3l9lUEp9Do8lr/d4/bTRUKG/dEVlhUm/0e
 vgCb0pi7ZqQqzXlckoQXg0OEFi6c7UHeJhVnWsiNlZcD8HbwXrXWL9tBpHh+zudGhY1W
 ZVSQ==
X-Gm-Message-State: AOAM533+7zjITmdlZMhC9PpRbvEjrH9J2j0gOlS61gu6Vd77md9zXPlU
 rxF4NW3eA3TQLCubAV/O3Co=
X-Google-Smtp-Source: ABdhPJxk/8iFEXCkdFfFArQ9KGWaQ0OCVHawoJ3hHxone4FWIJuPv75LVsXYEsMkcczLnVZdm2RD/A==
X-Received: by 2002:a05:600c:3786:: with SMTP id
 o6mr13560667wmr.155.1626085347108; 
 Mon, 12 Jul 2021 03:22:27 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id f5sm15027025wrg.67.2021.07.12.03.22.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 03:22:26 -0700 (PDT)
Subject: Re: [PULL 0/4] SD/MMC patches for 2021-07-11
To: qemu-devel@nongnu.org
References: <20210711211057.2714586-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d86892d0-1e38-5cc9-4bf2-6d0063beb715@amsat.org>
Date: Mon, 12 Jul 2021 12:22:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210711211057.2714586-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.631,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/11/21 11:10 PM, Philippe Mathieu-Daudé wrote:
> The following changes since commit 9516034d05a8c71ef157a59f525e4c4f7ed79827:
> 
>   Merge remote-tracking branch 'remotes/cminyard/tags/for-qemu-6.1-2' into staging (2021-07-11 14:32:49 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/philmd/qemu.git tags/sdmmc-20210711
> 
> for you to fetch changes up to a36cbb79763630837e7a73ae0d67aca210ebc791:
> 
>   hw/sd: sdhci: Enable 64-bit system bus capability in the default SD/MMC host controller (2021-07-11 23:02:51 +0200)
> 
> ----------------------------------------------------------------
> SD/MMC patches queue
> 
> - sdcard: Check for valid address range in SEND_WRITE_PROT (CMD30)
> - sdhci: Enable 64-bit system bus capability in default host controller
> 
> ----------------------------------------------------------------

Please disregard this pull request. I'm going to send another
one without the SDHCI patch.

