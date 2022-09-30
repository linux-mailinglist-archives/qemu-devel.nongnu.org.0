Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BDA5F0647
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 10:13:22 +0200 (CEST)
Received: from localhost ([::1]:54686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeB97-0005xg-8b
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 04:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oeB45-0008Ty-4W
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 04:08:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oeB43-0002jb-J1
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 04:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664525286;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Az/NVQ8C4Pn4XDHW724iColpt7qtpnDFTaGQ0cO1SA=;
 b=aQLYIaGUmwvgd5vYQ3Hm2qwsTH102IsifrBFOIW7LtHkxBVQq+Te/ep9pDtnZNxZH/7KD3
 Hmw4scAPNJ/tyebbfY6VxRiHDdjSWlqUK/03/VezPeDyEFYor5qc3dbO2sY6O5JdQI2oNO
 jRd/gOtl8UCA89AF0R+diwRCeGiya7c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-jKEKt1RWMbeLR6Nrnu0POA-1; Fri, 30 Sep 2022 04:08:02 -0400
X-MC-Unique: jKEKt1RWMbeLR6Nrnu0POA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 415D5858282;
 Fri, 30 Sep 2022 08:08:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2992940C6EC2;
 Fri, 30 Sep 2022 08:08:01 +0000 (UTC)
Date: Fri, 30 Sep 2022 09:07:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 stefanha@redhat.com
Subject: Re: [PATCH] meson: -display dbus and CFI are incompatible
Message-ID: <Yzaj3ttj2df3S4fK@redhat.com>
References: <20220930075324.13550-1-pbonzini@redhat.com>
 <CAJ+F1CKWo5ati_Kj=X9-Vp-GCSqncTP1eP=4bn5WdC+6F387HA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CKWo5ati_Kj=X9-Vp-GCSqncTP1eP=4bn5WdC+6F387HA@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 30, 2022 at 11:59:34AM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Sep 30, 2022 at 11:53 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
> > The generated skeletons for DBus call the finalize method of the parent
> > type using code like
> >
> >     G_OBJECT_CLASS
> > (qemu_dbus_display1_chardev_skeleton_parent_class)->finalize (object);
> >
> > However, the finalize method is defined in a shared library that is not
> > compiled with CFI.  Do not enable anything that uses gdbus-codegen if
> > --enable-cfi was specified.
> >
> 
> I had the same analysis. But what if gdbus (or other dependencies) is
> compiled with CFI ? Note: I have no idea if CFI is meant to be usable in
> production or just for developers.

It is supposed to be for production, but right now it is not usable
if you want QEMU modules enabled, so that limits its practicality
today.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


