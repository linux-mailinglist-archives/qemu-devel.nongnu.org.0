Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D54400406
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:21:36 +0200 (CEST)
Received: from localhost ([::1]:51940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMCsh-0005jH-J5
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMCq9-0003al-4n
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:18:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMCq6-0003Ft-R2
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:18:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630689533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=spKXXGv3q1guBvy/I+xaInR2dmqrYF45DOy3hfTTOp4=;
 b=QM3fJOEzNQF2a2VzlfEiDLQKERnjpggIsHyx35SxJcp3JFJMPH33552IhvBv61jX3InoA1
 zVNbotYy/7gP0QIM+5HJXt82wclwq6CW5C4cmpyhUz/J1jgeDhKrW4dvdhSiaZLtqGMfa6
 r1Ne1PuPV9TiJv8KNuib6afj2jeXkfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-Vxiq6UVEPHC1Ic1nXADZFA-1; Fri, 03 Sep 2021 13:18:52 -0400
X-MC-Unique: Vxiq6UVEPHC1Ic1nXADZFA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 192C19250D
 for <qemu-devel@nongnu.org>; Fri,  3 Sep 2021 17:18:33 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE7C77883E;
 Fri,  3 Sep 2021 17:18:08 +0000 (UTC)
Date: Fri, 3 Sep 2021 12:18:07 -0500
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 2/5] meson_options.txt: Switch the default value for
 the vnc option to 'auto'
Message-ID: <20210903171807.ty6u4nzkuj4gzxk5@redhat.com>
References: <20210903081358.956267-1-thuth@redhat.com>
 <20210903081358.956267-3-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903081358.956267-3-thuth@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 10:13:55AM +0200, Thomas Huth wrote:
> There is no reason why VNC should always be enabled and not be set to
> the default value. We already switched the setting in the "configure"
> script in commit 3a6a1256d4 ("configure: Allow vnc to get disabled with
> --without-default-features"), so let's do that in meson_options.txt now,
> too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  meson_options.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/meson_options.txt b/meson_options.txt
> index a9a9b8f4c6..2c89e79e8b 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -120,7 +120,7 @@ option('usb_redir', type : 'feature', value : 'auto',
>         description: 'libusbredir support')
>  option('virglrenderer', type : 'feature', value : 'auto',
>         description: 'virgl rendering support')
> -option('vnc', type : 'feature', value : 'enabled',
> +option('vnc', type : 'feature', value : 'auto',
>         description: 'VNC server')
>  option('vnc_jpeg', type : 'feature', value : 'auto',
>         description: 'JPEG lossy compression for VNC server')
> -- 
> 2.27.0
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


