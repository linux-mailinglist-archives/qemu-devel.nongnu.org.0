Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A732C3A28D9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 11:57:02 +0200 (CEST)
Received: from localhost ([::1]:52394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHQr-00062X-PE
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 05:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrHOn-0004HR-MX
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:54:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrHOl-00049o-9K
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:54:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623318890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BNFzlv9j2AmhBsTzSGLjxcsOC+8TzVQmllQq6YjJ8O0=;
 b=UKmQzlUUpXiwZ3hFZq9iN0fLdn8EhNvsCttJCcCGKNyFFpRt6Kp4z95cfqgbz5jqrthlme
 j1TiOxTz8TKfvi3ZOZN91oRHMa6nT58WQzOn1zIh6JMez950+GVc4EyFA/IypngYfOrk1S
 PnP1LURSYwyDXxegCGZdG4ggEVBy44U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-75VzVHOcO2qnRHaSSXh2LA-1; Thu, 10 Jun 2021 05:54:47 -0400
X-MC-Unique: 75VzVHOcO2qnRHaSSXh2LA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D2B5946;
 Thu, 10 Jun 2021 09:54:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C3C55D6BA;
 Thu, 10 Jun 2021 09:54:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1907C18000B2; Thu, 10 Jun 2021 11:54:34 +0200 (CEST)
Date: Thu, 10 Jun 2021 11:54:34 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v2 00/18] modules: add metadata database
Message-ID: <20210610095434.iygaxizo5h3745zf@sirius.home.kraxel.org>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <dd1c5487-b1bf-9e33-fd42-fc0863e0ddd7@suse.de>
MIME-Version: 1.0
In-Reply-To: <dd1c5487-b1bf-9e33-fd42-fc0863e0ddd7@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Thomas Huth <thuth@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Peter Lieven <pl@kamp.de>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 =?utf-8?B?Sm9zw6k=?= Ricardo Ziviani <jose.ziviani@suse.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, berrange@redhat.com,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 10:32:39AM +0200, Claudio Fontana wrote:
> On 6/10/21 7:57 AM, Gerd Hoffmann wrote:
> > This patch series adds support for module metadata.  Here are the pieces
> > of the puzzle:
> > 
> >   (1) Macros are added to store metadata in a .modinfo elf section
> >       (idea stolen from the linux kernel).
> >   (2) A utility to scan modules, collect metadata from the .modinfo
> >       sections, store it in a file (modinfo.json) for later consumption
> >       by qemu.  Can also be easily inspected using 'jq'.
> >   (3) Adding annotations to the modules we have.
> >   (4) Drop hard-coded lists from utils/module.c
> > 
> > take care,
> >   Gerd
> 
> The background has disappeared compared with V1.
> 
> V1 says:
> 
> "Background is that the hard-coded lists in util/module.c are somewhat
> ugly and also wouldn't work very well with a large number of modules,
> so I'm looking for something else."

Well, it's point (4) now (a bit short indeed ...).

> Can you write more about what the actual high level goals of this series are?

Right now we have information about modules hard-coded in various places
in qemu.  Most obvious ones are module_deps[] and qom_modules[] (both in
util/module.c), but also qemu_load_module_for_opts() (in softmmu/vl.c)
and maybe more I missed.

So, when you go build some qom object modular today you'll have to go
add that to the qom_modules[] list.  With this patch series applied
you'll go add a 'module_obj("typename");' to your source file instead.

Same goes for other metadata, see the "add $foo module annotations"
patches for examples.

> We are in general making QEMU more and more difficult to get into,
> requiring more and more investment for new contributors to get
> productive.
> 
> Is the additional complexity justified? What is the benefit, and is
> simplification a goal of the series as well?

IMHO it is a simplification for developers.  Modules are more
self-contained with this in place.  You just add the annotation macros
and you are done.  No need to edit manually maintained lists at some
non-obvious place elsewhere in the tree.  Also no patch conflicts in
those lists.  We have type_init() + friends for simliar reasons.

The price for that simplification is the new utility needed which
collects and stores the metadata.  But that is something you only need
to worry about when actually working on module support.  The build
system keeps the database automatically up-to-date and most developers
shouldn't even notice that it is there.

take care,
  Gerd


