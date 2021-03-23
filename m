Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E08B346D93
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:50:58 +0100 (CET)
Received: from localhost ([::1]:34034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOprU-0008EH-Fr
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOppv-00078C-S1
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:49:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOpps-0001hb-7R
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:49:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616539754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bM7BDX5OxpioXf7FHJRo0Dk1YEcB2TVWnRGb52tBgZg=;
 b=CWSfAk2jC8GN0MMrbw4RF2qT1it5GzY+ah6F4UajjtAuL98ft5SrmznaKY7JzKEoC2Ii03
 dX2zdBy2c4UB0rMgj/xOV/MKH62B/j4T2GfIXS8I8uu5FhPbeuKntP27oc4jVELf9mvaBu
 RiKXpqKRSB9gYAlmATRry0+yBMbeS0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-CA5Kv-szMbaE6z_ZKeDQeg-1; Tue, 23 Mar 2021 18:49:12 -0400
X-MC-Unique: CA5Kv-szMbaE6z_ZKeDQeg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BFFA1007477;
 Tue, 23 Mar 2021 22:49:12 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A5865D6D7;
 Tue, 23 Mar 2021 22:49:08 +0000 (UTC)
Subject: Re: [PATCH v2] docs/devel/testing.rst: Fix references to unit tests
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20210318174407.2299930-1-wainersm@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <6e0e059b-1908-f260-ccf1-4ca4d9955f48@redhat.com>
Date: Tue, 23 Mar 2021 18:49:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318174407.2299930-1-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 1:44 PM, Wainer dos Santos Moschetta wrote:
> With the recent move of the unit tests to tests/unit directory some
> instructions under the "Unit tests" section became imprecise, which
> are fixed by this change.
> 
> Fixes: da668aa15b99 ("tests: Move unit tests into a separate directory")
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
> v1->v2:
>   * Fixed typo on subject [jsnow]
>   * Replaced Related-to with Fixes [jsnow]
> 
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


