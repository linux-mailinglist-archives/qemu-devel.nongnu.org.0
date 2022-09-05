Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E84C25ADAC0
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 23:10:31 +0200 (CEST)
Received: from localhost ([::1]:33116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVJMV-00073z-2m
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 17:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJJW-0003jv-7P; Mon, 05 Sep 2022 17:07:30 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJJU-0002IJ-G0; Mon, 05 Sep 2022 17:07:25 -0400
Received: by mail-pg1-x52b.google.com with SMTP id r69so8914756pgr.2;
 Mon, 05 Sep 2022 14:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=3cje6uTO0v5sT7fwp6ARvf987BH3oN/3AOEDYn/lX4w=;
 b=SX2+O++fN2GzDfXo7VY9l0MYjNr1xvSOPiNHyvmcOqoOT06MonQSiaSjPEF4EIr0kh
 RgjlZd1L6PB8kYCbzo0CKvDoWW7nuZ87mBGNNACExxhERmuiXot7ukJYqPVw92YlYwK4
 sfp5m27b9ItscodMSAkY9Gq9BPahcep154lj1PFsabKSMIrGD/MWuTCoiAfJhdDMJVW1
 2kXYDr5Qu0l0+t4SYZ75S9lXehuAoexck3L1dojYJSI5njmvbSLCew/DQTlBtH12ZQyH
 ZxQfmxEZxTFWZaFEmXjB5P/SDKVTrWzAHZ+hAX3EdwZIHuWVanYoHaqGVJmTEZX9eyEZ
 6KGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=3cje6uTO0v5sT7fwp6ARvf987BH3oN/3AOEDYn/lX4w=;
 b=AohAwG/mHW4oRF+RgpkXqnvXQwx3q5UKfNUvTS2A30PTicG7eDIDPclsqFqepIpw1i
 0pQvRWBagSFbACXzb34bU7KBkn0p+3QYIOAYhN/vHB+zBIkn5rMbYQWEJDg+xjx/Nba6
 1bjYnETXUEcXGeyKXMDSzZG3QYbaIHR4yYiSSC/HGSqr7ZB0wyuvqGPAcStC3sZ/gdv/
 PWxIcOnq4/4zNqIV4UT5cyrnqhSaXvgjsXWUcpo+ETRDRnAVM3dJy6NPr3zEDNpV0OiD
 7cAqRFxGESespe8rCYC3VS0zzdQNcKWoutGkXllum/40ELE8LbJOlqbL0KMxIu02wXnV
 zISQ==
X-Gm-Message-State: ACgBeo2Mgx2ECysRDlGZEUBlrniHkE2rWUpiYRjqabrR5aMQGtSnylwF
 LRnihx3uDyL/G18/qZF4+bs=
X-Google-Smtp-Source: AA6agR5w83kGlauWhd+SvFzUsZ26Q3g0wXeuZDR/nsYN0kVjyxAdzihfn8b8bBXqls3w6La9C7Egrw==
X-Received: by 2002:a05:6a00:bd8:b0:537:ea87:45f3 with SMTP id
 x24-20020a056a000bd800b00537ea8745f3mr47553889pfu.55.1662412041686; 
 Mon, 05 Sep 2022 14:07:21 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a170903230700b0016d785ef6d2sm8026012plh.223.2022.09.05.14.07.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 14:07:21 -0700 (PDT)
Message-ID: <0db0dc36-75be-514a-47a5-d050a958932e@amsat.org>
Date: Mon, 5 Sep 2022 23:07:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/6] accel/tcg: Rename CPUIOTLBEntry to CPUTLBEntryFull
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pbonzini@redhat.com
References: <20220905202259.189852-1-richard.henderson@linaro.org>
 <20220905202259.189852-2-richard.henderson@linaro.org>
In-Reply-To: <20220905202259.189852-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/9/22 22:22, Richard Henderson wrote:
> This structure will shortly contain more than just
> data for accessing MMIO.  Rename the 'addr' member
> to 'xlat_section' to more clearly indicate its purpose.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cpu-defs.h    |  22 ++++----
>   accel/tcg/cputlb.c         | 102 +++++++++++++++++++------------------
>   target/arm/mte_helper.c    |  14 ++---
>   target/arm/sve_helper.c    |   4 +-
>   target/arm/translate-a64.c |   2 +-
>   5 files changed, 73 insertions(+), 71 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

