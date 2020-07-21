Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB82E227816
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 07:27:40 +0200 (CEST)
Received: from localhost ([::1]:54320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxkoV-0007hz-Ak
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 01:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jxknn-0007Hg-0g
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 01:26:55 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jxknk-0002sY-JK
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 01:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595309206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=JtzFXyhZ1nrbNCIvMU6Ja+PA3YXRwyNjpIDXh3WYams=;
 b=XZ5b1Pqtagz2DLRG7uEXMZRuwES3X2FY85Vwbs1GXXRjY0OGYh39uBn+Xb8efqYMF68SEu
 zGbhzcIWqaBIgDAshgkddfTTmjzVibiwGbv2fflHYTFX69BFT0wPkj0+Znou2cYfJ7oK4j
 +E2Cdr0bYJndjMX7OOW5pxkO4AJ7SDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-lJRbDW1TNryvvy_KSRAQjQ-1; Tue, 21 Jul 2020 01:26:44 -0400
X-MC-Unique: lJRbDW1TNryvvy_KSRAQjQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 280521005510;
 Tue, 21 Jul 2020 05:26:43 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-102.ams2.redhat.com [10.36.112.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDFE119C66;
 Tue, 21 Jul 2020 05:26:35 +0000 (UTC)
Subject: Re: [PATCH 2/4] docs/fuzz: describe building fuzzers with
 enable-sanitizers
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20200706195534.14962-1-alxndr@bu.edu>
 <20200706195534.14962-3-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <af4bd47a-3344-2993-c8a3-ad6baf889325@redhat.com>
Date: Tue, 21 Jul 2020 07:26:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200706195534.14962-3-alxndr@bu.edu>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 01:26:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: bsd@redhat.com, philmd@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/07/2020 21.55, Alexander Bulekov wrote:
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  docs/devel/fuzzing.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/devel/fuzzing.txt b/docs/devel/fuzzing.txt
> index 324d2cd92b..382ade974e 100644
> --- a/docs/devel/fuzzing.txt
> +++ b/docs/devel/fuzzing.txt
> @@ -23,9 +23,12 @@ AddressSanitizer mmaps ~20TB of memory, as part of its detection. This results
>  in a large page-map, and a much slower fork().
>  
>  To build the fuzzers, install a recent version of clang:
> -Configure with (substitute the clang binaries with the version you installed):
> +Configure with (substitute the clang binaries with the version you installed).
> +Here, enable-sanitizers, is optional but it allows us to reliably detect bugs
> +such as out-of-bounds accesses, use-after-frees, double-frees etc.
>  
> -    CC=clang-8 CXX=clang++-8 /path/to/configure --enable-fuzzing
> +    CC=clang-8 CXX=clang++-8 /path/to/configure --enable-fuzzing \
> +                                                --enable-sanitizers
>  
>  Fuzz targets are built similarly to system/softmmu:

In the future, we should maybe use "CC=clang CXX=clang++" instead, since
version numbers soon get old...

Reviewed-by: Thomas Huth <thuth@redhat.com>


