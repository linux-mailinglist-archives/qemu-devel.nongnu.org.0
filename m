Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BF5471D08
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 21:47:36 +0100 (CET)
Received: from localhost ([::1]:37752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwVkt-0000Gp-5H
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 15:47:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwVjc-0007pR-Ix; Sun, 12 Dec 2021 15:46:17 -0500
Received: from [2a00:1450:4864:20::334] (port=51959
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwVja-000803-8p; Sun, 12 Dec 2021 15:46:16 -0500
Received: by mail-wm1-x334.google.com with SMTP id 137so10633176wma.1;
 Sun, 12 Dec 2021 12:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hGM2NHUtnbFDEgpWxlzwlarIp6xK2fhN/yqxsB9M4XI=;
 b=gwM6uXXcliG67oQufE/i5bs66VzU6+kSCSLNJx/JvzKMiJgviqsdvvj5FTb9KGdfXB
 x6XbijvU/BiaWbP7yX40g+X8AGmDXb+J6QSMlSn92E4RM3sqGpxZKMvNRm2mluNukrOw
 bdYlkOSaMUEoRtB0o1y6asg7nr149hNn8yudg8RHS//r4HuykakQ1+99coBDIkc9bBpp
 c1vpo9XHVIJsqYf+mKVlCSNn3rc/U+aAYJ7db6tzFXbhAkZyEBtPjTKZeOgyzGBqDHRp
 MrFz/Bm1shWPZoim8ijhiX4OuOmiu8wxkd83QOGXf/r7spcjjEJ4Ib1UhzV3zg0EAHz2
 AqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hGM2NHUtnbFDEgpWxlzwlarIp6xK2fhN/yqxsB9M4XI=;
 b=5zu4Icg0sNh7rsoc+cDUDm5OXrPF04WR+LukZcL5OWZDiDtV+onCpI8wlv+oDmnTPP
 aCEN/V+nTJ/tuo22pysStD/I8GVb9wLBnUtCQWtXDtbooGr3owkT5dEAW/kjT+H7NaZw
 MuP/4P4Hx9txFXlS06ZWzrdEz18KSDhBWngUXMuK/3cRcBHuCfYD6qMeLAtHwXP2/Azp
 5RccYbgXH78Y1ccvTuvdEkgdkFKh+NhaA//MNFPM98QKrU40ao4b3MdiIymh3mbQWzno
 gUewM8x0g9D34qmQBpj+pzDF+Qxyy0WgJUDI9uRCaml18ESSU4LCRQ2Oy7g5LpETdyUH
 4+hQ==
X-Gm-Message-State: AOAM531gSSSg3YSZmr9aJcsOytUhUByIOHaKOGj+516Tl/Qv61nbghwQ
 ApTpWjIpvuxiuOR3c86tLEY=
X-Google-Smtp-Source: ABdhPJz/fImkd0bhG0CYUp3Z9YJhRwlSL/T8Kya/WrdN0hL18FXBlK+H7ARrWE/+ZURhsg5I2eTTWQ==
X-Received: by 2002:a1c:7907:: with SMTP id l7mr32524567wme.72.1639341971149; 
 Sun, 12 Dec 2021 12:46:11 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id az15sm5251678wmb.0.2021.12.12.12.46.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 12:46:10 -0800 (PST)
Message-ID: <717d0487-147f-14a9-34ed-993e8cc83c63@amsat.org>
Date: Sun, 12 Dec 2021 21:46:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 03/26] hw/intc/arm_gicv3_its: Remove redundant
 ITS_CTLR_ENABLED define
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211211191135.1764649-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 20:11, Peter Maydell wrote:
> We currently define a bitmask for the GITS_CTLR ENABLED bit in
> two ways: as ITS_CTLR_ENABLED, and via the FIELD() macro as
> R_GITS_CTLR_ENABLED_MASK. Consistently use the FIELD macro version
> everywhere and remove the redundant ITS_CTLR_ENABLED define.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/gicv3_internal.h |  2 --
>  hw/intc/arm_gicv3_its.c  | 20 ++++++++++----------
>  2 files changed, 10 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

