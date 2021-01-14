Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E53C2F6877
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:55:56 +0100 (CET)
Received: from localhost ([::1]:32830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06qh-0007iL-17
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l06OL-0007s1-Ff
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:26:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l06OJ-0007dR-Oz
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610645195;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h31vm5AaJeLSwl8kLVzPexZV77paJG0r8aKg4ih2QyY=;
 b=fgDHiipZ5PJDK+xTVoXUr23oAOYgdi3+K231VROAES63kXIiiPvXPMsAVp5q18oTRx3vqR
 nyaijS+90aGAN9qaQWR6j36KuxwIwSo8PTfMvlgC7fCLIe7l2Ic50yHErx1WW2BnPOJhEX
 v4Yaw47vJF64ZTs0UiDaFZz97U05kU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375--ItYEJ-bPmCf3pNMxhCmIw-1; Thu, 14 Jan 2021 12:26:33 -0500
X-MC-Unique: -ItYEJ-bPmCf3pNMxhCmIw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1F96806660;
 Thu, 14 Jan 2021 17:26:31 +0000 (UTC)
Received: from redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF15F50F7D;
 Thu, 14 Jan 2021 17:26:28 +0000 (UTC)
Date: Thu, 14 Jan 2021 17:26:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kashyap Chamarthy <kchamart@redhat.com>
Subject: Re: About creating machines on the command line
Message-ID: <20210114172626.GR1643043@redhat.com>
References: <13ecc030-f42b-5a27-a0b3-b07921426ce9@greensocs.com>
 <20210114113706.GF1643043@redhat.com>
 <20210114171150.GA94798@paraplu.home>
MIME-Version: 1.0
In-Reply-To: <20210114171150.GA94798@paraplu.home>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 richard.fuhler@sifive.com, sam.grove@sifive.com,
 Mark Burton <mark.burton@greensocs.com>, armbru@redhat.com,
 qemu-devel@nongnu.org, edgar.iglesias@gmail.com,
 Luc Michel <luc.michel@greensocs.com>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 06:11:50PM +0100, Kashyap Chamarthy wrote:
> On Thu, Jan 14, 2021 at 11:37:06AM +0000, Daniel P. Berrangé wrote:
> > On Mon, Jan 11, 2021 at 03:50:58PM +0100, Luc Michel wrote:
> 
> [...]
> 
> > > This would hopefully allow for simple machines creation. We would then be
> > > able to use either the command line or the `-readconfig` option to create
> > > the machine.
> > > 
> > > Note that we are not planning to use QMP/HMP for now. From our
> > > understanding, a `device_add` request is always considered as hot-plug,
> > > which is not what we want here.
> > > 
> > > Please tell us what do you think about this plan. Any feedback is
> > > appreciated.  Then we can discuss the details of how to do this properly.
> > 
> > There's a general desire amongst QEMU maintainers to move to a world
> > where QAPI is used for describing everything. In this vision, eventually
> > all current command line options would be replaced with QMP commands
> > and QAPI objects specs.
> > 
> > In this world -readconfig is likely to be deleted. 
> 
> In that case, I hope the above intention / direction will be documented
> somewhere more clearly.  In the past I ran into at least a couple of
> companies that use QEMU in production and heavily rely on '-readconfig',
> despite knowing some of its shortcomings.  There might be others out
> there.

Such a change would go through the deprecation process as normal so
they would have 2 releases prior warning.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


