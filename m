Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8033150FC61
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 13:58:56 +0200 (CEST)
Received: from localhost ([::1]:41008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njJqJ-0003GL-I7
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 07:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njJoj-0002Yu-Nk
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 07:57:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njJoh-0005l1-Tc
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 07:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650974235;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FtGBciEbW3HrGbgfdt44SW/MAlLfJ/KV2/2Bj92AK+4=;
 b=aphI9mVPUMPPVScc0xQp4cwEy87ZxBR3A7T2KwxJ1/sPlTPU7+d5IBwe/S2x+FgXTGITBu
 NyDfiTD1TSf6R3lt3gPReDyBX600ZPY6kTqMIIhPjPipqKqWqGjLGLZwx8X+Udmwt8A64a
 C6QT6/ex2fujyEczKavOYPr1jzMexbs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-GDLsOS10NyK7qFRCVICpZg-1; Tue, 26 Apr 2022 07:57:11 -0400
X-MC-Unique: GDLsOS10NyK7qFRCVICpZg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FF5C83395E;
 Tue, 26 Apr 2022 11:57:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54E9440F9D40;
 Tue, 26 Apr 2022 11:57:08 +0000 (UTC)
Date: Tue, 26 Apr 2022 12:57:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH v4 7/8] tests/crypto: Add test suite for crypto akcipher
Message-ID: <YmfeEaQHupPLBteU@redhat.com>
References: <20220411104327.197048-1-pizhenwei@bytedance.com>
 <20220411104327.197048-8-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220411104327.197048-8-pizhenwei@bytedance.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: helei.sig11@bytedance.com, mst@redhat.com, jasowang@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org, arei.gonglei@huawei.com,
 linux-crypto@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 11, 2022 at 06:43:26PM +0800, zhenwei pi wrote:
> From: lei he <helei.sig11@bytedance.com>
> 
> Add unit test and benchmark test for crypto akcipher.
> 
> Signed-off-by: lei he <helei.sig11@bytedance.com>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  tests/bench/benchmark-crypto-akcipher.c | 161 ++++++
>  tests/bench/meson.build                 |   4 +
>  tests/bench/test_akcipher_keys.inc      | 537 ++++++++++++++++++
>  tests/unit/meson.build                  |   1 +
>  tests/unit/test-crypto-akcipher.c       | 708 ++++++++++++++++++++++++
>  5 files changed, 1411 insertions(+)
>  create mode 100644 tests/bench/benchmark-crypto-akcipher.c
>  create mode 100644 tests/bench/test_akcipher_keys.inc
>  create mode 100644 tests/unit/test-crypto-akcipher.c
> 

> diff --git a/tests/bench/test_akcipher_keys.inc b/tests/bench/test_akcipher_keys.inc
> new file mode 100644
> index 0000000000..7adf218135
> --- /dev/null
> +++ b/tests/bench/test_akcipher_keys.inc
> @@ -0,0 +1,537 @@
> +/*
> + * Copyright (c) 2022 Bytedance, and/or its affiliates
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + * Author: lei he <helei.sig11@bytedance.com>
> + */
> +
> +/* RSA test keys, generated by OpenSSL */
> +static const uint8_t rsa1024_priv_key[] = {
> +    0x30, 0x82, 0x02, 0x5c, 0x02, 0x01, 0x00, 0x02,
> +	0x81, 0x81, 0x00, 0xe6, 0x4d, 0x76, 0x4f, 0xb2,

snip

For the patch as is:

 Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


It could be nice to add another test with some intentionally corrupt
RSA keys with bad DER encoding, as a way to prove that we're handling
errors in DER decoding correctly when faced with malicous data from a
bad guest.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


