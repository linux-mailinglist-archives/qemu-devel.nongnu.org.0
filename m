Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B693338A3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 10:23:57 +0100 (CET)
Received: from localhost ([::1]:42242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJv4O-00069e-7L
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 04:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJv3b-0005k8-2u
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:23:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJv3W-0002rp-2E
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:23:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615368180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QPqhamhM1HStzU+PolhCodc0VheywcO0utLbTnudjQE=;
 b=KnlC2MNRK2VRL28kWliMGyqURO7l2ZO5Z2jK2me3NVz2y5SSWQUHgiHMhFrU2fxoSZqxTx
 aIjOZaSetW4V20MbU5iBTB359AG8/MptoAB84eHMFbOzje9lajmHZgB+30DVC7JXRk1RZm
 q7OdimmV0iWE9H4JDl8dz9MpNtfJBDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-r3jnUYopPV2DnovufvNvrQ-1; Wed, 10 Mar 2021 04:22:58 -0500
X-MC-Unique: r3jnUYopPV2DnovufvNvrQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95F4310866C3;
 Wed, 10 Mar 2021 09:22:57 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBA665945E;
 Wed, 10 Mar 2021 09:22:52 +0000 (UTC)
Subject: Re: [PATCH] tests: Move unit tests into a separate directory
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210310063314.1049838-1-thuth@redhat.com>
 <d684cc63-d60d-b346-3a78-edc94a0dade9@redhat.com>
 <e1c41053-9809-7c6e-6ebd-a0b6f6db9486@redhat.com>
 <942499e4-0a67-ff9a-08e8-ac7d3cbc3c21@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <04db468c-825a-941c-038a-f7d7c7e00c01@redhat.com>
Date: Wed, 10 Mar 2021 10:22:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <942499e4-0a67-ff9a-08e8-ac7d3cbc3c21@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/2021 10.11, Paolo Bonzini wrote:
> On 10/03/21 10:08, Thomas Huth wrote:
>>>
>>> Looks good, I would have moved benchmarks as well but anyway it can be 
>>> done separately.
>>
>> My plan is to move them into a separate directory (tests/bench/) since 
>> this is a separate test suite.
> 
> That makes sense indeed.
> 
>> By the way, "make check-speed" is not working for me anymore (but "make 
>> bench" is working fine) ... and I haven't found out yet what's wrong ... 
>> is it working for you?
> 
> No; "make bench" and "make bench-speed" work though.

It's because this filter logic in the generated Makefile.mtest:

bench-speed: run-tests
ifneq ($(filter bench-speed bench, $(MAKECMDGOALS)),)
.tests += $(.test.$(SPEED).bench-speed)
endif
all-bench-targets += bench-speed

... so a quick fix is:

diff a/tests/Makefile.include b/tests/Makefile.include
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -156,6 +156,7 @@ clean: check-clean

  # For backwards compatibility

-check-speed: bench-speed
+check-speed:
+       $(MAKE) bench-speed

  endif


   Thomas


