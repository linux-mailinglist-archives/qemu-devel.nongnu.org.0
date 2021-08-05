Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDA43E12AA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 12:30:40 +0200 (CEST)
Received: from localhost ([::1]:38292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBae4-0000yB-EO
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 06:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mBacu-0000F4-Hh
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 06:29:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mBacr-0006WJ-DY
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 06:29:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628159359;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wo26EvFPy45yrZ74c07MURSM3x/kQPQpv8w3BBuFwmw=;
 b=iuKP5/N7jva7eDsXVOl7JfxGwXdFYenCqxxxJffWONJaHa2x/UmYm7430d0PJaQdkWwtn8
 pCMZuxkF2Y4kxgdGgWRU6ESsrXYI09pxvSwfQSz3JpBbPMAM0OVmNE35p2IOpexcCgs2O6
 7yJImrjGXGhDKfIdlGSQb297iDO+QbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-LPtqOcllOSO3y_4bQWbmSA-1; Thu, 05 Aug 2021 06:29:15 -0400
X-MC-Unique: LPtqOcllOSO3y_4bQWbmSA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6F69801B3C
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 10:29:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8909360C0F;
 Thu,  5 Aug 2021 10:29:06 +0000 (UTC)
Date: Thu, 5 Aug 2021 11:29:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v2 02/11] chardev/socket: print a more correct
 command-line address
Message-ID: <YQu9b5RbOIKOpMH/@redhat.com>
References: <20210804154848.557328-1-marcandre.lureau@redhat.com>
 <20210804154848.557328-3-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210804154848.557328-3-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 04, 2021 at 07:48:39PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Better reflect the command line version of the socket address arguments,
> following the now recommended long-form opt=on syntax.
> 
> Complement/fixes commit 9d902d51 "chardev: do not use short form boolean
> options in non-QemuOpts character device descriptions".
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  chardev/char-socket.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


