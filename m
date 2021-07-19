Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 113E43CD003
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 11:06:28 +0200 (CEST)
Received: from localhost ([::1]:44852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5PEJ-0000bw-4J
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 05:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5PCo-0008FH-2O
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:04:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5PCk-0001iM-Tp
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626685489;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=flLZxojVyde9myhMfGv7cjWOpp3nOeYY02pcHhlKLT8=;
 b=FhkNak074HCopH366peCq9P/ctuADUYgstl2N9jSKNcg/oBXMPPmoFJx/6ADk4pRBy26sz
 lmKhAWdHgZnmdS+amBPSUAakaHwteuZgWrObqe+BAA3s3DDT4e0ueLAbKcEE3oGwsCIfNB
 pmIxcnQKhqX8J7b33pw4da9MINh2mKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-a3yqwFH5OT-sTdLKTH9xtA-1; Mon, 19 Jul 2021 05:04:47 -0400
X-MC-Unique: a3yqwFH5OT-sTdLKTH9xtA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 840FB100C611;
 Mon, 19 Jul 2021 09:04:46 +0000 (UTC)
Received: from redhat.com (ovpn-112-193.ams2.redhat.com [10.36.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A29D240AC;
 Mon, 19 Jul 2021 09:04:37 +0000 (UTC)
Date: Mon, 19 Jul 2021 10:04:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci: Remove the second superfluous macos task
Message-ID: <YPVAInhYVnDvOf+c@redhat.com>
References: <20210719073051.1559348-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210719073051.1559348-1-thuth@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.466,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 09:30:51AM +0200, Thomas Huth wrote:
> While there might have been bigger differnces between the -base and
> the -xcode images in the beginning, they almost vanished in the
> current builds, e.g. when comparing the output of the "configure"
> step after cleaning up the differences due to temporary path names,
> I only get:
> 
> $ diff -u /tmp/base.txt /tmp/xcode.txt
> --- /tmp/base.txt	2021-07-16 09:16:24.211427940 +0200
> +++ /tmp/xcode.txt	2021-07-16 09:16:43.029684274 +0200
> @@ -19,14 +19,14 @@
>  Build type: native build
>  Project name: qemu
>  Project version: 6.0.50
> -C compiler for the host machine: cc (clang 12.0.0 "Apple clang version 12.0.0 (clang-1200.0.32.29)")
> +C compiler for the host machine: cc (clang 12.0.0 "Apple clang version 12.0.0 (clang-1200.0.32.28)")
>  C linker for the host machine: cc ld64 609.8
>  Host machine cpu family: x86_64
>  Host machine cpu: x86_64
>  Program sh found: YES (/bin/sh)
>  Program python3 found: YES (/usr/local/opt/python@3.9/bin/python3.9)
>  Program bzip2 found: YES (/usr/bin/bzip2)
> -C++ compiler for the host machine: c++ (clang 12.0.0 "Apple clang version 12.0.0 (clang-1200.0.32.29)")
> +C++ compiler for the host machine: c++ (clang 12.0.0 "Apple clang version 12.0.0 (clang-1200.0.32.28)")
>  C++ linker for the host machine: c++ ld64 609.8
>  Objective-C compiler for the host machine: clang (clang 12.0.0)
>  Objective-C linker for the host machine: clang ld64 609.8
> 
> Since we're not using Xcode itself at all, it seems like it does not
> make much sense anymore to waste compute cycles with two images here.
> Thus let's delete the -xcode job now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/cirrus.yml | 15 ---------------
>  1 file changed, 15 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


We can always add it back easily later if it becomes relevant again in
a future release/update.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


