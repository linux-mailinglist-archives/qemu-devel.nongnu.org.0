Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1062F407DDC
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 17:11:13 +0200 (CEST)
Received: from localhost ([::1]:54750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPR8R-0006ZP-Kl
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 11:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPR6m-0005tg-At
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:09:28 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPR6k-0005bk-Mi
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:09:28 -0400
Received: by mail-wr1-x432.google.com with SMTP id d21so2855707wra.12
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VAEY9rvLJAceM2Vq8lJoRFBd3eF0ilMcE+1/NFR9QZ4=;
 b=dk6cxbyx+0VCEE4TKhCYMOVYF+jMuuaPW0w0/m6Q91kTvMDqMVkrkxCoFQecOQJhjc
 xq7Xl9WdVCEwrH3qNzRtHrrYj/c0a87bq3yM0sWR6TemNiwdOJjxxTGuxFWtgjnxZ0Cz
 7xC/vBbWETWAbiBvdupbhrAu4IdUkY9uvuYT3RrIPa72XJ7ERDPoyEgIo7IKoLcEg1gM
 q3/441cn6UMGm2pYZn3MmTBH+XvD3YvpvB+U6dbwkAgqhuBX9OiABqngiE8MSDNxdkv8
 HsCBLsakfnPl4OZk5Tw6OwtVuUDuK7Schc1LwRV6OBCe8UVkUiuduGIng6A621caMSGZ
 FzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VAEY9rvLJAceM2Vq8lJoRFBd3eF0ilMcE+1/NFR9QZ4=;
 b=TIi+pNEyyWEmxyCbs3maVGZC+GADezN00Th+3I0cZhLmpO1Sxe337y47Y+kVFbViSo
 vmCy9Bz2oWxJu19sgrLb/FJ9rnlLN1cISZbiINaUPJH9gQijUinshwoUWIFm2F/C2bPb
 jABIDtQTjEHFUpa1vlH0etiOL2Y+M4GVECGpgv6fpRVw96CukSsWrO+bKOySUhdd/U9a
 MqxLiiuf5nLnp7Vx1e54wIujDSdRmhYIqha3rLHmEZzKEXhNTzmK/bAzsYnQETaluhGR
 3H3sdDtEQlspqNAXdiTT8uL1wddlY0q4CtMSuxCbt5b5PZstjtEN2C7Mg09KsKa0Qqx8
 kdIg==
X-Gm-Message-State: AOAM530fCzyCbLyk8oGB6O3WxLZRuzU+sFlvBsJCuEj7Y8jeFW1+jhFj
 YOqfwq/ywLjhSWneg2WE330=
X-Google-Smtp-Source: ABdhPJyfOYLnjhaS+LD3rQc56nFbKB0IF2ftKETAf1TQhr++cCBYXXLZGY+jgx/JJzaL0qCuARs7CA==
X-Received: by 2002:adf:c184:: with SMTP id x4mr7931975wre.266.1631459365115; 
 Sun, 12 Sep 2021 08:09:25 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id s24sm4247156wmh.34.2021.09.12.08.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 08:09:24 -0700 (PDT)
Subject: Re: [PATCH 01/20] nubus-device: rename slot_nb variable to slot
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-2-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <aa4f7cfd-8817-b538-d794-c138e6ca7022@amsat.org>
Date: Sun, 12 Sep 2021 17:09:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912074914.22048-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.584,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mark,

On 9/12/21 9:48 AM, Mark Cave-Ayland wrote:
> This is in preparation for creating a qdev property of the same name.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-device.c  | 14 +++++++-------
>  include/hw/nubus/nubus.h |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)

I suppose you are on a new setup. Consider re-adding
scripts/git.orderfile ;)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

