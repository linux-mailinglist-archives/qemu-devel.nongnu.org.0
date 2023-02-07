Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA9268D614
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 12:58:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMbR-0007ds-J6; Tue, 07 Feb 2023 06:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPMbO-0007dA-Oo
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:57:34 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPMbN-0000kk-Ab
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:57:34 -0500
Received: by mail-wm1-x335.google.com with SMTP id bg26so10873914wmb.0
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 03:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yvk1bjMva3nt591vRkSpjg/a1fkeFs+048PKS9Q/ybw=;
 b=Y0XiAATwkxkjABcNbAZKC1SsYF+RKtNMno4FrT1/Wh61Xc7Lnh5Y8iXHv1/jMjVhiz
 QOe6EC0l630FFkt/C1bDDcmZfmO2R9Nfi3D9xumbsrDyP6NUqmCyyAJUtEyIkBipsgB9
 xpxvmn9rDNLKqof9r6+CS4Y1ZHN6IS0YMGMDZNS0wzQ11wru0LcoQPPk6TXneNl9erwY
 NB7ycTj4kzprZil4DWpBcAe3S15cgRzCrWCaRTzfxW3C9ZwuN3JP7qXocwP0FjKn82Gy
 YgbaM/7lHCa+4kL9NYNCAjiFpgFkhcEjDLk6cme7EcDeAteNQnSV0g8Lx3IMvtWQ7JFJ
 tSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yvk1bjMva3nt591vRkSpjg/a1fkeFs+048PKS9Q/ybw=;
 b=ZMzozrEDl8HHx0wfT+eAAuNsVowKPNnoLsWvZdYpSpR2+Ye0/u/3owJUJKdlYy4TSP
 peWump8DDiP+RdO2JjPC+2QX1Hi0wa66vSUeTPkmukA7uNni4ZXUmHhj6MLK7VTjFSRM
 bLcP/WscZ4erihWS2icaybFWKGk00NMLkEocJlkjr28TmKUhRQnPFBgvmfyTvRpT0Z34
 ItB3fMuOpWuWDPySgVrwQlA1MRQT0AfGhlahq0PqWlyXaamDB/WIyDOlpl4J4u/qhBg4
 TuWI0wTYo86BG3jzFJ/zZfUQ4do7Ys7lOVUfoRty0xI6ui+LQBonuNfdjGXIC3MhOjam
 n0Hw==
X-Gm-Message-State: AO0yUKU1f0sAqdYkSlzCFKTBTFMl0Curh/lnTreYFCtXQHAHPSdkmyr/
 XhbwKe05mq70ftdF+Qr86/ZYqw==
X-Google-Smtp-Source: AK7set+Ee07zC0HyTtDI2ZbZFQGp/FnwdWHP+y4UxIWtoIiXQyoDiXHCc+0A2rimL0zuBULtCSIsOQ==
X-Received: by 2002:a05:600c:1716:b0:3df:f7cc:4da2 with SMTP id
 c22-20020a05600c171600b003dff7cc4da2mr2832791wmn.16.1675771051470; 
 Tue, 07 Feb 2023 03:57:31 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t1-20020a1c7701000000b003b47b80cec3sm18394291wmi.42.2023.02.07.03.57.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 03:57:31 -0800 (PST)
Message-ID: <0810c356-db4e-f808-a610-247c1b19b5b2@linaro.org>
Date: Tue, 7 Feb 2023 12:57:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 3/4] pcie: drop unused PCIExpressIndicator
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com
References: <20230204174758.234951-1-vsementsov@yandex-team.ru>
 <20230204174758.234951-4-vsementsov@yandex-team.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230204174758.234951-4-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/2/23 18:47, Vladimir Sementsov-Ogievskiy wrote:
> The structure type is unused. Also, it's the only user of corresponding
> macros, so drop them too.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   include/hw/pci/pcie.h      | 8 --------
>   include/hw/pci/pcie_regs.h | 5 -----
>   2 files changed, 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


