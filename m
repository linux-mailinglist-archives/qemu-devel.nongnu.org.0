Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFDD372673
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 09:19:58 +0200 (CEST)
Received: from localhost ([::1]:58418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldpLY-0004SU-TM
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 03:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldpKY-00042f-QC
 for qemu-devel@nongnu.org; Tue, 04 May 2021 03:18:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldpKW-0001RT-7X
 for qemu-devel@nongnu.org; Tue, 04 May 2021 03:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620112731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2UxMNe7zcNfDJdT34DoHq3sXDdAfIbt5bidn1HQudGs=;
 b=gANRXFAzftDNDqqmtTKnhaD2xHPD7GCpV1DgBM2tJV8nx3LgqAIoW4h1RGQR5QF67TrtV/
 j+9Z0X6bOAEsqIeCgDWWkWqoZ6NSv91G9tgAo6c7wrIVT0U0ht1xPCn8Ax0gmyLTTJjqmv
 K0iZkUvyX2gXCClZR2gFPn61tdNaNzs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-r9x0GFZkMe2jGHyv7pp3TA-1; Tue, 04 May 2021 03:18:48 -0400
X-MC-Unique: r9x0GFZkMe2jGHyv7pp3TA-1
Received: by mail-wr1-f71.google.com with SMTP id
 93-20020adf93e60000b029010d9bb1923eso5413899wrp.4
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 00:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2UxMNe7zcNfDJdT34DoHq3sXDdAfIbt5bidn1HQudGs=;
 b=gV9l6GQv4ZP3KumbEzrCVvxX/xlToluTlc+S90DS/NWECTUe3hE1uwElzLy6OkZ3QM
 Qp/ho4OV1pfbcGpyuT1oSo7e2Ij0nbi1oIBLGGqPEcLCBf9e2TcDNB0CzsoxWay8CBNs
 uI7UoMjh2ePoM8FK3MkaHXlsUifgsToN+AXM4KSnlGCWkci2SnMlf+iDhoxoBpPY4Pqr
 sj/sYY/Pq+iAqnClm2WEfXzDLXDSVolIrqj7wIrZliYM51aPNzXGF5bzX2Wh0/uZwmiJ
 mm+5bntaNqwOa+hCSc7w0TgSculyOD+6MtCqHCIdZtdu0V7LMRuUPg9rgcK+9+8wHrl4
 LPLQ==
X-Gm-Message-State: AOAM533Ss1sobHrYFOiq2oC1KzSJZb4X2mBKQrTdim/pWKSnoglcwR6K
 ZX5egXRlKM4YLi9508IF0YdWYD4bzdLCMEOeRiWDI56KZH2Df7DZ+teyfQ54sCNVh8bNMgoPvwA
 1tYZmDSR58ZKMXAM=
X-Received: by 2002:a05:600c:190c:: with SMTP id
 j12mr2304056wmq.41.1620112727236; 
 Tue, 04 May 2021 00:18:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwml1mjlV6PsjD+z6jBWwtGwXW7aLFnYGzKWjcp6gIXLJAit0BPCOOi187G49Jh93ZuKt750g==
X-Received: by 2002:a05:600c:190c:: with SMTP id
 j12mr2304028wmq.41.1620112727006; 
 Tue, 04 May 2021 00:18:47 -0700 (PDT)
Received: from thuth.remote.csb (p5791d35e.dip0.t-ipconnect.de.
 [87.145.211.94])
 by smtp.gmail.com with ESMTPSA id t2sm1494981wmg.38.2021.05.04.00.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 00:18:46 -0700 (PDT)
Subject: Re: [PATCH 3/3] tests: Avoid side effects inside g_assert() arguments
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210503165525.26221-1-peter.maydell@linaro.org>
 <20210503165525.26221-4-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3b1e76eb-43a3-5ff9-e4de-5ee32c3bf612@redhat.com>
Date: Tue, 4 May 2021 09:18:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210503165525.26221-4-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
 Corey Minyard <minyard@acm.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/05/2021 18.55, Peter Maydell wrote:
> For us, assertions are always enabled, but side-effect expressions
> inside the argument to g_assert() are bad style anyway. Fix three
> occurrences in IPMI related tests, which will silence some Coverity
> nits.
> 
> Fixes: CID 1432322, CID 1432287, CID 1432291
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/qtest/ipmi-bt-test.c  | 6 ++++--
>   tests/qtest/ipmi-kcs-test.c | 3 ++-
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qtest/ipmi-bt-test.c b/tests/qtest/ipmi-bt-test.c
> index a42207d416f..8492f02a9c3 100644
> --- a/tests/qtest/ipmi-bt-test.c
> +++ b/tests/qtest/ipmi-bt-test.c
> @@ -98,7 +98,8 @@ static void bt_wait_b_busy(void)
>   {
>       unsigned int count = 1000;
>       while (IPMI_BT_CTLREG_GET_B_BUSY() != 0) {
> -        g_assert(--count != 0);
> +        --count;
> +        g_assert(count != 0);
>           usleep(100);
>       }
>   }
> @@ -107,7 +108,8 @@ static void bt_wait_b2h_atn(void)
>   {
>       unsigned int count = 1000;
>       while (IPMI_BT_CTLREG_GET_B2H_ATN() == 0) {
> -        g_assert(--count != 0);
> +        --count;
> +        g_assert(count != 0);
>           usleep(100);
>       }
>   }
> diff --git a/tests/qtest/ipmi-kcs-test.c b/tests/qtest/ipmi-kcs-test.c
> index fc0a918c8d1..afc24dd3e46 100644
> --- a/tests/qtest/ipmi-kcs-test.c
> +++ b/tests/qtest/ipmi-kcs-test.c
> @@ -73,7 +73,8 @@ static void kcs_wait_ibf(void)
>   {
>       unsigned int count = 1000;
>       while (IPMI_KCS_CMDREG_GET_IBF() != 0) {
> -        g_assert(--count != 0);
> +        --count;
> +        g_assert(count != 0);
>       }
>   }

According to 
https://developer.gnome.org/glib/unstable/glib-Testing.html#g-assert 
g_assert() should be avoided in unit tests and g_assert_true() should be 
used instead. So I think it might be nicer to use g_assert_true() here?

  Thomas


