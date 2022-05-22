Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA4C530687
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 00:24:23 +0200 (CEST)
Received: from localhost ([::1]:45750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nstzW-0000M0-5U
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 18:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nstyQ-0007wj-T8; Sun, 22 May 2022 18:22:54 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:44823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nstyI-00055D-Rv; Sun, 22 May 2022 18:22:53 -0400
Received: by mail-pl1-x636.google.com with SMTP id q4so11529765plr.11;
 Sun, 22 May 2022 15:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h9uGHw/2QJC05+meai4sit5HDdWT9EtwfGrc8QJ0kKs=;
 b=W2Uln1QAj6fJUdpcoWGSMi57ga6HFPnscqBQqelTMaqMf0T3IvvK9ro2uMHjWBxc+C
 qJluf8GPnX3nFMrwBvD30H2yuOBp83+OJkpabtEjqXY50SJm1CGm8F9elVnAwhst31b3
 LAN+pIDI0dN0jbtilfWISsQhXGijvvE7l91eajYXtwweRbfMshmUB23NlyXSxCB1nUnf
 dWO4H+vA+71GdUEV42oiZ2lM0d+yP5QH1AbVdR//vPB5EIZC/a9IViRrvp1pMFs8gQKu
 puJH5u+0NWdMAArJaBg8hqx2e0h27SeKeuOyrP/c8BkDHq9Wb6slXtLIatDcjhfwmSxe
 /JoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h9uGHw/2QJC05+meai4sit5HDdWT9EtwfGrc8QJ0kKs=;
 b=PDC5T2xLWryBg1ojHv/IZMKfEcvbupuDSECTMEuRg5UBhpagvKRgjEktIgx2PJVHzR
 VE2HDqtfhYbpj61BV0dRbncASIAeOax8P6E/fcrM+MeK09GqFOwpEjNps51gWk5XYmJH
 pRaMZsMhd9B0HBWq2reLBz2xvHjyXfMxJzjlx1s2oOCy28rat9h/2pXw5W/UzlibuC6U
 9G3zXH0S7oEjPfV/GkI84x2h7uJI/tWoOBKF9MG/7QyF0mzuQuYIwnRUePhwgbX1GvpD
 1cVTzOfgDq5yV8HXJKEd+ymAtf0zal45O2Dw5/1RVD2Q1K6zhg+crKa+E+/EUZGxd3b+
 pDBg==
X-Gm-Message-State: AOAM532uDMbBoM08Qc00reXo8IUQP+W+70fAbWw9hvtQ5az+o9xX+ZT6
 PgbkpLPaYwsi6LefFHgR8Mg=
X-Google-Smtp-Source: ABdhPJwaesH/HDvE15pcUPC7iQy0GoP5LPbp38SIIM6Y8V1RK3HvizeKOAX8l8IrvbofM25jPkoRlg==
X-Received: by 2002:a17:902:e3d4:b0:162:23a7:a7e7 with SMTP id
 r20-20020a170902e3d400b0016223a7a7e7mr2699495ple.32.1653258149761; 
 Sun, 22 May 2022 15:22:29 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 mp11-20020a17090b190b00b001d96bc27a57sm5571903pjb.54.2022.05.22.15.22.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 May 2022 15:22:29 -0700 (PDT)
Message-ID: <b3c11eaa-7549-1695-6987-c181141c576f@amsat.org>
Date: Mon, 23 May 2022 00:22:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 09/50] ps2: remove duplicate setting of scancode_set in
 ps2_kbd_init()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-10-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-10-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 22/5/22 20:17, Mark Cave-Ayland wrote:
> The default value for scancode_set is already set in ps2_reset() so there is no

ps2_reset -> ps2_reset_keyboard ?

> need to duplicate this in ps2_kbd_init().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/input/ps2.c | 1 -
>   1 file changed, 1 deletion(-)

