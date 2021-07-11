Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D423C3F31
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 22:31:58 +0200 (CEST)
Received: from localhost ([::1]:35738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2g7J-0000RB-SZ
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 16:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2g3l-0004xT-9x
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 16:28:17 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2g3j-0003AR-Kt
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 16:28:17 -0400
Received: by mail-wr1-x430.google.com with SMTP id g16so12060756wrw.5
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 13:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6hP0EfbUQcC8PaBvpy7HEIFv/kWBuFPbf81A2JTimrU=;
 b=GJVHQWgE7iEQIyKeRrJQ55jykYNKKoxgW/brLTxb69kXSTyn7FyPWQno+L5am7idiF
 F059os6yQ6YxFFMnU7Z3t37cnOcCkPIvcY+W6k2h8rp3GfgBKbOyqApP6QSqpINtTLi8
 8A8qnntV7EgfDp/HLgmWK4B3eVDceq7zScGCkWi0XqqKm6ac9XXFo/yG/VD0WW9gsidI
 UUSi3u6bXpovzCDV9yesIE3l6Dn2sS4TAbIvC57fiN6saukRDwG7VlDQWbMILX71UlsS
 OZopiHg6BTqEiy4sUfxwclbXOWW9KZxNNVwYLhUGoIwclaS4wAUxgq6OgPLPaotrR5nD
 D69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6hP0EfbUQcC8PaBvpy7HEIFv/kWBuFPbf81A2JTimrU=;
 b=RQfb5GwGKWhCpoGJHCx4oazbolQkq7MO6D9ApP+5Mpd0FtY9SD/sCYMaGS2AVOuXmk
 VBC6KM8wJmc+Yrm+8t1/+gm2o9Tp8gp7/WPjkPAWyaqh5JfBdZfy+EXsD9lu5myvt+zR
 jqX/t48O5qJCsnHkVTssCtL2T20QjGVF+cR8o8+uCBe+OU4DWUNdjXdVpi9RC/C+yS/s
 9U2l0T3R62885obSxCZ8LY3q7KLIpg5EX7g9IQJv6sB4nlEnFbdBk7uERLajyhuaAKfN
 vMsPo8WhlZZW88lm7YnIQ4v/+JjutibAm9KvVq1FFFgkDR3qljkn9DqH/3KeEu2E0m5s
 qzWQ==
X-Gm-Message-State: AOAM531I9Zmj1ob4f8Y6DFIFZI/YrA+xYpfC5EDtHp9XE2cVocDVnn0T
 8sCqJPSK2wfbZD4iJhNO5YQ=
X-Google-Smtp-Source: ABdhPJyH2I6JOF1T2DDNtLYv+7Q87rj3tehOCkI78hYk+qN1uwJ2sT5XKkcBi7Z/gQOnbBysvGkiCw==
X-Received: by 2002:a5d:6b8d:: with SMTP id n13mr24796400wrx.258.1626035294313; 
 Sun, 11 Jul 2021 13:28:14 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id z13sm12681651wro.79.2021.07.11.13.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jul 2021 13:28:13 -0700 (PDT)
Subject: Re: [PATCH v4 0/5] dp8393x: fixes and improvements
To: qemu-devel@nongnu.org
References: <20210711103612.2661521-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e5abac9d-e6df-2774-7ba9-596ba729c591@amsat.org>
Date: Sun, 11 Jul 2021 22:28:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210711103612.2661521-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/11/21 12:36 PM, Philippe Mathieu-Daudé wrote:
> Hi Mark,
> 
> This should be the last respin.
> 
> Since v3:
> - dropped worrying patches
> - squashed migration patch
> - added tags
> 
> Patch #3 (dp8393x: Store CAM registers as 16-bit) still
> misses your S-o-b tag.
> 
> Based-on mips-next.
> 
> Mark Cave-Ayland (1):
>   dp8393x: don't force 32-bit register access
> 
> Philippe Mathieu-Daudé (4):
>   dp8393x: Replace address_space_rw(is_write=1) by address_space_write()
>   dp8393x: Replace 0x40 magic value by SONIC_REG16_COUNT definition
>   dp8393x: Store CAM registers as 16-bit
>   dp8393x: Rewrite dp8393x_get() / dp8393x_put()

Series applied to mips-next.

