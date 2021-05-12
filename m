Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F79A37B7F3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 10:29:29 +0200 (CEST)
Received: from localhost ([::1]:60316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgkFE-0006SM-6s
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 04:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgkDu-0005Wz-3o
 for qemu-devel@nongnu.org; Wed, 12 May 2021 04:28:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgkDk-0002ho-Fa
 for qemu-devel@nongnu.org; Wed, 12 May 2021 04:28:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620808075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BgSWjmpFiyYAac4u2q1cGgRwlk3GKZwGrH2RWVQjqIA=;
 b=iaDDBFLnWKpswo8mnsqpY0EfDipbZJIsFF3JOA4KQ2VHYVHASZRQRFd8nq1w61TIEIsG1O
 J7n/NFdJM6K/9HBrdE2YsLYIOsUN8fW9qaGaoGdui+Afpex1o4b6moN8ci0PLpIYIJuGz2
 yguIqehcsYK9phDnM4G6isBJk3HoK8U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-G0sBPjF8PXe2WoEKveAgqQ-1; Wed, 12 May 2021 04:27:51 -0400
X-MC-Unique: G0sBPjF8PXe2WoEKveAgqQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 y184-20020a1ce1c10000b0290143299f39d7so359855wmg.4
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 01:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BgSWjmpFiyYAac4u2q1cGgRwlk3GKZwGrH2RWVQjqIA=;
 b=tvrnZ5Cpa5I/b6DabyN7/WejvMLK3ClAtKfFLGjCAsb+LWlgQMXYl6wGOUTVvkAq3x
 GK00/hsnDWHyREPHERQ8SVP+kICMV3C1tpQkTolDBE+dEDGkITslQmQBF/JDuIDa6nuD
 XosbmQmvAmG1YR9oNT+JSFsbto+iiU0JukzhvGySXozddzkycJ542cejTsyWaWh6G8CI
 lkgchtUJqs79yrhQrZyhgZmNHO7FEq8muKZ0jSdvIGmcNKQz257ahDLHqupeCzHcIAfZ
 dlBSjiGRPFsPWzQuKAJMFh+kLoh57IDYM6r8d4G1i6FIiy5zRLiMBG7b7q69ua5Axg1R
 ZlpA==
X-Gm-Message-State: AOAM533/cHy69sGWDKYLId8Uwk0O7CA0p+Bhdy5LZGE25bq2odvpPjmB
 C7f7SCGShMNVLCtiM1sqc/lHjJkf9ZkEGYpJmiJrwnBLID1q7oS6pEvQYyarL6mELworogHApn1
 +eJRRRqw3Qk3qla0=
X-Received: by 2002:a05:600c:19c8:: with SMTP id
 u8mr10430795wmq.50.1620808070513; 
 Wed, 12 May 2021 01:27:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJCXBBPbVq1TLNNuTDzivdEe05gW86tXyk029q0+8E6mnTxDbR2JWghSOJ+zhJGBSjAkqsGw==
X-Received: by 2002:a05:600c:19c8:: with SMTP id
 u8mr10430767wmq.50.1620808070298; 
 Wed, 12 May 2021 01:27:50 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b6sm5514659wmj.2.2021.05.12.01.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 01:27:49 -0700 (PDT)
Subject: Re: [RFC PATCH 3/5] hw/ppc: Have pSeries depends on libfdt (via host
 Kconfig FDT symbol)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-4-philmd@redhat.com>
 <28e52da6-6cfa-1653-79c7-fb2d857c8eeb@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cf1f13e5-e466-0898-f503-7c12b45a2eb7@redhat.com>
Date: Wed, 12 May 2021 10:27:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <28e52da6-6cfa-1653-79c7-fb2d857c8eeb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 9:45 AM, Paolo Bonzini wrote:
> On 11/05/21 17:53, Philippe Mathieu-Daudé wrote:
>> Since commit fea35ca4b8e ("ppc/spapr: Receive and store device
>> tree blob from SLOF") the pSeries machine depends on the libfdt
>> fdt_check_full() call, which is available in libfdt v1.4.7.
>>
>> Add the corresponding Kconfig dependency.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> This is not the only one though.  In particular, there should be a
> "depends on" also for MIPS_BOSTON (hw/mips), E500 (hw/ppc), POWERNV,
> PPC440 (hw/ppc), (hw/ppc), SAM460EX (hw/ppc), VIRTEX (hw/ppc), RX_GDBSIM
> (hw/rx), XTENSA_XTFPGA (hw/xtensa).
> 
> Once you do this, TARGET_NEED_FDT can go away for PPC, MIPS and.  The
> remaining ones use fdt functions in hw/*/boot.c so they need libfdt
> unconditionally RX (and TARGET_NEED_FDT should be added to
> default-configs/targets/nios2-softmmu.mak for the same reason).

Got it, thanks!


