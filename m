Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE8469C656
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 09:13:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU1Hx-0001ia-4a; Mon, 20 Feb 2023 03:12:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU1Hq-0001iD-RO
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:12:39 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU1Ho-0001M5-Ti
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:12:38 -0500
Received: by mail-wr1-x42f.google.com with SMTP id o4so166438wrs.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 00:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BjA1H5coo8IdEGtvkkRoPTPzopK/LjqGl0GWz6hX1jg=;
 b=EKJNKWrHDcK+lTGZmRYrJ1cvzfIu2paQm4e54hRYH4dbBvOl910ynE7exzjzOHEFur
 i74YC7EVEmqI1RatFKqsiaXMfEgoWFK/nCNX8g0g2zKUUtugcmZOmmTIzoCwPvBEP49r
 lAtCNzN01J5pqKleREPVgaBOFIpYDaMIhU7kISz5rL/r+QUYtrBkRYLDO6BGYtuPIM1O
 RgY2cS/nYH661D5bcFnNwWB5HavYTbwzufYo0MJmNc+CMLDG4AZgJ59E990t3HB/9CTr
 4fdz8f/cz/A2icI8iCrKgaoKeFbE5h68rmQ4UWTodira7cww2B9IoBYRJJaNrECSSFAt
 Rmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BjA1H5coo8IdEGtvkkRoPTPzopK/LjqGl0GWz6hX1jg=;
 b=gT174L/8CttG87RRkmq2218GIn4Cj8ct1M1Zc1dXaCGUYUzxSJy1FRDX5ZIiV2luJj
 XFiZIfVI0eh4AqLU0yPT23muGnIoajRyk86YEBQ/Mt/aGK+4KIAA2iiz9R+qQieefJt9
 fV9wC89mmMZNmU2nNuzR8xx81uFErJrGKAYUo9XwZV0MlrLHXuotxi/vopmsmF6dRcyd
 iqrD2mK8WvnaKPTFZUxWq8vlgwK3P1ZvkvwZEIlPVNu5cNoT/xUzRNw1XuMD9qLHJgtv
 GC1IjiiWT3oF+ZC6Zdt0PTzGP68utadQtSHp1DPmqBd/f1eVWoCphU3qwIdy59qTE+KU
 Gy8Q==
X-Gm-Message-State: AO0yUKVLJI5dxq9IApkccnST1lhrnPRqhdHJPDHOpLlH48uqwtmhLiHQ
 NbK+ZQOyprTK2twQiV1is0xXFg==
X-Google-Smtp-Source: AK7set8TcshPFAwv9vVlVXZ5Y1hzfzDwta4G/Idnyp7plnkf9QmfrqsLv76FssXioe0DeKMCV8fkXQ==
X-Received: by 2002:a5d:5145:0:b0:2c5:6a99:1977 with SMTP id
 u5-20020a5d5145000000b002c56a991977mr1378658wrt.19.1676880755193; 
 Mon, 20 Feb 2023 00:12:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y5-20020a05600c364500b003e0015c8618sm9118789wmq.6.2023.02.20.00.12.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 00:12:34 -0800 (PST)
Message-ID: <e5446443-7ba6-0d6c-5ec7-e853ea03f71d@linaro.org>
Date: Mon, 20 Feb 2023 09:12:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] hw/ide/ahci: trace ncq write command as write instead of
 read
Content-Language: en-US
To: Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org
Cc: jsnow@redhat.com, qemu-block@nongnu.org
References: <20230217103130.42077-1-f.ebner@proxmox.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230217103130.42077-1-f.ebner@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 17/2/23 11:31, Fiona Ebner wrote:
> Fixes: e4baa9f00b ("AHCI: Replace DPRINTF with trace-events")
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> ---
> 
> Or should it be sorted alphabetically below execute_ncq_command_unsup?
> I felt read and write belong close together and this reflects the
> positions in the code.
> 
>   hw/ide/ahci.c       | 4 ++--
>   hw/ide/trace-events | 1 +
>   2 files changed, 3 insertions(+), 2 deletions(-)

> diff --git a/hw/ide/trace-events b/hw/ide/trace-events
> index 15d7921f15..5ef344ae73 100644
> --- a/hw/ide/trace-events
> +++ b/hw/ide/trace-events
> @@ -91,6 +91,7 @@ ahci_populate_sglist_short_map(void *s, int port) "ahci(%p)[%d]: mapped less tha
>   ahci_populate_sglist_bad_offset(void *s, int port, int off_idx, int64_t off_pos) "ahci(%p)[%d]: Incorrect offset! off_idx: %d, off_pos: %"PRId64
>   ncq_finish(void *s, int port, uint8_t tag) "ahci(%p)[%d][tag:%d]: NCQ transfer finished"
>   execute_ncq_command_read(void *s, int port, uint8_t tag, int count, int64_t lba) "ahci(%p)[%d][tag:%d]: NCQ reading %d sectors from LBA %"PRId64
> +execute_ncq_command_write(void *s, int port, uint8_t tag, int count, int64_t lba) "ahci(%p)[%d][tag:%d]: NCQ writing %d sectors to LBA %"PRId64

Note that ideally the tag format should be '%u' (pre-existing).

I'll carry this patch along with other QDev IDE patches I plan to merge
(with John's blessing).

Thanks,

Phil.

