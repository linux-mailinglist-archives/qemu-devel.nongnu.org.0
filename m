Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB5E5BBFF4
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 22:55:20 +0200 (CEST)
Received: from localhost ([::1]:44934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa1Jv-0006uO-WB
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 16:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oa1G5-0008KO-Ng; Sun, 18 Sep 2022 16:51:21 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:38677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oa1G4-000086-9E; Sun, 18 Sep 2022 16:51:21 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so4998214pjq.3; 
 Sun, 18 Sep 2022 13:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=aMGxKYBdjOX1zgkZGTHzBeoLbaeVzse+kIwUoXZM8qA=;
 b=Z1ILPRE5sH7qNJgeqr4PHWiocZvMVnfmDrCPOJcmedpKpH4ermh5RzdN8RopFcbFdN
 KwYwC9ex2K4dNDauiESsMiGnz9fxt1IBKlXzj+/SCoPC3zkQYIvcwgEIsb7D/E4yHl94
 sC1dpoL4+Npnuxhg6F/sdjV3cuSKVpbtNNBHg5SEiRnbtmOTO3c6XTMJyCe6rFaCxQOQ
 FFuH1VT85wbx4Ms+AS85wDtG8zPffn+mBnrscAPBc5aYHQ8YRX7E/HF52xP6qfxv//pV
 rksrTJemXT+RU8ZnxM9qEbExzfm5iDpBG8dLKUlK9wOE7FV+G07PMs82bblmqxvHU7dX
 U2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=aMGxKYBdjOX1zgkZGTHzBeoLbaeVzse+kIwUoXZM8qA=;
 b=dS2Vp9/CybfyRroNm9Jl8kTS7nKlgA3OdYBmNWXodT4jcPoQHjHltYWfm/bowiurQQ
 cMmAiMt2yBcJEOvV6N/BUnayryP8JGdyRt6LT+N7PYuiAHodcA8fO5oxYxPxtUNLBPLk
 mxKtGg6EKEW6Y5sJZdEwYqqHeN37xq1F+zzvT93/rGTcBp0Pcs1h7pA/1nFwAy185P9B
 P2ZFrql7wESrMzsgC2IQtamYZyHMYaINfBuVGDQFp66y8O6IIbjcuhHF0lMtf2PNOCUS
 3mHmKFehMUXshhLEaCkKx3cXjATPXOeqYuXpLdomSGMDcJs/QdDluSbWyx67/kS4gmlW
 XrJw==
X-Gm-Message-State: ACrzQf3cmlFZA8E8jUg1urGE+BD/Nplwdmo65sRep7hBACrLS3B4gjGc
 8o4SWfqZ1C0v2kwrukee4IObNxZMH6A=
X-Google-Smtp-Source: AMsMyM6aQfQ5JlZWssZieLISA9l/tvbSge9Xq+9JoMfg9cjx4PMkjPi752GDgbwyde6XkyIrAwrNZw==
X-Received: by 2002:a17:902:c106:b0:178:8cb:2762 with SMTP id
 6-20020a170902c10600b0017808cb2762mr10091284pli.58.1663534278442; 
 Sun, 18 Sep 2022 13:51:18 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a170902e55100b001752cb111e0sm19145670plf.69.2022.09.18.13.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 13:51:18 -0700 (PDT)
Message-ID: <336eada3-71f9-997b-d000-0eae9bf822a3@amsat.org>
Date: Sun, 18 Sep 2022 22:51:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v5 18/21] ppc4xx_sdram: Rename local state variable for
 brevity
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1663531117.git.balaton@eik.bme.hu>
 <eaa6db377e78445aa106f9b30e01df3b99e4eeba.1663531117.git.balaton@eik.bme.hu>
In-Reply-To: <eaa6db377e78445aa106f9b30e01df3b99e4eeba.1663531117.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.657,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 18/9/22 22:24, BALATON Zoltan wrote:
> Rename the sdram local state variable to s in dcr read/write functions
> and reset methods for better readability and to match realize methods.
> Other places not converted will be changed or removed in subsequent
> patches.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc4xx_sdram.c | 158 +++++++++++++++++++++---------------------
>   1 file changed, 79 insertions(+), 79 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

