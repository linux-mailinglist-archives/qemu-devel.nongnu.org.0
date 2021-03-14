Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8997533A86C
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 23:03:52 +0100 (CET)
Received: from localhost ([::1]:42970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYpz-00048i-I0
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 18:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLYm0-0002j3-6x
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:59:44 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLYly-0004xn-LP
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:59:43 -0400
Received: by mail-wr1-x431.google.com with SMTP id k8so4747511wrc.3
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6NjuRnQX/zjgBZs8NjpDQZJqS152ygMtze6Lec41Zgo=;
 b=r3yIwYiUgQX6c4lGsaiPyEKnq6Zedw8uR683bTNYf+Tg5EzP9CXan0nEUXrhzht/57
 Mq+D/7N6KnSdSRV//SSHjg6IAZ3uPpRTDi/ApPr1uaHpIODpfrUHRJU4Fy3ycgUEQ14P
 Flaw2I/pOsNMs6D/4gHF22GKe73GGpMYqlWmmCA76BMGZloMRnjEmT335DgSoeo+ocZl
 0Lsz0IH44wGTImEop8wMIIoKcAldIZgNF5lwF3RP5uM8alwfmGgMi9FDG6ERm6Aysg/B
 wvMhVNfNbZ0WHc5tEQCtFVt+ax1TV9RdPGY1Xsy50JZRuxRkMwh58IhVg4AssdbSunJv
 JT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6NjuRnQX/zjgBZs8NjpDQZJqS152ygMtze6Lec41Zgo=;
 b=C7Et4oj08XFWwMfNN5QZFFwMeSH6iPXUKBfE8Jeqx+jKUZDyiknCMcAonEXsrWJXd3
 aCkcq7simMMr9LdA2RPxfYO2BhjxOyqE7p/eBer9mLD+NClPPk0Oz1wTT27B14aOgrHE
 my4eUUqnV5sxhCBWDpDQb3Ig2q2KjBnGESkbVeWF+xbkvc2GwHCr11JxYs6YxryQzeWC
 1gJH/MAGvZLiApzNxWWWV+0CV36eKe9k/ZAsYvqeGzqB0c/EuwAzOG3ErOpW0RVF3TeM
 m0jfBw/KWwZwdpMnsp3dlbIGpsRyHy+Le3ivYK+W5BjMxVJMw+fp9IqLLbIQjkMHbH2F
 LWgA==
X-Gm-Message-State: AOAM530VcIkie+tnFE3ek1beeAYfYTYVuwNhjZbsA7TjmzWgcisBB7BE
 AJnMxNvDT4hppgIqJYOU+z4=
X-Google-Smtp-Source: ABdhPJzQC/IAvhuI7cG+ra6u1w4HApGOrIvh56+pcSC5u+K/RbOa2Szgno80F02ZfsA1IDmIG8hA8g==
X-Received: by 2002:a05:6000:118c:: with SMTP id
 g12mr24491975wrx.353.1615759180727; 
 Sun, 14 Mar 2021 14:59:40 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id n6sm11939246wmd.27.2021.03.14.14.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Mar 2021 14:59:40 -0700 (PDT)
Subject: Re: [PATCH] include/ui/console.h: Delete is_surface_bgr()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210314163927.1184-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a416912d-39bb-a818-e4ec-85df72c73267@amsat.org>
Date: Sun, 14 Mar 2021 22:59:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210314163927.1184-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/21 5:39 PM, Peter Maydell wrote:
> The function is_surface_bgr() is no longer used anywhere,
> so we can delete it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/ui/console.h | 10 ----------
>  1 file changed, 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

