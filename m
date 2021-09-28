Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EC941B1F9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 16:20:39 +0200 (CEST)
Received: from localhost ([::1]:53976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVDyG-0000To-BR
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 10:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVDvl-0007PG-Nm
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 10:18:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVDvh-00088l-IQ
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 10:18:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632838676;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=thVXV7Wkvw5faa/QYFCcZqLAIqivyEBpL87GHtN+X34=;
 b=UFz8Mo2x2pyG54JBW+yhxidaBDbI3Y4Dz9ywsd60yQ4bMHR2qmMJ1/LNvPTPsBRqZL8g4w
 73t0eQdaOR0Kx/CgvMm/974oKEqSA499F7KoQTfynwBwR6s2r442d5Ye/g4d1hJGDfZYp9
 0YqtTsIaVujtgImKQe8jsGCuG6ndjIo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-liPnuJ4TOW2jVTCNRUrPfg-1; Tue, 28 Sep 2021 10:17:53 -0400
X-MC-Unique: liPnuJ4TOW2jVTCNRUrPfg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 932FDA40C5;
 Tue, 28 Sep 2021 14:17:52 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EC6618AD4;
 Tue, 28 Sep 2021 14:17:51 +0000 (UTC)
Date: Tue, 28 Sep 2021 15:17:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v3 0/5] introduce QArray
Message-ID: <YVMkDFxHNBdLAIpd@redhat.com>
References: <cover.1629982046.git.qemu_oss@crudebyte.com>
 <2431106.PTX978RE0L@silver>
 <20210927125940.3ef12485@bahia.huguette>
 <1811981.VuayHpH01O@silver>
MIME-Version: 1.0
In-Reply-To: <1811981.VuayHpH01O@silver>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 28, 2021 at 02:25:57PM +0200, Christian Schoenebeck wrote:
> On Montag, 27. September 2021 12:59:40 CEST Greg Kurz wrote:
> > On Mon, 27 Sep 2021 12:35:16 +0200
> > 
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > On Dienstag, 31. August 2021 14:25:04 CEST Christian Schoenebeck wrote:
> > > > On Dienstag, 31. August 2021 13:58:02 CEST Greg Kurz wrote:
> > > > > On Thu, 26 Aug 2021 14:47:26 +0200
> > > > > 
> > > > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > > > > Patches 1 and 2 introduce include/qemu/qarray.h which implements a
> > > > > > deep
> > > > > > auto free mechanism for arrays. See commit log of patch 1 for a
> > > > > > detailed
> > > > > > explanation and motivation for introducing QArray.
> > > > > > 
> > > > > > Patches 3..5 are provided (e.g. as example) for 9p being the first
> > > > > > user
> > > > > > of
> > > > > > this new QArray API. These particular patches 3..5 are rebased on my
> > > > > > current 9p queue:
> > > > > > https://github.com/cschoenebeck/qemu/commits/9p.next
> > > > > 
> > > > > > which are basically just the following two queued patches:
> > > > > This looks nice indeed but I have the impression the same could be
> > > > > achieved using glib's g_autoptr framework with less code being added
> > > > > to QEMU (at the cost of being less generic maybe).
> > > > 
> > > > I haven't seen a way doing this with glib, except of GArray which has
> > > > some
> > > > disadvantages. But who knows, maybe I was missing something.
> > > 
> > > Ping
> > > 
> > > Let's do this?
> > 
> > Hi Christian,
> > 
> > Sorry I don't have enough bandwidth to review or to look for an alternate
> > way... :-\ So I suggest you just go forward with this series. Hopefully
> > you can get some reviews from Markus and/or Richard.
> 
> Ok, then I wait for few more days, and if there are no repsonses, nor vetos 
> then I'll queue these patches anyway.

I'm in favour of the general idea of an QArray concept, as i don't think
GArray quite does enough, but I've made suggestions on how I think QArray
needs to be improved first.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


