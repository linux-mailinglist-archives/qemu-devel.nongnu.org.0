Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB18338A76
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:45:54 +0100 (CET)
Received: from localhost ([::1]:51742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfIn-0004Y9-Aj
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:45:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKeuZ-0000M9-U4
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:20:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKeuW-0005LI-Jo
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:20:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615544447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r4NWjexGLXBbFNMuv5BhBFs795tRy9e2q0SJv/AcxAo=;
 b=d6ST59LgPyONzXZwl+PGcylM26rFefjDKov9mwOU0M4acmo6Msjat4Gcg2QNXdRYGeQMXO
 M6uciNmoPLdeRYUzQWxGimFlUqbta98fTBC9bVBf4/QUMq4fOU/bzuZ7iHD0mfh23RkFXi
 OAdR5BaiQGidfKTj25JS32OSoGVOC6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-Q3DjLBEOMG6nuw8Vh1Lo_g-1; Fri, 12 Mar 2021 05:20:45 -0500
X-MC-Unique: Q3DjLBEOMG6nuw8Vh1Lo_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C61FA802B7E;
 Fri, 12 Mar 2021 10:20:44 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7C725DAA5;
 Fri, 12 Mar 2021 10:20:39 +0000 (UTC)
Subject: Re: [PATCH] tests: Move benchmarks into a separate folder
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210312092238.79509-1-thuth@redhat.com>
Message-ID: <fb75a1e6-c43e-18e9-0e53-bd9ae630765a@redhat.com>
Date: Fri, 12 Mar 2021 11:20:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312092238.79509-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Longpeng <longpeng2@huawei.com>, "Emilio G . Cota" <cota@braap.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/2021 10.22, Thomas Huth wrote:
> Make it clear that these files are related to benchmarks by moving
> them into a new folder called "bench".
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Based-on: 20210310063314.1049838-1-thuth@redhat.com
> 
>   tests/{ => bench}/atomic64-bench.c          |  0
>   tests/{ => bench}/atomic_add-bench.c        |  0
>   tests/{ => bench}/benchmark-crypto-cipher.c |  0
>   tests/{ => bench}/benchmark-crypto-hash.c   |  0
>   tests/{ => bench}/benchmark-crypto-hmac.c   |  0
>   tests/bench/meson.build                     | 34 +++++++++++++++++++++
>   tests/{ => bench}/qht-bench.c               |  0
>   tests/meson.build                           | 34 +--------------------
>   8 files changed, 35 insertions(+), 33 deletions(-)
>   rename tests/{ => bench}/atomic64-bench.c (100%)
>   rename tests/{ => bench}/atomic_add-bench.c (100%)
>   rename tests/{ => bench}/benchmark-crypto-cipher.c (100%)
>   rename tests/{ => bench}/benchmark-crypto-hash.c (100%)
>   rename tests/{ => bench}/benchmark-crypto-hmac.c (100%)
>   create mode 100644 tests/bench/meson.build
>   rename tests/{ => bench}/qht-bench.c (100%)

I just noticed that I forgot to update MAINTAINERS... I'll squash in this hunk:

diff --git a/MAINTAINERS b/MAINTAINERS
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2729,7 +2729,7 @@ F: crypto/
  F: include/crypto/
  F: qapi/crypto.json
  F: tests/unit/test-crypto-*
-F: tests/benchmark-crypto-*
+F: tests/bench/benchmark-crypto-*
  F: tests/unit/crypto-tls-*
  F: tests/unit/pkix_asn1_tab.c
  F: qemu.sasl


  Thomas


