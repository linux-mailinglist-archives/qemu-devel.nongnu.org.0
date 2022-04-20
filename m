Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C80CE508B3C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:53:35 +0200 (CEST)
Received: from localhost ([::1]:46642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBi2-0005fG-Hv
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhBCJ-0004XD-7Z
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:20:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhBCG-0005F6-LM
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650464444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g+bZ+iWM0F0ECjnnZwThHZB2t/km3R/neNajU/RFOjs=;
 b=ex1iAGzFnE2pCq37l2szrP/t6S9IlLbrIpIG9eTux7gC6Aiyzo/AUxmJnYrqfSmM2EP1mJ
 +doHJM/YVbK8C4fPWYBTef02ENBr1Cv7RYfovZAGCFZhyihFLZGm4dYeh/oim8CVYvlg45
 9/knh72QOBkH1liwrturKj1GhlQ/zOU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-v7F5EglrNimOxn_z2R9gjQ-1; Wed, 20 Apr 2022 10:20:42 -0400
X-MC-Unique: v7F5EglrNimOxn_z2R9gjQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 h65-20020a1c2144000000b0038e9ce3b29cso3015278wmh.2
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 07:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g+bZ+iWM0F0ECjnnZwThHZB2t/km3R/neNajU/RFOjs=;
 b=eaL2wjuliY81w94AifBgPeD9CWxqfE2ItXWkEJmfPMyppM9Gr2CF8gPxJcK94nkceO
 XTpfToqL/MqqA0ZE1O+aOMmAhQsMPVRmRtFUeMczbETB0+ze+ajaOfCWhwCJOJk/2eW6
 3+f5YCIN/ySZw8eHDfqwkrjJ63Ix2JNNcdAzqxPvGFGdueUhpHhssA5bjtAOae60zn8w
 qeE5MnyAqw/EUq1dSEcZQufzxZ7NorYw0sO0iUXiJykm4PccK7QNZCtyBcBgSFAhdYeL
 mTLFn+T9Lx0Jkk7g9BoGugJMZDM5PMB8c+5ZiIKcMTLRjmtYwD+IXUvviXYzoJ4YQsS1
 mO4g==
X-Gm-Message-State: AOAM532MPo4InXEPOCmV/XHjn/01vZyQOGSXFAUiLzIBP8j2a1FE/Fby
 GbdiBTGJTxToiS10BpATPSf+DEcD/pzRUExwoB2S1c/2RjkwumqeoBPPwx3O8u9GzSZMcJoxPT5
 2qpVl4RhFDATubKk=
X-Received: by 2002:a7b:c5d6:0:b0:381:4127:84d3 with SMTP id
 n22-20020a7bc5d6000000b00381412784d3mr3916780wmk.24.1650464441491; 
 Wed, 20 Apr 2022 07:20:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlVuLXJfMVdkZULrzW7ZChpcaRIhAx3R/Sby4KBZjT1DDlO8g7gVWp7jvdvpsDWthQbJvWoA==
X-Received: by 2002:a7b:c5d6:0:b0:381:4127:84d3 with SMTP id
 n22-20020a7bc5d6000000b00381412784d3mr3916765wmk.24.1650464441317; 
 Wed, 20 Apr 2022 07:20:41 -0700 (PDT)
Received: from [192.168.8.102]
 (dynamic-046-114-174-058.46.114.pool.telefonica.de. [46.114.174.58])
 by smtp.gmail.com with ESMTPSA id
 n65-20020a1c2744000000b003862bfb509bsm594wmn.46.2022.04.20.07.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 07:20:40 -0700 (PDT)
Message-ID: <edddb101-6feb-8b83-f828-75fb356bf2a0@redhat.com>
Date: Wed, 20 Apr 2022 16:20:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 28/41] Use QEMU_SANITIZE_ADDRESS
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-29-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220420132624.2439741-29-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "open list:Floppy" <qemu-block@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/04/2022 15.26, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/qtest/fdc-test.c    | 2 +-
>   util/coroutine-ucontext.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
> index 4aa72f36431f..0b3c2c0d523f 100644
> --- a/tests/qtest/fdc-test.c
> +++ b/tests/qtest/fdc-test.c
> @@ -550,7 +550,7 @@ static void fuzz_registers(void)
>   
>   static bool qtest_check_clang_sanitizer(void)
>   {
> -#if defined(__SANITIZE_ADDRESS__) || __has_feature(address_sanitizer)
> +#ifdef QEMU_SANITIZE_ADDRESS
>       return true;
>   #else
>       g_test_skip("QEMU not configured using --enable-sanitizers");
> diff --git a/util/coroutine-ucontext.c b/util/coroutine-ucontext.c
> index 904b375192ca..52725f5344fb 100644
> --- a/util/coroutine-ucontext.c
> +++ b/util/coroutine-ucontext.c
> @@ -30,7 +30,7 @@
>   #include <valgrind/valgrind.h>
>   #endif
>   
> -#if defined(__SANITIZE_ADDRESS__) || __has_feature(address_sanitizer)
> +#ifdef QEMU_SANITIZE_THREAD

Shouldn't that be QEMU_SANITIZE_ADDRESS instead?

  Thomas



