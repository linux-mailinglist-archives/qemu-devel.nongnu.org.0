Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ED555C69A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 14:52:58 +0200 (CEST)
Received: from localhost ([::1]:53744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Ai9-0005dV-Be
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 08:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o6Acc-00023o-B0
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:47:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o6Aca-00036G-Ln
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:47:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656420432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UF39MZ6SdyEiuWXKkDqypAf9yWRthjfCRORVR1Mni04=;
 b=ijWHOJFccxj79fob4oBnOKheTYCYiTX2KYqmn5ethpvWf8lKYlhA2cD5OVbWfs/uQw4xdf
 1fiqtBPGF70lp7FHxoHhuki5oHYeQvoSj/c9/ur07kvYbHQRsbkDMPSlBjbSPga/HGkyxw
 8l69Oto8zzXBqbMwMhYuXC/K7VmsW2A=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-4rd1pX4UPGG9jg623gspYQ-1; Tue, 28 Jun 2022 08:47:08 -0400
X-MC-Unique: 4rd1pX4UPGG9jg623gspYQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 e128-20020a376986000000b006af6adf035cso563861qkc.8
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 05:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UF39MZ6SdyEiuWXKkDqypAf9yWRthjfCRORVR1Mni04=;
 b=RzkjeOr310qibth+6aNWtL+GO1/1vA0qKOf7uvnUlqSnpVdvRSUcg0k3X816zmj9Y1
 SR93jE1wiBIBGHtHa9jffhOZxoXXzyx2VMbeMu7C22z0Vf0uM6AIC+B9pCYJCzf44dgp
 fbK0JT4ERzMGN4CZyZ69Q6Yq67pGTIwnpdzudg9+/m1/J7QIsWBvWFqQ1TYa+8QC9+3u
 VtxOGwCCCFCGbkpEzJNWCIo3r5DRSnNmylvTzW89RC/tRwGe2XMktIhb/Pq/3t0M4/jX
 199C7aOxtk1hwf+fK4J8WW3gNe+YjXMLT9ltKrToPpA5hml+kS/OmDCSIP2DWAqpleqe
 lKyA==
X-Gm-Message-State: AJIora/B5VAZRTkmCTslqd0Wt66Ziw7BFWJ45kB5PgB9CvRKMSQY6zmy
 Dxthj+Boh7R4tvn+sKsGAqWcmB/FwSMkQCTXkW3UHmiW5JGDzAw3RR4cbyUsUFFrz4rrayJY3s3
 vrsdzXCJKvsOONjQ=
X-Received: by 2002:a0c:e6a2:0:b0:470:45c8:6a84 with SMTP id
 j2-20020a0ce6a2000000b0047045c86a84mr3351489qvn.38.1656420428274; 
 Tue, 28 Jun 2022 05:47:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u5PEi37Lt+HGwY6dCXTROo+QBwYywWyZKN/t/37wJWUtByZwdm52ptCLkk6EnRX2d7VgiacA==
X-Received: by 2002:a0c:e6a2:0:b0:470:45c8:6a84 with SMTP id
 j2-20020a0ce6a2000000b0047045c86a84mr3351464qvn.38.1656420427946; 
 Tue, 28 Jun 2022 05:47:07 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a05620a248b00b006af4f9b77fdsm2145521qkn.44.2022.06.28.05.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 05:47:07 -0700 (PDT)
Message-ID: <8561314b-59c3-d85f-d5cb-88c55f790317@redhat.com>
Date: Tue, 28 Jun 2022 14:47:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/5] tests: wait max 120 seconds for migration test status
 changes
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220628105434.295905-1-berrange@redhat.com>
 <20220628105434.295905-2-berrange@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20220628105434.295905-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/06/2022 12:54, Daniel P. Berrangé wrote:
> Currently the wait_for_migration_fail and wait_for_migration_complete
> functions will spin in an infinite loop checking query-migrate status
> to detect a specific change/goal. This is fine when everything goes
> to plan, but when the unusual happens, these will hang the test suite
> forever.
> 
> Any normally executing migration test case normally takes < 1 second
> for a state change, with exception of the autoconverge test which
> takes about 5 seconds. Taking into account possibility of people
> running tests inside TCG, allowing a factor of x20 slowdown gives
> a reasonable worst case of 120 seconds. Anything taking longer than
> this is a strong sign that the test has hung, or the test should be
> rewritten to be faster.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qtest/migration-helpers.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-helpers.c
> index a6aa59e4e6..e81e831c85 100644
> --- a/tests/qtest/migration-helpers.c
> +++ b/tests/qtest/migration-helpers.c
> @@ -15,6 +15,14 @@
>   
>   #include "migration-helpers.h"
>   
> +/*
> + * Number of seconds we wait when looking for migration
> + * status changes, to avoid test suite hanging forever
> + * when things go wrong. Needs to be higher enough to
> + * avoid false positives on loaded hosts.
> + */
> +#define MIGRATION_STATUS_WAIT_TIMEOUT 120
> +
>   bool got_stop;
>   
>   static void check_stop_event(QTestState *who)
> @@ -166,8 +174,11 @@ static bool check_migration_status(QTestState *who, const char *goal,
>   void wait_for_migration_status(QTestState *who,
>                                  const char *goal, const char **ungoals)
>   {
> +    g_test_timer_start();
>       while (!check_migration_status(who, goal, ungoals)) {
>           usleep(1000);
> +
> +        g_assert(g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT);
>       }
>   }
>   
> @@ -178,6 +189,7 @@ void wait_for_migration_complete(QTestState *who)
>   
>   void wait_for_migration_fail(QTestState *from, bool allow_active)
>   {
> +    g_test_timer_start();
>       QDict *rsp_return;
>       char *status;
>       bool failed;
> @@ -193,6 +205,8 @@ void wait_for_migration_fail(QTestState *from, bool allow_active)
>           g_assert(result);
>           failed = !strcmp(status, "failed");
>           g_free(status);
> +
> +        g_assert(g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT);
>       } while (!failed);
>   
>       /* Is the machine currently running? */

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


