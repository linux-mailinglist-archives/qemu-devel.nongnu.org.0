Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AE631F2D7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:14:43 +0100 (CET)
Received: from localhost ([::1]:52136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCsVO-0002m9-5l
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:14:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsTa-0001wN-Tu
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:12:50 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:54681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsTZ-0003wu-8t
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:12:50 -0500
Received: by mail-wm1-x333.google.com with SMTP id w4so5115578wmi.4
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 15:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aQddJ1WRhl7q8Vb6iTdGbnLJN38mRSWwqa12OyNM60E=;
 b=OhnTSffyZXt3vapsMPWYx2Ascv7FYHIc5VoFWd5N8s0/Xd9KKSq2TAglyt6HeP4tSk
 K6C/4/HzsK4O1/9ONW+wYwTfMKacpsOghH0F/p9SpCY7yj7YahfooeUbZ5P6bnaY3eKo
 f4mUX+0Z3J4Aw17l7eI6vjETZAQOnwjhGL85PPMpR2/enYIZLJbhqBOQgVxma9MrtSaV
 WN3OOxoJtBaFiK6Fc6VLm78LgoShpIK9AHRSLFER4Te8iuhJiWM4xUfs+VQLlRm61OW9
 HWNAV/r6efi0yOb8e2sPQ2hMqJVPFNb7hvz4wFw162S/uuj5UBqYEfsvYkXIj3cVHP+k
 G8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aQddJ1WRhl7q8Vb6iTdGbnLJN38mRSWwqa12OyNM60E=;
 b=lFKE7LHELdugYsv5rA1Wv7Uolu7qkQjBKLEGJDefeC20+mGMiR9jVdZcpIFBwiaQMw
 lRawc4f+LoOs5hEy+UJWlf19/LFaKwOmkZO3p0DIb0UstUMaDCPl7I21PnVknRiBKICg
 vjeI5cYe1DuzWuSaHGLth7NhsAq2LzORSwAMpcr7Dqs1UIXpL4JGV3/9Zk0wKT4W5pFt
 JinnHywD3lIZ4Tv+3f0opW8psumsbpiSxr/RvER+j6dB51tBPU2WZeFbMJK5ob0g5MGm
 xRGdCh9ab+kHC1na23puLWFNHr60m/d/meudyMZCLaWwWw4nqlggijFWG5qRQG0J2iZR
 HpzQ==
X-Gm-Message-State: AOAM531Ps379qKXeIimWVGslg2ToFux2higFn8/l3kkWFgYEIkye1x0P
 pfJCfD2Pg2OrVAhAZU5MMuo=
X-Google-Smtp-Source: ABdhPJyQduIgbeYPCAdmdrDQ4VOoYeCbPNHtqrXzV2bBpkzDfKdGJqaap+q8FVMjA7Pu77ihs6MSBw==
X-Received: by 2002:a1c:d7:: with SMTP id 206mr5575444wma.68.1613689967527;
 Thu, 18 Feb 2021 15:12:47 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y15sm10963728wrm.93.2021.02.18.15.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 15:12:47 -0800 (PST)
Subject: Re: [PATCH v4 06/71] tcg/tci: Remove tci_read_r8s
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
 <20210217202036.1724901-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fe78d748-c84d-1982-7618-459fdb98ca5a@amsat.org>
Date: Fri, 19 Feb 2021 00:12:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217202036.1724901-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 9:19 PM, Richard Henderson wrote:
> Use explicit casts for ext8s opcodes.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 25 ++++---------------------
>  1 file changed, 4 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


