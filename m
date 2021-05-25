Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBEE390354
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:04:19 +0200 (CEST)
Received: from localhost ([::1]:35966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXfO-0001AZ-OL
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llXcP-0005HZ-Oe
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:01:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llXcL-0007Rr-7y
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:01:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621951266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZjotSDKcl1XcGZCoExWuCdNZ6KD7y9tYiZUDIMJzZw=;
 b=QV5eZml0Bd/GqfWNZiVGKgGk4X9fD2gF506G0VSqmyA3KDF7pB1vDc1fEyAMYXjV3mBfW/
 KFlthNh2H7UPVJWaHMoNSNzV3iFrHMYBGKJzAO+HAcSfYuZR5+oAJf0zyr0gfNPC751TcF
 U1iN/E3qMgXMI2nW5785kLsc6pOUpyA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-r3mCOyK0MeudB5prFpNZYw-1; Tue, 25 May 2021 10:00:52 -0400
X-MC-Unique: r3mCOyK0MeudB5prFpNZYw-1
Received: by mail-wr1-f69.google.com with SMTP id
 2-20020adf94020000b0290110481f75ddso14642071wrq.21
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 07:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9ZjotSDKcl1XcGZCoExWuCdNZ6KD7y9tYiZUDIMJzZw=;
 b=e9avJlJQdRr2+szN9iVkl2EBg1c3loTtYvFYsWa2V/ANFcOeqrHTqNAcE78I2y0MJ2
 HmAOqgTqRGlvdtDheyou9NDuxB5tOC+Gmvhp8bUPdewYBSjuqewt4bLIs5bxuMK9E0t3
 +SvFktvP2RsfpyMGKJsXRls2+ofcBHMpbOkra25Z3TOcf4Z6fSqx0PEoOKFC8zfNAOkn
 vZkOxORHjJOgaajeV/0XFoixSWMX+VMZnK/Wp+Lz3vROzQuh9wOxVXLamwQ9merakhIG
 becRHSYPO7XFoAWpniXYipCCz/cxQNXsYB0/VeqEV7UknqKgBSEaagcJy1yvVIJnIYtC
 Mg5Q==
X-Gm-Message-State: AOAM5314D6PbosG2xO8oZv2DoXV8l4L1UqEr0V3gDoA46FtZhL+/RBBO
 2jJUJ4Iym00V+wGY68YJH8+e2lELLE0rfLwNmCrUInJ5SFaO+sACU3XZFBCD+DBxHscvY9hDOEx
 Q0VwBfb3GMI8qoGU=
X-Received: by 2002:a5d:44cb:: with SMTP id z11mr28167980wrr.159.1621951250578; 
 Tue, 25 May 2021 07:00:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxYP1qzDyXXJoTZf+Zc1MFWZXwa/abRxzwPA0M3GYEd4q4QEeIS30XfZQfwRdthtZjvi+nfw==
X-Received: by 2002:a5d:44cb:: with SMTP id z11mr28167961wrr.159.1621951250471; 
 Tue, 25 May 2021 07:00:50 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id i1sm10809713wmb.46.2021.05.25.07.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 07:00:50 -0700 (PDT)
Subject: Re: [PATCH 5/6] tests/qtest/tpm-tests: Remove unnecessary NULL checks
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210525134458.6675-1-peter.maydell@linaro.org>
 <20210525134458.6675-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3fbdd2de-4ed4-a95a-66ee-347f63de1c97@redhat.com>
Date: Tue, 25 May 2021 16:00:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525134458.6675-6-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 3:44 PM, Peter Maydell wrote:
> Coverity points out that in tpm_test_swtpm_migration_test() we
> assume that src_tpm_addr and dst_tpm_addr are non-NULL (we
> pass them to tpm_util_migration_start_qemu() which will
> unconditionally dereference them) but then later explicitly
> check them for NULL. Remove the pointless checks.
> 
> Fixes: Coverity CID 1432367, 1432359
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/qtest/tpm-tests.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


