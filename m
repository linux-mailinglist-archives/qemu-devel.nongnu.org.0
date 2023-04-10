Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ED46DCA1E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 19:42:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plvVk-0007vZ-FY; Mon, 10 Apr 2023 13:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1plvVY-0007vO-48
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 13:40:48 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1plvVW-0000XU-6D
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 13:40:47 -0400
Received: by mail-wm1-f51.google.com with SMTP id
 gw11-20020a05600c850b00b003f07d305b32so4101215wmb.4
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 10:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681148443;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a5i58Hb9p6+TuRBaiKmm6hJk2nYTdJ8C4Hjw8Hr76D0=;
 b=WqpYQyvwkJIrAV8gjhaFwp55HH077Mvt+qz+HVcSiBxyIiwtfOcv+Nt/IeHnxLBu7s
 QrIC3YJNpL0Ku1vEPf+nSIxzZYhmJjGcq+xAmTpNVInyBIX6N1Bd57DbhLCDqSWX3Nig
 q0IyTynq2WvPNyEyBxPvVEXJNNauX7nHCPwK8P18NokdL9JB+HdBNcAMQ+LcTpmXAhoU
 xutsTORw4D9PV8uS+W/e8/Ifn4nBK9nuMiblIjUc/+5L9hunyj3gaPDdtGLyZd3/TxJR
 s2UvMwSo0OugdEA4dFqL3f5GB0dpEhbxDtulXdK7L+jVPd6u7munKYnl4W7aU5GCjs9A
 C3gA==
X-Gm-Message-State: AAQBX9ep34ArHYhWktMuKndJ9ebi3gdQlxmsKRXf08oY9HIIEu/Bs9fy
 fX2C1cd8DY7TfdvgUE8nrS0=
X-Google-Smtp-Source: AKy350ZP5flHBVnd9vtXlgHZywc1LFkJFHjpGfVqR9oBzVwV0ERvTGyqBZfOerh+Y6ixKgWuJfXbJg==
X-Received: by 2002:a1c:f705:0:b0:3ed:9212:b4fe with SMTP id
 v5-20020a1cf705000000b003ed9212b4femr5398900wmh.0.1681148443028; 
 Mon, 10 Apr 2023 10:40:43 -0700 (PDT)
Received: from [192.168.32.129] (aftr-82-135-86-174.dynamic.mnet-online.de.
 [82.135.86.174]) by smtp.gmail.com with ESMTPSA id
 z12-20020a7bc7cc000000b003edd1c44b57sm14251400wmk.27.2023.04.10.10.40.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 10:40:42 -0700 (PDT)
Message-ID: <88e630a8-a8a4-1ac3-476d-0c00b82817f1@kernel.org>
Date: Mon, 10 Apr 2023 19:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/4] Add MEN Chameleon Bus emulation
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Javier Rodriguez <josejavier.rodriguez@duagon.com>,
 =?UTF-8?Q?Jorge_Sanjuan_Garc=c3=ada?= <Jorge.SanjuanGarcia@duagon.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20230406093157.104145-1-jth@kernel.org>
 <20230406093157.104145-2-jth@kernel.org>
 <CAFEAcA9Qu-dtjrKDUyT0UMg40EmjBHD4J3GLzQNhPkOhATN2Xg@mail.gmail.com>
Content-Language: en-US
From: Johannes Thumshirn <jth@kernel.org>
In-Reply-To: <CAFEAcA9Qu-dtjrKDUyT0UMg40EmjBHD4J3GLzQNhPkOhATN2Xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.128.51; envelope-from=morbidrsa@gmail.com;
 helo=mail-wm1-f51.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.246,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 06/04/2023 12:01, Peter Maydell wrote:
> On Thu, 6 Apr 2023 at 10:34, Johannes Thumshirn <jth@kernel.org> wrote:
>>
>> The MEN Chameleon Bus (MCB) is an on-chip bus system exposing IP Cores of an
>> FPGA to a outside bus system like PCIe.
>>
>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>> Signed-off-by: Johannes Thumshirn <jth@kernel.org>
>> @@ -0,0 +1,182 @@
>> +/*
>> + * QEMU MEN Chameleon Bus emulation
>> + *
>> + * Copyright (C) 2023 Johannes Thumshirn <jth@kernel.org>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>> + * the COPYING file in the top-level directory.
>> + */
> 
> Really version-2-only? We prefer 2-or-later, as noted in LICENSE...
> 
> thanks
> -- PMM

Sure will do.

