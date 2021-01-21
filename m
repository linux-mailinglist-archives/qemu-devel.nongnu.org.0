Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDB62FF5CF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:28:38 +0100 (CET)
Received: from localhost ([::1]:54996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2gZJ-00028C-NS
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2gYO-0001hg-Fh; Thu, 21 Jan 2021 15:27:40 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:32769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2gYM-0007AE-Ve; Thu, 21 Jan 2021 15:27:40 -0500
Received: by mail-ed1-x536.google.com with SMTP id c6so4093344ede.0;
 Thu, 21 Jan 2021 12:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oMvVL1Lu7AD1uYUS2/jecpUu9ul0KAUMMVu3woq/YQY=;
 b=J+vohOxsMv0S6yy8cPw5t91i8xsFo7AsOTwAwDV/0dGdmOVCCai480jPJiDTQtrvef
 5fHCLzPfhJHcjU4SjwRxfxiFLpI3l5kQHtqDg3EExSBkf8JlDnPJtHXwM5hUZt3yhjYv
 Mow4wpnpGWYDtD3BUA5UJQf3Wng3EA8mbZ6yDe/s9JRtq1q7mulz7+BcMZ4+SxRDLvby
 T9+C+X7g5RDvVn8Fr2l8tab2mOjvz5teM0oInS9ABLzLiua9Lgb+XQLJzorwFMW8gTce
 xLO0mB0LTVeKF3zY5hF84z6cBGaHyn41FnOe6lmFezfxSgTi61VoFD5vi1Df2b77ja3b
 Pe6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oMvVL1Lu7AD1uYUS2/jecpUu9ul0KAUMMVu3woq/YQY=;
 b=emRGcWCrKbaINrDp8ELilIqMT80BH4ed6NALbm6JQ/dR+UAySDvdz0bUPspCjTnzVV
 nCt3OFcB0QfX/yNrjiWzwF4ckdZOJrvbMqiArJJTshSHXdu7JFmRU09GfWjqV8Iem8ky
 ymmYYvaSNdy7N5XhWj8P9JML04uBaV/afv4ZWcbhGK/5NTC+rq2R5FcZvDMcBdny8Fml
 yyfVR8+eKBjPAN71BXXFsOqT+4kSbrbaoGhjTfVAadaDg2pyIL2BVVmpog1pMS50NnsZ
 xKRMxztV4Rrb6DBv9CmcoMULiNpPOEOqPcAJFEpKomHMxnwq9PXAfdiLPdWgXhST1Mh3
 crrA==
X-Gm-Message-State: AOAM530hw/k1V0ROZh9ZdER5qIl/yVB272iHthP7Itt4JOv2iLLgA/7y
 yx+MkIz32JOjI55pkosiPm4=
X-Google-Smtp-Source: ABdhPJyd6ihm22RlHwcwL602KhDdwT5CYMEEZUcxaiVdN4njLnZ+nQkPJpHam43zBCi4CiB5v7zmUg==
X-Received: by 2002:a05:6402:3487:: with SMTP id
 v7mr751496edc.68.1611260857186; 
 Thu, 21 Jan 2021 12:27:37 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id bd5sm2868776edb.86.2021.01.21.12.27.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 12:27:36 -0800 (PST)
Subject: Re: [PATCH 09/25] hw/watchdog/cmsdk-apb-watchdog: Add Clock input
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1bec0b11-e749-6e04-17c8-373872f4bd60@amsat.org>
Date: Thu, 21 Jan 2021 21:27:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x536.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 8:06 PM, Peter Maydell wrote:
> As the first step in converting the CMSDK_APB_TIMER device to the
> Clock framework, add a Clock input.  For the moment we do nothing
> with this clock; we will change the behaviour from using the
> wdogclk-frq property to using the Clock once all the users of this
> device have been converted to wire up the Clock.
> 
> This is a migration compatibility break for machines mps2-an385,
> mps2-an386, mps2-an500, mps2-an511, mps2-an505, mps2-an521, musca-a,
> musca-b1, lm3s811evb, lm3s6965evb.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/watchdog/cmsdk-apb-watchdog.h | 3 +++
>  hw/watchdog/cmsdk-apb-watchdog.c         | 7 +++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


