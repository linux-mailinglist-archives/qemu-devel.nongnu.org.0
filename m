Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4037321E2A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:33:59 +0100 (CET)
Received: from localhost ([::1]:55806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEF5q-0006p3-MW
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEF3S-0003kb-G6
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:31:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEF3Q-00086m-L4
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:31:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614015087;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Nv0jL9tkfIg7jT5q/LRCJnaUWmjmfK3JamE/WU9Jb94=;
 b=i4NuzCwyRUXFI3u9F1fii+XcKZtStc7lQWYjfXHsR52GNct3z9KIrmL4sNb9YEdgCaUiDX
 VUGSc2HCEoYUHPXDe/7dUy62zlDWo8gDRUrfEi/pOJjGPdUvWjy6zAca+DDfjw8esoVCOR
 A9RusC/90bb968r1PdXRa9SafXDH7Hg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-OxygkYeePGSYusJbKHdfyw-1; Mon, 22 Feb 2021 12:31:15 -0500
X-MC-Unique: OxygkYeePGSYusJbKHdfyw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D50111020C27;
 Mon, 22 Feb 2021 17:31:12 +0000 (UTC)
Received: from redhat.com (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 874EF100239F;
 Mon, 22 Feb 2021 17:30:53 +0000 (UTC)
Date: Mon, 22 Feb 2021 17:30:50 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Boris Fiuczynski <fiuczy@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <YDPqSoW3UGhkGcaq@redhat.com>
References: <20210222125548.346166-1-pasic@linux.ibm.com>
 <d0ffba8c-b032-d3b2-01c8-6455d9acae97@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <d0ffba8c-b032-d3b2-01c8-6455d9acae97@linux.ibm.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bruce Rogers <brogers@suse.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 06:18:57PM +0100, Boris Fiuczynski wrote:
> Paolo, Daniel,
> I am in general (s390 unrelated) a bit puzzled about the scenario of QEMU
> being modularized.
> Libvirt probes QEMU executables for their capabilities and creates a
> capabilities cache of the probed QEMU binary. There are a few triggers that
> invalidate the cache. One is the QEMU binary changing.
> Is there one for QEMU modules being installed or uninstalled?
> How is that supposed to work?

Libvirt doesn't check the modules specifically, but it does look at the
mtime on the directory containing modules, and that should be touched
when a moduled is added/removed.  This is since libvirt 6.8.0 or later.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


