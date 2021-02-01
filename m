Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32D930B2AA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 23:17:36 +0100 (CET)
Received: from localhost ([::1]:36776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6hVn-0002Ul-Ij
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 17:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6hUs-00024I-3d
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 17:16:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6hUo-0001H9-7A
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 17:16:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612217792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9cqxBe3ySBFl/9obe5kcwMlPo2iBMq260jgVfCS70WY=;
 b=HrEY7LHvDSVCz2Ca6oNQoFeid1Q8hqekBG/9VIEdR6B0hse9J9b8882gJlo/X29pAPXpBE
 Mc3AN2GanZLHTlnxa8MADnb+DuprmSgWRPCuBeeVInx852naCvosy59nyNBsPoQ3flGdZ1
 h28UWmcQps7kU4ql/bKZyRF3ZaE5Fsw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-k2uHv6-aNUqL7go5ESK5EA-1; Mon, 01 Feb 2021 17:16:30 -0500
X-MC-Unique: k2uHv6-aNUqL7go5ESK5EA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8D731087D75;
 Mon,  1 Feb 2021 22:16:28 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4098B5DA60;
 Mon,  1 Feb 2021 22:16:28 +0000 (UTC)
Date: Mon, 1 Feb 2021 17:16:27 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH] i386: Add the support for AMD EPYC 3rd generation
 processors
Message-ID: <20210201221627.GH3872207@habkost.net>
References: <161133338780.27536.17735339269843944966.stgit@bmoger-ubuntu>
MIME-Version: 1.0
In-Reply-To: <161133338780.27536.17735339269843944966.stgit@bmoger-ubuntu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 22, 2021 at 10:36:27AM -0600, Babu Moger wrote:
> Adds the support for AMD 3rd generation processors. The model
> display for the new processor will be EPYC-Milan.
> 
> Adds the following new feature bits on top of the feature bits from
> the first and second generation EPYC models.
> 
> pcid    : Process context identifiers support
> ibrs    : Indirect Branch Restricted Speculation
> ssbd    : Speculative Store Bypass Disable
> erms    : Enhanced REP MOVSB/STOSB support
> fsrm    : Fast Short REP MOVSB support
> invpcid : Invalidate processor context ID
> pku     : Protection keys support
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
[...]
> @@ -4130,6 +4180,61 @@ static X86CPUDefinition builtin_x86_defs[] = {
>          .model_id = "AMD EPYC-Rome Processor",
>          .cache_info = &epyc_rome_cache_info,
>      },
> +    {
> +        .name = "EPYC-Milan",
[...]
> +        .features[FEAT_8000_0008_EBX] =
> +            CPUID_8000_0008_EBX_CLZERO | CPUID_8000_0008_EBX_XSAVEERPTR |
> +            CPUID_8000_0008_EBX_WBNOINVD | CPUID_8000_0008_EBX_IBPB |
> +            CPUID_8000_0008_EBX_IBRS | CPUID_8000_0008_EBX_STIBP |
> +            CPUID_8000_0008_EBX_AMD_SSBD,

This breaks query-cpu-model-expansion, see:
https://gitlab.com/ehabkost/qemu/-/jobs/1000347471#L350

20:11:28 ERROR| Reproduced traceback from: /builds/ehabkost/qemu/build/tests/venv/lib64/python3.6/site-packages/avocado/core/test.py:767
20:11:28 ERROR| Traceback (most recent call last):
20:11:28 ERROR|   File "/builds/ehabkost/qemu/build/tests/acceptance/cpu_queries.py", line 31, in test
20:11:28 ERROR|     self.assertNotIn('', c['unavailable-features'], c['name'])
20:11:28 ERROR|   File "/usr/lib64/python3.6/unittest/case.py", line 1096, in assertNotIn
20:11:28 ERROR|     self.fail(self._formatMessage(msg, standardMsg))
20:11:28 ERROR|   File "/builds/ehabkost/qemu/build/tests/venv/lib64/python3.6/site-packages/avocado/core/test.py", line 953, in fail
20:11:28 ERROR|     raise exceptions.TestFail(message)
20:11:28 ERROR| avocado.core.exceptions.TestFail: '' unexpectedly found in ['fma', 'pcid', 'avx', 'f16c', 'avx2', 'invpcid', 'rdseed', 'sha-ni', 'umip', 'rdpid', 'fsrm', 'fxsr-opt', 'misalignsse', '3dnowprefetch', 'osvw', 'topoext', 'perfctr-core', 'clzero', 'xsaveerptr', 'wbnoinvd', 'ibpb', '', 'amd-stibp', 'amd-ssbd', 'nrip-save', 'xsavec', 'xsaves'] : EPYC-Milan-v1

The root cause is the lack of name for CPUID_8000_0008_EBX_IBRS at
feature_word_info[CPUID_8000_0008_EBX_IBRS].feat_names[14].

I'm applying the following fixup.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 06c92650a17..8d4baf72e5b 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1033,7 +1033,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "clzero", NULL, "xsaveerptr", NULL,
             NULL, NULL, NULL, NULL,
             NULL, "wbnoinvd", NULL, NULL,
-            "ibpb", NULL, NULL, "amd-stibp",
+            "ibpb", NULL, "ibrs", "amd-stibp",
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             "amd-ssbd", "virt-ssbd", "amd-no-ssb", NULL,

-- 
Eduardo


