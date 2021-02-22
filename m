Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCE6321BB0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 16:39:49 +0100 (CET)
Received: from localhost ([::1]:57820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEDJM-0005tv-C1
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 10:39:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEDGY-0004Pq-91
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:36:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEDGM-0003PV-1L
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:36:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614008195;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=50sJAQtnqegrqsguVq4pedKWTK/Rt4Hi81Lslvp68E4=;
 b=g0xXJjCB4TIBujeFRqsfS+n7BK5cuGhbYoMB4NdRSdtcWhhSDMf3IeuwI/gtoxlEZAxeYd
 t5BVVSEFsnDcz29NPeRwO1rYbG5y3pBhc5AqY0KURr0spBO0qGV6iSU77stc+RLYGSUuxg
 UoblEgU6OYbM3ljCCYoKs/4FFUE8a18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-zE11DCX1Mz-x5BkvOrdTug-1; Mon, 22 Feb 2021 10:36:34 -0500
X-MC-Unique: zE11DCX1Mz-x5BkvOrdTug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50F50AFA82;
 Mon, 22 Feb 2021 15:36:33 +0000 (UTC)
Received: from redhat.com (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F1F119C45;
 Mon, 22 Feb 2021 15:36:28 +0000 (UTC)
Date: Mon, 22 Feb 2021 15:36:25 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: Interactive launch over QMP socket?
Message-ID: <YDPPeVXzcttsJsJU@redhat.com>
References: <47b15088-514a-8174-029d-8d9c4571960a@redhat.com>
 <YDOhB4Db5xg52Zgv@redhat.com>
 <d137b4ee-7dbe-6bd5-63c9-b20a80259d08@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d137b4ee-7dbe-6bd5-63c9-b20a80259d08@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: jejb@linux.ibm.com, npmccallum@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 09:00:36AM -0600, Connor Kuehl wrote:
> On 2/22/21 6:18 AM, Daniel P. Berrangé wrote:
> > 
> > ... so this doesn't actually seem to need to be done in QMP on the fly.
> > It can be provided on the CLI, which seems to be possible wth the args
> > shown earlier.
> > 
> 
> > 
> > It seems like this is all doable already unless I'm missing something.
> 
> That's correct; however, I would like to make it possible for the entirety
> of it to happen on the fly, ultimately rendering the CLI args optional.

There is a long term goal to make entire of QEMU CLI optional, such that
it only contains the QMP config, and then do every thing related to VM
setup as QMP commands. So if current CLI is functionally sufficient,
then eventually, the same will be doable exclusively at runtime. We
don't have a firm ETA for this though.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


