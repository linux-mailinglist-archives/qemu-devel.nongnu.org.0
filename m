Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6A52D2B44
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:43:07 +0100 (CET)
Received: from localhost ([::1]:40034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmcKg-0005Sc-Qm
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kmcIv-0004dJ-EH
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:41:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kmcIs-0003wp-Ri
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:41:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607431273;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1IrgzhBfzgPNu/03eGwg84xJlObKLjuq5EPVHqkJC8I=;
 b=F9PZci6QgwuATAQk74EanlatDBkjJka7GN4/qhs5e9vJL2Qf3xyXbReS4/BRF/nK5qyrJ3
 DAFBShRZM93PZq+nWAFdNO/+E/f5crgxDQF0pKEd9olX98G8Ig651yY6h8Q7uiFq2DS+ii
 ppMho4gD8ZjSTI5gc3U1WR5WfG1adSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-EI36jUabPnSnSaEqI6Ap0A-1; Tue, 08 Dec 2020 07:41:07 -0500
X-MC-Unique: EI36jUabPnSnSaEqI6Ap0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C642D192CC44
 for <qemu-devel@nongnu.org>; Tue,  8 Dec 2020 12:41:06 +0000 (UTC)
Received: from redhat.com (ovpn-113-15.ams2.redhat.com [10.36.113.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D92F66E521;
 Tue,  8 Dec 2020 12:41:02 +0000 (UTC)
Date: Tue, 8 Dec 2020 12:40:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 0/9] vnc: support some new extensions.
Message-ID: <20201208124059.GH3136942@redhat.com>
References: <20201208115737.18581-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208115737.18581-1-kraxel@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, Dec 08, 2020 at 12:57:28PM +0100, Gerd Hoffmann wrote:
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
> gtk-vnc (and anything building on top of it like virt-viewer and
> virt-manager) has no support for these extensions.

I'm working on adding these two extensions to gtk-vnc as they're a notable
gap compared to spice.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


