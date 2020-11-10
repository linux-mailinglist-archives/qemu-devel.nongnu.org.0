Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDEA2AD22B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 10:15:26 +0100 (CET)
Received: from localhost ([::1]:58540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcPkL-00074U-Rl
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 04:15:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kcPjQ-0006VS-QX; Tue, 10 Nov 2020 04:14:28 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kcPjP-0004vb-1Q; Tue, 10 Nov 2020 04:14:28 -0500
Received: by mail-wr1-x442.google.com with SMTP id 23so11820568wrc.8;
 Tue, 10 Nov 2020 01:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LaIMM+DqIVWFrcocxgclUIO+odOJpMZBEYnQpJfjBCU=;
 b=guDLdIfSg8sESssdoF2eYG/cl4FjtmCh85LAvRvyeady9KwvbVQzxiphuAj1GTg0dg
 c1aGBcinPwr/YAtBTwTCgn0C3XmYHZyAOxNpl0fhEPuEJvZZQ0Kp2H0w3sUSDtGxmy8a
 ZvyyvX8Dss6V7LzdK21s0MCdTT0gNcXIY+A2vHR87ZFs+24GCtWLaQ4Ia8mmMIy+LtzL
 NIlXx8ztM6dOZzq6EHirEhT7OPWaYoFsDEgN0rQCT6N/xjdFv2QWYo2O6sFHkWHZxW8c
 Kpi+Hvdo+DXkt/NauptHU4ReF0H0Np5PR9JrmyggVksonptKstbTcNNMJ71IcsncvADj
 UUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LaIMM+DqIVWFrcocxgclUIO+odOJpMZBEYnQpJfjBCU=;
 b=GaX4buAF4BYdzWi0YtbCpWlYZCH15nwFMizcT06rMoYyflkhuhLF8T88SrEnprvlDf
 AYo/KZlCmASV5MAj/AIY97AwT/cBBtIcj8XH7RyrV/2Zq8f1q1ZnRiqu0IOOFjjj0DMA
 J0FW1k1/dVSVfDDECLYorCWIMPFrc69plXHh/rg4pN5kPIFeIoTNqdjys45pZc9VrfVa
 5IAGTIDUxayNGr4uFUOD/u/EcM678InzRnh/xqtvsGyf9zfOSLB3+45ookl+RBCszbZs
 NpKckRoNCOLSiwcS2LL4pHVwc/mfVvXosNSoo2KBtx6kLNQgQWi1a7FojzYMEuaJDvBk
 qFiQ==
X-Gm-Message-State: AOAM532va1OCeBEBt63aB3z0bLgBYqK58EDbHWjnwufBuXbkXLgN47jq
 jQjwMy+PRzIeRsX6xmyLmQA=
X-Google-Smtp-Source: ABdhPJzVj+DFEBGnixZM+SRxfLlxp23t3NY5L2vrt4V4xYaxkS4tp4Xjn/AnKeNPlruhbzg8oq1c6w==
X-Received: by 2002:a5d:4883:: with SMTP id g3mr22857087wrq.19.1604999665233; 
 Tue, 10 Nov 2020 01:14:25 -0800 (PST)
Received: from [192.168.1.103] ([151.33.227.77])
 by smtp.gmail.com with ESMTPSA id t23sm2274573wmn.4.2020.11.10.01.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 01:14:24 -0800 (PST)
Subject: Re: [PATCH 1/2] ppc/translate: Implement lxvwsx opcode
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <d7d533e18c2bc10d924ee3e09907ff2b41fddb3a.1604912739.git.thatlemon@gmail.com>
 <a1c67758-7b2c-725c-67b6-e0c52a971d67@linaro.org>
From: LemonBoy <thatlemon@gmail.com>
Message-ID: <9096a38b-0b6f-3531-b88b-e1be1d946831@gmail.com>
Date: Tue, 10 Nov 2020 10:14:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <a1c67758-7b2c-725c-67b6-e0c52a971d67@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=thatlemon@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Is there any chance for this patch series to be merged for 5.2?

On 09/11/20 18:39, Richard Henderson wrote:
> On 11/9/20 1:17 AM, LemonBoy wrote:
>> Implement the "Load VSX Vector Word & Splat Indexed" opcode, introduced
>> in Power ISA v3.0.
>>
>> Buglink: https://bugs.launchpad.net/qemu/+bug/1793608
>> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
>> ---
>>  target/ppc/translate/vsx-impl.c.inc | 30 +++++++++++++++++++++++++++++
>>  target/ppc/translate/vsx-ops.c.inc  |  1 +
>>  2 files changed, 31 insertions(+)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~
> 

