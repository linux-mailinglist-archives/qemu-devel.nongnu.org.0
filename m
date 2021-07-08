Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AEE3C176E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:51:11 +0200 (CEST)
Received: from localhost ([::1]:33302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XF0-0005bM-Uw
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m1X1V-0001gk-AL
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:37:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m1X1T-0007AO-Ge
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:37:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625762230;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4MCrt/ttHm47i/IfsWsaWWvyid+qm7+/W0vo3toaO3s=;
 b=J6BWeQbL6utNqCB2ceHVePreC9lTxd1GUdb3sutPP/f2EJEW4nYUcK+NzG1Hli7MYoImYF
 Pe4M9WeXDFFlDmQu7HDUKvVYBozDBNXy4OBBKLduwu5b4hlqB5zDkflOJNYLwZdHJkAVAe
 zO0eHa5VVvqspTYVMnzq+2jEUpdKxH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-Ivegk0mvOYauKsjBBew9ng-1; Thu, 08 Jul 2021 12:37:07 -0400
X-MC-Unique: Ivegk0mvOYauKsjBBew9ng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D598802E3C
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 16:37:06 +0000 (UTC)
Received: from redhat.com (ovpn-114-169.ams2.redhat.com [10.36.114.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A453660CC9;
 Thu,  8 Jul 2021 16:37:01 +0000 (UTC)
Date: Thu, 8 Jul 2021 17:36:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cole Robinson <crobinso@redhat.com>
Subject: Re: [PATCH] contrib: add udev qemu-guest-agent.rules
Message-ID: <YOcppnC8l29plH3t@redhat.com>
References: <316d1414d0af33f22fff24d16ad953629e7416bb.1625758833.git.crobinso@redhat.com>
MIME-Version: 1.0
In-Reply-To: <316d1414d0af33f22fff24d16ad953629e7416bb.1625758833.git.crobinso@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 11:40:33AM -0400, Cole Robinson wrote:
> Fedora/RHEL and Debian have shipped an identical file for years.
> This pairs with contrib/systemd/qemu-guest-agent.service
> 
> Signed-off-by: Cole Robinson <crobinso@redhat.com>
> ---
>  contrib/systemd/qemu-guest-agent.rules | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 contrib/systemd/qemu-guest-agent.rules

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> diff --git a/contrib/systemd/qemu-guest-agent.rules b/contrib/systemd/qemu-guest-agent.rules
> new file mode 100644
> index 0000000000..8a290abbd3
> --- /dev/null
> +++ b/contrib/systemd/qemu-guest-agent.rules
> @@ -0,0 +1,2 @@
> +SUBSYSTEM=="virtio-ports", ATTR{name}=="org.qemu.guest_agent.0", \
> +  TAG+="systemd" ENV{SYSTEMD_WANTS}="qemu-guest-agent.service"

If you fancy doing more work on top, I'd suggest we wire things
up so that 'make install' will install both this new file and
the .service file, with 'meson' detecting whether we're on a
systemd enabled OS </handwaving> libvirt has some meson rules
you can crib for this purpose.

Not a blocker for merging this particular patch though.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


