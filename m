Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E864B194B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 00:18:22 +0100 (CET)
Received: from localhost ([::1]:35556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIIhh-0000gY-6k
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 18:18:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIIeI-0006wZ-Vw
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:14:51 -0500
Received: from [2607:f8b0:4864:20::634] (port=42610
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIIeF-0002Ww-Ui
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:14:49 -0500
Received: by mail-pl1-x634.google.com with SMTP id z17so3180097plb.9
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 15:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vq3oAay5hY1I8kNiGnd2uH/JmRpBF81A4E3JSlPheHw=;
 b=bHJcdQGQ/FYxVa66n3GNvGo9nqTHKWId34WpaiVxLgDKtee0X3sLeayUR+SgHwMr2Y
 qCAtcDF0xAxOUcAmbzTaoQosgayLibz6oBjig1gpiCNpORSmPc4Om2KgFWCtZcSbHp0o
 tGogM4+z1LW61x1Kzbqgk/JvVQ1IaJ+c7dRmX84jpFPzLO/D69z7Ti22+uxZoy0M6D8S
 32bQR7KrSm4MPx2ElxSNHvYFkOaEonP4dXyF9IsskQIbeUQp+bF4wON95qCBBstXPWlI
 1cLdjISNtovG233fwaeBnJtJnDoT6RHyptdT3WwAMcVgJz6qzvXZ5ZXp076VoTATRyLd
 3Nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vq3oAay5hY1I8kNiGnd2uH/JmRpBF81A4E3JSlPheHw=;
 b=T5spQmSHLnNdlXwNgdJz2py1rRtLBvS10LCJuhQXQQXtSfNur7vkYTk7xADKDsHEDc
 6I9VPZvW0uOPul0uOuffkCdvpV6rOYp/WCq6z23pwVdXZltZtpUmZ1Rat4ZN4eVrwyUs
 RNftajQ0AOhO15tRNBsfROVRz9a6Whf/rqfgULDbVrEgrLtucoM+reQLd83aBwa6PRds
 djvzfLUDFycGkd8T8dyprmh8wjjsD1HAH23bCl2oD0NuB9vvlO46m+ObSeX3iVyfTFUq
 Y8IBvC7avzXP115sfrYMmhNA0OxldjwvdCBFQKiQhPRxSk9cXxzvDVatBwS1lYWq3Qk0
 +h3Q==
X-Gm-Message-State: AOAM531LTszZt+/Gcu0MMLpH2QYwSotfUgYtbBR6LmUtTRauat8txJKz
 14bz5WUVjcr/ZOhBnny7tdlqww==
X-Google-Smtp-Source: ABdhPJxaRfdIq2fylI3D/sIAsZim3IcVj1JIV0lWMpCi+Y3ikmo7GTaf2TFObE+Sjj1WrhuZ+e2oPw==
X-Received: by 2002:a17:903:1c4:: with SMTP id
 e4mr9765362plh.147.1644534886592; 
 Thu, 10 Feb 2022 15:14:46 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id g12sm23443121pfm.119.2022.02.10.15.14.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 15:14:46 -0800 (PST)
Message-ID: <64b84847-5d18-4713-e383-a1185937addb@linaro.org>
Date: Fri, 11 Feb 2022 10:14:40 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 6/9] exec: Define MMUAccessType in 'exec/cpu-tlb.h' header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220209230030.93987-1-f4bug@amsat.org>
 <20220209230030.93987-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220209230030.93987-7-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 10:00, Philippe Mathieu-Daudé wrote:
> To reduce the inclusion of "hw/core/cpu.h", extract
> MMUAccessType to its own "exec/cpu-tlb.h" header.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Not keen on the name, unless you plan to put something else in there.


r~

