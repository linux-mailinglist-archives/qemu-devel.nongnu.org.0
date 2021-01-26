Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A30C304D5A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 00:48:50 +0100 (CET)
Received: from localhost ([::1]:53566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Y4n-0004Qy-08
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 18:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1l4Y3X-0003qy-08; Tue, 26 Jan 2021 18:47:31 -0500
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29]:40629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1l4Y3V-0006Zg-Im; Tue, 26 Jan 2021 18:47:30 -0500
Received: by mail-oo1-xc29.google.com with SMTP id v19so95277ooj.7;
 Tue, 26 Jan 2021 15:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z524uCdNJiuexUgo/lddzxbYC+CDUPtG+5QwreV1/oU=;
 b=aDz3Kp/1Wu09WRxDHHaCAP/9c60Cc4GD4Td3s9sVSLqg12IttLhytBIdBxSINEv67w
 vsNl0mmss/tcpoR9/Q73AuRyCDHFSCPekN6sCMR+9KUOWJng22f7iyDFI7z5itYRJumU
 DV7UWWjCsSR/DYzZOKV9MkJD0CcRFyHnVH/GzK0uFFIHwr7rhAh8LQNXVVFr1GIX4WAW
 NPkMVqt2UmB8vYAEhTW7IGRnjp8XenWQ0IZavL/hVmcH1GwkmY2r0NKMPn2id979mpPG
 +EPqG69rIX9iZ0AD4OzfJTWPKYEJgtZO43jfoDVZ5MSbKCvPN5E5XhTAffNfJURMWHmk
 epzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=Z524uCdNJiuexUgo/lddzxbYC+CDUPtG+5QwreV1/oU=;
 b=HVuSxmuuH/NCOPyox6yBxiz03B+zTPFIT4eofyq4ptbuGgCqd0Plc4irgbp9sZpkQF
 0wpKIyXIPv7SO2V8ZrXz77PIfx8AVTvdzraSg+ydn+h6V8N472Zz8QlEs/w22SDjJkgy
 VRPHNPbZeuvVUnRQUw+aoVaizPLMjRGuMQGHJ2voiiK9ovyhJrEx5IC1U+Fh5H2uHRwx
 rpPgzrVQz2j6ry5HCvE9UZyL2Y8pJIBFME368aFiNoxNyYqCyFuoWNaU5+h+Nh4SORCR
 xQFnc6nZrCPz9tpyvQ/XNCsPOOPZ/WZKMbDm3ic6WlVSMsQeOp4zCmhw2ODhkb8q6mY+
 Jy4g==
X-Gm-Message-State: AOAM5315Ln4MifKiJWDBto/WodhTv0BjV+b/xiFI0iBnn9sXEgsHHxen
 PteywsyGNFNm9vVQ8VltPg==
X-Google-Smtp-Source: ABdhPJwVABhuNBrxRL8N5Ih5ZnFm+UV0SA9Rw5sGfgtOMXQOd4/bdmPbRZnve3a5sizIqSq+vhTRjg==
X-Received: by 2002:a05:6820:255:: with SMTP id
 b21mr5742153ooe.0.1611704847954; 
 Tue, 26 Jan 2021 15:47:27 -0800 (PST)
Received: from serve.minyard.net ([47.184.170.156])
 by smtp.gmail.com with ESMTPSA id m9sm94611oih.35.2021.01.26.15.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 15:47:26 -0800 (PST)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:2d17:e42b:3add:fd])
 by serve.minyard.net (Postfix) with ESMTPSA id F34401801B2;
 Tue, 26 Jan 2021 23:47:25 +0000 (UTC)
Date: Tue, 26 Jan 2021 17:47:24 -0600
From: Corey Minyard <minyard@acm.org>
To: Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH 6/6] hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode
Message-ID: <20210126234724.GC2057975@minyard.net>
References: <20210126193237.1534208-1-wuhaotsh@google.com>
 <20210126193237.1534208-7-wuhaotsh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126193237.1534208-7-wuhaotsh@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=tcminyard@gmail.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Reply-To: minyard@acm.org
Cc: peter.maydell@linaro.org, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 26, 2021 at 11:32:37AM -0800, wuhaotsh--- via wrote:
> +
> +static void npcm7xx_smbus_read_byte_fifo(NPCM7xxSMBusState *s)
> +{
> +    uint8_t received_bytes = NPCM7XX_SMBRXF_STS_RX_BYTES(s->rxf_sts);
> +
> +    if (received_bytes == 0) {
> +        npcm7xx_smbus_recv_fifo(s);
> +        return;
> +    }
> +
> +    s->sda = s->rx_fifo[s->rx_cur];
> +    s->rx_cur = (s->rx_cur + 1u) % NPCM7XX_SMBUS_FIFO_SIZE;
> +    --s->rxf_sts;

This open-coded decrement seems a little risky.  Are you sure in every
case that s->rxf_sts > 0?  There's no way what's running in the VM can
game this and cause a buffer overrun?  One caller to this function seems
to protect against this, and another does not.

Other than this, I didn't see any issues with this patch.

-corey

