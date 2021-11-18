Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946DC455950
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 11:44:49 +0100 (CET)
Received: from localhost ([::1]:35322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mneuO-0007XD-8Q
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 05:44:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnetF-00064F-U5
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:43:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnetC-0006eW-IS
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:43:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637232212;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WXkocPm2fCI7WAA2L9wW6sCoPi7Hj1eL7rCVOhzlNz0=;
 b=DthLAJdARSwLbYiCOY5XHMQ5CvIME7JKZUNZ3qCvE6hQZDsTL5OibtQTmX75jvuQjP2dQJ
 rih3NH5CZ6ibXGr1MOFGks8dcYkLcw2n+sfcueyjPbtbiJPctn+ZMPnZ9CEKm8SEJHSB5m
 /pOTrTp2vK/ZtasW+8zJWsJNw2PwCyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-kGSoP-MzP7-qSz7FyIvlvA-1; Thu, 18 Nov 2021 05:43:29 -0500
X-MC-Unique: kGSoP-MzP7-qSz7FyIvlvA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E6F619057A0;
 Thu, 18 Nov 2021 10:43:28 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C583919D9B;
 Thu, 18 Nov 2021 10:43:24 +0000 (UTC)
Date: Thu, 18 Nov 2021 10:43:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v2 for-6.2] meson.build: Support ncurses on MacOS and
 OpenBSD
Message-ID: <YZYuSn+0+R1B2pNl@redhat.com>
References: <20211117205355.1392292-1-sw@weilnetz.de>
MIME-Version: 1.0
In-Reply-To: <20211117205355.1392292-1-sw@weilnetz.de>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 17, 2021 at 09:53:55PM +0100, Stefan Weil wrote:
> MacOS provides header files for curses 5.7 with support
> for wide characters, but requires _XOPEN_SOURCE_EXTENDED=1
> to activate that.
> 
> By default those old header files are used even if there
> is a newer Homebrew installation of ncurses 6.2 available.
> 
> Change also the old macro definition of NCURSES_WIDECHAR
> and set it to 1 like it is done in newer versions of
> curses.h when _XOPEN_SOURCE_EXTENDED=1 is defined.
> 
> OpenBSD has the same version of ncurses and needs the same fix.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> v2:
> - Only define _XOPEN_SOURCE_EXTENDED when curses.h is used.
> - Extended to fix OpenBSD, too (untested!)
> 
>  meson.build | 5 ++++-
>  ui/curses.c | 4 ++++
>  2 files changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


