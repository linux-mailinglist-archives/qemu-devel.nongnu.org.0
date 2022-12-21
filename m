Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FC16535B9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:00:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83O3-0007Y3-Ja; Wed, 21 Dec 2022 13:00:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p83O1-0007XR-Qb
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:00:13 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p83O0-0003xO-96
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:00:13 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso2035642wmb.0
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LE179TSjHvOlMayVwgnHiaLJIBPoMmWv8ts/FodR04g=;
 b=ZOkcJIvgmC6CSTRBBtJOr81WczYLa93nQ4VItVeEYJjztMHlpPmS0xKQ2NfC+/33AD
 Um2OR8REBS8hqpUv9A4RtGr/SssHw9vVv9yxmFZMlHeW5Kh9Y8rMgH3j1Id41Xcxs2va
 ZT92YfQdGArd4dMg0Icl3H+88q2vMvz321ntIcOlFaoagNWHwHP8MbOnwG/GM3x21/DZ
 fAHb0juUKzMLaJBAvH7NIfqqk2+VL82G2VH5LNXcbn2e31D6Z2y/J2DNWzl/ABhbT0go
 FJaQb8OY8SyPgYaVbRGxBLKVol8SKHto5nywA1ZMbRgz1FvLU41SR4vjPqySU6t7J/zg
 XOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LE179TSjHvOlMayVwgnHiaLJIBPoMmWv8ts/FodR04g=;
 b=5Tyz2Lf3iedGNWcD0cYZIxEUzZ5tNkzHAjNwur9bK/DPabmHs/47INNCXbvrymtFAg
 YbmTUnHPkQp/Dk8oZ0R0r8ZVO5L/sR2uGzzqgO4t43KtJxUfJNxhO4enXWm05vH0YsGK
 yOGN4MEifke8+eQUshFmSIc6NrihMAcao0FQu15zqf/IJ4fWqsLhAuLBKDQN9/ofRHM3
 gSLo9ZPxT88iGGdq7iwRDiv/87/FaSoxFolvbPhwYAqHwM84cuFgDJ8OZmZTkdgrU6BZ
 gCAsy0a6sjQO0feo9iEMY5rc6UFChoeJjN8FXbvcJY8bafhFVQZRbGRuypNIfQo5MoMm
 tk4g==
X-Gm-Message-State: AFqh2kq2N5Y2tflLe2q0Uv2YpHmhEaElFs+ygC4d4z6cvY0GZyqhw0Lv
 rqvx+OZMirYCZHDuUYMrFDQ=
X-Google-Smtp-Source: AMrXdXu0zDPFIVpWNDEUAWuWeTdOW9JGDoVRlvFYUEkJ1W94yOJrp0Dl8jeCEHFTRj8xTFOiYedWrg==
X-Received: by 2002:a05:600c:3b93:b0:3d3:43ae:4d10 with SMTP id
 n19-20020a05600c3b9300b003d343ae4d10mr2557140wms.11.1671645610860; 
 Wed, 21 Dec 2022 10:00:10 -0800 (PST)
Received: from [192.168.6.210] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 m185-20020a1c26c2000000b003c6f1732f65sm2968588wmm.38.2022.12.21.10.00.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 10:00:10 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c22bb5a0-805a-98f6-24ed-5e0b97ba8637@xen.org>
Date: Wed, 21 Dec 2022 18:00:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v4 06/47] i386/hvm: Set Xen vCPU ID in KVM
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221221010623.1000191-1-dwmw2@infradead.org>
 <20221221010623.1000191-7-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221221010623.1000191-7-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 21/12/2022 01:05, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> There are (at least) three different vCPU ID number spaces. One is the
> internal KVM vCPU index, based purely on which vCPU was chronologically
> created in the kernel first. If userspace threads are all spawned and
> create their KVM vCPUs in essentially random order, then the KVM indices
> are basically random too.
> 
> The second number space is the APIC ID space, which is consistent and
> useful for referencing vCPUs. MSIs will specify the target vCPU using
> the APIC ID, for example, and the KVM Xen APIs also take an APIC ID
> from userspace whenever a vCPU needs to be specified (as opposed to
> just using the appropriate vCPU fd).
> 
> The third number space is not normally relevant to the kernel, and is
> the ACPI/MADT/Xen CPU number which corresponds to cs->cpu_index. But
> Xen timer hypercalls use it, and Xen timer hypercalls *really* want
> to be accelerated in the kernel rather than handled in userspace, so
> the kernel needs to be told.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/kvm/kvm.c     |  5 +++++
>   target/i386/kvm/xen-emu.c | 28 ++++++++++++++++++++++++++++
>   target/i386/kvm/xen-emu.h |  1 +
>   3 files changed, 34 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


