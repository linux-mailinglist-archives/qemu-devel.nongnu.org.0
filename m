Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CB45072C1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 18:16:17 +0200 (CEST)
Received: from localhost ([::1]:51178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngqWW-0003NG-Hq
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 12:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ngqSp-0001qB-K0
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 12:12:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ngqSl-0004CF-QW
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 12:12:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650384743;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bc40p4uzd5fuPsDwQcjUqHDV3feOLbtggGKjfR+mtUs=;
 b=gbSYYlNFyF5epEtoi+ALtzIllgsvUHui1jZl8Ad994bS94dx96DOSrsH5zUMLzV+UU6IHs
 xynql21oEzhhH7xSlIg7ihW+12sLKyEgniobwbJ7BzAYGcegm/7dcdEsVRoWZQcCmdAbV1
 f0ql6Hs54zs/7sUvT1nubwqHTfldsVc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-BpVPP0iXMkak6xf77dVkaA-1; Tue, 19 Apr 2022 12:12:19 -0400
X-MC-Unique: BpVPP0iXMkak6xf77dVkaA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 647843C11C6A;
 Tue, 19 Apr 2022 16:12:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.155])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91C38200D8EF;
 Tue, 19 Apr 2022 16:11:56 +0000 (UTC)
Date: Tue, 19 Apr 2022 17:11:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Denis V. Lunev" <den@openvz.org>
Subject: Re: [PATCH v3 for 7.1 1/1] block: add 'force' parameter to
 'blockdev-change-medium' command
Message-ID: <Yl7fSSFLdqV4eUG5@redhat.com>
References: <20220412221846.280723-1-den@openvz.org>
MIME-Version: 1.0
In-Reply-To: <20220412221846.280723-1-den@openvz.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 13, 2022 at 01:18:46AM +0300, Denis V. Lunev wrote:
> 'blockdev-change-medium' is a convinient wrapper for the following
> sequence of commands:
>  * blockdev-open-tray
>  * blockdev-remove-medium
>  * blockdev-insert-medium
>  * blockdev-close-tray
> and should be used f.e. to change ISO image inside the CD-ROM tray.
> Though the guest could lock the tray and some linux guests like
> CentOS 8.5 actually does that. In this case the execution if this
> command results in the error like the following:
>   Device 'scsi0-0-1-0' is locked and force was not specified,
>   wait for tray to open and try again.
> 
> This situation is could be resolved 'blockdev-open-tray' by passing
> flag 'force' inside. Thus is seems reasonable to add the same
> capability for 'blockdev-change-medium' too.
> 
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> Acked-by: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> CC: Eric Blake <eblake@redhat.com>
> CC: Markus Armbruster <armbru@redhat.com>
> ---
>  block/qapi-sysemu.c |  3 ++-
>  hmp-commands.hx     | 11 +++++++----
>  monitor/hmp-cmds.c  |  4 +++-
>  qapi/block.json     |  6 ++++++
>  ui/cocoa.m          |  1 +
>  5 files changed, 19 insertions(+), 6 deletions(-)
> 
> Changes from v2:
> - fixed parameter's order in changeDeviceMedia(). This is a VERY interesting
>   story, actually. Both versions of the patch (v2 & v3) compile silently.
>   In order to see the difference one needs to enable -Weverything compilation
>   option!
> 
> Changes from v1:
> - added kludge to Objective C code
> - simplified a bit call of do_open_tray() (thanks, Vova!)
> - added record to hmp-command.hx

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


