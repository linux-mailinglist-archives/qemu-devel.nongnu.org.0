Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25E15BBDC1
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 14:21:00 +0200 (CEST)
Received: from localhost ([::1]:52990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZtIB-0007gD-Qh
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 08:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZtDe-0002Rm-QZ; Sun, 18 Sep 2022 08:16:19 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:37502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZtDc-0005oQ-3y; Sun, 18 Sep 2022 08:16:18 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 c2-20020a1c3502000000b003b2973dafb7so2736156wma.2; 
 Sun, 18 Sep 2022 05:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=gz+PTBnco+F8z0HfVHELimkA+/rZX7Pi57dsYJgGNPM=;
 b=pMoaerZZb9qFQCaVLWFWsPxgw+yBJvG0OLI2+h9Ml48VXABxfiWqRoG339C1HbSM9R
 iTTMyWsA1mQwqcMBDk4Xz0kYYAo3+OittKBPvPF2ZHrHj4Ub6CWNdqdSJMxsiVWdpuK1
 WAR/MmcBYWdT9EmLgqzJHxM41d2xRrRtXrvb9thNq2sMjRUkWUW5GquIAX3vBI/VvXr0
 sEJ95b0MWkBE7vxYs14l5Fa+xfqzjqsJZvT0nArRTJoATrdm3kzSbEfPcD0tfazi44jM
 dBLVOZHj64sYLaZv2UAcAvDyUlBh1SyzRZ7dWLagiBiwi5/ZeGd+dBPNpXwBowxwBO2W
 xvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=gz+PTBnco+F8z0HfVHELimkA+/rZX7Pi57dsYJgGNPM=;
 b=P+OyyuKRt0uHAKZwfZeLKPNYZe6afNjopjTFUmOhTvfwBSocHysJEP3R7+8YdEvVIX
 hyLI2VWLl5adMEItOUm7K9sL1c/w0m3MpgzsdsWEsHoP3AdOijqYWDNmb6jrL1z4TUS1
 3x1qlJ6eYHaC5VJLSRuJzOb0HjU9FUtAOIV6VuxnHn+C2XFfF6MSiMORuDikmbc0y7TK
 778FW+tjQMnw3ew+77DfxelqnAa410Y8BL072XEBVZ/WUIZm1CWtme393WYThlm3FSlw
 qNwW9HVx7KLUzoJJyy82Ut2EPdVgsHGDjNsxJF8I4Zw5WKpMDRMpVsZyfgOdsWseMeku
 nMlQ==
X-Gm-Message-State: ACrzQf36kCNrH+UxTVrvTxTk7kpGs3wxaqFitUmqXJEFcMEn4Tw1cIYY
 WE7mxynbL2Jo1sHXH9F8bbs=
X-Google-Smtp-Source: AMsMyM673Da+8BgliFbtbuJS2sPASCWOSkbSxUsLXacZWTzyqAHJRIlULEOSU4NBVxD/PlvoNVTOag==
X-Received: by 2002:a05:600c:190a:b0:3a8:43b8:53e3 with SMTP id
 j10-20020a05600c190a00b003a843b853e3mr9540748wmq.4.1663503373641; 
 Sun, 18 Sep 2022 05:16:13 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a5-20020adffb85000000b0022a2f4fa042sm10423181wrr.103.2022.09.18.05.16.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 05:16:13 -0700 (PDT)
Message-ID: <fee4b210-9942-aef1-1b13-82b3ae8a15f4@amsat.org>
Date: Sun, 18 Sep 2022 14:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 03/11] docs/system/ppc/ppce500: Add heading for networking
 chapter
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-4-shentey@gmail.com>
In-Reply-To: <20220915152520.21948-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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

On 15/9/22 17:25, Bernhard Beschow wrote:
> The sudden change of topics is slightly confusing and makes the
> networking information less visible. So separate the networking chapter
> to improve comprehensibility.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   docs/system/ppc/ppce500.rst | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


