Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEB9262E83
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 14:28:09 +0200 (CEST)
Received: from localhost ([::1]:45958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFzCq-0002G3-7b
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 08:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kFzC2-0001mw-6e
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 08:27:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26343
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kFzBy-00062i-SQ
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 08:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599654434;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OrQ1vpzwl3GZSj/ENemKHhzGZf7U0NFqhMSn2AwT+DI=;
 b=OdFmLPpqm4pmicFWdnftpoSp0E9kA8UPTxDwsXDN/7IB7lrNds8uqy546IGP/AJshu6Ehx
 AUlYB92khruEPFp/vaR2sxJM4YF0zVPmD5HyceVcKqJSZHw1TEBUkz8/2xrsnliyqU/9KT
 x3jYt7IUXHul3DAiXadAInVujXiq2DU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-fPmfqTyONq67vk9knXe3zA-1; Wed, 09 Sep 2020 08:27:11 -0400
X-MC-Unique: fPmfqTyONq67vk9knXe3zA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4E0C10BBEDD;
 Wed,  9 Sep 2020 12:27:09 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE3FE7EEC9;
 Wed,  9 Sep 2020 12:27:00 +0000 (UTC)
Date: Wed, 9 Sep 2020 13:26:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yonggang Luo <luoyonggang@gmail.com>
Subject: Re: [PATCH v2 02/21] ci: fixes msys2 build by upgrading capstone to
 4.0.2
Message-ID: <20200909122658.GT1011023@redhat.com>
References: <20200909094617.1582-1-luoyonggang@gmail.com>
 <20200909094617.1582-3-luoyonggang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200909094617.1582-3-luoyonggang@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:05:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-block@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 qemu-devel@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Max Reitz <mreitz@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 09, 2020 at 05:45:58PM +0800, Yonggang Luo wrote:
> The currently random version capstone have the following compiling issue:
>   CC      /c/work/xemu/qemu/build/slirp/src/arp_table.o
> make[1]: *** No rule to make target “/c/work/xemu/qemu/build/capstone/capstone.lib”。 Stop.
> 
> Subproject commit 1d230532840a37ac032c6ab80128238fc930c6c1 are the tagged version 4.0.2
> when upgrading to this version, the folder structure of include are changed to
> qemu\capstone\include
> │  platform.h
> │
> ├─capstone
> │      arm.h
> │      arm64.h
> │      capstone.h
> │      evm.h
> │      m680x.h
> │      m68k.h
> │      mips.h
> │      platform.h
> │      ppc.h
> │      sparc.h
> │      systemz.h
> │      tms320c64x.h
> │      x86.h
> │      xcore.h
> │
> └─windowsce
>         intrin.h
>         stdint.h
> 
> in capstone. so we need add extra include path -I${source_path}/capstone/include/capstone
> for directly #include <capstone.h>, and the exist include path should preserve, because
> in capstone code there something like #include "capstone/capstone.h"
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  capstone  | 2 +-
>  configure | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/capstone b/capstone
> index 22ead3e0bf..1d23053284 160000
> --- a/capstone
> +++ b/capstone
> @@ -1 +1 @@
> -Subproject commit 22ead3e0bfdb87516656453336160e0a37b066bf
> +Subproject commit 1d230532840a37ac032c6ab80128238fc930c6c1
> diff --git a/configure b/configure
> index 4231d56bcc..f4f8bc3756 100755
> --- a/configure
> +++ b/configure
> @@ -5156,7 +5156,7 @@ case "$capstone" in
>        LIBCAPSTONE=libcapstone.a
>      fi
>      capstone_libs="-Lcapstone -lcapstone"
> -    capstone_cflags="-I${source_path}/capstone/include"
> +    capstone_cflags="-I${source_path}/capstone/include -I${source_path}/capstone/include/capstone"

IIUC, the original -I arg can be removed - we just need the new one.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


