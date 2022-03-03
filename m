Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C144CC0A1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:05:52 +0100 (CET)
Received: from localhost ([::1]:33390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPn1b-0007WU-5K
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:05:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPmzd-000681-V9
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:03:50 -0500
Received: from [2607:f8b0:4864:20::1034] (port=55999
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPmzc-0001rl-GH
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:03:49 -0500
Received: by mail-pj1-x1034.google.com with SMTP id gb21so4768538pjb.5
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 07:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RQkYnnRgAG8it09gE7M+1OriLnS28mGLBFJyrFZ1jhk=;
 b=hSMOxai5pacKNPv0Taj17rn0yy/smG6jQAwGfH4GGvChn/DAXYAOkVBFc4HAql5ete
 vx2O7T65Nk0cmU5VMCRFiD9BQxKeqRYDHsFokHTueF7x0GGJH/zJ9jnXNVOOX6oeaPgE
 NKt01qUmxc7QYDEXKVrFQd79F9VWvjK5RH/eAiAXNT07u9J8mDY0kFWiWEZmi/fVH6eP
 +VIGppZyO+3Cu2bByIPFxPHAOXElEZx/b9pbW5EN75VXskx4q4tDtIsRyTbA6AMORvCZ
 h/RgjPOGt3ApDQH+knVdPatKLSJY8FJaUGJ2cmcaTebYrXKSaLGlNTbwZ4THfNLYdzTB
 cZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RQkYnnRgAG8it09gE7M+1OriLnS28mGLBFJyrFZ1jhk=;
 b=FfbFCSQeowDBM9wp2Y+r3NQkj4JRkJkte+vEqPYIOffogvARshMsLEVHloOa9gM275
 DaQCsssi1R0rjHxi8TQIP8nTsBJ6wn9Bo3+ebC6x/vVHIgr11/QraE85JriM9WvU+sLN
 6PShUMsgQIPHMIl9QMuvfYb/ude82nNYJqkZZzAEveqZL2jri/VJc+xWkuNb4D+PDvq3
 vC4vTla7xLL45gCZHO3mbydzxkGKnafBmxTCSdz+rgyS6icFKYIeGFqMLiYZ2jhBERBr
 Q4XrXXTEiH5iBmFnB6jNUwKNLMTsHjYwju2UmyFVUmU4g2v5U2M5QM3Jij16Jo3/gpGL
 Kxrw==
X-Gm-Message-State: AOAM5315r+6OpeIMyJOsR1L0YNgjYPWi8QF85IzOJ1oWMnJcQR6keTXt
 YvWwkU+wENube9zVsYfjK9w=
X-Google-Smtp-Source: ABdhPJzgztZ8ftvGWm2yX/hFadWBXtJIwXlwHa7hElLfoDuNLb1G4fjMszEc5NmwJFWferXgYL5i5A==
X-Received: by 2002:a17:90b:945:b0:1bd:561e:b24d with SMTP id
 dw5-20020a17090b094500b001bd561eb24dmr5791434pjb.202.1646319826677; 
 Thu, 03 Mar 2022 07:03:46 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 mq5-20020a17090b380500b001bc770d1df4sm2508000pjb.55.2022.03.03.07.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 07:03:46 -0800 (PST)
Message-ID: <819e4c9a-d874-9774-d86e-9981962f4ce0@gmail.com>
Date: Thu, 3 Mar 2022 16:03:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v4 03/14] vl: support machine-initialized target in
 phase_until()
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org,
 mark.burton@greensocs.com, edgari@xilinx.com
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-4-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220223090706.4888-4-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/2/22 10:06, Damien Hedde wrote:
> phase_until() now supports the following transitions:
> + accel-created -> machine-initialized
> + machine-initialized -> machine-ready
> 
> As a consequence we can now support the use of qmp_exit_preconfig()
> from phases _accel-created_ and _machine-initialized_.
> 
> This commit is a preparation to support cold plugging a device
> using qapi (which will be introduced in a following commit). For this
> we need fine grain control of the phase.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   softmmu/vl.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

