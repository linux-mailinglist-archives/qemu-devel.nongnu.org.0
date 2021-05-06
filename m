Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201A0375C0B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 21:53:40 +0200 (CEST)
Received: from localhost ([::1]:44900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lek43-0005AD-77
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 15:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lek1V-0004De-SY
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:51:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lek1U-0001Q8-5J
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:51:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620330659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=geRE0ncL1to0VTcn8XbZTlFgfUoV+r4EoWu3c6mJ7i4=;
 b=a3qUN5R8tUAYwYYMGuKEeZEEA0huofhDjTLXQhdjDjrrAwx3b4CwipgIzuCBl1iHipYoBt
 LKAKT38T2+561xXhifTqfsNCxJr0pC2PZQqzB81kcJPWw1iwnoQUs4kyq2TV2bqwAOBkRe
 nsuEK+CTwGK/IJAHUHBsZV3ANu93dT8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-pzh-AIw0PPaLUYJ8bFhIeQ-1; Thu, 06 May 2021 15:50:57 -0400
X-MC-Unique: pzh-AIw0PPaLUYJ8bFhIeQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c2-20020a1cb3020000b029013850c82dbcso3037249wmf.5
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 12:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=geRE0ncL1to0VTcn8XbZTlFgfUoV+r4EoWu3c6mJ7i4=;
 b=XfiaAmycJBDSD37hOgOqvB6wZhxInoqHb/KFn7LCeOaoefv/oTIVqFyUeKwL0ARaIC
 QeT3eE7oPk9QCrAUSraHr7okWFpkIqZkwGHVWkgkHmYSROfWglDeO6+KMGDSCbD8QDfy
 z0Nf7W1wuQ+ybse4Uaoy02oU4BDfbHVeSmbSz0gUSTDjswwxzO8wnqadS7zPgfkbTUjB
 Ew7YYiOjYbjktNBzrcBmfwoL/WPNkI8SFbr/fBkvG96gaAlucfczDlehf6H/fagrosNq
 tIzztd8/a+iubPZQw2IOSvoy/FkPkPuC7LKsrblfMCU90Eb5RR/6FtJi0a+rT57FRxF0
 zi+g==
X-Gm-Message-State: AOAM533Y0UZpkXkNcdwqlxpV1iFj2pfe0FlKLWrdr7uza/i2XqiCNvy7
 qoSchGC2ILF2hXsMl7Y1L1Izh9CRXrFK3a1Vz8VR0y4I0K/Be/olcI7mmUCKZjZ8dPRWcPghwfS
 cOE1DChm8m3xpmMA=
X-Received: by 2002:a05:600c:154a:: with SMTP id
 f10mr5980415wmg.31.1620330656053; 
 Thu, 06 May 2021 12:50:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2do7IjaykorNIlhGq31Nlr8r9CbZJRKmRFmfghxqNyDiU1l1BFAe4QzeaR0StEdkt8MFdVg==
X-Received: by 2002:a05:600c:154a:: with SMTP id
 f10mr5980402wmg.31.1620330655888; 
 Thu, 06 May 2021 12:50:55 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id n5sm5938319wrx.31.2021.05.06.12.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 12:50:55 -0700 (PDT)
Subject: Re: [PATCH] tests/qtest/ahci-test.c: Calculate iso_size with 64-bit
 arithmetic
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210506194358.3925-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <df51675c-ea43-519e-b0fd-05bf5109c6af@redhat.com>
Date: Thu, 6 May 2021 21:50:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506194358.3925-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 9:43 PM, Peter Maydell wrote:
> Coverity notes that when calculating the 64-bit iso_size value in
> ahci_test_cdrom() we actually only do it with 32-bit arithmetic.
> This doesn't matter for the current test code because nsectors is
> always small; but adding the cast avoids the coverity complaints.
> 
> Fixes: Coverity CID 1432343
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/qtest/ahci-test.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


