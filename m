Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0B94BDA08
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 14:54:37 +0100 (CET)
Received: from localhost ([::1]:47220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM99A-0001Lh-Cm
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 08:54:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nM8nx-00082A-Mj
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 08:32:48 -0500
Received: from [2607:f8b0:4864:20::42a] (port=43776
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nM8nu-0007mX-KF
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 08:32:40 -0500
Received: by mail-pf1-x42a.google.com with SMTP id d187so8855590pfa.10
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 05:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zxg/QNpkkNtlpTb3PeO7y5ETwpcinicYAjBgTN7fgTU=;
 b=SPirq9HoGp0WFTUQP6qBwmx+p9bxGG637FU7evk9RokiFpkQpqQLFfniW8NAl6JcwQ
 4k9+Nzas0vqqwnTevCFUyM52cY06u0Xh8BytnM2vIIOG6STM41b9KvygYZ8NdHbClCcm
 6JqHct21e2Y5ZHrp+7j4plPS7Kv5X0lKR+TuBHo54SiSaA0kAJIogOKFXXQ4ThDMUGS5
 rhx1H38FstCpB2ZYPmzmiPzQ8sK082/gEnswndMRfD54RuKoooniaj37QADDZ+yyeiWt
 sqB/PCQmgJD2c+XNf3CHhQJzs0JzWfHy8tZvEbsJWXp93NpmquA2c8kEgA7AovtXpz+F
 1ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zxg/QNpkkNtlpTb3PeO7y5ETwpcinicYAjBgTN7fgTU=;
 b=eMYGdtYA6eBguFAvB9c5ubbEpp7C9ILHNJ7IEc8MABRmTPh7hg+gpzEDtU4PCtzR39
 VTevEsUsqExu5GtUu2iNWzaah2uwKF05wlwvPFnCKneXvkJGlxFuDsewOl8vOFTk1RAV
 7EDdqWJXWoiIss6rxkgVchoIqudZz1s595L90sEwPtvy4wezcVF1xAcRehJ6otZ1hqQJ
 v/tLHjxaymK0S2aYvYrmDCH5WQggRgWTPN2XsQDezwh6knUorWbvR/ooTsgjjeWcQDiA
 oNAPvP0ksh1uEtxdn+rAer54VEQy9fmh0I60aUPFdyhVcMpnTVjNJVnqWrTSaYsyY5tc
 W6eQ==
X-Gm-Message-State: AOAM532auFJbX7fnYb3Dicc5V+fCIFVkPi8Cz5DVyYGdGynz4poEV6pY
 Xfby3+AGi4t9001bCRn1fSmZzEYF9iQ=
X-Google-Smtp-Source: ABdhPJwR09HmgF3mou7tsE8MHrR+iGn64ltC5kym5WXYWV0xvI67YKvQjTi77vlKPMdCPfNNKh9LKw==
X-Received: by 2002:a63:2314:0:b0:370:5429:84ed with SMTP id
 j20-20020a632314000000b00370542984edmr16286442pgj.469.1645450356103; 
 Mon, 21 Feb 2022 05:32:36 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 k22-20020a17090a591600b001b7f9cf30desm7638823pji.36.2022.02.21.05.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 05:32:35 -0800 (PST)
Message-ID: <89be0672-87e4-b0dc-5b36-0ab05f100e8a@gmail.com>
Date: Mon, 21 Feb 2022 14:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH 2/2] hw/misc/pvpanic: Use standard headers instead
Content-Language: en-US
To: zhenwei pi <pizhenwei@bytedance.com>, pbonzini@redhat.com, mst@redhat.com
References: <20220221122717.1371010-1-pizhenwei@bytedance.com>
 <20220221122717.1371010-2-pizhenwei@bytedance.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220221122717.1371010-2-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/2/22 13:27, zhenwei pi wrote:
> QEMU side has already imported pvpanic.h from linux, remove bit
> definitions from include/hw/misc/pvpanic.h, and use
> include/standard-headers/linux/pvpanic.h instead.
> Also minor changes for PVPANIC_CRASHLOADED -> PVPANIC_CRASH_LOADED.

It seems to fail to build, missing PVPANIC_CRASH_LOADED. On which
tree is this patch based?

Do we need to run scripts/update-linux-headers.sh before?

> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>   hw/misc/pvpanic-isa.c     | 4 +++-
>   hw/misc/pvpanic-pci.c     | 4 +++-
>   hw/misc/pvpanic.c         | 5 +++--
>   include/hw/misc/pvpanic.h | 8 --------
>   4 files changed, 9 insertions(+), 12 deletions(-)


