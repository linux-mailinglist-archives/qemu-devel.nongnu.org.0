Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FCE467F68
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 22:36:09 +0100 (CET)
Received: from localhost ([::1]:40494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtGDw-0001mk-VM
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 16:36:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtGBT-000894-Ty; Fri, 03 Dec 2021 16:33:35 -0500
Received: from [2a00:1450:4864:20::335] (port=54193
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtGBO-0003rN-9q; Fri, 03 Dec 2021 16:33:35 -0500
Received: by mail-wm1-x335.google.com with SMTP id y196so3376467wmc.3;
 Fri, 03 Dec 2021 13:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rTRB1eReauuS/W9lTfSExn3Y7fIxqPjPMMy+/D7yAio=;
 b=jVAUlBJt1uG+tgCXReuh7aQwA4MoE63MHD8ADQi8mVtTmAP0rlMrfkvY5YCJ68GeJb
 lr51wmOFNdmZcKdJ3UszrtuASMhhA5nEoFUBpnTKNNUMaBCQY3BWbbZpuUFCh208zyF5
 Qus4+YvE0k+ws6aI8gW7aLoI81GWMXqPFMQLC65Pi/d6lssAFbue7lsA8CAs8bSF+xfD
 6r2Dl30sLeOOvnVOFpPC32Z6ZK+uJqZ7OwzhoRXHePyMSdbtXW4PSrgPxRuMYie35x1B
 ShxxQ/lulN3UtpKCw8XBtHGoLZEwjaiIEWupQB1nr33HxHMJFUWj050GIC2G1Vwk6U6k
 Z2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rTRB1eReauuS/W9lTfSExn3Y7fIxqPjPMMy+/D7yAio=;
 b=fnKeolA42HRPJBe5BJLzMu69VrNNxY9WAB8e8H4oIkGvdavBe4DTBrfxk5YgUprZ1z
 X3n4WkuJ17+mLBKw3a8tyUpn8ZGrBK6HOMNJ7TRA01MGc7TXGTn+/I386FE2R8b5jvM9
 IPTUiZnYuLGiKO1aLIm2YKbIIsQtTbgodq3s9/UbBsC4eXOAWvy5NoHfY2jaOMkyEbYb
 GEOhI+CAAa8FzZZ+z9415XTPmZ45eRA+5allp1paqS2BZylrnUnJsRtmscbUZczP65d8
 p8jRpzwg8amec3qKnmdSRPi5vid0LlWvyZ/JXaw3M6FISvU3aIdliTi/S4r8ngLIUc1d
 LfnA==
X-Gm-Message-State: AOAM532aeMs6kHu3mpTRDTJ/KCq+yDnDMKGA5WFVNyR5zaKi2ax1H3GX
 wg6DzsFcWC5tUmTFgpu2Thk=
X-Google-Smtp-Source: ABdhPJxEwzQHq0ou5EP1SHzQMXlFeZCEU6FQHv1/GOqg1d6bYBeX0VPJy7cnHzbncdzKbeIHHdGAng==
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr18167065wmj.12.1638567208743; 
 Fri, 03 Dec 2021 13:33:28 -0800 (PST)
Received: from [192.168.1.34] (abayonne-654-1-109-18.w86-222.abo.wanadoo.fr.
 [86.222.60.18])
 by smtp.gmail.com with ESMTPSA id o5sm3445671wrx.83.2021.12.03.13.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 13:33:28 -0800 (PST)
Message-ID: <af88e9c0-2c6f-fa2a-8e49-ee829a9b169b@amsat.org>
Date: Fri, 3 Dec 2021 22:33:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 14/35] target/ppc: Remove inline from do_fri
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211119160502.17432-1-richard.henderson@linaro.org>
 <20211119160502.17432-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211119160502.17432-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.938,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 17:04, Richard Henderson wrote:
> There's no reason the callers can't tail call to one function.
> Leave it up to the compiler either way.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/fpu_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

