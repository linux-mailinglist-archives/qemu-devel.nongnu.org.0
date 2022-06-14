Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E629F54ACA3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 10:59:15 +0200 (CEST)
Received: from localhost ([::1]:35066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o12OI-0000l5-QK
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 04:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o12KM-000736-7y
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:55:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o12KK-00013c-E0
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655196907;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=shO+9ggQWUM+5bIQh5djrmNyTOVskxEcTFFXvfwJshE=;
 b=C560xbGwJoxdj74zorDQ/YPf8WI+ra4IW58l9KUY6NgqvDcy5ZcJJdUSPtfDLN4P5D5Shi
 WEKZDBX3DeiwlYitW6h4XwsyFmdKzM8ZLKB9y+2chwW/gvzbMCwfEAZ7OLSDE+gVjKIcOa
 tv+R0ThkkTt/i9yusu0yB5p4/zVRZoE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-pdZhXso7M9-hloMWKMLuFw-1; Tue, 14 Jun 2022 04:55:04 -0400
X-MC-Unique: pdZhXso7M9-hloMWKMLuFw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3A8E1DC2426;
 Tue, 14 Jun 2022 08:55:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D31A2166B26;
 Tue, 14 Jun 2022 08:55:01 +0000 (UTC)
Date: Tue, 14 Jun 2022 09:54:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 1/5] tests/qemu-iotests: hotfix for 307, 223 output
Message-ID: <YqhM47DhwnzVp7dZ@redhat.com>
References: <20220614015044.2501806-1-jsnow@redhat.com>
 <20220614015044.2501806-2-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220614015044.2501806-2-jsnow@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 13, 2022 at 09:50:40PM -0400, John Snow wrote:
> Fixes: 58a6fdcc

CC'ing Eric given the above commit hash

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/223.out | 4 ++--
>  tests/qemu-iotests/307.out | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Tested-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/tests/qemu-iotests/223.out b/tests/qemu-iotests/223.out
> index 06479415312..26fb347c5da 100644
> --- a/tests/qemu-iotests/223.out
> +++ b/tests/qemu-iotests/223.out
> @@ -93,7 +93,7 @@ exports available: 3
>   export: 'n2'
>    description: some text
>    size:  4194304
> -  flags: 0xced ( flush fua trim zeroes df cache fast-zero )
> +  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
>    min block: 1
>    opt block: 4096
>    max block: 33554432
> @@ -212,7 +212,7 @@ exports available: 3
>   export: 'n2'
>    description: some text
>    size:  4194304
> -  flags: 0xced ( flush fua trim zeroes df cache fast-zero )
> +  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
>    min block: 1
>    opt block: 4096
>    max block: 33554432
> diff --git a/tests/qemu-iotests/307.out b/tests/qemu-iotests/307.out
> index ec8d2be0e0a..390f05d1b78 100644
> --- a/tests/qemu-iotests/307.out
> +++ b/tests/qemu-iotests/307.out
> @@ -83,7 +83,7 @@ exports available: 2
>   export: 'export1'
>    description: This is the writable second export
>    size:  67108864
> -  flags: 0xced ( flush fua trim zeroes df cache fast-zero )
> +  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
>    min block: XXX
>    opt block: XXX
>    max block: XXX
> @@ -109,7 +109,7 @@ exports available: 1
>   export: 'export1'
>    description: This is the writable second export
>    size:  67108864
> -  flags: 0xced ( flush fua trim zeroes df cache fast-zero )
> +  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
>    min block: XXX
>    opt block: XXX
>    max block: XXX
> -- 
> 2.34.3
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


