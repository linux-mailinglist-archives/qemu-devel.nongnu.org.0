Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAC55A10CB
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 14:41:43 +0200 (CEST)
Received: from localhost ([::1]:42998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRCAz-0007fk-Hj
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 08:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRC27-0007rS-5i
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:32:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRC24-0006w4-OF
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661430742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8oeZDoKCwjgjhl9XzMI9S7TuPQlWS06JYNQwc+Bwjsg=;
 b=MP5+EhgF05tDsfn5JIs00+BxHTgnPWCXCcyX9ZjQZJxrc8K6gezhD4VJLR2MQ49q15qv2U
 hbYEdB9jMilBuFfqTC9kUsOQo0lxwSeT8La86D/1eFe0d7yJHQvIlrSE0YuuMknjPq9H3U
 thCdbTJV3//S6VPOU/HzI0ztIfkQ9II=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-FxwwBJZeMmSWkivRtzo1Xw-1; Thu, 25 Aug 2022 08:32:21 -0400
X-MC-Unique: FxwwBJZeMmSWkivRtzo1Xw-1
Received: by mail-wm1-f71.google.com with SMTP id
 i7-20020a1c3b07000000b003a534ec2570so2403033wma.7
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 05:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=8oeZDoKCwjgjhl9XzMI9S7TuPQlWS06JYNQwc+Bwjsg=;
 b=zY+RFS5TwZaLQgB5tI/oWVK7BsGe3AXmJmoYwD1xnyYUvscm8ImFAkRSJgyws/kqFi
 nGV/WSG0+msY8QcZGwzLwm7wz+efoPLlfyefS+kvrY6yprYFUy4y/eATj2R8ZTpq9Sps
 Z4CSxb5IYxPTsd7QsCr+smYG7bGl/C+uTIPIVDEl/Mykn5cfLzaxFzItgtdc774Ky4EA
 N/SqpL+ukPfRp8Bnh8ZPSvoaolyVnqiPy+IDvengQYx+kofQT9oIbZS7VBTDVUJ95MiN
 r4+HsPm7lP5MaEZz0lCgjkso4LEvvMsCBHJEmgWgJtenVqHKc9JqtFKqTWoymUfwH1XL
 PywA==
X-Gm-Message-State: ACgBeo3pOqRdIbbq/MmhfEji2PU5NyYMQrSoy39DyvPoWDDQJ0/Oxkyc
 YDawE9PaujOmBAEeaHJyQm+njjlfAqVAqesun+cpHs1zLB5MPeEXdTrhpmK/f2vkEF2/aNP19od
 5PSVKd78ZOcFWwxo=
X-Received: by 2002:a5d:4571:0:b0:225:6191:779d with SMTP id
 a17-20020a5d4571000000b002256191779dmr2164275wrc.325.1661430740402; 
 Thu, 25 Aug 2022 05:32:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR69pFnkc+3/p4fh4b85BWQ9cXVGwjWcMY14UMY1+cpPaIjSj8QldUcAeeM6vZ28nH/qEUddEg==
X-Received: by 2002:a5d:4571:0:b0:225:6191:779d with SMTP id
 a17-20020a5d4571000000b002256191779dmr2164266wrc.325.1661430740194; 
 Thu, 25 Aug 2022 05:32:20 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 p18-20020adfce12000000b002253f18d87fsm16244342wrn.96.2022.08.25.05.32.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 05:32:19 -0700 (PDT)
Message-ID: <3efbdce4-fa39-43fa-8158-a0404338edd4@redhat.com>
Date: Thu, 25 Aug 2022 14:32:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 43/51] tests/qtest: npcm7xx_emc-test: Skip running
 test_{tx,rx} on win32
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-44-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-44-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 24/08/2022 11.40, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> The test cases 'test_{tx,rx}' call socketpair() which does not exist
> on win32. Exclude them.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/npcm7xx_emc-test.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>


