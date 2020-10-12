Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9DA28B229
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 12:23:29 +0200 (CEST)
Received: from localhost ([::1]:42568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRuzI-0005KI-NJ
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 06:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRutA-0006R6-5u; Mon, 12 Oct 2020 06:17:08 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRut7-0004u1-8L; Mon, 12 Oct 2020 06:17:07 -0400
Received: by mail-wr1-x443.google.com with SMTP id e18so18496274wrw.9;
 Mon, 12 Oct 2020 03:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZcYpi53PoO5CUyx/N+Zpk6I5SsI3xUxsG1Oj6npBByk=;
 b=ciWzv/nuoIqxe708TEr26XgvzVTHzz0Cv9oShIMsfP/2/+RDZlm4CY2h4eMmGynGwX
 3JJBiLpLjvk/T1klmQMMaKZTGOGfbFAA/LfEtptY5VgwWBnCw4P+sVrya8BWJ7zsAuhh
 npo/c/L0fow6kXLmW8yThZw++69ykuHVfhUl5sogeKhAdtHudyiEzraoeKKATV/O0YVS
 axuUQhQnfe2OwwfXaO0so2b4rZwwi60v3WSROQ7P1XTrFkNa1mnkbp8P2FEZvEG8dqFG
 /Hfx4XqwtaUUUtediOAAKFl4uGJ+uWreOKq2YWbtbL3OqtGJlE9hqgFzmwsFbKoSB6mj
 IFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZcYpi53PoO5CUyx/N+Zpk6I5SsI3xUxsG1Oj6npBByk=;
 b=Zln3r0Io/nPv7q2clx8nZprGJvuArUENdWp341JOCV9rjHDJ5XjCi0ZmmAvUhxjdAk
 f0orLXMuD7dWzNDBAxRMCn7HdZlIXMRky20hVnY9V1x5yLfhK+DXUHGZCHCZAoePYWKS
 jmUXBHOodDMZsyiZB1S8zuJNEX6e7G6DmR3LwPUk32WTSBktIrqIRaCKZjMwgwRuvFdq
 NoXv99djrCcRwexclm0EFfRiiGakg+JnQ6X5taH/Lvg0spgx9kEfA9s21ti7RSpbUR2J
 hx8IHdfl0GO7ffmCrBG/Mi9kq1qKHfcALuVLKJhxaBCGjPBV34l8ytGUBFRt4uQxY7Nq
 mDaQ==
X-Gm-Message-State: AOAM531jTSRV96emtwoQBoS5qv+5e40LdmKttpTHGAQhv3pxugArx93G
 8kn0AvM7/NoxQA4RVj4PvkUHs9UkENk=
X-Google-Smtp-Source: ABdhPJzGnl5/C+pOGLimfM4krdiU44wYlepphuPwZcOQWs6PAYun1wEemoEoWWyU3V47fjTnnv1GZQ==
X-Received: by 2002:a5d:518b:: with SMTP id k11mr28391098wrv.369.1602497822808; 
 Mon, 12 Oct 2020 03:17:02 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id u63sm23305649wmb.13.2020.10.12.03.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 03:17:02 -0700 (PDT)
Subject: Re: [PATCH 1/3] hw/ssi/aspeed_smc: Rename max_slaves as max_devices
To: Kevin Wolf <kwolf@redhat.com>
References: <20201011210513.3253905-1-f4bug@amsat.org>
 <20201011210513.3253905-2-f4bug@amsat.org>
 <20201012100444.GB7777@merkur.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5b707ead-286c-4a1b-fc0a-4af934686475@amsat.org>
Date: Mon, 12 Oct 2020 12:17:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201012100444.GB7777@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/20 12:04 PM, Kevin Wolf wrote:
> Am 11.10.2020 um 23:05 hat Philippe Mathieu-DaudÃ© geschrieben:
>> From: Philippe Mathieu-DaudÃ© <philmd@redhat.com>
>>
>> In order to use inclusive terminology, rename max_slaves
>> as max_peripherals.
> 
> This is inconsistent with the subject line which talks about
> "max_devices".

Ah I missed that change, thanks.

