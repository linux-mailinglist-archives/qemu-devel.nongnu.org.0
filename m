Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6843040B4B1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 18:32:38 +0200 (CEST)
Received: from localhost ([::1]:33276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQBML-0003VC-HI
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 12:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQBK5-0002hL-2Z
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 12:30:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQBK3-000314-95
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 12:30:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631637014;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ZZimBFLD8xWTPbyQJZXxHC37zGGExRnF8iXkkypJR0Q=;
 b=SISm4kCcj0P5JBiavHaApemhLyQR8UtuZudXBQnFs22r1QAYLkUF53dgfOfxUAqAahdxNv
 Zqi9Vkv2zrOtL1U7q2sCBUUE0IfuYDIQE8NMb4kBk9YHYNgWcnrdzRmfTg6eVD4UTqe1v8
 hXQ+V2NyhK157eQVH8mGfCriMYvSvjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-UrCP0VGhNamJTDfkqrkciQ-1; Tue, 14 Sep 2021 12:30:01 -0400
X-MC-Unique: UrCP0VGhNamJTDfkqrkciQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AC605074C;
 Tue, 14 Sep 2021 16:30:00 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68E221001281;
 Tue, 14 Sep 2021 16:29:52 +0000 (UTC)
Date: Tue, 14 Sep 2021 17:29:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [RFC v2 0/2] ui: Add a Wayland backend for Qemu UI (v2)
Message-ID: <YUDN/Sb7rcaCnXXY@redhat.com>
References: <20210913222036.3193732-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210913222036.3193732-1-vivek.kasireddy@intel.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 Satyeshwar Singh <satyeshwar.singh@intel.com>, qemu-devel@nongnu.org,
 Tina Zhang <tina.zhang@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 03:20:34PM -0700, Vivek Kasireddy wrote:
> Why does Qemu need a new Wayland UI backend?
> The main reason why there needs to be a plain and simple Wayland backend
> for Qemu UI is to eliminate the Blit (aka GPU copy) that happens if using
> a toolkit like GTK or SDL (because they use EGL). The Blit can be eliminated
> by sharing the dmabuf fd -- associated with the Guest scanout buffer --
> directly with the Host compositor via the linux-dmabuf (unstable) protocol.
> Once properly integrated, it would be potentially possible to have the
> scanout buffer created by the Guest compositor be placed directly on a
> hardware plane on the Host thereby improving performance. Only Guest 
> compositors that use multiple back buffers (at-least 1 front and 1 back)
> and virtio-gpu would benefit from this work.

IME, QEMU already suffers from having too many barely maintained UI
implementations and iti s confusing to users. Using a toolkit like GTK
is generally a good thing, even if they don't enable the maximum
theoretical performance, because they reduce the long term maint burden.

I'm far from convinced that we should take on the maint of yet another
UI in QEMU, even if it does have some performance benefit, especially
if implemented using a very low level API like Wayland, that won't let
us easily add rich UI features.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


