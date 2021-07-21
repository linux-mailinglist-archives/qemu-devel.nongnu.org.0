Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FDD3D14E4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 19:14:04 +0200 (CEST)
Received: from localhost ([::1]:44022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6FnG-0005ii-N2
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 13:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6FmI-0004GP-6N
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:13:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6FmF-0001fs-8z
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626887578;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=jPL3o8LAiKkAemGwkXHSqciFkuboSG/7D4aHtYJk/hc=;
 b=QxRtTBbmD0xjTHyaL5WBnKAqpMyGY658GWE1/b4mSxf7k3pUnzacvJrfmOvdPNi4s12Mcs
 cr5ZVOIzKUquMcCbEhsBW6aZiNhhE+nKZ8B0SF2dIvf8KT4+FASco+aeEsK082NRxstQ/5
 YGFiwLPyxCQqRYGuV2ZMJCcB8n/4c70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-k4us9-ljNLKdjIMXyv-kAw-1; Wed, 21 Jul 2021 13:12:54 -0400
X-MC-Unique: k4us9-ljNLKdjIMXyv-kAw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5D108026AD
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 17:12:53 +0000 (UTC)
Received: from redhat.com (ovpn-112-39.ams2.redhat.com [10.36.112.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A403A5C225;
 Wed, 21 Jul 2021 17:12:52 +0000 (UTC)
Date: Wed, 21 Jul 2021 18:12:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: Intermittent failure in build-system-centos
Message-ID: <YPhVehtxi/hr5Zhz@redhat.com>
References: <CAFn=p-bxme1mcs17J2hn04z6E38Hd232aB6n9AVQ94F0hsV2Aw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-bxme1mcs17J2hn04z6E38Hd232aB6n9AVQ94F0hsV2Aw@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 01:42:47PM -0400, John Snow wrote:
> I don't know if this one is known yet, but I occasionally see this test
> blink out on me and then succeed on retry:
> https://gitlab.com/jsnow/qemu/-/jobs/1439046851
> 
> On IRC, Dan said that it sounded like a missing meson dependency
> accidentally allowing dependent components to build in parallel, which
> sounds plausible enough.

This should be dealt with by this patch:

  https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg05678.html

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


