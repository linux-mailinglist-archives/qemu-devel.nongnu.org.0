Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711216A6EA3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:43:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXNed-00054R-EY; Wed, 01 Mar 2023 09:42:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXNeb-00054E-FB
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:42:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXNeZ-0005mb-PG
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:42:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677681718;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GL8KoISy8MUmiFtG9b7W0c0GJGCi7LjL9wJkEaacU3U=;
 b=Zh1B9KmQgG3oM/7v6Mb0gbPhkBrHPIfAozXd/FS1OLXV6diqReSmGFeMp/I7kNfMsahm0A
 koobetDYYbT2J+2XhLzJgO6Chd02x+GeN6452+nOfWXp0Vqjgg3lp79Tf2loghCki/XjNY
 r1e97FSUickq1nZRp76au7nsmsuKUc4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-EQ-f3xGGMDelmEHY9zlERQ-1; Wed, 01 Mar 2023 09:41:57 -0500
X-MC-Unique: EQ-f3xGGMDelmEHY9zlERQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 511E2181E3EE
 for <qemu-devel@nongnu.org>; Wed,  1 Mar 2023 14:41:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C418F1121315;
 Wed,  1 Mar 2023 14:41:56 +0000 (UTC)
Date: Wed, 1 Mar 2023 14:41:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Erico Nunes <ernunes@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] ui/sdl2: remove workaround forcing x11
Message-ID: <Y/9kMobasTih1xe7@redhat.com>
References: <20230301141205.514338-1-ernunes@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230301141205.514338-1-ernunes@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 01, 2023 at 03:12:05PM +0100, Erico Nunes wrote:
> This workaround was put in place in the original implementation almost
> 10 years ago, considering a very old SDL2 version. Currently it prevents
> users to run in a wayland-only environment without manually forcing the
> backend.
> The SDL2 wayland backend has been supported by distributions for a very
> long time (e.g. in Fedora, first available 8 years ago), and is now
> considered stable and becoming the default for new SDL2 releases.
> Instead of requiring the x11 backend to exist by default, let new qemu
> releases run with the default chosen by the installed SDL2 version.

As the comment says, it is better fixed elsewhere anyway rather
than hardcoding in QEMU

> 
> Signed-off-by: Erico Nunes <ernunes@redhat.com>
> ---
>  ui/sdl2.c | 16 ----------------
>  1 file changed, 16 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


