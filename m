Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC564C5F8B
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:47:05 +0100 (CET)
Received: from localhost ([::1]:40696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOSJk-0007nA-OD
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:47:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOSCd-0006fl-Pg; Sun, 27 Feb 2022 17:39:44 -0500
Received: from [2607:f8b0:4864:20::533] (port=40648
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOSCc-0003cJ-GT; Sun, 27 Feb 2022 17:39:43 -0500
Received: by mail-pg1-x533.google.com with SMTP id w37so9859934pga.7;
 Sun, 27 Feb 2022 14:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=o/9a7v6A8wKe8ZxsFiI4UjL5JbnfYRLnVEmHvTO20/o=;
 b=XZDiMZtkaebtQ30wfjjxcnrtUEXMxQr8IWSwb7JVXQGlJeqDof07rjJ2v8ARTmutHP
 UANaLJ0SWZ3mpLFnZOdyZT4KKZruv5eaxYejf0gEqouRAKKGhnKb569C1ZSMXZ4rHnNC
 h9tPVl81mLTSPywdlLbT8u2BBUZq+0Lc5WIgOJk9ponCycRyJIND7nHQZW5+aY0rozf/
 PxFkJUBwFMMgl1jtz/mEkomg1DXjb/jRKatBabjWea+SDidsayWdrn1eCAzCvcE2dJFZ
 VJGwqkBcHLPjNmW70bM947XKQPlkW2ztJRbg6LrS1ki48hRoamQaxE0IHjQAhLxShynK
 s0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o/9a7v6A8wKe8ZxsFiI4UjL5JbnfYRLnVEmHvTO20/o=;
 b=y6UTBBjob23Xw06UebfjVy8EP6wQW+J9/1zx0f+RJa5oQraYRREEl2WUmiQ52UsPDi
 WruHhVkjWWRmT764qovz7Kmddt2p9tQz+709QW2hMnHfJiGuOQyLvVHpKSGXUQUTpDlY
 pcisaE321ut/IwyAjSth58K3I8psFkNDW9YQQR5+9Rr0V2X2HsF0+yMcnD/dxSuFtGEA
 bUAItc+pVas51dU2Rw4jCyke9xS+KWQM+2C29tD5KUaEK9pFXDNYC/0N+DHq2FBD0g4f
 b9BMzg40hfP4TDF0ybuzJVZqeNnKfVq3hxpqItYzWhav7WyKEsY7PyphAPzxL3ACbice
 NKWQ==
X-Gm-Message-State: AOAM530pQv9UwIuy15OSqj8AWxCYL5Gms8ehQi/K26rGKOin8jLV/m6n
 SFiDOLtNvdWfD9twNkXg18w=
X-Google-Smtp-Source: ABdhPJyrxQDRgHn+ind+fwCQga+vSGNL3ExZh1keHd7GCCx5zcuW7qGyrKFQBxkV2gUNAzetJMRcCQ==
X-Received: by 2002:a05:6a00:a26:b0:4c3:d3e:3667 with SMTP id
 p38-20020a056a000a2600b004c30d3e3667mr18371723pfh.69.1646001580873; 
 Sun, 27 Feb 2022 14:39:40 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 d5-20020a056a0010c500b004e1b283a072sm10493434pfu.76.2022.02.27.14.39.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 14:39:40 -0800 (PST)
Message-ID: <48ebd0fb-5b56-7996-3349-5473999728b9@gmail.com>
Date: Sun, 27 Feb 2022 23:39:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 04/22] hw/isa/isa-bus: Remove isabus_dev_print()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220222193446.156717-1-shentey@gmail.com>
 <20220222193446.156717-5-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220222193446.156717-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x533.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/2/22 20:34, Bernhard Beschow wrote:
> All isabus_dev_print() did was to print up to two IRQ numbers per
> device. This is redundant if the IRQ numbers are present as QOM
> properties (see e.g. the modified tests/qemu-iotests/172.out).
> 
> Now that the last devices relying on isabus_dev_print() had their IRQ
> numbers QOM'ified, the contribution of this function ultimately became
> redundant. Remove it.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/isa-bus.c           | 16 ----------------
>   tests/qemu-iotests/172.out | 26 --------------------------
>   2 files changed, 42 deletions(-)

Also the ISA IRQ is now displayed in HMP (the human monitor):

Before:

(qemu) info qtree
        ...
           dev: mc146818rtc, id ""
             gpio-out "" 1
             base_year = 0 (0x0)
             lost_tick_policy = "discard"

After:

           dev: mc146818rtc, id ""
             gpio-out "" 1
             base_year = 0 (0x0)
             irq = 8 (0x8)
             lost_tick_policy = "discard"

Maybe worth mentioning it in the description.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

