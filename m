Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 136175266EC
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:22:12 +0200 (CEST)
Received: from localhost ([::1]:44200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npY3P-0005rj-5V
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1npXqa-0005r7-79
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:08:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1npXqX-0003z6-Un
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:08:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652458133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RdEHetMbE1AtFJvaLcwsISLedTzjODBUZUzPDxTT/QY=;
 b=H3A4joNVlJABSU0XQgj0yLvBzknenHAuNw0CfEHrW6LXFcaE9Oz1hw1U4DvgcMBd7FpRN1
 sPJ7b+rXNI6EHkmHLRmP9o8FHNBfP+h6oa58h0eDtrJLG1sIUpOtSlV2PX2ccqS2wpFinA
 asedzdkAcGl8msW8s808nPH2HpDKLH4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-yOKyRhG_MF-jALTOLct_Nw-1; Fri, 13 May 2022 12:08:51 -0400
X-MC-Unique: yOKyRhG_MF-jALTOLct_Nw-1
Received: by mail-wr1-f69.google.com with SMTP id
 o11-20020adfca0b000000b0020adc114131so3077336wrh.8
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 09:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RdEHetMbE1AtFJvaLcwsISLedTzjODBUZUzPDxTT/QY=;
 b=72quz1z5MJneNJoohaqaEOOu0gwTAX0o2Q9mNJvj5ZHU/6cIAqHMlmL3KDsVJS/A/u
 OwNSltdShTz7uBgX1IBqj9u59Iprqx005dqhtdUKYAdh5acDhiOPyaLcKJlj1LKt4MMH
 yxZTjGl50bmti3kDDM6MckZWBgP18RYuIPLIwtCASakEf8dUOgeIqrBwc9DnPVVX7MiN
 GD+UlR0Z/Z4qEKRtVch+BD52xcn2M4nvdYTp4jadAp5TtFgpA4UEbncPlSQ96tFEgbW9
 BuwpcwdA59yvuxRsEULa2CgNOFW1Aj6tFJ3eRtNZEL03uX+0KOeZgbE6/DrjStzgS7TT
 z5Fg==
X-Gm-Message-State: AOAM531FQHsjy7+4j1a1NbhYngJDLwowQzsKe0LiHJmjOmPBBQmKPvpq
 LwRyWu/B/DYt2SnmrQqcCUDXfCBa3DwvqhrfxzNRxuWt4MPmUS6G2qJgLzWfCTry8TwhdylObti
 hMyqrfBimT12ZHoo=
X-Received: by 2002:a5d:4a84:0:b0:20c:47b6:61ee with SMTP id
 o4-20020a5d4a84000000b0020c47b661eemr4705755wrq.68.1652458130521; 
 Fri, 13 May 2022 09:08:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGpYbzYa0j1BDDVWsPi/SvCTbFXB67b7n+bNt39j/YaKJ7LIe/JhuVa/TLzVOSKxtoj++mNg==
X-Received: by 2002:a5d:4a84:0:b0:20c:47b6:61ee with SMTP id
 o4-20020a5d4a84000000b0020c47b661eemr4705736wrq.68.1652458130287; 
 Fri, 13 May 2022 09:08:50 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 z19-20020a1cf413000000b003942a244ee3sm2741599wma.40.2022.05.13.09.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 09:08:49 -0700 (PDT)
Message-ID: <af414a58-e4d7-69c0-c2b3-d1704cbf1694@redhat.com>
Date: Fri, 13 May 2022 18:08:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/2] tests/qtest: fix registration of ABRT handler for
 QEMU cleanup
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20220513154906.206715-1-berrange@redhat.com>
 <20220513154906.206715-2-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220513154906.206715-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 13/05/2022 17.49, Daniel P. Berrangé wrote:
> qtest_init registers a hook to cleanup the running QEMU process
> should g_assert() fire before qtest_quit is called. When the first
> hook is registered, it is supposed to triggere registration of the
> SIGABRT handler. Unfortunately the logic in hook_list_is_empty is
> inverted, so the SIGABRT handler never gets registered, unless
> 2 or more QEMU processes are run concurrently. This caused qtest
> to leak QEMU processes anytime g_assert triggers.

Ouch, thanks for spotting it!

> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qtest/libqtest.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 228357f1ea..4a4697c0d1 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -197,11 +197,11 @@ static bool hook_list_is_empty(GHookList *hook_list)
>       GHook *hook = g_hook_first_valid(hook_list, TRUE);
>   
>       if (!hook) {
> -        return false;
> +        return true;
>       }
>   
>       g_hook_unref(hook_list, hook);
> -    return true;
> +    return false;
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


