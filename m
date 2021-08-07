Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8113E3401
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 10:01:42 +0200 (CEST)
Received: from localhost ([::1]:44300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCHH2-0005kJ-Em
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 04:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCHF9-0004SG-Q0; Sat, 07 Aug 2021 03:59:43 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCHF8-0001yo-Be; Sat, 07 Aug 2021 03:59:43 -0400
Received: by mail-wr1-x431.google.com with SMTP id h13so14075341wrp.1;
 Sat, 07 Aug 2021 00:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QLiv8i5t0PRA2lFWUtHsI2WYPqf9Azi2kSZ1aVvvnDc=;
 b=LtUOeM9K5Ul/gv3Z/Ao7rn1HRcRuxpbefjaBNk2JGTYQzDdK0/zU5fVLPDMdFnnm2r
 BTGOZpf3ds3XziH2m/PsHB71p5YLQ6fkpDTS6uWt4U2kLsIDP7elk1lgpBt05uYV7LHK
 bYLdbBkJAV49E4W6IqjKQz183DUThMuuVgWKV/uwRL5dMEJzTEbLW9IiLqVIdE4jeL4X
 rbVglor/CHAd0QJ+KbMRNhcJmNA8/mwZ40dgsbfWPHPdmB2gR9lz0mrGqF9RwJf4Smy5
 ZECTgtbBhv1Ka8r8v7v6PxLal7i5gFqUHE6APEHlSmv9q11U+1gZYYuqBbzmWkHAax3f
 rsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QLiv8i5t0PRA2lFWUtHsI2WYPqf9Azi2kSZ1aVvvnDc=;
 b=Q5W5Z1elqylrxYxdgLp6UvFsfTkZqVdTYQGLtw1CFnwoiClzJwWq1lPRA1Ld2UuaY5
 x2HJccP9SQr4ziBRn1fGB2E/tZvOuKA9ppmSwKAkPJRRZ3YR8oy8TyMAndDb9pQ3VmcK
 yUpxFVq/YooAdmdLhAsEzIfJwMLh41tTJGNNyc/7DnItEaNZPKAh3/7yZf3WSV9jeffs
 4NicBdaCWiptYYzYEWfsbRD0omh+6NMKVJ/CtLFOIplys75SpHOP3mICxYdMBD50AIcK
 NPzjuISXb1ntUGGnjfwIm+gosNqM0hpj0Z8WiOqgHImay9BzpVSGC+LXfYuT1k1IcDcy
 G35w==
X-Gm-Message-State: AOAM531sU4FEf1japM0876PrNUKKbDApfqkFL3IWQ+kXB8KuT43yKm83
 bMuCQZXWrWpRS0XLu6Mh63E=
X-Google-Smtp-Source: ABdhPJy1COytHIavx7HiBABsbpVTXnDCPbf13kfVHv06x+YI8NyrU34O3vvGshwSscuzCrz7Bvzeeg==
X-Received: by 2002:adf:d085:: with SMTP id y5mr14532341wrh.272.1628323180460; 
 Sat, 07 Aug 2021 00:59:40 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id t17sm11833980wru.94.2021.08.07.00.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 00:59:39 -0700 (PDT)
Subject: Re: [PATCH for-6.2 08/12] npcm7xx_clk: Use DECLARE_INSTANCE_CHECKER
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20210806211127.646908-1-ehabkost@redhat.com>
 <20210806211127.646908-9-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6e3a1c96-b85b-17e5-965f-e29405641809@amsat.org>
Date: Sat, 7 Aug 2021 09:59:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806211127.646908-9-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.619,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/6/21 11:11 PM, Eduardo Habkost wrote:
> Use DECLARE_INSTANCE_CHECKER instead of defining the
> NPCM7XX_CLOCK_PLL, NPCM7XX_CLOCK_SEL, and NPCM7XX_CLOCK_DIVIDER
> macros manually.
> 
> These changes had to be done manually because the codeconverter
> script isn't smart enough to figure out that the typedefs exist
> in a separate header.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Havard Skinnemoen <hskinnemoen@google.com>
> Cc: Tyrone Ting <kfting@nuvoton.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/misc/npcm7xx_clk.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

