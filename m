Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905FA418127
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:57:15 +0200 (CEST)
Received: from localhost ([::1]:33914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU5Mo-0001Kl-Gd
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU5Lc-0008Me-GV
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:56:00 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU5Lb-0003TQ-4E
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:56:00 -0400
Received: by mail-wr1-x429.google.com with SMTP id i23so35308641wrb.2
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 03:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t+Eazd1hU0vpptiNQYDtC2+w+0uH2RgDjaEeolTNVtI=;
 b=gYgTnCzLJ64WPgp35lGsGDPISggGD5+wL5sJ4Cw7nUUDjxXLsupOy2yGaGWnDur33L
 XPo/bTjw3ZV57ljzcC2AiPowgyvV+V1nsgJJd6Wj+bmZjTq9RwbxqTzAZ58098NtaTfD
 TGVP38kYUXgYUVLcykoRnOMqt4OrGgQRGiw5UXoyyvfYOxEPafG8in8pqVzTferT+2cH
 L1yZ95/o3KOCfSk2VV9aijHDPit3q6LmVeiNfX/AyPPlHbFSD+6Ilxby83oWD+d48E7B
 3XP4A34Ig8tBU6sTRYT2wedspzVE2+xZEl9Raz7/4EfQvITAfT5eROn4PE9Q5c73F7/3
 e9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t+Eazd1hU0vpptiNQYDtC2+w+0uH2RgDjaEeolTNVtI=;
 b=rNhhGJHHKH5XUVpdDw4Gx+CfQZiT6pM3WIKLnKyj/g3SAAnrzQyaEsL7Yi10qFK8Yb
 DYX9f6wuictW4L6HpuEVcGQX//mAJNlIa3HnSTs8trI/cxpOVg8L+XzX9Y/lxlCPA4ja
 /xzrztKa9ZtJCXpHEgVB00sF12MI8KillO7nbZx7WEDmJFFl6NLPrYIhvxCSqWOEOrKs
 pP2WPLzo/VyCYsfp7RkvKfQb5LOav6Km7vbtUYdF0qIieRwAo5eYMDaerzce7qSY4HtU
 ZIbKn4omBwhF7FObZtsJzd+c0NFd36sVvOXjjRLKhHdKEaP63eb9oB/RbG9KpNymH9Fq
 yPsw==
X-Gm-Message-State: AOAM531Ka4IFmi6k1cuvu4leSdHDUTAlXumXt4gLl0j7dDlCbW8kudDQ
 zX16l/f9zk3a4CsQTmATjkw=
X-Google-Smtp-Source: ABdhPJxHazrZoY2SqRZxSzVJYZqC6LVTWu4dlAr8bJSXKHtbDV0R/kZ2Q/EtbSTgAaQmqRCSVT4dYg==
X-Received: by 2002:a05:600c:2057:: with SMTP id
 p23mr6520730wmg.25.1632567357745; 
 Sat, 25 Sep 2021 03:55:57 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d7sm10929058wrh.13.2021.09.25.03.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 03:55:57 -0700 (PDT)
Message-ID: <8d4b42d3-6a56-93a6-b2e8-731267803789@amsat.org>
Date: Sat, 25 Sep 2021 12:55:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 4/9] bsd-user/mmap.c: mmap return ENOMEM on overflow
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922045636.25206-1-imp@bsdimp.com>
 <20210922045636.25206-5-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210922045636.25206-5-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: kevans@freebsd.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 06:56, Warner Losh wrote:
> mmap should return ENOMEM on len overflow rather than EINVAL. Return
> EINVAL when len == 0 and ENOMEM when the rounded to a page length is 0.
> Found by make check-tcg.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/mmap.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

