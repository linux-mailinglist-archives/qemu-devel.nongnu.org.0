Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B46373A137B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 13:50:54 +0200 (CEST)
Received: from localhost ([::1]:50768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqwjV-0007G1-QJ
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 07:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lqwiK-0006Yt-0l
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 07:49:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lqwiI-0006od-Dl
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 07:49:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623239377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3j0c3HGU/avOneBPPjouy+hMM4IxuZpGKGV4FnVGDZs=;
 b=KJXEHwpUuxlFm0maSWSCyRVoAL0xb/56GaHv0LOQEgmiPVbP+KSNazJcBccvgcXsdyxhzE
 /OL7dp+cwLe7yf8iIAwWDenfuQXj8YNY9e2MJMDtYNmbvL2KS2u2qlC0SJBt87grv7xNk2
 ABQ2lsFvabBm0zNXkcx28cRSkkM/93k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-S6OOoNESO8CPqzyHROhDQQ-1; Wed, 09 Jun 2021 07:49:36 -0400
X-MC-Unique: S6OOoNESO8CPqzyHROhDQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B73F3801B13
 for <qemu-devel@nongnu.org>; Wed,  9 Jun 2021 11:49:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A5FB19C46;
 Wed,  9 Jun 2021 11:49:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 465E818017CA; Wed,  9 Jun 2021 13:49:21 +0200 (CEST)
Date: Wed, 9 Jun 2021 13:49:21 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [RFC QEMU PATCH] ui: Make the DisplayType enum entries conditional
Message-ID: <20210609114921.mc4upvizeobfruaw@sirius.home.kraxel.org>
References: <20210609100240.1285032-1-thuth@redhat.com>
 <20210609112405.pyv62l22g5ympoe4@sirius.home.kraxel.org>
 <YMCmNrcNByZ+Ozxn@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YMCmNrcNByZ+Ozxn@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, libvir-list@redhat.com, smitterl@redhat.com,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 12:29:58PM +0100, Daniel P. Berrangé wrote:
> On Wed, Jun 09, 2021 at 01:24:05PM +0200, Gerd Hoffmann wrote:
> > On Wed, Jun 09, 2021 at 12:02:40PM +0200, Thomas Huth wrote:
> > > Libvirt's "domcapabilities" command has a way to state whether
> > > certain graphic frontends are available in QEMU or not. Originally,
> > > libvirt looked at the "--help" output of the QEMU binary to determine
> > > whether SDL was available or not (by looking for the "-sdl" parameter
> > > in the help text), but since libvirt stopped doing this analysis of
> > > the help text, the detection of SDL is currently broken, see:
> > > 
> > >  https://bugzilla.redhat.com/show_bug.cgi?id=1790902
> > > 
> > > QEMU should provide a way via the QMP interface instead. The simplest
> > > way, without introducing additional commands, is to make the DisplayType
> > > enum entries conditional, so that the enum only contains the entries if
> > > the corresponding CONFIG_xxx switches have been set.
> > 
> > Hmm, that'll break for the "dnf remove qemu-ui-sdl" case ...
> 
> Note tht libvirt invalidates its cache of QEMU capabilities when it
> sees the /usr/lib64/qemu directory timestamp change. So it ought to
> pick up changes caused by installing/removing QEMU modules, and apply
> this to future queries for domcapabilities, or when starting future
> QEMU guests.

That'll work fine for modules implementing qom objects / devices,
because the list of available objects changes accordingly and libvirt
can see that.

The #if CONFIG_SDL approach will not work because qemu will continue to
report sdl as supported even when the sdl module is not installed any
more.

take care,
  Gerd


