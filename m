Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2752C372881
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:11:23 +0200 (CEST)
Received: from localhost ([::1]:57444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lds1S-0003mz-6l
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldrxr-0000B9-Db
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:07:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldrxp-0005rP-J9
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620122853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MI2/n1OGEGl6XD4YWQLpncbpOVhDC0gelJ8hlxnt8UM=;
 b=XeryWdrIwO9w1yxeflCCuGV8V3DY9cdBMpNByEDhthE0Sy8SZjX/sUo8lWMf3QdtquNI1k
 cDZz/JiIOeAS0S//R75+f6hzAnj5hLKkJUCaKv/i+6nsN/LPe/ytJ793axPA1WgcWBMvOb
 ZaU+RcO5GzgEATjOXwNp7MydG3Op8F0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-54JKcozxOXazfYpL01Wk0g-1; Tue, 04 May 2021 06:07:31 -0400
X-MC-Unique: 54JKcozxOXazfYpL01Wk0g-1
Received: by mail-wr1-f70.google.com with SMTP id
 u5-20020adf9e050000b029010df603f280so2611501wre.18
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MI2/n1OGEGl6XD4YWQLpncbpOVhDC0gelJ8hlxnt8UM=;
 b=VlPQ0TnFlXd4P0Nhd7vZzQgbAIL39BON1UXshqqZanJ0+OI5XDnUU5uc17+rK8+W72
 3F/rFUqzCrBcs7OLL6Pr94gYJ/+clH86UjFxrGQpH/mMF/WzQV2aaEs6jGYEsTLzkZmD
 PNxmdWq0TIrZWz6lluT0jQgs680o371c2a4J0FZnjke2t/jYWh5A3iy29+2EpUjnn0pk
 +AyvIDoZZpyqxKqDvpkrrZbgu5nCp4fvlVtoQXs2FHYyinUJYiAtN1ROg8ZSPEipVb5C
 tAv3t8LQgDQ1oQJzxRYuUUbLMFqUWc28+Zws+g6rsKC9D9j/b0cssbocq5CJbv+asIvB
 pXNQ==
X-Gm-Message-State: AOAM533drLCHMF7oBFD3jYspJb+wYFaUkjQIj3hRtfkBseYPi9ZdnxfF
 c29RLGMNE5BCQ04abmPo6OZceKou68kyS5u3hpJJcuthglRVXsMyBShRIofmN/JlPklfEaR2BnQ
 Uxyh9nXDEjQN9I/I=
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr3117015wml.146.1620122850357; 
 Tue, 04 May 2021 03:07:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnC3iefNgzA2uJE9WCl76yiUoklScSQlMSYxApNQXeFCBFPC/dRnvXvJBTrZqePNLiINO0yQ==
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr3116994wml.146.1620122850172; 
 Tue, 04 May 2021 03:07:30 -0700 (PDT)
Received: from thuth.remote.csb (p5791d35e.dip0.t-ipconnect.de.
 [87.145.211.94])
 by smtp.gmail.com with ESMTPSA id t2sm1995361wmg.38.2021.05.04.03.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 03:07:29 -0700 (PDT)
Subject: Re: [PATCH] tests/migration-test: Fix "true" vs true
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, lvivier@redhat.com, peter.maydell@linaro.org
References: <20210504100545.112213-1-dgilbert@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d3a05612-92dd-b926-48db-825e00e1065a@redhat.com>
Date: Tue, 4 May 2021 12:07:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210504100545.112213-1-dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/05/2021 12.05, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Accidental use of "true" as a boolean; spotted by coverity
> and Peter.
> 
> Fixes: b99784ef6c3
> Fixes: d795f47466e
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Reported-by: Coverity (CID 1432373, 1432292, 1432288)
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   tests/qtest/migration-test.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 3a711bb492..4d989f191b 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -898,8 +898,8 @@ static void test_xbzrle(const char *uri)
>   
>       migrate_set_parameter_int(from, "xbzrle-cache-size", 33554432);
>   
> -    migrate_set_capability(from, "xbzrle", "true");
> -    migrate_set_capability(to, "xbzrle", "true");
> +    migrate_set_capability(from, "xbzrle", true);
> +    migrate_set_capability(to, "xbzrle", true);
>       /* Wait for the first serial output from the source */
>       wait_for_serial("src_serial");
>   
> @@ -1246,8 +1246,8 @@ static void test_multifd_tcp(const char *method)
>       migrate_set_parameter_str(from, "multifd-compression", method);
>       migrate_set_parameter_str(to, "multifd-compression", method);
>   
> -    migrate_set_capability(from, "multifd", "true");
> -    migrate_set_capability(to, "multifd", "true");
> +    migrate_set_capability(from, "multifd", true);
> +    migrate_set_capability(to, "multifd", true);
>   
>       /* Start incoming migration from the 1st socket */
>       rsp = wait_command(to, "{ 'execute': 'migrate-incoming',"
> @@ -1330,8 +1330,8 @@ static void test_multifd_tcp_cancel(void)
>       migrate_set_parameter_int(from, "multifd-channels", 16);
>       migrate_set_parameter_int(to, "multifd-channels", 16);
>   
> -    migrate_set_capability(from, "multifd", "true");
> -    migrate_set_capability(to, "multifd", "true");
> +    migrate_set_capability(from, "multifd", true);
> +    migrate_set_capability(to, "multifd", true);
>   
>       /* Start incoming migration from the 1st socket */
>       rsp = wait_command(to, "{ 'execute': 'migrate-incoming',"
> @@ -1358,7 +1358,7 @@ static void test_multifd_tcp_cancel(void)
>   
>       migrate_set_parameter_int(to2, "multifd-channels", 16);
>   
> -    migrate_set_capability(to2, "multifd", "true");
> +    migrate_set_capability(to2, "multifd", true);
>   
>       /* Start incoming migration from the 1st socket */
>       rsp = wait_command(to2, "{ 'execute': 'migrate-incoming',"
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


