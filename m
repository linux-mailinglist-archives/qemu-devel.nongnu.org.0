Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F5A2FBBD3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:02:20 +0100 (CET)
Received: from localhost ([::1]:33674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tSV-0004ag-CT
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l1sog-0002v4-5M
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:21:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l1soc-0002wQ-Vw
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:21:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611069665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CZOUtDJ4E5AAV3YMyNbLdC+YsRw9H93EdsRSv1UAAtM=;
 b=HjdUC1OlC22cdazdDqR7GdHIapd3sr2V+WwSkoHz2tSSQVOL6JIYMCvXx4Ib6+Hzt0/F9p
 d7isjOSw5FajSBqwZbbKQnrdK6Wbr3wtrRRxcXNfCC8RXMm1YAFLG1qEG1bL6mnWkGchUv
 lM64h/FljpGRVysNemn5ZhVdnoiYTfs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-CsSqHWTCOL2pIg4F0eIpeA-1; Tue, 19 Jan 2021 10:21:03 -0500
X-MC-Unique: CsSqHWTCOL2pIg4F0eIpeA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77C178014D9;
 Tue, 19 Jan 2021 15:21:02 +0000 (UTC)
Received: from localhost (ovpn-118-239.rdu2.redhat.com [10.10.118.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 187536B551;
 Tue, 19 Jan 2021 15:20:56 +0000 (UTC)
Date: Tue, 19 Jan 2021 10:20:56 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [RFC PATCH 1/2] hw/i386: -cpu model,-feature,+feature should
 enable feature
Message-ID: <20210119152056.GE1227584@habkost.net>
References: <20210119142207.3443123-1-david.edmondson@oracle.com>
 <20210119142207.3443123-2-david.edmondson@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20210119142207.3443123-2-david.edmondson@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi,

Thanks for the patch.  Getting rid of special -feature/+feature
behavior was in our TODO list for a long time.

On Tue, Jan 19, 2021 at 02:22:06PM +0000, David Edmondson wrote:
> "Minus" features are applied after "plus" features, so ensure that a
> later "plus" feature causes an earlier "minus" feature to be removed.
> 
> This has no effect on the existing "-feature,feature=on" backward
> compatibility code (which warns and turns the feature off).

If we are changing behavior, why not change behavior of
"-feature,feature=on" at the same time?  This would allow us to
get rid of plus_features/minus_features completely and just make
+feature/-feature synonyms to feature=on/feature=off.

> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  target/i386/cpu.c                   | 33 +++++++++++++++++++++++------
>  tests/qtest/test-x86-cpuid-compat.c |  8 +++----
>  2 files changed, 30 insertions(+), 11 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 35459a38bb..13f58ef183 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4750,13 +4750,32 @@ static void x86_cpu_parse_featurestr(const char *typename, char *features,
>          GlobalProperty *prop;
>  
>          /* Compatibility syntax: */
> -        if (featurestr[0] == '+') {
> -            plus_features = g_list_append(plus_features,
> -                                          g_strdup(featurestr + 1));
> -            continue;
> -        } else if (featurestr[0] == '-') {
> -            minus_features = g_list_append(minus_features,
> -                                           g_strdup(featurestr + 1));
> +        if (featurestr[0] == '+' || featurestr[0] == '-') {
> +            const char *feat = featurestr + 1;
> +            GList **remove, **add;
> +            GList *val;
> +
> +            if (featurestr[0] == '+') {
> +                remove = &minus_features;
> +                add = &plus_features;
> +            } else {
> +                remove = &plus_features;
> +                add = &minus_features;
> +            }
> +
> +            val = g_list_find_custom(*remove, feat, compare_string);
> +            if (val) {
> +                char *data = val->data;
> +
> +                *remove = g_list_remove(*remove, data);
> +                g_free(data);
> +            }
> +
> +            val = g_list_find_custom(*add, feat, compare_string);
> +            if (!val) {
> +                *add = g_list_append(*add, g_strdup(feat));
> +            }

I believe we'll be able to get rid of plus_features/minus_features
completely if we remove compatibility of "-feature,feature=on".
But if we don't, wouldn't it be simpler to replace
plus_features/minus_features with a single list, appending items
in the order they appear?

> +
>              continue;
>          }
>  
> diff --git a/tests/qtest/test-x86-cpuid-compat.c b/tests/qtest/test-x86-cpuid-compat.c
> index 7ca1883a29..6824d2b13e 100644
> --- a/tests/qtest/test-x86-cpuid-compat.c
> +++ b/tests/qtest/test-x86-cpuid-compat.c
> @@ -171,18 +171,18 @@ static void test_plus_minus_subprocess(void)
>      char *path;
>  
>      /* Rules:
> -     * 1)"-foo" overrides "+foo"
> +     * 1) The later of "+foo" or "-foo" wins
>       * 2) "[+-]foo" overrides "foo=..."
>       * 3) Old feature names with underscores (e.g. "sse4_2")
>       *    should keep working
>       *
> -     * Note: rules 1 and 2 are planned to be removed soon, and
> -     * should generate a warning.
> +     * Note: rule 2 is planned to be removed soon, and should generate
> +     * a warning.
>       */
>      qtest_start("-cpu pentium,-fpu,+fpu,-mce,mce=on,+cx8,cx8=off,+sse4_1,sse4_2=on");
>      path = get_cpu0_qom_path();
>  
> -    g_assert_false(qom_get_bool(path, "fpu"));
> +    g_assert_true(qom_get_bool(path, "fpu"));
>      g_assert_false(qom_get_bool(path, "mce"));
>      g_assert_true(qom_get_bool(path, "cx8"));
>  
> -- 
> 2.29.2
> 

-- 
Eduardo


