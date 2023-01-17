Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C2866DD13
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 13:02:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHkeU-0003nF-Ew; Tue, 17 Jan 2023 07:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHkeS-0003n6-Q1
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:01:16 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHkeR-0001Yu-9L
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:01:16 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so20799482wma.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 04:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xqd61SDmBwNdhXYOpVk/2R5m2b3B1pUdCnmujP22eZ8=;
 b=TFCXGhmfR3uChkjEl1P/x+z3OhkDvGemIWe3t4rXmsRD+h+h+TjPq8ImIhx8kBAfho
 xb5Q7t+r/JEa7RCL4m1iGbb6GIYzGhte5h5UzWCcBBuK51+7kX0ha125C88f0E6U9f5H
 JpKOqvyL7OUWUhuGy0uiHoeLaFH9UVJ9UnbOKWkgOKziKnuqg2FcFMOOuxQ460iemeho
 tWC3vuRq0wE9wlaX2c83CFx0R5gW0VNVDc+wdMI++AlXZ4NIqcKijkb0S/KTi/ArQJsm
 VHnFvgLrIbFyo9wBv2H9o2rlVZ/uaIU+fBdJ3FEdLS+uIyRaQwU6J1ibbcemOkaxLDhR
 W71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xqd61SDmBwNdhXYOpVk/2R5m2b3B1pUdCnmujP22eZ8=;
 b=Uo0DKDo4GGXT00OrzoqmJJu2ynrxeud2pnEE4L3Yd4YhlzkA8Y1rXtMTWXYRZmeAQb
 Ptu30YCtyri8SBjecE7OFVCMRIZd++/lLtkBCXnHHwnj8A/YFwZJaZpb+yxMjOXzy10S
 lhTFpRnrpTFfwkptsEDhM+eVM58F30WMWRkaYaalUDI4cEwewp/jwHvWkfJnx1XrpVVU
 z3OiT9fgZZ1VMfJs65io4bygQe9t9QRDftm59rzV4Yf49vTSvCIMUTg659KDbxAA5HE3
 PFqoLFnifUjaYcl+KORUd9I+ikdj34nBFtTTxZebhCv0UPo7Sj3x7yKgmlSfLbBHXw9i
 l7Fw==
X-Gm-Message-State: AFqh2kp7upFvqlxHPXc4jTXfOXNMqXgb7aAhwSGjG9an/eRL89P/zBsL
 g82euHfRGvuX/m4f2twEmgY=
X-Google-Smtp-Source: AMrXdXtZKIVAaEx9imwDlnKOGXhIJ4KYDCC7GBoUAfsKkSDljYo4AS2u8JSRzCSLysGhra3hJvl94A==
X-Received: by 2002:a05:600c:4f06:b0:3da:f671:eded with SMTP id
 l6-20020a05600c4f0600b003daf671ededmr2813597wmq.12.1673956873832; 
 Tue, 17 Jan 2023 04:01:13 -0800 (PST)
Received: from [192.168.8.108] (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a05600c218d00b003daf672a616sm8160681wme.22.2023.01.17.04.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 04:01:13 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <134806d0-4203-8fd4-a932-50b552a8e566@xen.org>
Date: Tue, 17 Jan 2023 12:01:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 27/51] i386/xen: Add support for Xen event channel
 delivery to vCPU
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230116215805.1123514-1-dwmw2@infradead.org>
 <20230116215805.1123514-28-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230116215805.1123514-28-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x331.google.com
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

On 16/01/2023 21:57, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The kvm_xen_inject_vcpu_callback_vector() function will either deliver
> the per-vCPU local APIC vector (as an MSI), or just kick the vCPU out
> of the kernel to trigger KVM's automatic delivery of the global vector.
> Support for asserting the GSI/PCI_INTX callbacks will come later.
> 
> Also add kvm_xen_get_vcpu_info_hva() which returns the vcpu_info of
> a given vCPU.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   include/sysemu/kvm_xen.h  |  2 +
>   target/i386/cpu.h         |  2 +
>   target/i386/kvm/xen-emu.c | 86 ++++++++++++++++++++++++++++++++++++---
>   3 files changed, 84 insertions(+), 6 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>

