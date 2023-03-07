Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BCF6ADC78
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:56:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUym-0003ox-J9; Tue, 07 Mar 2023 05:55:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZUyk-0003on-Jp
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:55:34 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZUyi-0000EQ-Vb
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:55:34 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so6915787wmi.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 02:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678186531;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AAVcnYx3QZnRAXDufYHLkIsodJ4tM4KvNy14RA4QE6M=;
 b=a2gVlMiiU7S5mZPCuXPp1IpSMVC+Ak7HPfIQRaEpo37lxzMJri9lb4k6bMUE2znpp9
 +P5S5bcv+G6hwCEVBnr83uEQiNmOKdZRnZUFc+7GTEGesu2Cj28KEVHTSuxr5Ue677wL
 bHQTLKtf3KlHExJYrJiht5K60X7omSVw2xjcsOnkO1ahV7QeBOzYstc3kSCyuQ10L+1Q
 5+4axwdeDX8rSr1vw9xx2502MyzKNaSqdbMf27UO5wADXT1u3hUhgb6ePe3iMCohPA9B
 TFwepiM5syMTsH6S1/V+tHvZW/6ci5jde3EsSozaoD6nQo+AdD2qKcNVh+GGdHCUxJtw
 wObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678186531;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AAVcnYx3QZnRAXDufYHLkIsodJ4tM4KvNy14RA4QE6M=;
 b=x0wO0ckIQuD5+MD/I9Fd7lIflTgkOnS5tyaLGU6k4LaZ1oKsZXkXCbMFBlfewTmB2c
 722qx4/9EL/0B0mQYIAHkjGUavkUQ00CDraNbYGu+rwkEar+9t5VG8PwbCqzlQV9dXNM
 Hcm9WO08hFCZJFd0WRSsEgMBEJN0b0KnJ4sN++8wCY8skeqkl9q6FOBffBLgW4fLvNEd
 /sx9FoJ5inatTiR9n1cK7Lc5djDG22Kf6f6SvpHjrILUhFX5mVAGRD0KhoaXJf6Ja0kX
 on0Nr94hUCOYvUJGqBqMo1BzD1X4gNoHfAaZfUvRDTesijQo5wkKjtz2/Llm7yj+JXMO
 du0Q==
X-Gm-Message-State: AO0yUKWIiCUuNNSSklXF46qL3IiXaLYrjf3Y6h9wPY5lZ8Tx+S48gpw8
 iUPI3TrcAZ/zZu8xmK8/i34t4neatiGEtQ==
X-Google-Smtp-Source: AK7set+BkQbMolHKG9tsxmouOdNPkJc43l0g6ZwDn7TZkxqZPIfcbEg+j+eVA5m18GT2O3Gmz9a6Eg==
X-Received: by 2002:a05:600c:a47:b0:3eb:2b88:9adc with SMTP id
 c7-20020a05600c0a4700b003eb2b889adcmr11175851wmq.25.1678186531216; 
 Tue, 07 Mar 2023 02:55:31 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a7bc04a000000b003e876122dc1sm16145657wmc.47.2023.03.07.02.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 02:55:30 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <e33bba43-5f5d-80e6-34ff-62c7b6eafc1f@xen.org>
Date: Tue, 7 Mar 2023 10:55:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 01/25] hw/xen: Add xenstore wire implementation and
 implementation stubs
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-2-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-2-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This implements the basic wire protocol for the XenStore commands, punting
> all the actual implementation to xs_impl_* functions which all just return
> errors for now.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/meson.build     |   1 +
>   hw/i386/kvm/trace-events    |  15 +
>   hw/i386/kvm/xen_xenstore.c  | 871 +++++++++++++++++++++++++++++++++++-
>   hw/i386/kvm/xenstore_impl.c | 117 +++++
>   hw/i386/kvm/xenstore_impl.h |  58 +++
>   5 files changed, 1054 insertions(+), 8 deletions(-)
>   create mode 100644 hw/i386/kvm/xenstore_impl.c
>   create mode 100644 hw/i386/kvm/xenstore_impl.h
> 

Reviewed-by: Paul Durrant <paul@xen.org>


