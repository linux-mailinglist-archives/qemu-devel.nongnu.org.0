Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C8A30D6F6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 11:02:52 +0100 (CET)
Received: from localhost ([::1]:51526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ezr-0007OF-CD
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 05:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7ExS-0006Yo-3L
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:00:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7ExL-0004LN-G0
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612346412;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=A9Ecmec4Bf+4kytxZK689A0aAFvu/zePQp2wa29OLrU=;
 b=F6ZJ1oZXZDj0eEeO3a0VjvdZPBsfZ+JAeQTr30LG2QXko6mSKH2BPAT0VAR7DVt2GVmDSM
 zSTL2xJKuFDKkvWyaV6hTTMJvQ/7eJmzV+zoD09uFaHN0z6rl1VKtob3kocDVh1N1cGVHe
 VSpl09s6r2NiDmzn6HMQS1H9BEWl7/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-dyhA4DftNoaM5dVY8PzIKA-1; Wed, 03 Feb 2021 05:00:10 -0500
X-MC-Unique: dyhA4DftNoaM5dVY8PzIKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73C95100C624;
 Wed,  3 Feb 2021 10:00:09 +0000 (UTC)
Received: from redhat.com (ovpn-115-117.ams2.redhat.com [10.36.115.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8ABE60C66;
 Wed,  3 Feb 2021 10:00:06 +0000 (UTC)
Date: Wed, 3 Feb 2021 10:00:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: macOS (Big Sur, Apple Silicon) 'make check' fails in
 test-crypto-tlscredsx509
Message-ID: <20210203100003.GB300990@redhat.com>
References: <CAFEAcA88wwwK5RYDpkQ+KEGwS5Qon6wQc8UsuWjjkKtKM9egcA@mail.gmail.com>
 <YBjg7ubtbw3OeQCd@SPB-NB-133.local>
 <6d360ded-f8b6-d08b-b4fc-af8c52554a58@redhat.com>
 <4581723.kQ5iP5sz2Z@silver>
 <2aa107b3-b986-0788-4d2d-fcd90ad891a4@redhat.com>
 <ca868458-d695-a8f8-69f7-98fb8a8554af@weilnetz.de>
 <55ade56a-2c1d-c89f-a71e-fa63db272ccf@weilnetz.de>
MIME-Version: 1.0
In-Reply-To: <55ade56a-2c1d-c89f-a71e-fa63db272ccf@weilnetz.de>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 09:50:39PM +0100, Stefan Weil wrote:
> Am 02.02.21 um 21:31 schrieb Stefan Weil:
> 
> > The code uses NULL + offset constructs, so requires a fix.
> > 
> > https://gitlab.com/gnutls/libtasn1/-/merge_requests/71 fixes the unit
> > tests of libtasn1 for me, maybe also the test for QEMU which I still
> > have to check.
> > 
> 
> The QEMU test passes with the patch for libtasn1:

That's great, thanks for chasing this problem.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


