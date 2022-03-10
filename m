Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311D44D42BA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 09:38:23 +0100 (CET)
Received: from localhost ([::1]:46226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSEJS-0003vR-0c
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 03:38:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSEI9-0003CY-75
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 03:37:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSEI7-0005Ns-IU
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 03:37:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646901418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BfCubYLkiGjVLWAS4UngcKf/iQI6u1PFOh6TcSvStxM=;
 b=inTu+bWZG9XFqAiBKdXOZgylk37lpsGOfVnPhC/yh0ALA4nf4Mrxi0hTVCd4LfGVpgT7KT
 JiiueTU01XWZF0n/jBF8b2NRGCfOkPvwAF7sc7hKxO0xcjLCDzDjK/maHfMwBMi4UQ6GJc
 SWX00qjUN+lwhArQSsdPHEIBOnyR69A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-fySuRkJOMCKRZcCvwBb6Qg-1; Thu, 10 Mar 2022 03:36:55 -0500
X-MC-Unique: fySuRkJOMCKRZcCvwBb6Qg-1
Received: by mail-wr1-f69.google.com with SMTP id
 y13-20020adfee0d000000b001f1fa450a3dso1436884wrn.11
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 00:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BfCubYLkiGjVLWAS4UngcKf/iQI6u1PFOh6TcSvStxM=;
 b=kyWjYN8O6EgP2odUdRuKV/ZoMn8huW82AV7leMBTkuLtO7ZMpuWLJD7iGIwa0z2ow0
 ewlJnKw6HRf6+FGNtxYa2oKMnQf5N8thWwu2EAOulgJbQw9Vc9Oh8glCHRiiN0lB64mu
 haGfxUp6KDvcpInFVNm3zgP8yydaICqGmHBPkCFAk37WRj/tjSAF0tJ8C+VJr9oYQW4v
 PDOjdnSXrDLMrP/vWTNb6hb0GH+vql3DKD2OCqfNcDOatmYLELDZ4molb+Y1utjXfoqB
 HH0u4TUTu63PcdCEipy0EQGTVECoHj2Gb+hHHMvKZK2AQ+pVK6DLV4O5KgbDcP65RCax
 O4Wg==
X-Gm-Message-State: AOAM532i2axVfaxvox0onT35/vYfDQlel9ZuGwpTKtElJjHYCjAVpaVJ
 emAayMuaPt6VpCmITAWbp+fhtScy3OxXB+/NDnKogyg7LdXP+4CuexUcoxhl4sm+xejb92wuJU+
 KHMLYt9ETIQkjBgQ=
X-Received: by 2002:a05:600c:3b12:b0:381:80ed:aae4 with SMTP id
 m18-20020a05600c3b1200b0038180edaae4mr10706093wms.111.1646901414619; 
 Thu, 10 Mar 2022 00:36:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfrsTLzzJpyYmDHEqywCYGjATH66LthTqw1TuCtmwCm5SyYC5/wjaf7R5VDK15kK8WKy8RPw==
X-Received: by 2002:a05:600c:3b12:b0:381:80ed:aae4 with SMTP id
 m18-20020a05600c3b1200b0038180edaae4mr10706068wms.111.1646901414239; 
 Thu, 10 Mar 2022 00:36:54 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c4fd400b00389ded79198sm971803wmq.34.2022.03.10.00.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 00:36:53 -0800 (PST)
Message-ID: <5ac2ce87-90a3-05f9-d65e-a8ef9854863c@redhat.com>
Date: Thu, 10 Mar 2022 09:36:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH] tests/tcg: drop -cpu max from s390x sha512-mvx
 invocation
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220309112248.4083619-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220309112248.4083619-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/2022 12.22, Alex Bennée wrote:
> With -cpu max we get a warning:
> 
>    qemu-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.
> 
> But dropping the -cpu max and it still runs fine.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> ---
>   tests/tcg/s390x/Makefile.target | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index 257c568c58..7aa502a557 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -34,6 +34,4 @@ sha512-mvx: CFLAGS=-march=z13 -mvx -O3
>   sha512-mvx: sha512.c
>   	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
>   
> -run-sha512-mvx: QEMU_OPTS+=-cpu max
> -
>   TESTS+=sha512-mvx

Ok, this helps to get rid of the warnings, thus feel free to add:

Tested-by: Thomas Huth <thuth@redhat.com>

However, the error still persists. I now had a closer look by running the 
test with "qemu-s390x" on my z15 machine directly, and all tests are 
failing! The problem happens with both, gcc v11.2.1 and clang v13.0.1. The 
problem goes away (i.e. test works fine) if I compile the code with -O1 
instead of -O3, or if I use GCC v8.5 instead. I'll try to find out more, but 
as a temporary workaround, we could also switch to -O1 instead of -O3.

  Thomas


