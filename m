Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859883633D3
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 07:24:22 +0200 (CEST)
Received: from localhost ([::1]:37066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXzuv-0006xL-IR
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 01:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXzo7-0005H1-PW
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 01:17:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXznv-0004UJ-CK
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 01:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618723025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UFFS/VSGDn13RXKk67pKjYmGISPKLKhIHDE22K+/0f8=;
 b=NnZXZ4vd1laWQeFLHbWwrV47Oh72yJg27luK+hj5gw4OaFsRflAac2A3ZWH8FHAJ7PxwXM
 GqATK7TJPPCYy498ff0qle/M8CP8BLaF6D80+MDKBGHirh1ugWcBub4QcnoTutGEHHHStB
 svMtyFnQVDnL5O65UmH9v7P3W59ejfg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-BnttgU5YNiGb_hXufvFGHg-1; Sun, 18 Apr 2021 01:17:03 -0400
X-MC-Unique: BnttgU5YNiGb_hXufvFGHg-1
Received: by mail-wr1-f72.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso3562395wrf.11
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 22:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UFFS/VSGDn13RXKk67pKjYmGISPKLKhIHDE22K+/0f8=;
 b=JGrWyZj4pyTTzVxGs3IEH4nCUtsqRSR2sKoYJKPgiCx2773yAVpQ8HzGa0gxJIPajj
 wNwSxjXFwkF84zt8mby0DnjRtfDOyjQoAiQT+IGqHImQNh76D/p3KCL8zf25uND+ZY/5
 tBZs++kuHfdRW+Wj9DVvLkAGga5t39+NCAg8HDGexn8SxjB2ZYegPEKRcG+j6DDX3zLK
 kN+ONhnsYMbaN9Ze0+X7p9erkhyIGVgpz8U6eKbWadIFjbR16rZRg/YSmOOigEjATfl6
 fcZS25k2YOZWCaBbOhQqJ8qkNSBrcFxNz1j4K1tQlhocNG6EF3sj7QLWZDrQgXzZaUzp
 ukcg==
X-Gm-Message-State: AOAM533ULwrrHO2yA0ndughdFOy7etKtwCYrwB2kl90z93dqeofeSWlp
 WJ0qwCX7pNuSzScb7WAp75YLSYJ7LVjbAJKQHs+9ssUsV06WRZ4lJYaqKQShIJ81AvrgmH/e8cF
 ZGCNjePaQ4jY81fc=
X-Received: by 2002:a1c:e20a:: with SMTP id z10mr10457936wmg.158.1618723021747; 
 Sat, 17 Apr 2021 22:17:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOvpE27kpaQZC0WTBB2ag+fxVNAmB0RTpqy0RynEwTeYAl/3RRmX9q2JMMY9xva6xiuQE5zA==
X-Received: by 2002:a1c:e20a:: with SMTP id z10mr10457932wmg.158.1618723021645; 
 Sat, 17 Apr 2021 22:17:01 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id i133sm15725696wmi.40.2021.04.17.22.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Apr 2021 22:17:01 -0700 (PDT)
Subject: Re: [PULL 0/7] queue of proposed rc4 fixes
To: Peter Maydell <peter.maydell@linaro.org>,
 Prasad J Pandit <pjp@fedoraproject.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210417194205.17057-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a64b9f0d-66fb-9fd2-711c-c5e6df318bed@redhat.com>
Date: Sun, 18 Apr 2021 07:17:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210417194205.17057-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/17/21 9:41 PM, Peter Maydell wrote:
> This pullreq contains fixes for the remaining "not fixed yet" issues
> in the 6.0 Planning page:
>  * Fix compile failures of C++ files with new glib headers
>  * mps3-an547: Use correct Cortex-M55 CPU and don't disable its FPU
>  * accel/tcg: Fix assertion failure executing from non-RAM with -icount
> 
> None of these are 100% rc4-worthy on their own, but taken all together
> I think they justify rolling another release candidate.

I wonder about this one for https://bugs.launchpad.net/qemu/+bug/1914236
"mptsas: remove unused MPTSASState.pending (CVE-2021-3392)"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg799236.html
which is a respin of
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg02660.html
with Paolo's comment addressed.

> ----------------------------------------------------------------
> Fixes for rc4:
>  * Fix compile failures of C++ files with new glib headers
>  * mps3-an547: Use correct Cortex-M55 CPU and don't disable its FPU
>  * accel/tcg: Fix assertion failure executing from non-RAM with -icount
> 
> ----------------------------------------------------------------
> Alex Bennée (2):
>       target/arm: drop CF_LAST_IO/dc->condjump check
>       accel/tcg: avoid re-translating one-shot instructions
> 
> Paolo Bonzini (2):
>       osdep: include glib-compat.h before other QEMU headers
>       osdep: protect qemu/osdep.h with extern "C"
> 
> Peter Maydell (3):
>       include/qemu/osdep.h: Move system includes to top
>       hw/arm/armsse: Give SSE-300 its own Property array
>       hw/arm/armsse: Make SSE-300 use Cortex-M55
> 
>  include/qemu/compiler.h   |  6 ++++++
>  include/qemu/osdep.h      | 38 +++++++++++++++++++++++++++++---------
>  accel/tcg/translate-all.c |  2 +-
>  hw/arm/armsse.c           | 24 +++++++++++++++++++-----
>  target/arm/translate.c    |  5 -----
>  disas/arm-a64.cc          |  2 +-
>  disas/nanomips.cpp        |  2 +-
>  7 files changed, 57 insertions(+), 22 deletions(-)
> 


