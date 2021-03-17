Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC1A33FAAF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 22:57:10 +0100 (CET)
Received: from localhost ([::1]:34602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMeA9-0004uH-Qu
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 17:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lMe8i-0004F7-7p
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:55:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lMe8e-0006xX-E1
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616018133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xV+0j9wDELZ04X61jXDAfzgW/PKriphRaZJeSBHZHFw=;
 b=OO/0zVwvEom6TuQ2eHI6YlbNGlF3i5sw4FeekJyhpBblDTYlc6D7ugdmlgs31AszMtIqf7
 tQy+KMNMNQ519VTIr3/PIV6fKBfidAkpt26fH1gYuvtED6WuOPosbBv5jwVScvVyBGgemP
 XSdIMghss7nsfWe3CTZv6uf3XpGXKgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-3AkaGgXSMqiykh-uDiaGJw-1; Wed, 17 Mar 2021 17:55:29 -0400
X-MC-Unique: 3AkaGgXSMqiykh-uDiaGJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D48A9107B7C3;
 Wed, 17 Mar 2021 21:55:28 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CE041001281;
 Wed, 17 Mar 2021 21:55:25 +0000 (UTC)
Subject: Re: [PATCH] docs/devel/testing.rst: Fix referencies to unit tests
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20210317194849.2262346-1-wainersm@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <6cd5da6e-c7d1-5eba-d842-4983671f5db8@redhat.com>
Date: Wed, 17 Mar 2021 17:55:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317194849.2262346-1-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

typo in the commit summary; "references to"

On 3/17/21 3:48 PM, Wainer dos Santos Moschetta wrote:
> With the recent move of the unit tests to tests/unit directory some
> instructions under the "Unit tests" section became imprecise, which
> are fixed by this change.
> 
> Related-to: da668aa15b99 (tests: Move unit tests into a separate directory)

You can probably just use "Fixes", even though nothing is technically 
broken to avoid introducing a new one-off tag type.

> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>   docs/devel/testing.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 1434a50cc4..1da4c4e4c4 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -34,17 +34,17 @@ If you are writing new code in QEMU, consider adding a unit test, especially
>   for utility modules that are relatively stateless or have few dependencies. To
>   add a new unit test:
>   
> -1. Create a new source file. For example, ``tests/foo-test.c``.
> +1. Create a new source file. For example, ``tests/unit/foo-test.c``.
>   
>   2. Write the test. Normally you would include the header file which exports
>      the module API, then verify the interface behaves as expected from your
>      test. The test code should be organized with the glib testing framework.
>      Copying and modifying an existing test is usually a good idea.
>   
> -3. Add the test to ``tests/meson.build``. The unit tests are listed in a
> +3. Add the test to ``tests/unit/meson.build``. The unit tests are listed in a
>      dictionary called ``tests``.  The values are any additional sources and
>      dependencies to be linked with the test.  For a simple test whose source
> -   is in ``tests/foo-test.c``, it is enough to add an entry like::
> +   is in ``tests/unit/foo-test.c``, it is enough to add an entry like::
>   
>        {
>          ...
> 


