Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7570B5315C5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 21:43:22 +0200 (CEST)
Received: from localhost ([::1]:56912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntDxZ-0006ob-1v
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 15:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ntDuo-0003z3-Nd
 for qemu-devel@nongnu.org; Mon, 23 May 2022 15:40:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ntDuk-0002zS-SD
 for qemu-devel@nongnu.org; Mon, 23 May 2022 15:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653334824;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T8of/U3HBZJmeNDMSz2fYIpWd9dBSux8ToSl8t6HVVE=;
 b=LYMDs6OKmRbMGmoqgNDfyurBoUI7LcXJQrQhqL0zc4FX6+VXPbQSSi9SFh3bDzqsl8/zdh
 lcFnFJiaVwHzzhC7F5V+IVHr+FG5f3HI1AwRO1eioYfSzoLIF/k/gQXt13RV/ailgrOrSM
 RgzDgwnmvzI0GDq7Jc/3fWTtHf128DY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-hY5B2CorN0e4fZQqjz8UQg-1; Mon, 23 May 2022 15:40:23 -0400
X-MC-Unique: hY5B2CorN0e4fZQqjz8UQg-1
Received: by mail-qk1-f198.google.com with SMTP id
 bl27-20020a05620a1a9b00b0069994eeb30cso12028123qkb.11
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 12:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T8of/U3HBZJmeNDMSz2fYIpWd9dBSux8ToSl8t6HVVE=;
 b=1eUV8dgDb8rujqQf/3YDvjQsVDEk6ym46xgaEbUT8QlXcPJJ/+DUwgpAwBFiuBtqIC
 ZwmYqsHHL2hXShX32s/Wkdai4Ef1UFM92c71C1d6Wv/Hf9P6k2ZrVw/kEPix6AH3iPXh
 UYtiVGrOBfmUmVkH/ZVMZhA/dFH4aU1GLhhnACrqjewR8dLoEqmZDuZ5dPX2+QsDmQvp
 iblxSxHBzFx6WE+em576O4gIpin8G6Mn/SIkSCGoOKkFqkJT5cxyrnSN8b644E0UQx60
 Qv5a9gJtjTdpCHaNPWgCWNhH5/f1D4ZGkGnvCugOCbLZ5qeJLBpznj/4D+W82Db8peAO
 YvDQ==
X-Gm-Message-State: AOAM530Dgz30VkyNuihfUwJ+ViTZGT/uh/GBkAu07xjpt88qiHm2YyQ4
 iU3Kp7GnLAxk0xJ/7LToha0xEEarWH2j/7UFru/vQeJQrkLWuNqnBLnsTK+9v2oP/nc54h1TNIH
 IyfLxvqp4ikAmaSs=
X-Received: by 2002:ac8:7f01:0:b0:2f9:1c7d:c68 with SMTP id
 f1-20020ac87f01000000b002f91c7d0c68mr12932333qtk.504.1653334822178; 
 Mon, 23 May 2022 12:40:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuWCMzM9TcCDUpRXY1g0flOmiGKQslVVANkiH0kLLwJAkBWgUeCfbSvidvp7uj5aUSFiyPqA==
X-Received: by 2002:ac8:7f01:0:b0:2f9:1c7d:c68 with SMTP id
 f1-20020ac87f01000000b002f91c7d0c68mr12932322qtk.504.1653334821906; 
 Mon, 23 May 2022 12:40:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 t128-20020a372d86000000b0069fc13ce22dsm4958881qkh.94.2022.05.23.12.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 12:40:21 -0700 (PDT)
Message-ID: <7bb0e9e9-33bb-3fba-fbc0-5d5f740c5c26@redhat.com>
Date: Mon, 23 May 2022 21:40:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: can QEMU's arm smmu model handle non-PCI devices?
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA-NnZQ+4hoScoZMjOyta9EWv_LusXeZ5HRv4kXSqZjD0w@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA-NnZQ+4hoScoZMjOyta9EWv_LusXeZ5HRv4kXSqZjD0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,
On 5/23/22 16:52, Peter Maydell wrote:
> Hi; in real hardware an SMMUv3 might be sat in front of any
> DMA-capable device. Putting one in front of a PCI bus is common
> but not the only use case. Does QEMU's SMMUv3 model handle that,
> or is the implementation currently restricted to only handling DMA
> from PCI devices?
only PCI is supported at the moment. IOMMU MR regions are only created
for PCI devices
(smmu_find_add_as() in hw/arm/smmu-common.c)

As a reminder, Chunming Li submitted several iterations of a series dedicated to that. See

https://patchew.org/QEMU/1629878922-173270-1-git-send-email-chunming_li1234@163.com/

It is not upstream though.

Thanks

Eric




>
> I ask because for the Realm Management Extension (aka Confidential
> Compute Architecture) we're going to need to put SMMUs in front of
> other devices (such as the GIC), so that their DMA is checked against
> the RME Granule Protection Tables. So if we don't currently handle
> non-PCI devices then that's a bit of extra preliminary work that we'll
> want to do :-)
>
> thanks
> -- PMM
>


