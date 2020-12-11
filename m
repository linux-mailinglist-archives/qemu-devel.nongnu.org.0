Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E572D7121
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 08:57:14 +0100 (CET)
Received: from localhost ([::1]:42128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kndIf-0007Mh-Is
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 02:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kndHb-0006ji-SK
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 02:56:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kndHa-0001lG-6n
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 02:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607673365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rzyx2TF8B+woUYnTXLgfjmprY6gihqt0t7T7spAKDoc=;
 b=Y99MuZSeBHjRlfxNoWNOtYXQ9t2ZXJ/ORl1HT3Nxqlr+gAYLNZRq62P7KGlSy5CZhNFdHI
 kbuZdWEmPHBiltzdSGsXCbZVbB/MAwwob8aCmf90jQhLtiRKKBweAnO7JZLVIW7HiVVyce
 Wiwp1vWwi5zAEXCTRfWW79QU5/QEA+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-Y8LeOlqrN1S2zVsOsH0R8A-1; Fri, 11 Dec 2020 02:56:03 -0500
X-MC-Unique: Y8LeOlqrN1S2zVsOsH0R8A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF44C107ACE4;
 Fri, 11 Dec 2020 07:56:01 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 519196F447;
 Fri, 11 Dec 2020 07:55:52 +0000 (UTC)
Subject: Re: [PATCH v2 8/8] tests/tcg: build tests with -Werror
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201210190417.31673-1-alex.bennee@linaro.org>
 <20201210190417.31673-9-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ea96a9e5-a7e2-fc62-56bd-2ac04bd2fb9b@redhat.com>
Date: Fri, 11 Dec 2020 08:55:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201210190417.31673-9-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 stefanha@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/2020 20.04, Alex Bennée wrote:
> Hopefully this will guard against sloppy code getting into our tests.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/Makefile.target | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> index 2ae86776cd..24d75a5801 100644
> --- a/tests/tcg/Makefile.target
> +++ b/tests/tcg/Makefile.target
> @@ -94,7 +94,7 @@ ifdef CONFIG_USER_ONLY
>  -include $(SRC_PATH)/tests/tcg/$(TARGET_NAME)/Makefile.target
>  
>  # Add the common build options
> -CFLAGS+=-Wall -O0 -g -fno-strict-aliasing
> +CFLAGS+=-Wall -Werror -O0 -g -fno-strict-aliasing
>  ifeq ($(BUILD_STATIC),y)
>  LDFLAGS+=-static
>  endif

I hope this works out as expected ... -Werror together with -O0 hopefully
does not trigger any false-positives since the compiler might not smart
enough in this case to determine e.g. whether certain variables are used or
not? Well, let's try and see.

Reviewed-by: Thomas Huth <thuth@redhat.com>


