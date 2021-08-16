Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645343ED99E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 17:12:36 +0200 (CEST)
Received: from localhost ([::1]:56704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFeHz-00043w-C2
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 11:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFeGP-0000xk-SG; Mon, 16 Aug 2021 11:10:57 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:41735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFeGN-0003uT-9p; Mon, 16 Aug 2021 11:10:57 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 c129-20020a1c35870000b02902e6b6135279so215493wma.0; 
 Mon, 16 Aug 2021 08:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=88h3na5Wae3JGFzV3UaPER4PrVtMNd+s9mSPPesndCg=;
 b=cx3z7D8N68bNcQmSOfzrQojnx1sSCWHsUpsAYEuZEiF0SS5NJZoGRv0zq66uOjBiYE
 XG41FZr9fuz/tUPH+uWzXf4SqlZZhlm78+NsROKQtAF/LBCSI+RplehOpmZbay5ocA2e
 2u+aISOPjpOB6lwMNbhTB7quhk/eStLqyvw2SgdyrjMv52cH5g4XMZMHLPrKx/pjU9XE
 wRsJXqQL+y2gitCPuuM3IUAjlhWJZ2zJUq0OLNZbPefMI9a5lot59QH9INajqUsGDvXQ
 zUsrT537lzinVLCzSqRavEcHbmjaC04WYJZzI2T8yOt639/c3l0FVJjk53/5VarjK74s
 f0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=88h3na5Wae3JGFzV3UaPER4PrVtMNd+s9mSPPesndCg=;
 b=Y4yVABvSp6Yll3frTp9ciPC/2WjRZhg0Xzc1NkVDVQtEBE2GWCcNC/N0Bp74IplnNf
 rHhFSZgCUMLrhVmg7BEO5OVEeL2iurmHPyFy8h4B7PK5ln/uCGoZzKMSJ0Ye44A6A6Dk
 7p8aQUE3A+Ca0EUiMKn7ZZIPf6xU5sOL9UBiyaRO0btpoY6td6zddJK02ByN7pVhxhNW
 knVxKolpKrbd1Bzs8cQOw2PIL7ISKv363KHbrOikFWAzT/9mRltqOWuOA/uDT+tOswTJ
 IW81srGDMhq5umvny776k+qzlO1Pkbkebv+S54B9LNihpBqXVqDlDRTioWsfR+nbNAVY
 Uxxg==
X-Gm-Message-State: AOAM5319vgGwMME/+wBVIsWX+h8eAq99IGBqXxLRWe9lCHOD0yasaOt7
 4XCUKTuC2nZasAaZCxnBtvY=
X-Google-Smtp-Source: ABdhPJzZbeSsRTFEDpSpuOSuyV0VqDVxwg2Ij0FWtSAYluv5UdxvycsnP9zPjHBeHkKIUtvvE9iWwA==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr15875701wmc.150.1629126653669; 
 Mon, 16 Aug 2021 08:10:53 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id k6sm12183686wrm.10.2021.08.16.08.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 08:10:52 -0700 (PDT)
Subject: Re: [PATCH 3/3] hw/arm/virt: Delete EL3 error checksnow provided in
 CPU realize
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210816135842.25302-1-peter.maydell@linaro.org>
 <20210816135842.25302-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6d45d23b-c536-6c00-b9e6-5c1872aaefad@amsat.org>
Date: Mon, 16 Aug 2021 17:10:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816135842.25302-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.71,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 3:58 PM, Peter Maydell wrote:
> Now that the CPU realize function will fail cleanly if we ask for EL3
> when KVM is enabled, we don't need to check for errors explicitly in
> the virt board code. The reported message is slightly different;
> it is now:
>   qemu-system-aarch64: Cannot enable KVM when guest CPU has EL3 enabled
> instead of:
>   qemu-system-aarch64: mach-virt: KVM does not support Security extensions
> 
> We don't delete the MTE check because there the logic is more
> complex; deleting the check would work but makes the error message
> less helpful, as it would read:
>   qemu-system-aarch64: MTE requested, but not supported by the guest CPU
> instead of:
>   qemu-system-aarch64: mach-virt: KVM does not support providing MTE to the guest CPU
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/virt.c | 5 -----
>  1 file changed, 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

