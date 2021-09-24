Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0C3416E74
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:04:06 +0200 (CEST)
Received: from localhost ([::1]:54982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTh7l-0000rK-O3
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTh6F-0007s8-Rb
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:02:31 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTh6E-0000Iw-Bp
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:02:31 -0400
Received: by mail-wr1-x432.google.com with SMTP id u15so25158522wru.6
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/RzFECHeU82i8ZyJQt14k7cdN2Oibhzmt2JaiBXmwaA=;
 b=CpL/2gVdEs4z6D9YQL4LtkDeI5I7gXgfWI6LS4Pj1SbCjQZRRPhsWpVQqI7Nj7tBOj
 dcCNrutNbU5JGqCxkJBdoihOhbWHOovJjeSzRIF2VW1uT1HNWZPdu48iGIuki9cDOsx0
 Zvl4TEIH9OrfRY3ED6S7LxRcWp03wWEmz6ycHjt7TxQZ770y850H4Eq5aIZILW1WIxW7
 0AQQcC2i6oBKfMgbq9XGSsekRyVawnGdQePBoLgHcQfmK4vPmfoEpbzgOwK5KSpHueMU
 C2cR113X7ZcVwurRoZlncdTlsE5RLOWQzvXgntv3Y6+aCjJCZ+VonntHWdC4Hucoa6xh
 heZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/RzFECHeU82i8ZyJQt14k7cdN2Oibhzmt2JaiBXmwaA=;
 b=YBin+0+IvsZ5Wx1aboiQkgZ7s3UM2948DaJf2zX/2uR2480anzVvRnSG7UKmF/1dsa
 V+8cBysz5c904KkPH+Nyg8lkpD9d0uu5R6W3cESg5K8zBCDb+inZwpcQNPEBUs8WD5Gv
 YaKl8jZeNKREId+e2oeiAdF3tdbTPAkucu5n8/uL1cm9lMa6X5LlrUdWqvfyh+WJdXYN
 TlMXkrfnaVwM4/fPyCUVvs4HOeYZg1GL8us2TfrHoEG22tQRZYF2TD1qi38AfBsPkwUa
 +oT0w9ahKgz2ozPsLziW8zEyhmqL8+/0NmWq+p1zWAyk4jfmAtR68E85a2FPjOq0BciH
 0N0g==
X-Gm-Message-State: AOAM532GBMSpaGFABGiGmKsKyc13PgW+g4jARVg2THDqExXiasRqmfwX
 x/pCpvExx3vgLrCfUpWjDk84SQjxrpg=
X-Google-Smtp-Source: ABdhPJxa2Js67yRTWvRcD3C++Ec0D8sFRBvct5Pq7wFUmft+CZODH0Z0M34DiZCMrPB96FAlvOL4yQ==
X-Received: by 2002:a05:6000:160c:: with SMTP id
 u12mr10214744wrb.128.1632474148378; 
 Fri, 24 Sep 2021 02:02:28 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id i67sm9097855wmi.41.2021.09.24.02.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 02:02:27 -0700 (PDT)
Message-ID: <863be2dd-a218-2711-9044-69ec0280bad3@amsat.org>
Date: Fri, 24 Sep 2021 11:02:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v6 04/20] nubus: use bitmap to manage available slots
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210924073808.1041-1-mark.cave-ayland@ilande.co.uk>
 <20210924073808.1041-5-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924073808.1041-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 09:37, Mark Cave-Ayland wrote:
> Convert nubus_device_realize() to use a bitmap to manage available slots to allow
> for future Nubus devices to be plugged into arbitrary slots from the command line
> using a new qdev "slot" parameter for nubus devices.
> 
> Update mac_nubus_bridge_init() to only allow slots 0x9 to 0xe on Macintosh machines
> as documented in "Designing Cards and Drivers for the Macintosh Family".
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   hw/nubus/mac-nubus-bridge.c         |  4 ++++
>   hw/nubus/nubus-bus.c                |  5 +++--
>   hw/nubus/nubus-device.c             | 29 ++++++++++++++++++++++++-----
>   include/hw/nubus/mac-nubus-bridge.h |  4 ++++
>   include/hw/nubus/nubus.h            | 13 ++++++-------
>   5 files changed, 41 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

