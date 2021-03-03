Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB82332B899
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 15:27:51 +0100 (CET)
Received: from localhost ([::1]:57608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHSTe-0004ZT-Tv
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 09:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHSSW-00048d-DU
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:26:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHSST-0004IP-AI
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:26:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614781595;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/rWnYXvzGmRmuTz9qQvccJN+4aQe7LNqf9qmjSiPzI=;
 b=jHmctAR3HW8zDmHKk8qwI8JqFyDla5BANMqZPE4uozkp14traCEhU2Ni9kdEFGe31hk5o1
 Glb/IXKtBRDtv0Esru/TERrgAEB3/4jL3cSzxM0RGILBtCFTSQriSts/hpCLjtznBdR6RO
 nyFmPKZy0LzoZja7K33vc6ohDj6clpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-EEFBztk1OFKA4QRyrP7wyQ-1; Wed, 03 Mar 2021 09:26:33 -0500
X-MC-Unique: EEFBztk1OFKA4QRyrP7wyQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69F3D107ACF7;
 Wed,  3 Mar 2021 14:26:32 +0000 (UTC)
Received: from redhat.com (ovpn-115-145.ams2.redhat.com [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 473E12CE8A;
 Wed,  3 Mar 2021 14:26:30 +0000 (UTC)
Date: Wed, 3 Mar 2021 14:26:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH] multi-process: Initialize variables declared with g_auto*
Message-ID: <YD+ckxoEk6cB6AAc@redhat.com>
References: <20210303070639.1430-1-yuzenghui@huawei.com>
 <YD9iTgCNgrsbzWfx@redhat.com>
 <245D5971-0F34-42BB-9C84-4039BEE255E1@oracle.com>
MIME-Version: 1.0
In-Reply-To: <245D5971-0F34-42BB-9C84-4039BEE255E1@oracle.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
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
Cc: Zenghui Yu <yuzenghui@huawei.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>,
 John Johnson <john.g.johnson@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 03, 2021 at 02:24:04PM +0000, Jag Raman wrote:
> 
> 
> > On Mar 3, 2021, at 5:17 AM, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > 
> > On Wed, Mar 03, 2021 at 03:06:39PM +0800, Zenghui Yu wrote:
> >> Quote docs/devel/style.rst (section "Automatic memory deallocation"):
> >> 
> >> * Variables declared with g_auto* MUST always be initialized,
> >>  otherwise the cleanup function will use uninitialized stack memory
> >> 
> >> Initialize @name properly to get rid of the compilation error:
> >> 
> >> ../hw/remote/proxy.c: In function 'pci_proxy_dev_realize':
> >> /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: 'name' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> >>   g_free (*pp);
> >>   ^~~~~~~~~~~~
> >> ../hw/remote/proxy.c:350:30: note: 'name' was declared here
> >>             g_autofree char *name;
> >>                              ^~~~
> > 
> > This is a bit wierd.  There should only be risk of uninitialized
> > variable if there is a 'return' or 'goto' statement between the
> > variable declaration and and initialization, which is not the
> > case in either scenario here.
> > 
> > What OS distro and compiler + version are you seeing this with ?
> > 
> > Also we seem to be lacking any gitlab CI job to test with the
> > multiprocess feature enabled
> 
> Hi Daniel,
> 
> Concerning gitlab CI, it looks like we are running acceptance tests as
> part of it. "acceptance-system-fedora" runs it on fedora.
> 
> Is it sufficient to have multiprocess tests as part acceptance tests suite
> or do you prefer to have a separate test in gitlab CI?

No problem. it is just me getting confused. I was looking for a CI job
with --enable-multiprocess, not realizing it is enabled by default
on Linux in configure


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


