Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61F55F388B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 00:02:24 +0200 (CEST)
Received: from localhost ([::1]:49264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofTW2-0006q1-G0
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 18:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofSWb-00058U-O6; Mon, 03 Oct 2022 16:58:53 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofSWW-0007k7-CX; Mon, 03 Oct 2022 16:58:49 -0400
Received: by mail-pf1-x42d.google.com with SMTP id w191so1778686pfc.5;
 Mon, 03 Oct 2022 13:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=5UaXlBnwTtkUj/CvSUIMLcOVlYViDg0kGi734aeNFw0=;
 b=h+s79tQL2xp/3zOtNerBe1s7VKnsaPqfp/Oq5ym+y7EHU1mY2wMfGUDcu7yp/SzvIA
 rv0TSOehA3uHeE+nVr6+gm3RnQYiSRkOhzm0p5K+FY5KMIAjERMhXVSNoOWyJffiy67j
 lfJZIvBTeYAosOstonC2TSknjMFLDdy98K5ZPdSBzQE8iGRbh1n02jZoTMlomyZl+mvO
 yFjAcCAToU3SxruBNISnA9MTMw7Y68jQjM/B0npfqxHL5LqNaY+riQR4uabcE22t6GfG
 feh0hXw1MhLmMUp0ucrtNB6RZQPGlRIsZKk0s+NouaOB1HGrqDZ8jNf3spkQZBgappO+
 myRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=5UaXlBnwTtkUj/CvSUIMLcOVlYViDg0kGi734aeNFw0=;
 b=rolH3DMvL3UGonJsMxNnYwwfr+wW61MoUtmGT4eFRdzJcMva8e4Uy7W//ynv7fgzgg
 4a5xQkhw25bBA0KFIRYvMIWMc1UNDe+woGUuk14NWLSX37uMeJnUvFLeXUJkX1225ral
 zKaq8Wiz9pRuTW8SXFcz/UNCYIOMZqcYB+yObeG/lOUFkzNABwpeKzCeLX9W0rO/ZqM4
 reUqG0GIinCK0ks8IW3wgdD/dAOtogdA1AfpX1aNezkXD9jRoDhCxflOANOL9RSK7iH1
 vmv4WOxAe8nfWRdT3KhRWxxzaw2iKBlzY/yQaHFHpTQAVJTYh81ChJyubEkGtUfvnvbV
 jDPw==
X-Gm-Message-State: ACrzQf18K4mo5D+mcArDX5rq+0ZpIy9tJUhn+g14U+aFkcz0EPToOa2S
 dmyud2QHu+NrLllhMHQ7MRaLMhb0/YE=
X-Google-Smtp-Source: AMsMyM4McddM9WpyHhJ7sWzNWqLE2HrpsSusIYcxAnqUueTI8tZqyD9JKmlhHkTIexolXj+kLpv8Lg==
X-Received: by 2002:a63:6b09:0:b0:453:b1f8:bb3b with SMTP id
 g9-20020a636b09000000b00453b1f8bb3bmr1862948pgc.36.1664830725325; 
 Mon, 03 Oct 2022 13:58:45 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k11-20020aa7998b000000b00560a25fae1fsm4056006pfh.206.2022.10.03.13.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 13:58:44 -0700 (PDT)
Message-ID: <6bc33a40-8808-b2e4-9aff-20a24dff8127@amsat.org>
Date: Mon, 3 Oct 2022 22:58:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 08/13] hw/block/pflash_cfi01: Error out if device
 length isn't a power of two
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Kevin Wolf <kwolf@redhat.com>, Bin Meng <bmeng.cn@gmail.com>
References: <20221003203142.24355-1-shentey@gmail.com>
 <20221003203142.24355-9-shentey@gmail.com>
In-Reply-To: <20221003203142.24355-9-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
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
> According to the JEDEC standard the device length is communicated to an
> OS as an exponent (power of two).
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>   hw/block/pflash_cfi01.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

With CFI02 similarly fixed:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

