Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3135A5F37FB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:45:00 +0200 (CEST)
Received: from localhost ([::1]:50814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofTFC-0004V3-I9
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofStk-00077E-5X; Mon, 03 Oct 2022 17:22:48 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofSti-0003UG-CQ; Mon, 03 Oct 2022 17:22:47 -0400
Received: by mail-pl1-x629.google.com with SMTP id f21so2939876plb.13;
 Mon, 03 Oct 2022 14:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=zvj+1oYpjyqPMr059tCcNZWkFTM6VZ36U82QrNMNzZ0=;
 b=eBsFflyNW0gMlb7txLUt0kpIEJcTR3mVTcXyLtiS1xhqhjCcJ5cFEKUg0OcpJ3/70h
 SZ2piLrXtprIPOmTtIn51pT2nXUIEznPHoS9uQQutJCXKMmB1vfsPpgJr/w5PFUReDKL
 wStn0S51T0JHOO5Vbu2c7Qzzy/hJ5U7uhCFc+g6pYTjNDG0SzryvuTVyNBChJ2r+cDml
 g0BLJDrxgJl1j44bkYLP6jtjLHtACd+/pfduaj7UsZpSiVaOUM8aPmMAlQ0JaH1Nh6Ej
 1Mj8c+w4mJhD5JOb/PZ/XhTYNHc72O56UwsYMIJbKPXwrBDgaLIWVRU7ap2yNNZzNSA+
 XCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=zvj+1oYpjyqPMr059tCcNZWkFTM6VZ36U82QrNMNzZ0=;
 b=qYvjEcqwiCBK0yb/sDrDDKFr5tagBowP5UsPEvuqW+H/GCcdrkRVdAovtTomG7SUyc
 FctWHmcIerzrnF6Qt6Kiy36Y1CMFleVLc1HijThOi6GfNtI4F/0NcZWul+70iwEFA61J
 5FC+nDH5fpAqSjzBPvbzQgjPxyqrlXN0bM03DdCL38C3F6uZF3fKTFm87F8dbwL4put+
 mOWm/YprptSoeaRJ1j18s7ZAI4HRJV5q9Vzo4rS/Q2DbIB25g+i28+zgbZm5RI34KqDc
 TQN9147WO+N57f2x1eIPs4GW0Ih7h07U/oGKa0hNxflB1w8BC+c96/nWznR7+HOJc21Z
 wgdQ==
X-Gm-Message-State: ACrzQf0pgfDCeaADJFNGSvqjvQyoaRFbxow2vzAa44OpCncyiG93hjvt
 56CjrN1UGNQ32IdIjlpalNA=
X-Google-Smtp-Source: AMsMyM6FysMKoPUzGbBmf25w8opfQysm657r/SkcjBv+w9UZ61puSCCMjbUt68Ey4VHiEMWQ5PQatw==
X-Received: by 2002:a17:90b:4acd:b0:202:e381:e650 with SMTP id
 mh13-20020a17090b4acd00b00202e381e650mr14351124pjb.204.1664832164225; 
 Mon, 03 Oct 2022 14:22:44 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a1709027fc400b00176dee43e0dsm7467674plb.285.2022.10.03.14.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 14:22:43 -0700 (PDT)
Message-ID: <92891ba2-f9db-1667-bd9f-79b35f352a37@amsat.org>
Date: Mon, 3 Oct 2022 23:22:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 04/13] hw/ppc/e500: Reduce usage of sysbus API
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20221003203142.24355-1-shentey@gmail.com>
 <20221003203142.24355-5-shentey@gmail.com>
In-Reply-To: <20221003203142.24355-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.467,
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

On 3/10/22 22:31, Bernhard Beschow wrote:
> PlatformBusDevice has an mmio attribute which gets aliased to
> SysBusDevice::mmio[0]. So PlatformbusDevice::mmio can be used directly,
> avoiding the sysbus API.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ppc/e500.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


