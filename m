Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E7269F3FE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 13:05:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUnrx-0008CE-SC; Wed, 22 Feb 2023 07:05:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pUnru-0008BC-Nt
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 07:05:06 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pUnrt-0007D8-2B
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 07:05:06 -0500
Received: by mail-wr1-x42d.google.com with SMTP id p8so7616067wrt.12
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 04:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HjuOLpqE9MGSRfTLGp5jT4Iiki08l+f0i8pylSEMfM0=;
 b=kpL2uR5K4Y8UOfmenWRYTWQmm10jvn1Zj8wZl31XGOVt+rqnyr6HB0v4YUWiRFokRO
 ePo4pXnOd27zJ/+3SbWm+QAm93fotW80ULsC8yedJkT7Z7RQqZcB+wj89CEezjjxVEkC
 K4WQgRtKz4VEJzAxY5gV9knqC19KU2f66uxjmxiaLxTpRS/6TxtPtBCFDrVitME9xIns
 WjDwn3xwa1CUHKz8IYQf3EP1eigl3Jt48MMrgZ5W1+eBIkdgkAuy+/tSPJRo28MdgiW3
 gR6d5zVQo4/9YHsyffP/pJm8HH59Pa7VppfCKKYtlkt0a0JpGe1fsu16vcEt4xCRa4VK
 94Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HjuOLpqE9MGSRfTLGp5jT4Iiki08l+f0i8pylSEMfM0=;
 b=hMOGbiO8dcNQPg+8Udj6vMMVrY+L69EPIHg1MnF3fQ0m2e4USFokMREpj2mgLytIzH
 M9vImdosZDuUslzK9wfuet/bIQmRmZbcHBg6U8MgcAqrkFC1Keayz36ATMTQdakMPExi
 6LtMuGkUULTPVEkIylxU9veLXcOF4mIaUL56ToYuq9L+psSUHlAC+u3NgtE3EEEcdH/X
 IFviyAnqHfYck4pCdgmSHmxKZbYOuCjm5SE3FCgJMPQLmFd9wzPvcgPhdEg3baR6iLu5
 XS3gFafB8NqxB0IN5ElQyelcma1WiOavzmRwBnvLGFXPe7xr7wkQXpNHtfS2P3gCt7L0
 yNyg==
X-Gm-Message-State: AO0yUKVgO6rHE/s6v5gk1iEyiN+fgLF8jh6IXst0FQFdjlcVxKhYPI9z
 oU8m9MAFm/rKaGBv4NR8JI8=
X-Google-Smtp-Source: AK7set9x1t02BhreqKcnALKiA3DHNhj1erzSfDdyb3OdLZmRVp3yW7vQht1U7kbnBC2yVXfdtCWHKg==
X-Received: by 2002:adf:e242:0:b0:2bf:c0e4:1bc5 with SMTP id
 bl2-20020adfe242000000b002bfc0e41bc5mr7629542wrb.56.1677067501683; 
 Wed, 22 Feb 2023 04:05:01 -0800 (PST)
Received: from [10.95.97.18] (54-240-197-228.amazon.com. [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a056000054d00b002c546d169ddsm8190070wrf.11.2023.02.22.04.05.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 04:05:01 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <6566fb93-f610-0871-b645-a692c0c2fa71@xen.org>
Date: Wed, 22 Feb 2023 12:05:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v12 60/60] hw/xen: Subsume xen_be_register_common() into
 xen_be_init()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
References: <20230220204736.2639601-1-dwmw2@infradead.org>
 <20230220204736.2639601-61-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230220204736.2639601-61-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.102, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 20/02/2023 20:47, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Every caller of xen_be_init() checks and exits on error, then calls
> xen_be_register_common(). Just make xen_be_init() abort for itself and
> return void, and register the common devices too.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/xen/xen-hvm.c               |  8 +----
>   hw/xen/xen-legacy-backend.c         | 56 ++++++++++++-----------------
>   hw/xenpv/xen_machine_pv.c           |  6 +---
>   include/hw/xen/xen-legacy-backend.h |  3 +-
>   4 files changed, 25 insertions(+), 48 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


