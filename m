Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF25631643F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 11:50:05 +0100 (CET)
Received: from localhost ([::1]:35420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9n4O-00043x-JK
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 05:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9n2R-0002xm-Qf; Wed, 10 Feb 2021 05:48:03 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9n2Q-0001zL-7T; Wed, 10 Feb 2021 05:48:03 -0500
Received: by mail-pl1-x635.google.com with SMTP id 8so978367plc.10;
 Wed, 10 Feb 2021 02:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=z3CAgLKsEN/oAwU+vHwabcCvKxgPjQlFKnmFyOSQWfQ=;
 b=AqDjtvkBMlAldR8qCxSM1qiDbInNtMC37XmEWIdIq5cnkPVpMHt83N5+YtGTihXK04
 +Jlnv0Kz1xoVlrodEjNpvUL+VIEVb7CmUy/WdrR7vkwrZ1CHvCN3HkPPvbGCTrCWoA17
 3vn+gBkdGjNlzMjAgaXcN3fMOz0n1fcyXbcDqPoQUNkP9chAMakACMhGTg/iUQEDhXee
 NpNN0kb4MWxzKUho1qQKEPhWC3P9N2s/U1pJg0T7C7canXEpAOHLUokZO5Y+RI/M9zyY
 CVDW3+r1qraOGJ8BN0oL7acYoQ3YvRN5B6zulxzeZoac9WuHjOcSNliDT9EdA3BIcCDV
 jXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=z3CAgLKsEN/oAwU+vHwabcCvKxgPjQlFKnmFyOSQWfQ=;
 b=Xpq+hIwifc9oAC8igVQVv6JNyyPSbbGSSlpiA95mRz2C/hwJN5sc2gtYdBjzMiTzMl
 OTfKFfTE/u4vOcVBfl5xBRKvBvXcpsLlENzhp6El2eFkjdYQ4f6ws5gsIK2iW9kU0h5b
 YQxk7EbmLM4NxiVqNhMg/ruNgthOw/PhVImwZZpGbmNEcFqPyeFaxyRQwNq6MdrR+h9x
 RthMoSmhF2QhvhXmiTXn4wdjo5h8lsikqqabPV963TFtvYQrvp9zT4msTzg93Z7nHRFf
 /rkcJVJwmNb1BOpH4CzTb/t8W7iiz7Rckdk8QqySvjWuO9VeoGIOMbV2q9BAMd8qsyA1
 bAAw==
X-Gm-Message-State: AOAM533Hzzt33E8kzGqKt09tN+tgaml+qBHkhNLb3VjWAsPfnxqflEaA
 EoGFWB/vUT2kOucsV9uyhL4=
X-Google-Smtp-Source: ABdhPJxOsgbA/Xw4qA7GCcJk4vk+sa55fAQlgfQdgIeVaxCtWemB7mFfzsZL8sQDKa6WceWFmomsRw==
X-Received: by 2002:a17:902:728a:b029:e3:530:cc73 with SMTP id
 d10-20020a170902728ab02900e30530cc73mr1675184pll.60.1612954079976; 
 Wed, 10 Feb 2021 02:47:59 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id u18sm1814296pjn.18.2021.02.10.02.47.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Feb 2021 02:47:59 -0800 (PST)
Date: Wed, 10 Feb 2021 19:47:57 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2] hw/block: nvme: Fix a build error in nvme_get_feature()
Message-ID: <20210210104757.GA9664@localhost.localdomain>
References: <1612952597-62595-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1612952597-62595-1-git-send-email-bmeng.cn@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-10 18:23:17, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Current QEMU HEAD nvme.c does not compile:
> 
>   hw/block/nvme.c:3242:9: error: ‘result’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>          trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
>          ^
>   hw/block/nvme.c:3150:14: note: ‘result’ was declared here
>      uint32_t result;
>               ^
> 
> Explicitly initialize the result to fix it.
> 
> Fixes: aa5e55e3b07e ("hw/block/nvme: open code for volatile write cache")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Bin,

Thanks for the fix!

