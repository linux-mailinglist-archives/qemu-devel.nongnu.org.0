Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8BE2F687F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:59:55 +0100 (CET)
Received: from localhost ([::1]:41362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06uY-00036M-2X
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l06UG-0005rj-5g
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:32:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l06UD-0001aF-34
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:32:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610645558;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ktWFoftb3sytgMoXP5eUci8tmFS+Ka1fwMkcGKAZbpI=;
 b=XTrllB0CkyDk3jJu0jW5AK85JBmESj8lVh+nMPZBAuZ7/XgTeO/oWog4gUpCKUbIK5x4ff
 KksmyQwnFdxX0OujlUAmvummWAIlDyknxRKstezJynmkKw5rPWsUcKhfBz7jy1Md4Uew2f
 exldl+TpfrbX3d0exoP/lTCTRo/JU8A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-zgZY5Z5VMlqVbek7EivvIA-1; Thu, 14 Jan 2021 12:32:33 -0500
X-MC-Unique: zgZY5Z5VMlqVbek7EivvIA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEA6F806667
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 17:31:54 +0000 (UTC)
Received: from redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D91760657;
 Thu, 14 Jan 2021 17:31:53 +0000 (UTC)
Date: Thu, 14 Jan 2021 17:31:50 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 0/3] vnc: support some new extensions.
Message-ID: <20210114173150.GS1643043@redhat.com>
References: <20210112134120.2031837-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210112134120.2031837-1-kraxel@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

On Tue, Jan 12, 2021 at 02:41:17PM +0100, Gerd Hoffmann wrote:
> The rfb standard keeps envolving.  While the official spec is kind of
> frozen since a decade or so the community maintains an updated version
> of the spec at:
> 	https://github.com/rfbproto/rfbproto/
> 
> This series adds support for two new extensions from that spec: alpha
> cursor and extended desktop resize.
> 
> alpha cursor allows a full alpha channel for the cursor image (unlike
> the rich cursor extension which has only a bitmask for transparency).
> 
> extended desktop resize makes the desktop-resize work both ways, i.e. we
> can not only signal guest display resolution changes to the vnc client
> but also vnc client window size changes to the guest.
> 
> Tested with tigervnc.
> 
> Support for gtk-vnc is in progress.

FWIW, basic support (ie no multi-head) is implemented and testable
via the examples/gvncviewer program in gtk-vnc.

virt-viewer/remote-viewer are still todo.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


