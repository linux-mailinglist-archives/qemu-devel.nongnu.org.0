Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F34324887
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 02:30:25 +0100 (CET)
Received: from localhost ([::1]:40058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF5U0-0003pc-Fx
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 20:30:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF5QD-00022J-9w
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:26:31 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:47056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF5Q7-0000G1-RR
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:26:29 -0500
Received: by mail-pg1-x52d.google.com with SMTP id h4so2690615pgf.13
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 17:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q3APHiix+aI4hjRk+xgeXR/K3G+JNbFbTJeSOOmlUXc=;
 b=u6b5dwsntbTH+DGPYNVhsrweTvfnr6iipkaAJNZcA67LP/i7AEY+o54LuJVHZMbqnJ
 WU2JC6TuSb09/+wBP/iYnu3VAWTVd1zDtz3TL+bOJcZhmVkUzzNFHuQoiYOM/GsVk+os
 5l5cp+uur39jyC5aSEof+/tIM9fHxU2zvylghs1Rr05jsgwMZjznpyguYIR7Pci/vJsG
 YPmwJmyVlybzsz7ogiseBvlaj7WuoH2ICQlLWd+Qt1vO/xecp/LOgclY9t1pgpV/AazI
 KIEVphyeygBanrhE0jQ89LKSNkRpYTcUEoMkEDrItMRYpzqDzfDhQr2KKFRFcvcdcEwR
 1Cnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q3APHiix+aI4hjRk+xgeXR/K3G+JNbFbTJeSOOmlUXc=;
 b=KjwmuLSS9Dlo9zbzhzIy0cH2qVM4rGB+pMSdXouKiRIKKTckdvcwybQYzYRFZjN7K2
 B0Tw+v/0S9MN40bbh8f9ZCc7krJ4sN3H8emi+iEyKO1ZX3SWJA/xyaIqdUHqhFI7BlYW
 Nx5E4bIYc5Xp8JUkh0taDJa63LBMURyFnooujXC4TFLAk68tLqVQMfcjfQiZOPUgF+pY
 MycLZLgFj+5yAEJT+Ilz72og+RHEpzIjEmOVFe4+Cer1fKXM6D5dI17N5W/qJ5qkJGdk
 pu2E1AgLuaFUBvaxDsu5QVFOJeTKtgOODu6NOe8vXqiaLJ+sE3GlG0pkeexqFHZQqhPq
 IPeg==
X-Gm-Message-State: AOAM530gBuDg5+fuXRE2umwIv7cZN34G+dFKo4EtdIh2EVYSqy+no7Ln
 gVse64PA5VSMnuZ5glE4JVjEkvLW+sBsuw==
X-Google-Smtp-Source: ABdhPJz5wcLoriFl0XkMV6EJ/h8v7+zoOFi8ezb4R1Yc5UyeCZRbFlmtdQ3ArkxZs/kN1mhuyePmUQ==
X-Received: by 2002:a63:504a:: with SMTP id q10mr696029pgl.188.1614216381514; 
 Wed, 24 Feb 2021 17:26:21 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id f19sm4094907pgl.49.2021.02.24.17.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 17:26:21 -0800 (PST)
Subject: Re: [PATCH v22 03/17] accel: introduce new accessor functions
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-4-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <51999fc2-73d7-b4a7-f0a6-b4c9feeeec71@linaro.org>
Date: Wed, 24 Feb 2021 17:26:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224133428.14071-4-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 5:34 AM, Claudio Fontana wrote:
> avoid open coding the accesses to cpu->accel_cpu interfaces,
> and instead introduce:
> 
> accel_cpu_instance_init,
> accel_cpu_realizefn
> 
> to be used by the targets/ initfn code,
> and by cpu_exec_realizefn respectively.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/qemu/accel.h | 13 +++++++++++++
>  accel/accel-common.c | 19 +++++++++++++++++++
>  cpu.c                |  6 +-----
>  target/i386/cpu.c    |  9 ++-------
>  4 files changed, 35 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

