Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387EF459106
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 16:10:50 +0100 (CET)
Received: from localhost ([::1]:59504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpAy1-0007el-Aa
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 10:10:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpAuX-0003pa-D2
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:07:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpAuR-0000vg-9A
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:07:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637593619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7HNdb2tt/SMg3ihyXdEzZR5yaQw44U4iAoXpEHLkOf8=;
 b=OD5GmAFgppXRLZ/MmIDj5WMH/sqtuM9eFp3gQOsv33Px0Q4TbEsJVRCtTSn5USZvOVqETC
 6z+nqBSWKl2BiQTl4USSHK3n8TburVeC8Tw5yTF8J54rD/43tkrTBJHJd12l3QGUZ8mLiK
 SpMaOXcxMbHG74JVIpRbx64zoePnq8k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-INll1rWxN_2K_tiIrd-mQQ-1; Mon, 22 Nov 2021 10:06:58 -0500
X-MC-Unique: INll1rWxN_2K_tiIrd-mQQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 205-20020a1c00d6000000b003335d1384f1so10318744wma.3
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 07:06:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7HNdb2tt/SMg3ihyXdEzZR5yaQw44U4iAoXpEHLkOf8=;
 b=6fIqutkQOJMkIiVehwEsidec7u10KZX6n9wkUM1VEYKy5JBUdk1c+bvu/d9WdR02m6
 8GBfnbgL51l4EH21dHggYM5CZj3txjlI8xhdKdrhhL55RPMNW1AQMaPzNrjPW3TGjx+V
 AvbvyyNsVVR1jS0HuxoROat6vAUeBGAWbFmTSw1JaHg27I0tYA9LVhaBGSRNTJF0/gJf
 mbSFsV1QQdMsLtETZl3eXdkB81tfh+mX2ZKwXz9leRs7qBTYJO+Y4r6o91cid0SdYeAT
 C6B5Zltt0/+UFRqtcvLFQeucjmRxyQhW5gMwUnHfgb5tNP6eiO8/Znj1g6Z6WW1zmAyq
 WtIg==
X-Gm-Message-State: AOAM531N/Ntq2xybMiJ3OxJEIcwDX4yz7SjMbLwnh++8fHyjLkIk+2Rz
 mlHWFxq5TO0ywdz5fAv99NoD4uq7LHWBRhoM0m3CjIZrC5NXAbxTSvrCYtB1+gInhD9hn6I/zgc
 Tq9ySfHnkhd9afFE=
X-Received: by 2002:a5d:64ea:: with SMTP id g10mr40139299wri.242.1637593617005; 
 Mon, 22 Nov 2021 07:06:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpAz3BM1JaUryUUoMdf7TTl/w5EcCZ8pRYLe/xm5fIBcCaGEAkgKutWHPQbdKiJ20bVtfHHw==
X-Received: by 2002:a5d:64ea:: with SMTP id g10mr40139256wri.242.1637593616767; 
 Mon, 22 Nov 2021 07:06:56 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id bg12sm8892624wmb.5.2021.11.22.07.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 07:06:56 -0800 (PST)
Message-ID: <dc9e58cb-44f8-1f6e-db4c-cd887d7a82a2@redhat.com>
Date: Mon, 22 Nov 2021 16:06:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-7.0 1/5] hw/display: Rename VGA_ISA_MM -> VGA_MMIO
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211119171202.458919-1-f4bug@amsat.org>
 <20211119171202.458919-2-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211119171202.458919-2-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/11/2021 18.11, Philippe Mathieu-Daudé wrote:
> There is no ISA bus part in the MMIO VGA device, so rename:
> 
>   *  hw/display/vga-isa-mm.c -> hw/display/vga-mmio.c
>   *  CONFIG_VGA_ISA_MM -> CONFIG_VGA_MMIO
>   *  ISAVGAMMState -> VGAMmioState
>   *  isa_vga_mm_init() -> vga_mmio_init()
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   configs/devices/mips-softmmu/common.mak |  2 +-
>   include/hw/display/vga.h                |  2 +-
>   hw/display/{vga-isa-mm.c => vga-mmio.c} | 16 ++++++++--------
>   hw/mips/jazz.c                          |  2 +-
>   hw/display/Kconfig                      |  2 +-
>   hw/display/meson.build                  |  2 +-
>   hw/mips/Kconfig                         |  2 +-
>   7 files changed, 14 insertions(+), 14 deletions(-)
>   rename hw/display/{vga-isa-mm.c => vga-mmio.c} (93%)

Reviewed-by: Thomas Huth <thuth@redhat.com>


