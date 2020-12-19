Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42212DF149
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 20:26:18 +0100 (CET)
Received: from localhost ([::1]:55268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqhrt-0001KG-UT
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 14:26:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqhQH-0006MY-K3
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 13:57:45 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqhQF-0005Fu-6r
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 13:57:45 -0500
Received: by mail-wm1-x32b.google.com with SMTP id y23so6693824wmi.1
 for <qemu-devel@nongnu.org>; Sat, 19 Dec 2020 10:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zK12kk+a7a7KVfOLjwpYtIcPrMfKXbkiTHJMy6YoCPw=;
 b=f6wiuNWXT3FHxfq90Tav7nQXvsooPgBoExbSAlPOSINnqJ7TEAznZJRyIPQwcSD6ny
 TgjEwPPOkVOwkdwm4H2HJ9tFv2CIVJIKHFMPEV8ge8jGrGtmsNnnYH5GP2L4lH2NpU2B
 pqysbwFOPYqi72lkKupPwymuqUPtSnjlELgs+Wq8JesUIDRKPV7xpJaL8shNZHsTy6TA
 Ba+ZeeWTg5So+yswpG4rIvbJtIVjQzdddGhtY7v9YCDChW+w+I603OvSna/1XEvpHVSu
 tR/4l5FRUgWww7xlmoHZz2WQitpfe6fYJVeyLh6+8KMgfZ71xEnXeD7gOrB8WV3ct1qm
 4nwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zK12kk+a7a7KVfOLjwpYtIcPrMfKXbkiTHJMy6YoCPw=;
 b=HNjFUtWVNsEZau4HdjqwTXJ7x3UhfFRucDVfyMnmW+Ddwahtg7sDQIM12VhGEaRLX9
 AJjNIjbEGHQjHNgaqIss54yAuPPvobdQYrX6Gpryhl0fRfriFFoFfWz9W0WEf5KI+qJQ
 Gwzr23Q7LacWeikXsWbTkkwpqe+fShA7961fpY4A091DLByjLW9G9RAkR8gPfbVykmQY
 4K//WMYu8F/D989FReGbcdWCyPlJTsKI2ulV+dL3qM7xzbXLhB8/4tCMQmw9FMB1SPNB
 Nk5DMcRKHLm4aZs8rGxYYiptRmW9pIahIcEO+sQpojOnALWmji3+ajV9fHhZG7SpItwq
 H9Hg==
X-Gm-Message-State: AOAM531xC6zhk8z14JgLOFSdMqYSrTDZ7ovyN36RUdozIVLylaN/0+Qx
 czeSrsfP+IjbwYivHApNPCo=
X-Google-Smtp-Source: ABdhPJzFeMMrTbiNg2IOizM0Nip6s0/3pFBP1iPkwUeb5HRVyGP2Isng9NpayRUTSOuXAKPkr+v8iA==
X-Received: by 2002:a1c:2003:: with SMTP id g3mr9289112wmg.136.1608404261784; 
 Sat, 19 Dec 2020 10:57:41 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id n189sm16196705wmf.20.2020.12.19.10.57.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Dec 2020 10:57:41 -0800 (PST)
Subject: Re: [PATCH v2 8/8] tests/acceptance: Test boot_linux_console for
 fuloong2e
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <20201219072326.40157-2-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9eb8f7e8-5d62-30cd-301b-abd9ea61b75f@amsat.org>
Date: Sat, 19 Dec 2020 19:57:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201219072326.40157-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: chenhuacai@kernel.org, wainersm@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/19/20 8:23 AM, Jiaxun Yang wrote:
> The kernel comes from debian archive so it's trusted.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  tests/acceptance/boot_linux_console.py | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

