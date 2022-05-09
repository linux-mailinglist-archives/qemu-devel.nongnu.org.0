Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FFA51FDA9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:13:41 +0200 (CEST)
Received: from localhost ([::1]:46490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3Cm-0005Gi-Nb
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2va-0000mL-GU; Mon, 09 May 2022 08:55:54 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2vY-0003Rm-Ts; Mon, 09 May 2022 08:55:54 -0400
Received: by mail-pj1-x102e.google.com with SMTP id x88so1530901pjj.1;
 Mon, 09 May 2022 05:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZZQ9FkloxtlckcyMzDbyTeJk0F0YPUSf+sX0FbU7bqI=;
 b=Wtqkln28HOAKWeWlngfKRc0Y7XltxZdnmpwddOm1AVhu4SuTFHt56WOHDMtsE6Q6QT
 oisNjF+zJx290GUYsWHTy+8ZP32nlYuwHRu2pnudavMu7d4EpouNjk3JiaeyWlNqbjF+
 nr1Ng68nK4mTF1AcnNUCFWqgz74CdYHZVVYwQV0PQJqSr/4b9aylxqnULSXfVV5hJPmS
 FYUPDXXOydPB989h2yOHDUd4GYB92k/mWZOCUZsrrcaCtPyi+uu+XwmSbIymsza7l6BU
 jx4YIAE8z97e/tvJ6+hV/2BHmw0nNpExlGPcfM5bByVgS7IHo676BFLzFnxDRomGc9FU
 je+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZZQ9FkloxtlckcyMzDbyTeJk0F0YPUSf+sX0FbU7bqI=;
 b=oDUxSpMBaV3fSv5gngO/3OtE7+oTNoHcv7KUHT5w2D1Dg7Uf6e/wwLjtl6rU82gU0z
 PolTTpxa8zcvAaV0Nl1ou2OeA2+hmhlkpe5kaPtN9hi0Kv4ZNKSPb7Fz+iT4apCbcZH6
 WOmEZQQI7LVrlZBnTpRc1qR/OjoxphE4ZtweDMd6CcReTgYkk8H0t0/DwakHLmZTT7ub
 SFVmhpk1yruoQWThRaiOe43X1eX8IOplNOhV2vSIrvQJekqzcPN0aERrFbOxMOiSGABx
 qtjPZjAh5oNjbtQhlzjtxHB+XTP75jQCnTxIe6RtPT+cnmMgIvG4HL6OZtq2ge4j5QqR
 zSrA==
X-Gm-Message-State: AOAM532Rgh180XA6DMxjo7sftmOcgi6Hcv0/xj7oEOO/t19o6C8ag2Up
 +/vDlX47bqaLpSPuMTIjV3o=
X-Google-Smtp-Source: ABdhPJxBjQ+LgPGg6t97HLwnC83/UUzba9w9e6RqFvV0zc4u4rJkNDphwSMB01rmLLBRLCZeXrHRig==
X-Received: by 2002:a17:902:d507:b0:15e:9045:c5dc with SMTP id
 b7-20020a170902d50700b0015e9045c5dcmr16377896plg.138.1652100951172; 
 Mon, 09 May 2022 05:55:51 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa783c8000000b0050dc762818asm8565490pfn.100.2022.05.09.05.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:55:50 -0700 (PDT)
Message-ID: <0be836fe-742d-e4d0-b2c4-19fca1171950@amsat.org>
Date: Mon, 9 May 2022 14:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 03/11] hw/audio/cs4231a: Const'ify global tables
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
References: <20220505161805.11116-1-shentey@gmail.com>
 <20220505161805.11116-4-shentey@gmail.com>
In-Reply-To: <20220505161805.11116-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/5/22 18:17, Bernhard Beschow wrote:
> The tables contain spcifically crafted constants for algorithms, so make
> them immutable.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/audio/cs4231a.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

