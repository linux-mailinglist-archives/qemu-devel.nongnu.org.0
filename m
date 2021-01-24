Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C27A301E46
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 19:58:52 +0100 (CET)
Received: from localhost ([::1]:51738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3kb5-000789-49
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 13:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3kZq-0006bl-H5; Sun, 24 Jan 2021 13:57:34 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3kZo-0002NR-LH; Sun, 24 Jan 2021 13:57:33 -0500
Received: by mail-wm1-x32b.google.com with SMTP id c128so8860801wme.2;
 Sun, 24 Jan 2021 10:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0ri+gYqyhnQxCFXuaLJzEKBf79vs92mdalKFQrBekyU=;
 b=KxvXZBM9QB/U0vGQc680xfwUu43rNh/2fbIyiN2qVSonFm+21YB/qhd21lY1FUPcXK
 SRrqoMpf5e+GXy5D4FVnVDYB5DefoxHD7MP9zWPotSQ7x+Hk20J9PNz3zEjxC33Yn2l4
 58bkRlbXS1WhmKcRMDdUpKmm21syQDc3trkC6t5GYzSroNCQApcsYlX5DqLmRfzP1VGa
 jK73pYmzE32ZDAzrfJnS9KVtlB9vm2IzRdWkMHhu4K5fP4wmL1Tt/0VmrasWtrmoLE8E
 axes6Oh2KwYFHmqliXo9ahPjAt2EPOIpschHacGsu95A0cdXurRxxFcJNS6BgNUMDsQK
 Kt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ri+gYqyhnQxCFXuaLJzEKBf79vs92mdalKFQrBekyU=;
 b=GOie8TdI5ugxJPTZ+ULE304l8swr23K7gNw+Mc+wSlfhz5MuHPtrNZW7gU6DmXuqdL
 qD1eGjyTDBdyaM9mmfohj6uCSdlLuWGVVt7MtGSe0KaStxHFo14kC/9+Lo65yhWUKbMp
 1lmh9i2HTiaelFpE+mOjzibnUqSjsAvRn5ZKSPMUI727EzfyIrMO9NgdyxTAMxbHs9Jy
 sEErciq3U4VAjChbHU4OJqHSYK5OH9mAfOSZY/9hNLiOXvG9HaVC1QWJZkRVG0UHTo5/
 nTGVpbOm/uHbuf9yOHrQ1q1kLr4C1N7A4LtSB5fmC4g5qPHTilj1l7Oay6A9FtLRtx64
 6osg==
X-Gm-Message-State: AOAM532RSH9GSqM+0QtKbhIfDSgDzCfP5OEFte1gif8i44ku1tiJJuLt
 S/MJh3LAJhSu6Q3lhwSyRA0=
X-Google-Smtp-Source: ABdhPJxySf5xGQKj9479DGmHphyVaPNNjDcUgCU5wk9RJsLSVtfcsiUfFzxpOf2AFRm2BRNR3D+cSA==
X-Received: by 2002:a1c:a90f:: with SMTP id s15mr1089249wme.154.1611514650558; 
 Sun, 24 Jan 2021 10:57:30 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b133sm19586555wme.33.2021.01.24.10.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 10:57:29 -0800 (PST)
Subject: Re: [PATCH v2 07/25] hw/sd: ssi-sd: Suffix a data block with CRC16
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-8-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <895ef987-1d6c-a2a1-4f1b-e3ec680a7117@amsat.org>
Date: Sun, 24 Jan 2021 19:57:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210123104016.17485-8-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/21 11:39 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Per the SD spec, a valid data block is suffixed with a 16-bit CRC
> generated by the standard CCITT polynomial x16+x12+x5+1. This part
> is currently missing in the ssi-sd state machine. Without it, all
> data block transfer fails in guest software because the expected
> CRC16 is missing on the data out line.
> 
> Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> 
> (no changes since v1)
> 
>  hw/sd/ssi-sd.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Bumping migration version:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

