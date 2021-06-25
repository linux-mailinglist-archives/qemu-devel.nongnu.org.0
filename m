Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0813B3FC0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:49:59 +0200 (CEST)
Received: from localhost ([::1]:38130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhXC-0005Yz-T3
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwhUl-0003Av-TU
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:47:27 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwhUk-00073B-IE
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:47:27 -0400
Received: by mail-wr1-x429.google.com with SMTP id a13so9685038wrf.10
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 01:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DDIVzvjZkLQrqRd0cvtg8LVZj69OCTB0XlH4H9RH2mg=;
 b=eC+JqYlwQq2zATyoHxv+2fRhLNvKXtcuxSD8xh9L5U9OOBXOBsx/zQv2NQjIb2UdE6
 qVYQcQs4C25pt7e8J93J7QO6sNSn70Pd3q0zrAAWcllsTYQn+xkLlAu0VVtKCuuULCSZ
 0gP6LnJzqgH5L6CYC/HHDvWWpRMXymiBMklAyxxMLpp3NNY/xCssLnEPPrh2CoSSe4A0
 lLMWRmrq09cHA1Ay0a/WHdEQcHEBHKh0eV8Ckdrv9/vYWriUHMqkyKGsrcaSpYf4+Azv
 XZeTXfi3o6EvMBPXZ6n3NQ2UDaDgxJFJ8k4wjsSlAeDL5UcrDI6xcfrTZ1L0BpxMhZxs
 wUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DDIVzvjZkLQrqRd0cvtg8LVZj69OCTB0XlH4H9RH2mg=;
 b=aI46F4vGS+sCJmtX4Zvu2GVZTaKVVJVP9D7+i0X/gzSUJFiNNLXbqD6VSjIQt9Ooo2
 zDxuHM9qcnHO/EWh01UsqtNfw+QW/qLeWfwJYu8iq9UnHeNOJkCed1LcWMQBJ8hYzQAH
 z7ZTrh0aex91j8h7hJfnZKu95oVFcKdSyDkM0IpcwH344xvtGFbg/8GXNXFGmQWUI/oo
 Xzy9znR9glv13jRBDRNHGpTDjk3jvV2wFO4ztahJykUL3ZxZAddcTPCQSHwNDapCzSfc
 kJkd/B5vi4Fby0GR+fFTzHGQkzdkjdG7AF+MhFkENtXX8BDGrihylxY6KbBp50xDf7Bo
 3FZw==
X-Gm-Message-State: AOAM530zPs3wXPNU9wtK0FZPMhAviJsAI+SYKhmWnKG5zDkh61KTwycX
 95z3sXtPhxddi65OPo+XpmI=
X-Google-Smtp-Source: ABdhPJz8v5Ykc0JYoAYaBU7LjMs1CeL1cXbG4gsuxrtSwUEdt65i7QnqPeo3+IFWekUsuAddhXOO2A==
X-Received: by 2002:adf:e10c:: with SMTP id t12mr240191wrz.36.1624610844957;
 Fri, 25 Jun 2021 01:47:24 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s1sm11081384wmj.8.2021.06.25.01.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:47:24 -0700 (PDT)
Subject: Re: [PATCH v2 02/10] dp8393x: convert to trace-events
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, jasowang@redhat.com, fthain@telegraphics.com.au,
 laurent@vivier.eu
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
 <20210625065401.30170-3-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d9205884-2b9b-dadb-5a8c-76c70c0cf216@amsat.org>
Date: Fri, 25 Jun 2021 10:47:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625065401.30170-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 8:53 AM, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/net/dp8393x.c    | 55 +++++++++++++++++----------------------------
>  hw/net/trace-events | 17 ++++++++++++++
>  2 files changed, 37 insertions(+), 35 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

