Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E93E13A2CA6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:15:43 +0200 (CEST)
Received: from localhost ([::1]:59310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKX9-0005p3-1D
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrKVH-0004Vk-G4
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:13:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrKVE-0007iv-UJ
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623330824;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=EDQCNUlzFwr18H/DtLiIA7BzQv3BMSijYNa/vFxnR4k=;
 b=HMA32yKBUaKcgfc+Kz/00U8naGeO9qUakropgU9hNqW87TNhonb/pYkCTJz8MdzCC6QtGp
 NopZTNne1g+pSfk8aR9ckbm0YYOR9lvPwaUenU9J5Wk7gNNyrEbRZ61CTgYfbCaOUgnFFP
 b3R3ZOWNIg4b+1vkMAokzjSWtBAJDZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-3fWhoAzKPGeUM0HfhMXXwg-1; Thu, 10 Jun 2021 09:13:43 -0400
X-MC-Unique: 3fWhoAzKPGeUM0HfhMXXwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C8BE100CA8D
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 13:13:42 +0000 (UTC)
Received: from redhat.com (ovpn-115-203.ams2.redhat.com [10.36.115.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCB4C5D6BA;
 Thu, 10 Jun 2021 13:13:36 +0000 (UTC)
Date: Thu, 10 Jun 2021 14:13:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 03/18] modules: add qemu-modinfo utility
Message-ID: <YMIP/cKc570Ozvdh@redhat.com>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-4-kraxel@redhat.com>
 <20210610130424.fj6fsufnunccmhmx@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210610130424.fj6fsufnunccmhmx@sirius.home.kraxel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 03:04:24PM +0200, Gerd Hoffmann wrote:
>   Hi Paolo,
> 
> > +if config_host.has_key('CONFIG_MODULES')
> > +   qemu_modinfo = executable('qemu-modinfo', files('qemu-modinfo.c') + genh,
> > +                             dependencies: [glib, qemuutil], install: have_tools)
> > +   custom_target('modinfo.json',
> > +                 input: [ softmmu_mods, block_mods ],
> > +                 output: 'modinfo.json',
> > +                 install: true,
> > +                 install_dir: qemu_moddir,
> > +                 command: [ qemu_modinfo, '.' ])
> > +endif
> 
> I have trouble with this one.  Tried to declaring the modules as "input"
> to make sure meson will only run qemu-modinfo when it is done building
> the module.  But now and then I get build errors because qemu-modinfo
> runs in parallel to a module build and qemu-modinfo throws an read error
> because of that.

softmmu_mods and block_mods are both lists already, so this sets a
nested list and I wonder if it confuses meson  ? eg do you need

 input: softmmu_mods + block_mods

Alternatively there is option to do:

  'depends: softmmu_mods + block_mods

though the meson docs claim that's not required if they're
already listed against 'input:'


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


