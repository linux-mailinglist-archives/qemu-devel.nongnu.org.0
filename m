Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83765BAF82
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 16:41:38 +0200 (CEST)
Received: from localhost ([::1]:49602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZCXA-00057f-Tz
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 10:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZCQy-0007at-Aa; Fri, 16 Sep 2022 10:35:12 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:37694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZCQu-0003cu-DO; Fri, 16 Sep 2022 10:35:09 -0400
Received: by mail-pl1-x636.google.com with SMTP id s18so15662914plr.4;
 Fri, 16 Sep 2022 07:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=RLe31tioKZvrY0rEcwPoqoVY+zpiIzWIetWqe5H0/aY=;
 b=eSTe8yntiQ/TqQcOK/sOVYKF39T8CL6xW642fs3QIp4FUvkrz5ry9GLXxkKoImkA7a
 Tzayc4rrfhNnJ24QkKrwiD2TPMjpALIh1NLaO7MipAkYx4ydyG6x0hX3D9Rxw46pDcmS
 l6cMv/rbtXEDUwqbDdplqUvKfYmWJ6V0iiXClQJ/qADP55UtXEL1yN2Pl3GSyoAR7GlD
 /p4N6J+B687o514GTKLnsnzby2PsSNeSSVxGzSGu0hf5bh996Fmwg9rBWmp9zJ07gTEf
 x8Nd2wB9eNhMYtwj0B+HLP6XjzqSkkWIzNrKzkwjQFjv7QWJCbnGT2pm2vVj/fEMYV9Q
 PBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=RLe31tioKZvrY0rEcwPoqoVY+zpiIzWIetWqe5H0/aY=;
 b=y1a8xIY/ehsxn9uOEaZ+B4ER1LmQE2msMmAKAGAerGZjEjOEYkCoLlxAWctlTRZuCk
 oaCpLz/BKwvWFbbTMYE2sZozH0bYcxfFMJ+W1QtqjEYDOTbGPSp8qXCRXgxtIx6d8eK9
 8nk/znA1K1KTd0oSFmBK/QdnI4Mkr1TCPVk38Zcc46IZYBIHxMxjCsjCN7fdF+gqeXEf
 jl9AQl6eyQwq6WISXvVRAxvhAEYKH9CGuRnv/KxSrAnkfSsgF4Hg2wLRz2COO/ox3YM2
 oKBGML9hYZM+q0sZCRvtb3Rp/n87ZPH4CQ2dEme0mVLGpKPd4B+P1aNHRYKZKxd6Uzbd
 uq5Q==
X-Gm-Message-State: ACrzQf3HgfgVPaDsm8dW38YQqNef7nyfSo2AE6SQ5SFJKVMpvOWdxsHk
 hSEQaUEPvpN/nLy1BWJrd+k=
X-Google-Smtp-Source: AMsMyM7CAjVcCb3nFF/md3Ugj94JBMsAXnq3cOL7zfjnQxJOJXDLgrO+rA0gxZM7dQZrXCTdVRTq9w==
X-Received: by 2002:a17:902:d4ce:b0:177:fe49:19d2 with SMTP id
 o14-20020a170902d4ce00b00177fe4919d2mr190051plg.4.1663338903735; 
 Fri, 16 Sep 2022 07:35:03 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a170902b18200b00176d347e9a7sm14763561plr.233.2022.09.16.07.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 07:35:03 -0700 (PDT)
Message-ID: <697688af-11da-380a-4b53-ce31f7bd3a74@amsat.org>
Date: Fri, 16 Sep 2022 16:34:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v5 11/13] hw/mips/fuloong2e: Inline
 vt82c686b_southbridge_init() and remove it
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20220901114127.53914-1-shentey@gmail.com>
 <20220901114127.53914-12-shentey@gmail.com>
In-Reply-To: <20220901114127.53914-12-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.816,
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

On 1/9/22 13:41, Bernhard Beschow wrote:
> The previous patches moved most of this function into the via-isa device
> model such that it has become fairly trivial. So inline it for
> simplicity.
> 
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/mips/fuloong2e.c | 28 ++++++++++------------------
>   1 file changed, 10 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


