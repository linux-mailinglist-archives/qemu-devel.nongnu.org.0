Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50063D4DB1
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 15:22:33 +0200 (CEST)
Received: from localhost ([::1]:55224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7e5Q-0002p2-OY
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 09:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7e4M-00029L-2G
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 09:21:26 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7e4K-0007pv-Cv
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 09:21:25 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso4318914pjf.4
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 06:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d2/4624cnC7PlfzzXleej5DvT9JGDQb8z7g1XxXZ9nk=;
 b=Om6dDv8HmIwxWRUvHPM5M3lwQJN4OydeyHD3J11xTPlwVr6dbZ3kPxrdLeaz0WazFm
 pRg0vqPaIVrZOstud1SxRUcpoJrWv90J+DTbloc+bjZ+8zw5eD47pgxGSsKKrAnoY+kW
 9U/GHSx6qli7srWFT4yo4T6Y3SpHY/k0Oht3mXS+OOfMVtIJPcvQU1/WsVsW/00IZXJS
 D2pndILufvYmNp/2ApIGDrwmnRLKGhJOyFgZE6oe3R47Fu852wtw0GUUalpdXsJbmBoo
 +UiTrCvRISOGc0iolY2nFIk5MAnmIKbWb5363bC92Jmjvf9Xiejpm+PDwq5uZI73vlsK
 aJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d2/4624cnC7PlfzzXleej5DvT9JGDQb8z7g1XxXZ9nk=;
 b=qigLxgCilCWeckvYnP0tt1jWI80hZkON8yLLD+7ttIY7mS1er66/Cu5xnYKdhIuBZV
 y5Yf+3KiRry/L6YjsUn0ydJ9jrlLeoJkfKntFy5COLxi419jWfZX3Hbc0vgWFFwI/AGI
 exdzxbKu7leBLFEOcjBWEi1dKlT4+zHpC6Fe2FDDl6vgDgLiJQ8UJXytSK0MTd9cueIs
 ZVA0koqy2EXxoHIaNRXynxW/T/WZMVzC+NRRdx1vOJ+kYhSRTEsMJ5NR63hCrHt/kM/s
 xSkwGi+vSBwh6XFrZZucne0ryXi9bg+aRDMEFYtuEkIeN/nr2KVVNkZzKdZ1dZ3u1g2i
 eZ+w==
X-Gm-Message-State: AOAM533r1qA66YUS715L4CDQgQDMTM5oTKnkqS1CjcQpsAyPpHYEcbcB
 pZMBbmKXt4/Cbb2U7dPhNTozQg==
X-Google-Smtp-Source: ABdhPJweS7pAxhE/lMgMOdIomy1wsWdLiNxoAwIfHzDY9UkRAjdu5FKa/MCMkAnR2lcpCkqZnSgOtQ==
X-Received: by 2002:a65:6110:: with SMTP id z16mr10120117pgu.152.1627219282041; 
 Sun, 25 Jul 2021 06:21:22 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id d2sm40376081pfa.84.2021.07.25.06.21.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 06:21:21 -0700 (PDT)
Subject: Re: [PATCH 11/20] Hexagon HVX (target/hexagon) instruction utility
 functions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-12-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e6275f42-7dfe-2eb2-37ff-bb60aec15b8b@linaro.org>
Date: Sun, 25 Jul 2021 03:21:18 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625528074-19440-12-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.091,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 1:34 PM, Taylor Simpson wrote:
> Functions to support scatter/gather
...
> +uint32_t count_leading_ones_2(uint16_t src)
> +{
> +    int ret;
> +    for (ret = 0; src & 0x8000; src <<= 1) {
> +        ret++;
> +    }
> +    return ret;
> +}

Not related to scatter/gather.

Also, much better implemented as

   clz32(~src & 0xffff) - 16


r~

