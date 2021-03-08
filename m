Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423DE330C43
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:24:33 +0100 (CET)
Received: from localhost ([::1]:52040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJE00-000384-4M
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:24:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJDzE-0002dz-SP
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:23:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJDzD-0004ie-BI
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:23:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615202622;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z1Ex6NBN1hdfKG/pwgRDNqHQrRmUDVWi3lO0vNk2r0g=;
 b=eE53LbAGKT1NHhxtFh/549FnWQaXv3F1AtkK5HR6iVt3X5EtfkGpDNCm3IAoWRbImOQEEB
 dKzC/b7oUEAVLgP2CKPwNyHK/1vzqJG7MGokkhTuvC3qYQr3W7xsQqpQlGoH6PRJAvvLFn
 U93TSnnRY0Uj2azxMHt3Zjrd+Zbg9xs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-fIxbGVn3OPm1-hF327bD2A-1; Mon, 08 Mar 2021 06:23:40 -0500
X-MC-Unique: fIxbGVn3OPm1-hF327bD2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76C1380432F;
 Mon,  8 Mar 2021 11:23:39 +0000 (UTC)
Received: from redhat.com (ovpn-114-69.ams2.redhat.com [10.36.114.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85D93100239F;
 Mon,  8 Mar 2021 11:23:31 +0000 (UTC)
Date: Mon, 8 Mar 2021 11:23:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 1/3] fdc: Drop deprecated floppy configuration
Message-ID: <YEYJME8QswKLSh0q@redhat.com>
References: <20210304100059.157158-1-armbru@redhat.com>
 <20210304100059.157158-2-armbru@redhat.com>
 <YEC74LYdmj2p8IyY@redhat.com> <87v9a7dmfk.fsf@dusky.pond.sub.org>
 <87lfb29g8a.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87lfb29g8a.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 05, 2021 at 09:06:45AM +0100, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> 
> > Daniel P. Berrangé <berrange@redhat.com> writes:
> >
> >> On Thu, Mar 04, 2021 at 11:00:57AM +0100, Markus Armbruster wrote:
> >>> Drop the crap deprecated in commit 4a27a638e7 "fdc: Deprecate
> >>> configuring floppies with -global isa-fdc" (v5.1.0).
> >>> 
> >>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> [...]
> > Sadly, the commit's update of docs/system/deprecated.rst neglects to
> > cover this use.  Looks the series overtaxed my capacity to juggle
> > details; my apologies.
> [...]
> 
> I'm talking about commit 4a27a638e7 here.
> 
> The deprecated.rst text only covers setting floppy controller properties
> with -global.  It neglects to cover setting them with -device.  For
> onboard controllers, -global is the only way to set them.
> 
> I append a fixup.
> 
> We can put it before this patch.  This patch then moves the fixed up
> text to removed-features.rst.
> 
> Or we squash it into this patch, i.e. this patch deletes the flawed text
> from deprecated.rst and adds the fixed up text to removed-features.rst.
> 
> Got a preference?

I'm fine with either option. It isn't unusual to tweak the text when
moving it to the removed-features.rst file, as we'll be talking about
the past rather than future.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


