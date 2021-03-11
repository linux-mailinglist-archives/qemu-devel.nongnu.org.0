Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B481C337044
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:42:39 +0100 (CET)
Received: from localhost ([::1]:34448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIm6-0006aO-QJ
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKIhp-0002WJ-Sg
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:38:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKIhk-0000De-GV
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615459087;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qImgGBKA9M6+YfLvPOPyqzOHLVFxx+/8TAw9Mned+9U=;
 b=X5uJZqpddrxgQc/aHO9qkhcJSXMmS3NgC+XJ61AmHbWCHiWuAvRmNr89Gwoaa3DRK2hDIo
 3Ih1rrcdEgWJnJttctZxBckhcX3s3QgErDeHQZ+VyS8LVJzJOV8r0q2jewLLdO5CZwuqy9
 WZfRwoYAdixmqju8hdyuzpthfJT5eEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-dezF6MRZOPiw3dyFu73ofg-1; Thu, 11 Mar 2021 05:37:57 -0500
X-MC-Unique: dezF6MRZOPiw3dyFu73ofg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FDB1100C618
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 10:37:56 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 914CC60240;
 Thu, 11 Mar 2021 10:37:48 +0000 (UTC)
Date: Thu, 11 Mar 2021 10:37:45 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/4] ui: add support for 'secret' object to provide
 VNC/SPICE passwords
Message-ID: <YEny+ZFWi9wVQbmF@redhat.com>
References: <20210219184556.154972-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210219184556.154972-1-berrange@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping

On Fri, Feb 19, 2021 at 06:45:52PM +0000, Daniel P. Berrangé wrote:
> This fixes a long standing limitation of the VNC/SPICE code which was
> unable to securely accept passswords on the CLI, instead requiring use
> of separate monitor commands after startup.
> 
> This takes the opportunity to also remove previously deprecated ACL
> functionality from VNC.
> 
> Daniel P. Berrangé (4):
>   ui: introduce "password-secret" option for VNC servers
>   ui: introduce "password-secret" option for SPICE server
>   ui: deprecate "password" option for SPICE server
>   ui, monitor: remove deprecated VNC ACL option and HMP commands
> 
>  docs/system/deprecated.rst       |  24 ++--
>  docs/system/removed-features.rst |  13 +++
>  hmp-commands.hx                  |  76 -------------
>  monitor/misc.c                   | 187 -------------------------------
>  qemu-options.hx                  |  17 ++-
>  ui/spice-core.c                  |  32 +++++-
>  ui/vnc.c                         |  61 ++++------
>  7 files changed, 88 insertions(+), 322 deletions(-)
> 
> -- 
> 2.29.2
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


