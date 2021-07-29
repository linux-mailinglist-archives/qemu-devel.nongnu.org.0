Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FFE3DA079
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 11:43:23 +0200 (CEST)
Received: from localhost ([::1]:55712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m92ZW-00059u-G8
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 05:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m92YQ-00039w-9J
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 05:42:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m92YM-0002GU-R1
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 05:42:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627551728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jv+0g+Wr9ZESBrUc+CPKD66ATw/ZIXAtlTGFra1MYYU=;
 b=WxgmNWgatocRU0Gim4TjL9fscH7Wyt+tlWYKiREIHsIt7/1dKoziIUOGW8k3bK2KbzmpPj
 vlfuK7y7q+OEe0/Btxr++fqR21z6K7RKqPIex9C9eGtJKPK6bGtml24f6z6Hy4extZ927I
 bnp/Q1pD6++CSgH3HNJXsmcmUdZKBlU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-qoHd37kBOYCz0Eck6Zx5Gg-1; Thu, 29 Jul 2021 05:42:07 -0400
X-MC-Unique: qoHd37kBOYCz0Eck6Zx5Gg-1
Received: by mail-wm1-f70.google.com with SMTP id
 a18-20020a05600c2252b02902531dcdc68fso2014677wmm.6
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 02:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jv+0g+Wr9ZESBrUc+CPKD66ATw/ZIXAtlTGFra1MYYU=;
 b=BtRp3qPRW1rLfZXyvphzHnTST7UPPN1eJZy4WO9RMV86yKd+jIFKhFXcN2WymJldrd
 Y62nYOp8g0wduhTQC74+fjVFDcxI2IEQOOyi8gEja9xXjAdeV58Q07vdYBxkMZcvNFde
 l3ybAOnOFl4rT08nnnRvW2ODbB4ExdPDOX8ajU6einYsYUhcOkfwMqije6sa84R18DEL
 63ASS37JFMEFBqHFbSMhs6Gl7xkP78JfO88TAUzGzrkocEfdPP4WFWE1FHP2Z3ZN03oU
 LVj2r4FlyDD4ZgcEXgoc4fDu/lSPQfpZAiTBV6o1qwtajj//xiE50YRshIIfKXCty3f3
 GFqg==
X-Gm-Message-State: AOAM532+oC/ZKLkvb5594b097ibz9FY3c7qdY4jUWt04p7WpWHjxPUVx
 iiFZghxENe+edsXtb/xWdr05Tz4C4JMmg8UT1eZryU8N7cDjJXOg4rf9/ybw9tK8OQHPuVqMqj7
 f+Vy3tD9/9iq5xUY=
X-Received: by 2002:a05:600c:ac4:: with SMTP id
 c4mr13479522wmr.10.1627551726371; 
 Thu, 29 Jul 2021 02:42:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz80c67HZ5TAmoj8Mgpq8YrcRFhvZQstcWrJPe0e0IwxoHreD1coh9MmCvtFDAAZ4bwTvgyIg==
X-Received: by 2002:a05:600c:ac4:: with SMTP id
 c4mr13479507wmr.10.1627551726175; 
 Thu, 29 Jul 2021 02:42:06 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id k22sm2308936wms.47.2021.07.29.02.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 02:42:04 -0700 (PDT)
Subject: Re: [PULL 8/9] tests: Fix migration-test build failure for sparc
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210729082211.532572-1-thuth@redhat.com>
 <20210729082211.532572-9-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f09aafaf-eb28-2b3c-dabd-97cca72680a7@redhat.com>
Date: Thu, 29 Jul 2021 11:42:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729082211.532572-9-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 10:22 AM, Thomas Huth wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> Even if <linux/kvm.h> seems to exist for all archs on linux, however including
> it with __linux__ defined seems to be not working yet as it'll try to include
> asm/kvm.h and that can be missing for archs that do not support kvm.
> 
> To fix this (instead of any attempt to fix linux headers..), we can mark the
> header to be x86_64 only, because it's so far only service for adding the kvm
> dirty ring test.
> 
> Fixes: 1f546b709d6 ("tests: migration-test: Add dirty ring test")

Thanks :)

> Reported-by: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> Message-Id: <20210728214128.206198-1-peterx@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/migration-test.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)


