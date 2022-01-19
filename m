Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A3B493721
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:22:15 +0100 (CET)
Received: from localhost ([::1]:50414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7AU-0002n7-1c
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:22:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA6wz-0005Br-Iq; Wed, 19 Jan 2022 04:08:17 -0500
Received: from [2a00:1450:4864:20::334] (port=54949
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA6wr-0000F5-WD; Wed, 19 Jan 2022 04:08:17 -0500
Received: by mail-wm1-x334.google.com with SMTP id p18so3873270wmg.4;
 Wed, 19 Jan 2022 01:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8bqLBSkZoIP6Q1CpUf2DoTsZ7rv8sAUV8Lf79ej0hf8=;
 b=ADc6TxWF170+K7LyDW7tSV4Kh5WEwYjK0oH2iaKeZOmy1R8rWkdAVbZaxW5f2ir85Q
 0X6/C8MDYaGaJ/fbhwPK5cLK/GN2oprTXFvFpdYBfNKQwVgIxb+Bpc04trnJn3SHZuXg
 ngyVblf3t4yeczrA9ChUfbA/+2lSypu6E9ZCaVHImb6Kd8+Ds/JkL1biKFq0QJKdvRcn
 LX40l/b19htehPYYDehcxT769auUxNStip8nGUIlRYdeXmdZxT1s3Rkd0RMlQWrzPYwP
 HMIEdnnRjbICMRi4HQqLvMpoGBNIDrhmWaiZwzgn/5oqvmaSubrXlDjHVIcbB1SIahiq
 pajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8bqLBSkZoIP6Q1CpUf2DoTsZ7rv8sAUV8Lf79ej0hf8=;
 b=cischMwJ6T3TYQPJl3rrw1gOUBYm/4rHaa/t5UHPXbmn6RXM3ryDRzsOgNrCU0/cXE
 nSqrZWpziNBzo8TnStLa1B4ebjpqugcVVp3Sa1M/S+exjoh0SU/cAs0yuWud9kgvrZyT
 v19f0sxZ7PmUTmDkuQn2Kjw1jpuiXsU7BhaKAe1FWosmNE1bnZYGXsqemEhaC7afj8Hh
 g5dqW7IhrRv7wLAItW4pLr0ETrilZP9++Xpznd03mnXBAdN9wZmG8gcTZQKVt80/sIrl
 NCLf373jHZ45CNTxAUaVR9LsC28NzXYASMgPKM4HUXtoAixRKGVlf4aeWzQ9+iAYMttL
 Mhcg==
X-Gm-Message-State: AOAM532HqVguObHxkSHUkOgLUAdJpvV14S2JDJjuccstUWzt6WU90B+S
 UMVKO8BZKhnIthRFF1eNp8s=
X-Google-Smtp-Source: ABdhPJzqao1X8nW0bpqxI/D8cVbIX4RUS9ivgpe0I7oocRYY6TCGWTa4NQzZbYbTHA43b76DXIj2kQ==
X-Received: by 2002:a05:6000:1543:: with SMTP id
 3mr23504334wry.98.1642583287364; 
 Wed, 19 Jan 2022 01:08:07 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id i8sm11552263wry.33.2022.01.19.01.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 01:08:07 -0800 (PST)
Message-ID: <4d892836-59e5-180e-cc3c-efdf79599bb2@redhat.com>
Date: Wed, 19 Jan 2022 10:08:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 6/6] tests/qtest/libqos: Add generic pci host bridge in
 arm-virt machine
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 thuth@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org, eesposit@redhat.com
References: <20220118203833.316741-1-eric.auger@redhat.com>
 <20220118203833.316741-7-eric.auger@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220118203833.316741-7-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 21:38, Eric Auger wrote:
> +
> +typedef struct QGenericPCIBus {
> +    QOSGraphObject obj;
> +    QPCIBus bus;
> +    uint64_t gpex_pio_base;
> +    uint64_t ecam_alloc_ptr;
> +} QGenericPCIBus;
> +
> +/*
> + * qpci_init_generic():
> + * @ret: A valid QGenericPCIBus * pointer
> + * @qts: The %QTestState
> + * @alloc: A previously initialized @alloc providing memory for @qts
> + * @bool: devices can be hotplugged on this bus
> + *
> + * This function initializes an already allocated
> + * QGenericPCIBus object.
> + */
> +void qpci_init_generic(QGenericPCIBus *ret, QTestState *qts,
> +                       QGuestAllocator *alloc, bool hotpluggable);
> +
> +/* QGenericPCIHost */
> +
> +typedef struct QGenericPCIHost QGenericPCIHost;
> +
> +struct QGenericPCIHost {
> +    QOSGraphObject obj;
> +    QGenericPCIBus pci;
> +};
> +
> +QOSGraphObject *generic_pcihost_get_device(void *obj, const char *device);
> +void qos_create_generic_pcihost(QGenericPCIHost *host,
> +                                QTestState *qts,
> +                                QGuestAllocator *alloc);
> +
> +#endif

Ok, now I understand why you had it in arm-virt-machine.c in v1 (the 
hard-coded addresses). :)  But it's okay this way too, since you keep 
the maybe I'll get to generalize it a bit later.

Paolo

