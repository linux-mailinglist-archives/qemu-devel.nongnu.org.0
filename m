Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1874E532DE7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:55:33 +0200 (CEST)
Received: from localhost ([::1]:36802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWse-000422-6h
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntWhR-00006W-5N
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:43:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntWhN-0005fT-Ht
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653407032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pLOz8yxAQHBC5Fs0RtBgXJkLZ4xSyDtVDE0Ca4CH0PI=;
 b=GdO879lE5uFwIRB7q/Qk5SG/R7+/TlYk3JodEBVqGE2M6Yuht/Y1gEt4ogV/Lik65kYDhQ
 b4+FfTQuLaIYOO5Ejeu4PzCfNXd9Ivwwc62WlTOoXyb/Fw62J4ILmz3AIqpj4y/nuL6NSw
 vPx98vEWfQ9B/H5Qzw7Ywb183Ew4HNM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-nopVJ8KyM9ePbFzLoNFAxA-1; Tue, 24 May 2022 11:43:51 -0400
X-MC-Unique: nopVJ8KyM9ePbFzLoNFAxA-1
Received: by mail-wr1-f70.google.com with SMTP id
 w17-20020adf8bd1000000b0020fc99aee61so2056635wra.18
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pLOz8yxAQHBC5Fs0RtBgXJkLZ4xSyDtVDE0Ca4CH0PI=;
 b=J227MVWGMv04OXJp1+/463S/sXRAAjnk1eaMTBhf8vB1fagLAgl5WvWeWD/7VY/2Mu
 hw2HmwPwels+ef4b8KzIZ0IRxYt33E6HERvUAmWET4wDkgNuCuXP/exE0o5fiB5rxm8Z
 xzagWRgVjz6hkiaIpnYw0HL3Sv9zmzVV83WNgIGMQchP96hcaaTVQINfF0IXyGQAFTuU
 nA4hluUenqxEvW+M8cHIHBqOgCuFUKYGbJeAbtVBU+EDW4RhjENtT4jqVvNLFN+664b5
 v8QU1V1YPbBlGjZZt5vIPgK9VgzLVDW8wuFTVpiAvWriQv7yk/EcY90pjKdmJISBEEeo
 Sucw==
X-Gm-Message-State: AOAM5339W932hmbq0EH2ImBQu9WJr2K/FMYHjKYZiqNYFzdAAKIGVk/8
 xng+5OHxMB5LEE+kT/37rumBxUPGGAzbZ5Vw2xopwjOMckXcKBWVSAZ4puxNfAU9im9uOQ6+4J+
 pmAECCAb9rSA85io=
X-Received: by 2002:a7b:c08a:0:b0:397:5859:deb5 with SMTP id
 r10-20020a7bc08a000000b003975859deb5mr4331449wmh.121.1653407030320; 
 Tue, 24 May 2022 08:43:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2b5zVJTo57+9x81moUbEGf2/x3GZsUpHuXwgFzrc+mrLA0HhNOtbjVwn/SSv/556efOpH3w==
X-Received: by 2002:a7b:c08a:0:b0:397:5859:deb5 with SMTP id
 r10-20020a7bc08a000000b003975859deb5mr4331427wmh.121.1653407030097; 
 Tue, 24 May 2022 08:43:50 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 bg26-20020a05600c3c9a00b003942a244f50sm2634997wmb.41.2022.05.24.08.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 08:43:49 -0700 (PDT)
Message-ID: <9c313696-6626-0b9e-0625-394fb2b38e21@redhat.com>
Date: Tue, 24 May 2022 17:43:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 07/15] tests/qtest: pass stdout/stderr down to subtests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
 <20220524154056.2896913-8-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220524154056.2896913-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/05/2022 17.40, Alex Bennée wrote:
> When trying to work out what the virtio-net-tests where doing it was
> hard because the g_test_trap_subprocess redirects all output to
> /dev/null. Lift this restriction by using the appropriate flags so you
> can see something similar to what the vhost-user-blk tests show when
> running.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220407150042.2338562-1-alex.bennee@linaro.org>
> 
> ---
> v2
>    - keep dumping of CLI behind the g_test_verbose flag
> ---
>   tests/qtest/qos-test.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
> index f97d0a08fd..7e1c8fc579 100644
> --- a/tests/qtest/qos-test.c
> +++ b/tests/qtest/qos-test.c
> @@ -185,7 +185,8 @@ static void run_one_test(const void *arg)
>   static void subprocess_run_one_test(const void *arg)
>   {
>       const gchar *path = arg;
> -    g_test_trap_subprocess(path, 0, 0);
> +    g_test_trap_subprocess(path, 0,
> +                           G_TEST_SUBPROCESS_INHERIT_STDOUT | G_TEST_SUBPROCESS_INHERIT_STDERR);
>       g_test_trap_assert_passed();
>   }
>   

Acked-by: Thomas Huth <thuth@redhat.com>


