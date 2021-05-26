Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B86B391E5A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:48:23 +0200 (CEST)
Received: from localhost ([::1]:35692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llxdm-0002ln-41
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llx2U-0003ux-Iw
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:09:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llx2S-00068x-V8
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622048988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+YpBknw/207Qu5KvgUM/SwdlbggoFYE84KUhsln0seg=;
 b=hP3SfXu7ohxlZh2WJKLrT1rdN4yQG7skxDnSSrOrNBADZwTZR2GoQHvEOEMFlPuLZeyv68
 zVK+0mnEM6/dBOnFSi4UxCM0j1GP+JlrqP6KX6CAo/Qj8P5gNFICk86UO++iojukMlVAUo
 vEfvjsF4JftTKT1ZFss47vBpqPgggAY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-lXtWMybkOE6JPWE67y-ySQ-1; Wed, 26 May 2021 13:09:44 -0400
X-MC-Unique: lXtWMybkOE6JPWE67y-ySQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 2-20020adf94020000b0290110481f75ddso592709wrq.21
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 10:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+YpBknw/207Qu5KvgUM/SwdlbggoFYE84KUhsln0seg=;
 b=aF470BGUXsc+vkmL9gX/Dg+jqueTEuAUPZB3bFqkPABfVV4gE7LKRk6Tfye3Khywd2
 6rn7XO4gkTGweW8ya7axo8WJnMriYDNmaZ5B7RqMtpb6/RKB+KZnPPOpLdwPQyU3MsZ1
 BfyP6QJLBNbHmEF5jWhhxTy+hloPnQDwZcBkVU27iXetJaAtLYfHXhgbtxyFQt7yXW4S
 l85xoR/Oqi14ncn8wJ3+JkiLaroZc8xLAbw7eSFrZNs9X+46CyVE85naOyTwi/igfMs8
 TyQXCYDiRRpT6JM8t3vgjoQdG4YFE2egS13L8bUX4B4ZhVOv332uFoqIIZ75H0Xz1UHP
 vlGw==
X-Gm-Message-State: AOAM531Jh4kssiUJTiCz8w0pvfxA8lwVtYhr1FsZCBtPT8W34/++kllP
 1fLnUdubcZKaADHz4Afjbg+QsTO0Y9ZthjD25D6DRmg7VWkVysqY/JC5ie9yru3a1K7jT7RTRaU
 zjsk/3iR+Ps1Uw4Q=
X-Received: by 2002:adf:ec8d:: with SMTP id z13mr22280626wrn.113.1622048983524; 
 Wed, 26 May 2021 10:09:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL4vFalOMUGPgnFubY5Er3VkUK17Y8TL5g7ratmbh77cMrbTBSWHFZC/I6+Pg32V7KR572dA==
X-Received: by 2002:adf:ec8d:: with SMTP id z13mr22280612wrn.113.1622048983377; 
 Wed, 26 May 2021 10:09:43 -0700 (PDT)
Received: from [192.168.1.36] (64.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.64])
 by smtp.gmail.com with ESMTPSA id r5sm18170688wmh.23.2021.05.26.10.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 10:09:43 -0700 (PDT)
Subject: Re: [PATCH v8 00/12] qtests: Check accelerator available at runtime
 via QMP 'query-accels'
To: qemu-devel@nongnu.org
References: <20210526170432.343588-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <269bf39d-816f-1e75-2cdf-45cd9cd5764d@redhat.com>
Date: Wed, 26 May 2021 19:09:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210526170432.343588-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 7:04 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series aims at having accelerator-independent qtests
> by querying a QEMU instance at runtime to check the list
> of built-in accelerators.
> 
> First we add the 'query-accels' QMP command,
> then we add the qtest_has_accel() method to libqtest,
> finally we use this new method to allow running
> bios-tables-test on KVM-only builds.
> 
> This series is expected to be merged via the ARM tree.

I forgot to carry MST R-b tag:
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
https://www.mail-archive.com/qemu-devel@nongnu.org/msg807421.html

> Since v7:
> - Include Markus code (see patch #2)

> $ git backport-diff v6
> Key:
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream patch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respective=
> ly
> 
> 001/12:[----] [--] 'MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG CPUs=
>  section'
> 002/12:[0048] [FC] 'accel: Introduce 'query-accels' QMP command'
> 003/12:[----] [--] 'qtest: Add qtest_has_accel() method'
> 004/12:[----] [--] 'qtest/arm-cpu-features: Use generic qtest_has_accel() to =
> check for KVM'
> 005/12:[----] [--] 'qtest/arm-cpu-features: Restrict sve_tests_sve_off_kvm te=
> st to KVM'
> 006/12:[----] [--] 'qtest/arm-cpu-features: Remove TCG fallback to KVM specif=
> ic tests'
> 007/12:[----] [--] 'qtest/arm-cpu-features: Use generic qtest_has_accel() to =
> check for TCG'
> 008/12:[----] [--] 'qtest/migration-test: Skip tests if KVM not builtin on s3=
> 90x/ppc64'
> 009/12:[----] [--] 'qtest/bios-tables-test: Rename tests not TCG specific'
> 010/12:[----] [--] 'qtest/bios-tables-test: Rename TCG specific tests'
> 011/12:[----] [--] 'qtest/bios-tables-test: Make test build-independent from =
> accelerator'
> 012/12:[----] [--] 'qtest: Do not restrict bios-tables-test to Aarch64 hosts =
> anymore'


