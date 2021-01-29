Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD8530890E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:28:46 +0100 (CET)
Received: from localhost ([::1]:44482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5StJ-0002oa-IX
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5Snn-0007E3-Pd
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:23:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5Snl-0007qH-Tn
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:23:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611922981;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=koYh7I6xMePKze/5b8HbsjzSG6uT4PtE3sdQsBUvZlQ=;
 b=Gh/+U2DAzPtW+EAcyuVdgh1M17u9rBDLoogrSluYSPtDNIOMcbGu49vLafPTO7LQeStQL3
 nlyfvtAzFqZCcQQ2hqRbxLJz/eLwTsCmURMWkfC8uAvlHdRTNx0rCfl+5GXbQ3DxugmKi/
 Om28yGESTMEEInNFiZL4JKnIh7DpwHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-8qBXjPW1PgOYP1vngkL7Ug-1; Fri, 29 Jan 2021 07:22:58 -0500
X-MC-Unique: 8qBXjPW1PgOYP1vngkL7Ug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA84E107ACF9;
 Fri, 29 Jan 2021 12:22:56 +0000 (UTC)
Received: from redhat.com (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9247719C66;
 Fri, 29 Jan 2021 12:22:55 +0000 (UTC)
Date: Fri, 29 Jan 2021 12:22:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] tests: Replace deprecated ASN1 code
Message-ID: <20210129122253.GB4008275@redhat.com>
References: <20210128171523.45921-1-sw@weilnetz.de>
 <20210129100624.GE4001740@redhat.com>
 <f8e03cad-4eb8-92c0-eed5-a3ab033e2ab4@weilnetz.de>
 <20210129114745.GI4001740@redhat.com>
 <ce85d1ef-9c3a-d77a-d72d-84f025c6ce78@weilnetz.de>
MIME-Version: 1.0
In-Reply-To: <ce85d1ef-9c3a-d77a-d72d-84f025c6ce78@weilnetz.de>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Jan 29, 2021 at 01:18:43PM +0100, Stefan Weil wrote:
> Am 29.01.21 um 12:47 schrieb Daniel P. Berrangé:
> 
> > This is really odd.
> > I've got the 4.16.0 tar.gz for libtasn1 and it does not contain any
> > such _Pragma / deprecation warnings.
> > 
> > The libtasn1  git repo *does* contain these pragmas, but only in the
> > dev tree for the unreleased 4.17.0 version.
> > 
> > The homebrew-core.git repo recipe for libtasn1 claims to be using
> > 4.16.0 release
> > 
> >    https://github.com/Homebrew/homebrew-core/blob/master/Formula/libtasn1.rb
> > 
> > and those tarballs match what i have.
> > 
> > None the less it looks like your 4.16.0 installed version is in fact
> > a  git snapshot. Damned if I understand what homebrew is doing.
> > 
> > None the less, given that these deprecations are in libtasn1 git upstream,
> > we're going to have to deal with them.
> > 
> > 
> > Regards,
> > Daniel
> 
> 
> Mea culpa.
> 
> While examining the problem with some tests on new Macs which were reported
> by Peter, I used a local build of libtasn1 with debug information. I also
> tried git master to see whether the problem was fixed there, so my current
> header files were indeed newer than the official 4.16.0 ones. That explains
> why I was the first one to see those error messages.

No problem, I'm queuing your patch anyway, with an expanded commit
msg to say that these deprecations will be in the forthcoming 4.17.0
release.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


