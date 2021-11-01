Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FC0441D90
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 16:45:31 +0100 (CET)
Received: from localhost ([::1]:44858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhZV4-0006wA-FL
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 11:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhZTd-0005MA-HE; Mon, 01 Nov 2021 11:44:01 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:46046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhZTb-0003fD-US; Mon, 01 Nov 2021 11:44:01 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so212361wme.4; 
 Mon, 01 Nov 2021 08:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MlQttHH2kwAIsvb++LZ+eOLjccVMnfe3l7uqnBPxmYE=;
 b=dtvISIjrK7/iZAGr6UXDK9RurissNjZsibQdaza643atfYwMKmuagVcIGN2faTVSnM
 HPdBfvYwRSHH3V3ojWJjrDCOzZMux+RpHa4kVKqB1IVagdgGPd7Oa/oQU/rJag/ksqlP
 7AsyfdQZgDbNJxS/N3F4lEnMp/oj7YTrlNoRu1U8s/PVn95Wc56Q3/q75jR53GbbqfeI
 YVEu//aY3gb9zCBHO9I0USvhO0EQ6c6Y/z3PC5BY0Un1C9sQloX6ca4BdxwPUHga+kUg
 kvrddQmeRIPo40WLucSdBbQKQOs3yEv3gdwepE1NDx76TjCqUSgH9HRDTpNFS8YbK3j6
 hFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MlQttHH2kwAIsvb++LZ+eOLjccVMnfe3l7uqnBPxmYE=;
 b=WcdFC6RrpjBUlocAKKU2/qNs3V3R/twDkH91ZhwOT22UBu3uo/xoVus2vc/hqeB4lJ
 xKj2dfPnlIOM8+aEB0hxz+2q43945/bOpIZq2lVcp/2G3w1cwVAaO3wtyelgl2k0gMHU
 253arlZq3fdt3d1s3lU2SftKQ6656wiQoUQeV7nRno72UrQU+aCVZ/kEj2xcUFLN5EEw
 rwO5dq5c+V+8jtcV7ZYcdDDumlQDO0v6Wm0jnreoHwJbUHEOYs42hYDmAoAo//B7bYI/
 8Z8J5yfppRrSepyvH3DDOQO9M4B+IVgl41OIpv55nM63XEXjVYwErmz26RmEDNmrWH5T
 6gXg==
X-Gm-Message-State: AOAM531NzQfxBfAX/Xz8yFmQcJz/CHLHlOdLL+QNvZTghDBdnNVUngIY
 +mzkNK4Gyk/YapH/FYZNQT4=
X-Google-Smtp-Source: ABdhPJx4fuJry0SB4u6Sm7Wh7s/3Dt8lRBF9NsS4YzuY3eD8L4ZA8Ah5bu1XaOXFrpcT66Ilhpt8BA==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr32013388wmb.78.1635781437755; 
 Mon, 01 Nov 2021 08:43:57 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id e18sm12818711wrs.48.2021.11.01.08.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 08:43:57 -0700 (PDT)
Message-ID: <a62209b3-340d-e24e-b5a1-0a50accb487f@amsat.org>
Date: Mon, 1 Nov 2021 16:43:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 6/6] hw/input/lasips2: QOM'ify the Lasi PS/2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211101082747.2524909-1-laurent@vivier.eu>
 <20211101082747.2524909-7-laurent@vivier.eu>
 <04704da8-24c5-25d6-85e1-6f9901f00b24@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <04704da8-24c5-25d6-85e1-6f9901f00b24@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.14,
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
Cc: qemu-trivial@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 16:31, Richard Henderson wrote:
> On 11/1/21 4:27 AM, Laurent Vivier wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
>> Message-Id: <20210920064048.2729397-4-f4bug@amsat.org>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> ---
>>   hw/hppa/lasi.c             | 10 +++++++++-
>>   hw/input/lasips2.c         | 38 ++++++++++++++++++++++++++++----------
>>   include/hw/input/lasips2.h | 17 +++++++++++++----
>>   3 files changed, 50 insertions(+), 15 deletions(-)
> 
> This has broken the qtest-hppa device-introspection test:
> 
> ERROR:../src/qom/object.c:2011:object_get_canonical_path_component: code
> should not be reached
> Broken pipe
> Aborted (core dumped)
> 
> Also, the previous patch 5 does not compile on its own:
> 
> In file included from ../src/hw/input/lasips2.c:28:0:
> /home/richard.henderson/qemu/src/include/hw/input/lasips2.h:17:18:
> error: field ‘reg’ has incomplete type
>      MemoryRegion reg;
>                   ^~~
> ninja: build stopped: subcommand failed.
> 
> Reverting to patch 4 builds, and passes the introspection test.

Thank you for the update, I'll have a look.

