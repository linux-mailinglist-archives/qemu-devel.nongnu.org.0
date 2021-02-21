Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBBD320A97
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 14:36:59 +0100 (CET)
Received: from localhost ([::1]:47334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDouw-0004bK-Ng
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 08:36:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDosE-0002wx-Gl; Sun, 21 Feb 2021 08:34:10 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDosC-0001PN-DA; Sun, 21 Feb 2021 08:34:10 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v15so16222348wrx.4;
 Sun, 21 Feb 2021 05:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W3Tdmuul5Cs4K1EGUI7N/Ng/a7QaIyQ3aVKntq5AeHo=;
 b=L6/6SD+KDtRW1C9LqSn2KBQj8Lsa9PHnWz6fD+42OxRgwYeI4+mnquKlwYL4MtNthz
 t2RobbgXNy2KD0aF2oOGwb1S4llZJmucG/0kt32M4COiLF5Fa7KAfw/jRRx4hZt28vHQ
 o1AGfaNsHKGOTKas7Y/tHNP42a+DIqXAE0skHGhJgVu/W81HrAfJefJaXZcdLWyjRZ2z
 lKmwPOL0k+8zWopKYb2M42ea+byMKqoBb2/kNpIER2wjJIX6chkmBw5igmcXLi9FiqYq
 W1bd4HpYqGGywkMPShA47AaSQxwKqHzPkqgLABEMNk4Tm34fFBhLRdugg579ZZ6r7K4H
 rDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W3Tdmuul5Cs4K1EGUI7N/Ng/a7QaIyQ3aVKntq5AeHo=;
 b=in7wMjcAPH5MEN/+BQQizAevXvjdYtGQQG9cSYWBtNWKxYv4tS5TjHPn+q5qpK7ixm
 J6kRDmd8zHJce3PGZ/XWoi/cOsouVuD6iobjjrAvPe37YZnntRONEoaWxgRtWbHDBxvZ
 iNp1ugwcI39xe+a8i48W6l+ZKTVz5MEn2yvt7j7V0MY4BcHzmALeAbY2FYyflnOtbNkH
 uueEuoFLWiQFq09rqGkEWQDMGEnavdA7O8Jn4urP301PZ08Ansyrvs9RjmgsBF7dIPGz
 4uym4QxifJlG7Zm9gkKLzB9ksUPjt1wAH+L+j42uNSbbe7LIxnkHMbzlL6EiRpIEQd5v
 jsfQ==
X-Gm-Message-State: AOAM533TScdfy7cFDG1WwtMS6mXzzKp2Hrlqj1X41COaBnZ2oQZ/wWaa
 I2gBQZgZmb8sRSrST72DcGhrlMnqP7o=
X-Google-Smtp-Source: ABdhPJz8LrfCtmFZ/e/csxxh4IdIoY13nR+PSb4Cvcs7SLktdezuL6RM11TGhv+dbEtMwEqmUgtjvQ==
X-Received: by 2002:adf:e884:: with SMTP id d4mr16931848wrm.275.1613914444902; 
 Sun, 21 Feb 2021 05:34:04 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r17sm25272677wrx.82.2021.02.21.05.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 05:34:04 -0800 (PST)
Subject: Re: [PATCH 21/44] hw/arm/armsse: Use an array for apb_ppc fields in
 the state structure
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-22-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9b0bf4b8-72d6-32f9-5e4c-1298d25dbdcc@amsat.org>
Date: Sun, 21 Feb 2021 14:34:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 2/19/21 3:45 PM, Peter Maydell wrote:
> Convert the apb_ppc0 and apb_ppc1 fields in the ARMSSE state struct
> to use an array instead of two separate fields.  We already had one
> place in the code that wanted to be able to refer to the PPC by
> index, and we're about to add more code like that.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h |  6 +++---
>  hw/arm/armsse.c         | 32 ++++++++++++++++++--------------
>  2 files changed, 21 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

