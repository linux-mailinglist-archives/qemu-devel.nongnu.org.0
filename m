Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D24E8482CE7
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Jan 2022 23:13:53 +0100 (CET)
Received: from localhost ([::1]:54602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n496u-0006h8-Un
	for lists+qemu-devel@lfdr.de; Sun, 02 Jan 2022 17:13:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4927-00043p-5M; Sun, 02 Jan 2022 17:09:01 -0500
Received: from [2607:f8b0:4864:20::631] (port=38432
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4925-0006vd-Rg; Sun, 02 Jan 2022 17:08:54 -0500
Received: by mail-pl1-x631.google.com with SMTP id c3so10498619pls.5;
 Sun, 02 Jan 2022 14:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WGdbQg37T1SsKsMGzvSJsIrL/2DxdfJ5GJkDqtcgv0I=;
 b=T5EEFbIovpd+e6Wco7M3wqHR+vORqK1c9LoV/0SFlvsH1pnCTYmJ8XiNt9T5Tt7QvW
 ofLvWfOvTpFQvx3SEYroZqYnHck4BnY8hkWwTB//B/gRrcnL5WQCL28YSt1my2E4E6ZX
 A8ZXNfo1xv54lbhi9C1/RNw5U6v+ub7dpRaBPnD7IgdyBX4a6SquXmTNngfM2EBlbx6W
 o5g6voaC3mVvLxV+QKxZWd0Winlxilc+borGgTitgjuv/KKoqJ5ZAKouzHJeljdi1IOc
 73B9uosJ7bI18NZAG/im/P7zgC6gAkTd9MBabHQvsEKZVeYTwyR96/iqJkWEAhWzws28
 IlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WGdbQg37T1SsKsMGzvSJsIrL/2DxdfJ5GJkDqtcgv0I=;
 b=Tf0MZM+PDz0ePjM1FcslRi5ZMV1hl4pNlrMoMzSP0snVlPedvrFRSss5y55/fOKmZo
 y7qS1bWmod+UA6S4L68tE1i5qB6Nk5m/UcN2OGM3eCS/XiHJlqOMfNy12sa7BeZkY49D
 65OP6VsV61iJShiyK++0j3zPYqHQZEFWuxovUax5VZs7jnpozpYK8uETze8S9bYivUlw
 yus62shLaHja55t9jB5HeLXxXhdtb+IbLrWcfytRU+wyzEPpe0WlaJH3amzxsGqQOizb
 hqyLWDFGxZK/JDsjdRzxmgpZCmUzMGZ/aHk3K+YDDuJjVLda5JAiEyCoJDkwLDM9s4nB
 eK2Q==
X-Gm-Message-State: AOAM533Uml5Z/L2tBrTUcUNNqw+5ZM/ot7vFY822PwdErFKmnbAitzZ6
 KsjKCvfmfr/HAEghWd3VbCrsnhDd6b+lkg==
X-Google-Smtp-Source: ABdhPJwS0Dth3SyYe04OjMSlzqcYLQ0XFvtWGnKLE9EPKXAN2t5k6N+pyBkGMasodZ3QPsPXFB/TaQ==
X-Received: by 2002:a17:902:6a88:b0:149:7aa0:f94b with SMTP id
 n8-20020a1709026a8800b001497aa0f94bmr32242398plk.150.1641161331492; 
 Sun, 02 Jan 2022 14:08:51 -0800 (PST)
Received: from [192.168.1.37] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id c18sm38393080pfl.201.2022.01.02.14.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Jan 2022 14:08:51 -0800 (PST)
Message-ID: <45cfa795-799b-1854-cf2d-db3fde1927c9@amsat.org>
Date: Sun, 2 Jan 2022 23:08:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 1/4] hw/arm: Add kudo i2c eeproms.
Content-Language: en-US
To: Patrick Venture <venture@google.com>, peter.maydell@linaro.org
References: <20220102215844.2888833-1-venture@google.com>
 <20220102215844.2888833-2-venture@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220102215844.2888833-2-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: wuhaotsh@google.com, titusr@google.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, crauer@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 22:58, Patrick Venture wrote:
> From: Chris Rauer <crauer@google.com>
> 
> Signed-off-by: Chris Rauer <crauer@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Patrick Venture <venture@google.com>
> ---
>   hw/arm/npcm7xx_boards.c | 8 ++++++++
>   1 file changed, 8 insertions(+)


Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

