Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7B02FBC6B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:29:51 +0100 (CET)
Received: from localhost ([::1]:54206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tt8-0001xW-7j
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l1trN-00016d-VZ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:28:02 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l1trL-00061f-Lw
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:28:01 -0500
Received: by mail-wr1-x431.google.com with SMTP id l12so15110342wry.2
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 08:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version; bh=3sguUzVB30CvIwmzATbkX0C3iWNmNy1/g4UZbRdeoLM=;
 b=LxsVDuyjPe7i9X8RpDfmPJrWU246Rvn6xqx0SWIeQEjeGwc2i8v1wYDF+26BU69B7I
 R2pzLgXPxzIC9RhVV1q6SudOO60EtwPoclK7Q7ImfPW6KxjWSOJBkZu+MoNZPmaylbl8
 EKEMN4zgriSCQWe/dsINJm746YRKzRZHRFfjbOarlDM/7g5v65yqPHz99f9aKx7URaEC
 AgVIHspqfM7cudi6y43p07K3fzw+7D/Yh9YwvxtHzitGn6bWslbz2ilot1ch+JJ3tx5C
 dQN9QkO02sb2+fxXxVUiXm4+20TB8G4wlk+LdbkGo7jBcnit1kRKieV8/a3SrsI6tweh
 KECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version;
 bh=3sguUzVB30CvIwmzATbkX0C3iWNmNy1/g4UZbRdeoLM=;
 b=qOdhJpaeMqlVfyNpz+vKNtvjXUcQnGZ5iPvUEqz0NgIWskxZsHafokQnbq8sWezIVv
 PUw4zs2QnP8KQVmBmsCDmder6QYnXi9x+WOwVIu0RC61JobUeFV6OrrZsKL1RJ4KKdi0
 PUhe/RKYr8UlNpdW/r7dZIeq+qpJA0tnTNw28O36I+7PgJrY8JF2PxKAPdqpd2e1YzyZ
 kkiIobI2IX0lJKRcMInB0bZrtkql0JYhtfbwl75ZiuDyFlsNRys+QhgM4cQxnLnYrgfq
 +bGlboJfTPauqMCk1NaQODjOTXOAWtR8rRkbgoMcp3jvCrx0WjsC1+I9kGSWCioPYl3l
 S5uA==
X-Gm-Message-State: AOAM531ITdf4cMD4zh0viWC5e17crutQ4qClQckfldZlLAevLLJrS7cv
 Q6iB1PcKv3fwp/eTx7SbO597cw==
X-Google-Smtp-Source: ABdhPJwADcbKKYPw81NWUxVJR5OuFrAG5b7cMQuZWzC/mHIeFjP5SpD2L2ZuAPJSAlGgxPM4g/PmbA==
X-Received: by 2002:adf:f60b:: with SMTP id t11mr5227212wrp.401.1611073677577; 
 Tue, 19 Jan 2021 08:27:57 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id b13sm34008021wrt.31.2021.01.19.08.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 08:27:57 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 0a6b7ba7;
 Tue, 19 Jan 2021 16:27:56 +0000 (UTC)
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [External] : Re: [RFC PATCH 1/2] hw/i386: -cpu
 model,-feature,+feature should enable feature
In-Reply-To: <20210119152056.GE1227584@habkost.net>
References: <20210119142207.3443123-1-david.edmondson@oracle.com>
 <20210119142207.3443123-2-david.edmondson@oracle.com>
 <20210119152056.GE1227584@habkost.net>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
X-Now-Playing: Four Tet - Parallel: Parallel 1
Date: Tue, 19 Jan 2021 16:27:56 +0000
Message-ID: <cuna6t499ir.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::431;
 envelope-from=dme@dme.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-01-19 at 10:20:56 -05, Eduardo Habkost wrote:

> Hi,
>
> Thanks for the patch.  Getting rid of special -feature/+feature
> behavior was in our TODO list for a long time.
>
> On Tue, Jan 19, 2021 at 02:22:06PM +0000, David Edmondson wrote:
>> "Minus" features are applied after "plus" features, so ensure that a
>> later "plus" feature causes an earlier "minus" feature to be removed.
>> 
>> This has no effect on the existing "-feature,feature=on" backward
>> compatibility code (which warns and turns the feature off).
>
> If we are changing behavior, why not change behavior of
> "-feature,feature=on" at the same time?  This would allow us to
> get rid of plus_features/minus_features completely and just make
> +feature/-feature synonyms to feature=on/feature=off.

Okay, I'll do that.

Given that there have been warnings associated with
"-feature,feature=on" for a while, changing that behaviour seems
acceptable.

Would the same be true for changing "-feature,+feature"? (i.e. what this
patch does) Really: can this just be changed, or does there have to be
some period where the behaviour stays the same with a warning?

>> 
>> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
>> ---
>>  target/i386/cpu.c                   | 33 +++++++++++++++++++++++------
>>  tests/qtest/test-x86-cpuid-compat.c |  8 +++----
>>  2 files changed, 30 insertions(+), 11 deletions(-)
>> 
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 35459a38bb..13f58ef183 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -4750,13 +4750,32 @@ static void x86_cpu_parse_featurestr(const char *typename, char *features,
>>          GlobalProperty *prop;
>>  
>>          /* Compatibility syntax: */
>> -        if (featurestr[0] == '+') {
>> -            plus_features = g_list_append(plus_features,
>> -                                          g_strdup(featurestr + 1));
>> -            continue;
>> -        } else if (featurestr[0] == '-') {
>> -            minus_features = g_list_append(minus_features,
>> -                                           g_strdup(featurestr + 1));
>> +        if (featurestr[0] == '+' || featurestr[0] == '-') {
>> +            const char *feat = featurestr + 1;
>> +            GList **remove, **add;
>> +            GList *val;
>> +
>> +            if (featurestr[0] == '+') {
>> +                remove = &minus_features;
>> +                add = &plus_features;
>> +            } else {
>> +                remove = &plus_features;
>> +                add = &minus_features;
>> +            }
>> +
>> +            val = g_list_find_custom(*remove, feat, compare_string);
>> +            if (val) {
>> +                char *data = val->data;
>> +
>> +                *remove = g_list_remove(*remove, data);
>> +                g_free(data);
>> +            }
>> +
>> +            val = g_list_find_custom(*add, feat, compare_string);
>> +            if (!val) {
>> +                *add = g_list_append(*add, g_strdup(feat));
>> +            }
>
> I believe we'll be able to get rid of plus_features/minus_features
> completely if we remove compatibility of "-feature,feature=on".
> But if we don't, wouldn't it be simpler to replace
> plus_features/minus_features with a single list, appending items
> in the order they appear?

Will investigate.

>> +
>>              continue;
>>          }
>>  
>> diff --git a/tests/qtest/test-x86-cpuid-compat.c b/tests/qtest/test-x86-cpuid-compat.c
>> index 7ca1883a29..6824d2b13e 100644
>> --- a/tests/qtest/test-x86-cpuid-compat.c
>> +++ b/tests/qtest/test-x86-cpuid-compat.c
>> @@ -171,18 +171,18 @@ static void test_plus_minus_subprocess(void)
>>      char *path;
>>  
>>      /* Rules:
>> -     * 1)"-foo" overrides "+foo"
>> +     * 1) The later of "+foo" or "-foo" wins
>>       * 2) "[+-]foo" overrides "foo=..."
>>       * 3) Old feature names with underscores (e.g. "sse4_2")
>>       *    should keep working
>>       *
>> -     * Note: rules 1 and 2 are planned to be removed soon, and
>> -     * should generate a warning.
>> +     * Note: rule 2 is planned to be removed soon, and should generate
>> +     * a warning.
>>       */
>>      qtest_start("-cpu pentium,-fpu,+fpu,-mce,mce=on,+cx8,cx8=off,+sse4_1,sse4_2=on");
>>      path = get_cpu0_qom_path();
>>  
>> -    g_assert_false(qom_get_bool(path, "fpu"));
>> +    g_assert_true(qom_get_bool(path, "fpu"));
>>      g_assert_false(qom_get_bool(path, "mce"));
>>      g_assert_true(qom_get_bool(path, "cx8"));
>>  
>> -- 
>> 2.29.2
>> 
>
> -- 
> Eduardo

dme.
-- 
They must have taken my marbles away.

