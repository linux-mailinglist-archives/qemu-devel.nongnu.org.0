Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC7E508ADB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:36:03 +0200 (CEST)
Received: from localhost ([::1]:48500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBR4-0001j5-95
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhB2n-00052W-2o
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:11:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhB2k-0003o7-VQ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650463853;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LFWf6Ad3pf+tFgci9jcc+edyU/koA8ErKNfOYFHGBrE=;
 b=LZ80Ot0T6dWBPnTJq/OqNuMKBLnPgmKN5rp6BxsNwmOmUea9AiRG1gpqwyrepO5PKPasPN
 3KHxhFCzUjPAIiMb8ka7pTPK0Bn/gqfqGh1h7iSuy369eNjl/JJqu9NmLDk6ulXFDWtYuQ
 bv9l9DtwUaFSrS+dElYvfGXhbaXF5v4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-oq9uhvX-PGSUzqqe7fsanA-1; Wed, 20 Apr 2022 10:10:52 -0400
X-MC-Unique: oq9uhvX-PGSUzqqe7fsanA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33A2329AA3B3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 14:10:52 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70B7040CFD06;
 Wed, 20 Apr 2022 14:10:51 +0000 (UTC)
Date: Wed, 20 Apr 2022 15:10:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 17/41] doc/build-platforms: document supported compilers
Message-ID: <YmAUaMp7kTRaRCGY@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-18-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220420132624.2439741-18-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 05:26:00PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> According to our configure checks, this is the list of supported
> compilers.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  docs/about/build-platforms.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
> index c29a4b8fe649..1980c5d2476f 100644
> --- a/docs/about/build-platforms.rst
> +++ b/docs/about/build-platforms.rst
> @@ -92,6 +92,16 @@ hosted on Linux (Debian/Fedora).
>  The version of the Windows API that's currently targeted is Vista / Server
>  2008.
>  
> +Supported compilers
> +-------------------
> +
> +To compile, QEMU requires either:
> +
> +- GCC >= 7.4.0
> +- Clang >= 6.0
> +- XCode Clang >= 10.0

Do we need to spell out the versions explicitly ? These versions are
all derived from what's available in the repos of the supported build
platforms, similar to any other build deps we have. I don't think we
want to start a precedent of duplicating versions in this doc for
build deps we have, and there's nothing particularly special about
compilers in this respect.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


