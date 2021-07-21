Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DF23D0F72
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:26:36 +0200 (CEST)
Received: from localhost ([::1]:60124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6CF9-000549-81
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6C8P-00035l-6L
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:19:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6C8M-000164-71
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626873572;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HqxCSmMZ8/KLgxOnDVOeDY2jq2TTpv2f/1VRm6eY+9c=;
 b=CTkN+dOrA3sL8eyyPbE48TkDjgZCymJnu/aZwxnQUzHUnlVj6PbBp3u9Q8S0IzFLWGoxg3
 jwY6tBfz7fDnCxDT5rpEZjT1bFAnnoCZIe4HGYUgPaN4ZETnd5zRBcC01JPZl4gQcvtdhf
 Or5UZNAusgeWaDEDoW1tSw8VeA5S2AE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-oAkgEOx7MW2ekVYSJpUB1A-1; Wed, 21 Jul 2021 09:19:31 -0400
X-MC-Unique: oAkgEOx7MW2ekVYSJpUB1A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F9C092503
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:19:30 +0000 (UTC)
Received: from redhat.com (ovpn-113-72.ams2.redhat.com [10.36.113.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A71D60583;
 Wed, 21 Jul 2021 13:19:25 +0000 (UTC)
Date: Wed, 21 Jul 2021 14:19:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH] chardev/socket: print a more correct command-line address
Message-ID: <YPge2hlF7QovV/RV@redhat.com>
References: <20210721130453.1180878-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721130453.1180878-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 21, 2021 at 05:04:53PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Better reflect the command line version of the socket address arguments,
> following the now recommended long-form opt=on syntax.
> 
> Complement/fixes commit 9d902d51 "chardev: do not use short form boolean
> options in non-QemuOpts character device descriptions".
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


