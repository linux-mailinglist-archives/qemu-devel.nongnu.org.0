Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7232F6975
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:27:55 +0100 (CET)
Received: from localhost ([::1]:44760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07Lc-0005vD-T7
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:27:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l06f1-0007pM-JD
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:43:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l06ez-0005Ks-Qq
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:43:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610646227;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/lI7+KpKJIj1EizpYoqkiz3hv4CTyJJUscqbWDgD1As=;
 b=AMucOMzi0VBftdm3Me/+y/6m7egA7HgbW/WuKeY7IufsefOz+etw0GJfbWqVtFLWWHmuBb
 qLoJch5llNxOQV1yRcK9lSaik0eUsvwXv9D9y4iswIA9JV9NCBbv0r7aV37XmzYC9UcEuO
 1igo0l2Q+awE0zNgKFVXnJwKS0yi5N4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-rYM-1ms3N1mIx9_jHTH85w-1; Thu, 14 Jan 2021 12:43:44 -0500
X-MC-Unique: rYM-1ms3N1mIx9_jHTH85w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72258806661
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 17:43:43 +0000 (UTC)
Received: from redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FF465C1BD;
 Thu, 14 Jan 2021 17:43:39 +0000 (UTC)
Date: Thu, 14 Jan 2021 17:43:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 3/3] vnc: add support for extended desktop resize
Message-ID: <20210114174336.GV1643043@redhat.com>
References: <20210112134120.2031837-1-kraxel@redhat.com>
 <20210112134120.2031837-4-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210112134120.2031837-4-kraxel@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 02:41:20PM +0100, Gerd Hoffmann wrote:
> The extended desktop resize encoding adds support for (a) clients
> sending resize requests to the server, and (b) multihead support.
> 
> This patch implements (a).  All resize requests are rejected by qemu.
> Qemu can't resize the framebuffer on its own, this is in the hands of
> the guest, so all qemu can do is forward the request to the guest.
> Should the guest actually resize the framebuffer we can notify the vnc
> client later with a separate message.
> 
> This requires support in the display device.  Works with virtio-gpu.
> 
> https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#extendeddesktopsize-pseudo-encoding
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  ui/vnc.h |  2 ++
>  ui/vnc.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 65 insertions(+), 1 deletion(-)


Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


