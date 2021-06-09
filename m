Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B193A14F1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:52:58 +0200 (CEST)
Received: from localhost ([::1]:55864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxhZ-0002Ua-OP
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lqxfn-0001Uf-J3
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:51:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lqxfi-0005e0-7Y
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623243061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nhy0bFyqaunbYGuIvPDnCisIwUd/6m1LRiQEMKXsv24=;
 b=WZRFlxaHWngZ8iksaJpU1SoKBbm771ExiEqMs7f9IJzYplvkx6DlU4Y9alDe6CN4HaJ+fq
 RNfbBrnDcSk7EV/ushu8o+0sYKzhvhW87kdwqVm0YUaJ0oTW4TFqN0dWml17X4zmmh9zGX
 lrg6VqRFilqc5dynp9+l9MomgVKy2Fo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-MsE-wABBM_qKcKVLNXAufQ-1; Wed, 09 Jun 2021 08:50:57 -0400
X-MC-Unique: MsE-wABBM_qKcKVLNXAufQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 685CD19057A0
 for <qemu-devel@nongnu.org>; Wed,  9 Jun 2021 12:50:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3675519C45;
 Wed,  9 Jun 2021 12:50:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 76F7318003B6; Wed,  9 Jun 2021 14:50:51 +0200 (CEST)
Date: Wed, 9 Jun 2021 14:50:51 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC QEMU PATCH] ui: Make the DisplayType enum entries conditional
Message-ID: <20210609125051.l5qh3ub3sau47kow@sirius.home.kraxel.org>
References: <20210609100240.1285032-1-thuth@redhat.com>
 <20210609112405.pyv62l22g5ympoe4@sirius.home.kraxel.org>
 <YMCmNrcNByZ+Ozxn@redhat.com>
 <20210609114921.mc4upvizeobfruaw@sirius.home.kraxel.org>
 <16fdaf9e-e3ed-9de5-932c-3db33c6f77ee@redhat.com>
MIME-Version: 1.0
In-Reply-To: <16fdaf9e-e3ed-9de5-932c-3db33c6f77ee@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 libvir-list@redhat.com, smitterl@redhat.com, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > The #if CONFIG_SDL approach will not work because qemu will continue to
> > report sdl as supported even when the sdl module is not installed any
> > more.
> 
> I guess we'd need a separate QMP command to fix that, which tries to load
> the modules first when being called? Something similar to what is being done
> in qemu_display_help() ?

That would work, yes.

> That's certainly doable, too, just a little bit more complex...

Alternative idea: turn QemuDisplay into an ObjectClass, then it'll be
visible in qom introspection.  Likewise a bit more complex ...

> do we want that?  Or is the quick-n-easy way via the schema good
> enough for most use cases?

Would be better than nothing, but I'd prefer something which works
properly with modular qemu ...

> (I'm not that familiar with "virsh domcapabilities" ... is there any
> real usage for the <graphics> section or is this rather cosmetical?)

Management apps can use that info to avoid building unsupported
configurations.  Also you'll get a nice "$foo is not supported" error
from libvirt instead of libvirt dumping qemu stderr ;)

take care,
  Gerd


