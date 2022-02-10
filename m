Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71F74B0BF5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:12:21 +0100 (CET)
Received: from localhost ([::1]:37872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI7N6-0005QS-J5
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:12:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI7I4-0002Tr-RU
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:07:09 -0500
Received: from [2607:f8b0:4864:20::429] (port=40448
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI7I3-0003OC-0y
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:07:08 -0500
Received: by mail-pf1-x429.google.com with SMTP id a39so8741326pfx.7
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 03:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iuNbsgglThZLgo68xlho/p9f4cboV4zCZKCdQsDrkTQ=;
 b=DPxvxBXhg5JohUCuibm8ySfibQDa+Fy8egIuzgnBQDPnq/zxPlVoOWwqC4BMis2fBQ
 2DHp07hKR4WD7S+DNdd2cP9v8kkGPZnzHVZpjOlOc3leHd1DZkVBrupoeBo8phUCIP0n
 oTn+Qn8sViiwFSSaN1+DAQ0bSVu2wGcp/A5CvaX1FuVQC8qeNAsf0KEEm9HVaXNRwv3o
 hXrt+nEzM307MFTiu0z6axKCjEnpHdmrAUZnJ84qzyDCBgluhpwmpvt3LzH2mIxpML9U
 okvEG9F0OY5+jrT0T9GXkH6chi/NPlQ0p9JEnC7+BVdjWxEWc6NBP9lVG8Cu2Q8K8966
 pMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iuNbsgglThZLgo68xlho/p9f4cboV4zCZKCdQsDrkTQ=;
 b=QGma5N+dR4WRcH5EDPheJcoWyjTUntEukpi0T1PQTkmL0YgLahpqDWnAfoksOxVEAP
 oitsa7wVlMmaJd1tPvrmjjslPzXdl7cb4BHnOHUqW7BN5Apu0iHOCFOJiIw4zyagSxPw
 hwACRqv31gcPM3PSXlVhHAouqL/jZs9ATmoXNqnH5dLuKhpWlb4XN3wCDWN8LhU455vc
 1+u7V4au3a7jhN3EWLHK5mwI2fovq1RSmaVOm396jhM4lHXvEbquBps6LGPPZIwxWACh
 NtL+CBd/EOgKKyf4gGDlYcNkVsahj/xTScwcTuTYmqjGfYuSeHEwhJP7lxtCTU4qKOLl
 GGWw==
X-Gm-Message-State: AOAM533E05oVcDHiflxeaik10UlTGeVRj5XcwTaENuEtYxlhXg2zZB8e
 ylZUFfDPgynpZH4P9keDyzCK6CSaf6A=
X-Google-Smtp-Source: ABdhPJw3IjkfzspcKd2NX2Qn6ixx4mHMqBhXBus6u1Kt7rir8JlqeyftjQLyxivPEpD5fX6qzjxM3Q==
X-Received: by 2002:a63:884a:: with SMTP id l71mr5703920pgd.589.1644491225755; 
 Thu, 10 Feb 2022 03:07:05 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id l17sm22879591pfu.61.2022.02.10.03.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 03:07:05 -0800 (PST)
Message-ID: <ac0eb0a2-8a8e-c95c-08a4-4dfe07862f9b@amsat.org>
Date: Thu, 10 Feb 2022 12:07:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 2/4] hw/openrisc/openrisc_sim: Paramatarize initialization
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Jia Liu <proljc@gmail.com>
References: <20220210063009.1048751-1-shorne@gmail.com>
 <20220210063009.1048751-3-shorne@gmail.com>
In-Reply-To: <20220210063009.1048751-3-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 10/2/22 07:30, Stafford Horne wrote:
> Move magic numbers to variables and enums. These will be
> reused for upcoming fdt initialization.
> 
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
>   hw/openrisc/openrisc_sim.c | 42 ++++++++++++++++++++++++++++++--------
>   1 file changed, 34 insertions(+), 8 deletions(-)

Typo "Parameterize" in subject.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

