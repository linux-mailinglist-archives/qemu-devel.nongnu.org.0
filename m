Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864E666CDE4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:47:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTYt-00018R-RB; Mon, 16 Jan 2023 12:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTYr-00018A-Sx
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:46:21 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTYq-0006og-2j
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:46:21 -0500
Received: by mail-wm1-x333.google.com with SMTP id l8so3422584wms.3
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 09:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dOBXev8yriWTN2uSFh6JiGHMNKOYiyiNGLpojJY0dI4=;
 b=JKUI3zCq7Kxj28wZXnfJ3R7a9ZTuZ3wNQsDESWVLesWlw28chcOtCZOva5K0mmpWqN
 GD8MdxYqkbSvCWnXhnnCscux70WMSqfgCC2yUGzmn3xqdQwEnjaujm6G7H/opmCpPclO
 AkBXGph7jmvJrYR2Zv+nzzgyiPPlM+h9xtNXUlz2TS307IzYP9vrhJGXWwGhAJVceRVq
 /RaNffjrenr8fJKnrSPHe7bgwrNxdTdVqFAS3h1Rmn0QCms/FIgGxrqEqzkjUfRJMZwb
 zbnB/CvtMqcBCSpOmUXCx21IiJKh5lL5vyjzlG/0ZerpXEOWCFNZcF2m2vnYNOvSzVHV
 M9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dOBXev8yriWTN2uSFh6JiGHMNKOYiyiNGLpojJY0dI4=;
 b=iKviWiWvDUB/A99mgV0e2745onvL/WZI9y5AoXB/YCvPU2gyQjFhwWjd0PnUevix0N
 EM4uCTaGlRwEKti33o2ly/L7ytzPR4mpuX5nE8O7rt1EdPGTnx692D8GIXj7Mk6ysaPy
 ltyrtUWwXnZGB6FikDavpSJKBqSeGdK6Vo5O1yBn/CGWqeNTk8CviPZ25VFT/5A8Zzuy
 08T3uMOLD751QkkDRPOorLqQ9lyZQvcFT1s+HiXyaUn01Lu6vsN0uDgWWaXLfs8rojIt
 lRQF2ukiXrUdshOgPFM1LL+hhJ9HbHpBBArmSMg1+uuXgAzqat1gsxiylxTRK6ddipf4
 sqtA==
X-Gm-Message-State: AFqh2kq3mdwWlB/QnYJZS1RXomqM/kLKUTeQNWvLdiXb0TTSPzEhm3d7
 YM2X6OdqonY1GgLPXHvINQs=
X-Google-Smtp-Source: AMrXdXtYSiU4n0TYmgVO9g8MAC7ifxaIJggxXu91rWA45yhJI3HXXEp89jGZvhwHH0RALCAtcVwHlQ==
X-Received: by 2002:a05:600c:4fc2:b0:3d9:f8a1:710d with SMTP id
 o2-20020a05600c4fc200b003d9f8a1710dmr334800wmq.6.1673891178370; 
 Mon, 16 Jan 2023 09:46:18 -0800 (PST)
Received: from [192.168.6.176] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c1d0e00b003da105437besm18116801wms.29.2023.01.16.09.46.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 09:46:18 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <2f50be65-e24e-d612-9fa0-53b7f20125de@xen.org>
Date: Mon, 16 Jan 2023 17:46:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 20/51] i386/xen: handle VCPUOP_register_vcpu_info
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110122042.1562155-21-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230110122042.1562155-21-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/01/2023 12:20, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Handle the hypercall to set a per vcpu info, and also wire up the default
> vcpu_info in the shared_info page for the first 32 vCPUs.
> 
> To avoid deadlock within KVM a vCPU thread must set its *own* vcpu_info
> rather than it being set from the context in which the hypercall is
> invoked.
> 
> Add the vcpu_info (and default) GPA to the vmstate_x86_cpu for migration,
> and restore it in kvm_arch_put_registers() appropriately.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/cpu.h            |   2 +
>   target/i386/kvm/kvm.c        |  17 ++++
>   target/i386/kvm/trace-events |   1 +
>   target/i386/kvm/xen-emu.c    | 152 ++++++++++++++++++++++++++++++++++-
>   target/i386/kvm/xen-emu.h    |   2 +
>   target/i386/machine.c        |  19 +++++
>   6 files changed, 190 insertions(+), 3 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


