Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6C333FEA1
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 06:12:34 +0100 (CET)
Received: from localhost ([::1]:33628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMkxV-0006yv-3u
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 01:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMkvo-0006H6-O5
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 01:10:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMkvl-0003md-8U
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 01:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616044242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KGGFUCGGy2/OdUky9jecKjVu9I9UkM+ANcAVr49cUdI=;
 b=PW2dt4FPYnS1j2X2X73dtH8TMrfSOe+Ib3nobrJ0AnSLkSGTSxAWGQgYvfiMb7dhG+AZxk
 jDdH3QXLh+TQ0cqAdozvkz0pV2NKG/aFZJ1lUpLuMP4DxjQKRX+GuzNSZJpARgmS5ewQpO
 9EaRCmLBMPM+9IxN1jdqS8reCNA4Jck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-nJAnbXAhMpyWTdacflxaBg-1; Thu, 18 Mar 2021 01:10:38 -0400
X-MC-Unique: nJAnbXAhMpyWTdacflxaBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAA788030D7;
 Thu, 18 Mar 2021 05:10:37 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D46741F41B;
 Thu, 18 Mar 2021 05:10:33 +0000 (UTC)
Subject: Re: [PATCH] docs/devel/testing.rst: Fix referencies to unit tests
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20210317194849.2262346-1-wainersm@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f52cb9c9-e962-ec3d-54e6-a058e5466b03@redhat.com>
Date: Thu, 18 Mar 2021 06:10:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317194849.2262346-1-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/03/2021 20.48, Wainer dos Santos Moschetta wrote:
> With the recent move of the unit tests to tests/unit directory some
> instructions under the "Unit tests" section became imprecise, which
> are fixed by this change.
> 
> Related-to: da668aa15b99 (tests: Move unit tests into a separate directory)
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

Reviewed-by: Thomas Huth <thuth@redhat.com>


