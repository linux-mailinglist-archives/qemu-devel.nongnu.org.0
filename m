Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE4440A6ED
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 08:53:56 +0200 (CEST)
Received: from localhost ([::1]:51306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ2KJ-0004D4-BD
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 02:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQ2IR-0003W2-S0
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:51:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQ2IL-0006Fs-3V
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631602310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=phfGUCeN6Z4c5JJSEq+e4zdrinJ5NMJq5wHqHIEtVN4=;
 b=i5H/vIgG249/84s2oB13qZpcaMlBI8LTT6lt55+yQhZTYOCPzW6xzcrrS+RcZTaj4UMp2O
 Dbt1P30eOhryz8BJ8WNHPaw/7XjHQYO1jTltDnk0NvNd2MdMRO7rd3fObT6t3tmP/l32cu
 poYha7j09PihV5T+vfsgodP0Xxqx1YY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-MA4fF41mOSeUVpnp_0TsLg-1; Tue, 14 Sep 2021 02:51:49 -0400
X-MC-Unique: MA4fF41mOSeUVpnp_0TsLg-1
Received: by mail-wr1-f69.google.com with SMTP id
 r7-20020a5d6947000000b0015e0f68a63bso1365180wrw.22
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 23:51:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=phfGUCeN6Z4c5JJSEq+e4zdrinJ5NMJq5wHqHIEtVN4=;
 b=PIdAY2mBDk+2HknmdJN5gzkgbUKk9EnmlJ6AxlB/LbJW1zmj/7MaMYLAL/CemS71aX
 uyUObDvAeAjOSK7jXwwsMXWdwUj2B6D4FOOpfDET6Mm+C/Mx2gTHoyCcSvcKSmbho9sF
 Iy3F9kCGmOq1vAxo4nXovWFZm/NY7vgpCkmrE46Y9s4VegPG+fgbEo8qvXcGMOMYTJU4
 xMPEyhU/4eN+UcwwrhFjnDGY4zYtHp6eG1Ts6qJ+NKCL5wO6iqmdHA0VpTxsUyH5hmdY
 oDT3Sh4GTH5VVwG5DgdUllU/luHIMZF+aqB13vOK4h1D1BTZvzo9w3HX9TSOcu1KNp5Q
 ewgg==
X-Gm-Message-State: AOAM531OtR0vw7bS1pxkPSdEtNYnLCYNA73wCTaoMjKpLqjDqMC64/Ns
 k4RynRKM3cNaVrskdJLCYV0NdVwUklB02+NzSLjR4O7XOdN14kF2A0gbrdsQzcdtd4hrUx31A5P
 bC9c+yqjly/YNrWI=
X-Received: by 2002:a7b:c217:: with SMTP id x23mr384349wmi.192.1631602308622; 
 Mon, 13 Sep 2021 23:51:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhOThs5+DvILlWJePIvCC7kf4DMECe/ZQKI9IzC6LKuFXjdvW1y+KzasWcr6Pqg3vuN1TfbA==
X-Received: by 2002:a7b:c217:: with SMTP id x23mr384335wmi.192.1631602308453; 
 Mon, 13 Sep 2021 23:51:48 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id l7sm166288wmp.48.2021.09.13.23.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 23:51:47 -0700 (PDT)
Subject: Re: [PATCH v4 00/33] Qemu SGX virtualization
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210719112136.57018-1-yang.zhong@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4f1d0102-7ec1-fc38-aac0-8f38839df32f@redhat.com>
Date: Tue, 14 Sep 2021 08:51:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719112136.57018-1-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: seanjc@google.com, kai.huang@intel.com, eblake@redhat.com,
 jarkko@kernel.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/21 1:21 PM, Yang Zhong wrote:

> This series is Qemu SGX virtualization implementation rebased on latest
> Qemu release. The numa support for SGX will be sent in another patchset
> once this basic SGX patchset are merged.

>  backends/hostmem-epc.c                   | 118 ++++++++++
>  backends/meson.build                     |   1 +
>  configs/devices/i386-softmmu/default.mak |   1 +
>  docs/intel-sgx.txt                       | 167 ++++++++++++++
>  hmp-commands-info.hx                     |  15 ++
>  hw/i386/Kconfig                          |   5 +
>  hw/i386/acpi-build.c                     |  22 ++
>  hw/i386/fw_cfg.c                         |  10 +-
>  hw/i386/meson.build                      |   2 +
>  hw/i386/pc.c                             |  15 +-
>  hw/i386/pc_piix.c                        |   4 +
>  hw/i386/pc_q35.c                         |   3 +
>  hw/i386/sgx-epc.c                        | 265 +++++++++++++++++++++++
>  hw/i386/sgx-stub.c                       |  13 ++
>  hw/i386/sgx.c                            | 170 +++++++++++++++
>  hw/i386/x86.c                            |  29 +++
>  hw/vfio/common.c                         |   1 +
>  include/exec/memory.h                    |  15 +-
>  include/hw/i386/pc.h                     |  10 +
>  include/hw/i386/sgx-epc.h                |  68 ++++++
>  include/hw/i386/x86.h                    |   1 +
>  include/monitor/hmp.h                    |   1 +
>  include/qemu/bitops.h                    |   7 +

Consider using scripts/git.orderfile to ease reviewers workflow.


