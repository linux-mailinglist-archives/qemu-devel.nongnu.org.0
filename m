Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560CA2AEF13
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 12:01:58 +0100 (CET)
Received: from localhost ([::1]:49452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcnsy-0000qt-Vn
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 06:01:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcnlP-0006ly-Kl
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 05:54:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcnlN-0005XW-Li
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 05:54:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605092044;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Feav7peSQrUdXKOQt1CH4ZGPSmYWu/EvLd2puwbJH2c=;
 b=UEEkC+zCKK7QZYqsemL51oi1/OelxjAMjQXVhd/sl18GLbUbufQxXlKgVFh/iYY8tmX3oe
 hW4AfjQr7b+GQwOQL9LXPP5Kp5m13OpSu5jG6KYPrdW2vCigjcBw/vrHwoxxahjoCjZz3P
 sLWbSsx/5LsIGciVrQ89rvTqnvksmrk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-VikMtCUtNYeeUfXEpmaFCw-1; Wed, 11 Nov 2020 05:53:59 -0500
X-MC-Unique: VikMtCUtNYeeUfXEpmaFCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 281586D240
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 10:53:58 +0000 (UTC)
Received: from redhat.com (ovpn-114-221.ams2.redhat.com [10.36.114.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DE6219C71;
 Wed, 11 Nov 2020 10:53:56 +0000 (UTC)
Date: Wed, 11 Nov 2020 10:53:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/2] keyval: accept escaped commas in implied option
Message-ID: <20201111105353.GE906488@redhat.com>
References: <20201111104521.1179396-1-pbonzini@redhat.com>
 <20201111104521.1179396-2-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201111104521.1179396-2-pbonzini@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 11, 2020 at 05:45:20AM -0500, Paolo Bonzini wrote:
> This is used with the weirdly-named device "SUNFD,two", so accepting it
> is also a preparatory step towards keyval-ifying -device and the
> device_add monitor command.  But in general it is an unexpected wart
> of the keyval syntax and leads to suboptimal errors compared to QemuOpts:

If "SUNFD,two" is the only wierdly named device, can we just rename
it to get rid of the comma, and then put validation in QOM to forbid
commas entirely.  eg rename it to "SUNFD-two"

Just have a targetted hack in vl.c to replace any use of "SUNFD,two"
with the new name before parsing in keyval, if we care enough about
back compat for this niche hardware device.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


