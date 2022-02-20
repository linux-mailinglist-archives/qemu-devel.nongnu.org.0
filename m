Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D48D4BD130
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 21:08:53 +0100 (CET)
Received: from localhost ([::1]:55212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLsVo-0006Yq-59
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 15:08:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nLsUM-0005EM-50
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 15:07:23 -0500
Received: from [2a00:1450:4864:20::335] (port=34050
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nLsUK-0004bM-DS
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 15:07:21 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so7414499wmb.1
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 12:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kObkPtXPmhAaU3BL9f6EUCJfcV8IV1OdIIZLyskZads=;
 b=T94FWFAn7pdOwHLLMNu46ewVMop92SDssFuztgHOqyaDYbOVOZQGFXnqdh/cvbHiPs
 TJB1Dwm5uX4gtz28w+sbQTi4SzkAkcu5IFS81OgJGT5eU6ihg4cR/D4A6sio+94cm08J
 0Kh7prboy5T/SV5wNdtsbjDqbsupBm/fk7ISU+t1Yar8q4ZvI0DSv/5qx8Dw48anOiFG
 YuVBYcL5LBVdqTlEk4ctrVtd8u9L6w9jgMTBLWrOlJbRxZ+KMIHw5E/mPK90aJ7YYAkf
 VJ3wLzlNxlB5NM30cLDlO8/JIgJdbQmdzn5m2gsKGphR9foVYXunfg48R6efgcj5NCzo
 /k5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kObkPtXPmhAaU3BL9f6EUCJfcV8IV1OdIIZLyskZads=;
 b=kyITLYA+t96aeUqN8B4ZzMnZchGTNpLOGzjQNW2xxgoi1gKlaFN6SzYrud4L+l8gYW
 m8fCdbu2j56ElKHYJeMvuozx3cvF/fmTOEhRVt384812VtF5zabkJtuw9wn0VWRVTqZr
 oLu61hjD4TGNaKzlKgxiSSOcS2LZINYAYekeIr6q7KbSXIGRYCkSWjQ9qW4Sam4KbwZn
 7bzF0xpllYClWI1/e8yYAyazA88lC6PH+NzoqeGDglqsl24DrtajJaKMJDnTrWDWEF6E
 4qtjfVXTUSwahJdnpOlPKaYKFAIpK0rBOS9hzP3A2vbZVDpqiUePcrMlZ9RT3ZE7gX8P
 LcIg==
X-Gm-Message-State: AOAM5338b2vfwm9tBrDS7Yulmg/ULseMzNeZ/GJuHqLQVTnxuWKaOnl7
 4KwZOiObBzSi1Te4JaLKkZi43eNikcs=
X-Google-Smtp-Source: ABdhPJzQmRuQh6NaPRYZaFgwZxFNHGIW4FPSPtpQ66tlyGWoD971QukWbtu4nzdbGiMQk7+9YugsOw==
X-Received: by 2002:a05:600c:2e0c:b0:37c:3615:c52 with SMTP id
 o12-20020a05600c2e0c00b0037c36150c52mr14863667wmf.43.1645387639088; 
 Sun, 20 Feb 2022 12:07:19 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id l28sm50895295wrz.90.2022.02.20.12.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 12:07:18 -0800 (PST)
Message-ID: <d97c3f6f-e155-b257-552e-eebd0d8d2169@gmail.com>
Date: Sun, 20 Feb 2022 21:07:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v3 4/6] hw/openrisc/openrisc_sim: Increase max_cpus to 4
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
References: <20220219064210.3145381-1-shorne@gmail.com>
 <20220219064210.3145381-5-shorne@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220219064210.3145381-5-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/2/22 07:42, Stafford Horne wrote:
> Now that we no longer have a limit of 2 CPUs due to fixing the
> IRQ routing issues we can increase the max.  Here we increase
> the limit to 4, we could go higher, but currently OMPIC has a
> limit of 4, so we align with that.
> 
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
>   hw/openrisc/openrisc_sim.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

