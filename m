Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B465348126
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 20:03:16 +0100 (CET)
Received: from localhost ([::1]:59942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8mg-0002Qd-Vz
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 15:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8g0-0005tw-IG
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:56:20 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29]:35587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8fy-0006z2-FW
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:56:20 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 i20-20020a4a8d940000b02901bc71746525so6077612ook.2
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DVENg2Fgrje3rR/9PJLVLLDbk8bHc371BiQH06mNz1g=;
 b=CLDjZoqDkduFmyfiuTmX9oHPcO96llVgSlBi/CCcQoFOoxQAkuVct+kB2hX/jrEQxI
 PZxkQpiRcnO19Y1DbKoDjBpyuEeBTuhk3wl1GJduBcqTa1iZriHOrVT0YUfQjmBsfI1H
 XLBSMZLJJEuFFHXLPgyUKdY+lfugDfVqFUguhCQXWdq6JckOH8X2rsgoYblNgw0VyYHm
 IP46n2NzyOtZObtVPdVIHpIF9nOs8bBnRRXu+eWuMf5Z7YGL6Mzm6aRzYrpjGDBINmPM
 ixgO7kdZEXoc6TJj+UMzcY/yfdFagbtKi0VkKOdKyrUpQsZ76PuSckxc6zbDG26BcjSv
 JvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DVENg2Fgrje3rR/9PJLVLLDbk8bHc371BiQH06mNz1g=;
 b=moRtMQ11OSb7W7n6m6rF/aSkF/NtOZX6z3lRgmtKd94AXkIRldMMLyfDq2sOg0hqgd
 nNG6Q8Tek6QN5MGF+qPOTM/JdF3DyNBajBxHIDFPrAa6MQRqOSO+g0QmzpcXsfpQ/HZ8
 SHMsYOnelUcdaeG1tRPwQjT71pQYPh6n/Zt5kuPDFDbnY/KlyUiHWhjcJRaNC4cSORHG
 JxAWdAhGcS4ozf1c1FFeGLgXCZuF2fOWfKE82BurnkpkUYZeQnnDHinxUOgbPA+Us6Q2
 64zO08ZGrAtBYKlC+ps6h1atRLDKPML6Znwt+L5tLaR1bp43nvSOLiBtNMu3JRhWChVh
 hezQ==
X-Gm-Message-State: AOAM531bcWF1egvA/gJ6bNuIE0Xf3ArnYzeefK04m5P7Ah0ifICfQ9kd
 tRQEp7SWUwV9ZSdo2oyyGLDPFA==
X-Google-Smtp-Source: ABdhPJxGMJxMcVHP5HPjVH+WxErspQu1ze0fFVDFQN7rIeQsVthoXWmixvk8nhVznu46KUaKVkaONg==
X-Received: by 2002:a05:6820:20a:: with SMTP id
 i10mr3979817oob.6.1616612175107; 
 Wed, 24 Mar 2021 11:56:15 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id g11sm745512ots.34.2021.03.24.11.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 11:56:14 -0700 (PDT)
Subject: Re: [RFC v11 19/55] target/arm: add temporary stub for
 arm_rebuild_hflags
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-12-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57ed7b80-2971-5410-e629-16c80e62dc6b@linaro.org>
Date: Wed, 24 Mar 2021 12:56:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-12-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc29.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:46 AM, Claudio Fontana wrote:
> this should go away once the configuration and hw/arm is clean
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   hw/arm/boot.c                 | 5 ++++-
>   target/arm/arm-powerctl.c     | 8 +++++---
>   target/arm/kvm/helper-stubs.c | 6 ++++++
>   3 files changed, 15 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

