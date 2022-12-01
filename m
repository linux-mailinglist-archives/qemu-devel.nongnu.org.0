Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA52D63EB97
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 09:50:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0fGG-0007v8-U3; Thu, 01 Dec 2022 03:49:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p0fG3-0007rU-Rc
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:49:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p0fG2-0007qp-5g
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:49:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669884565;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WJgZEgfyw13qguQqIh3XeMHghgc97TF6yupZ4L3cWCs=;
 b=KpAFZ/9DVxOFDv65lD7m+Y9ftek+weD0XDkotECZa08TuxlkRJ09zrYwYlSBkRjG4ieJsi
 xcikZWz2h71JGfKaGH6zz1Ev26xYiztDqhmHp7gLrb8ql02afI9980zdCw4pkTgBXfxp3B
 5MgawqoP1m44QX7zVaKa9NiTptwqVBM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-OdilzdxXO8eGSRxbIb3Cow-1; Thu, 01 Dec 2022 03:49:23 -0500
X-MC-Unique: OdilzdxXO8eGSRxbIb3Cow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B11B1C07588
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 08:49:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88FA31121314;
 Thu,  1 Dec 2022 08:49:21 +0000 (UTC)
Date: Thu, 1 Dec 2022 08:49:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, dgilbert@redhat.com
Subject: Re: [PATCH 3/9] ui: Drop disabled code for SPICE_CHANNEL_WEBDAV
Message-ID: <Y4hqiiNzcMVS0t0k@redhat.com>
References: <20221201061311.3619052-1-armbru@redhat.com>
 <20221201061311.3619052-4-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221201061311.3619052-4-armbru@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Thu, Dec 01, 2022 at 07:13:05AM +0100, Markus Armbruster wrote:
> HMP "info spice" has a bit of code to show channel type
> SPICE_CHANNEL_WEBDAV as "webdav", disabled since commit 7c6044a94e
> "hmp: info spice: take out webdav" (v2.3.0), because it compiles only
> with Spice versions 0.12.7 and later.  Our minimum version is 0.12.5.

Last version bump was 4 years ago

commit 1b63665c2c0e0d52735e0dd5217f109fe0dd2322
Author: Marc-André Lureau <marcandre.lureau@redhat.com>
Date:   Wed Nov 28 19:59:32 2018 +0400

    configure: bump spice-server required version to 0.12.5

    ...snip....

    According to repology, all the distros that are build target platforms
    for QEMU include it:
    
          RHEL-7: 0.14.0
          Debian (Stretch): 0.12.8
          Debian (Jessie): 0.12.5
          FreeBSD (ports): 0.14.0
          OpenSUSE Leap 15: 0.14.0
          Ubuntu (Xenial): 0.12.6

We moved on from Debian and RHEL since then

   Debian 11: 0.14.3
   RHEL-8: 0.14.2
   FreeBSD (ports): 0.14.4
   Fedora 35: 0.14.0
   Ubuntu 20.04: 0.14.0
   OpenSUSE Leap 15.3: 0.14.3

IOW, we can bump to 0.14.0, and then revert the
webdav conditional commit.

> 
> Looks like nobody minded in more than seven years.  Drop it, so that
> checkpatch.pl won't complain when I move the code.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  monitor/hmp-cmds.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index a7c9ae2520..86dd961462 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -626,12 +626,6 @@ void hmp_info_spice(Monitor *mon, const QDict *qdict)
>          [SPICE_CHANNEL_SMARTCARD] = "smartcard",
>          [SPICE_CHANNEL_USBREDIR] = "usbredir",
>          [SPICE_CHANNEL_PORT] = "port",
> -#if 0
> -        /* minimum spice-protocol is 0.12.3, webdav was added in 0.12.7,
> -         * no easy way to #ifdef (SPICE_CHANNEL_* is a enum).  Disable
> -         * as quick fix for build failures with older versions. */
> -        [SPICE_CHANNEL_WEBDAV] = "webdav",
> -#endif
>      };
>  
>      info = qmp_query_spice(NULL);
> -- 
> 2.37.3
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


