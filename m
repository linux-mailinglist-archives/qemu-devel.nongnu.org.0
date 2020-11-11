Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2682AF189
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:06:12 +0100 (CET)
Received: from localhost ([::1]:41146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcppD-0007G8-8i
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kcpcj-0002kx-Io
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:53:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kcpch-0003wJ-8H
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:53:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605099193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V5M+7Q/GzSMBYj/haeau7beTHgtvSzgOP+au3F7gqhE=;
 b=JblYGEHGfCx1zpX2aOwRV8p3rQy6xzHPPRVpFoe2oGzgef8g10ny1XHcMQ/RwyVZDrQquV
 3VHAc/t40RIgemm9IlM1i1PiErxxQ/X6MDMSPQbnXxNsPyGYKK4vcpacvtzOYVfwa8DZOH
 wJkzBVRzWjWC4Qn5DBmui65smWmu3QI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-5wB4gFi2O5aQ8oPpwe0XDw-1; Wed, 11 Nov 2020 07:53:11 -0500
X-MC-Unique: 5wB4gFi2O5aQ8oPpwe0XDw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 977AC188C122
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 12:53:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-124.ams2.redhat.com [10.36.114.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F76D5DA74;
 Wed, 11 Nov 2020 12:53:09 +0000 (UTC)
Date: Wed, 11 Nov 2020 13:53:07 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Command line QAPIfication and -readconfig
Message-ID: <20201111125307.GC3898@merkur.fritz.box>
References: <20201111092423.GA3898@merkur.fritz.box>
 <20201111101407.GD906488@redhat.com>
 <20201111103550.GB3898@merkur.fritz.box>
 <30bdf162-5b29-6725-f5a5-fb5dcc85abee@redhat.com>
MIME-Version: 1.0
In-Reply-To: <30bdf162-5b29-6725-f5a5-fb5dcc85abee@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
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
Cc: jsnow@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.11.2020 um 12:07 hat Paolo Bonzini geschrieben:
> On 11/11/20 11:35, Kevin Wolf wrote:
> > > IOW, I'd suggest we focus effort on introducing the new config file format
> > > based on QAPI first, and once that exists, then convert these sample
> > > config files in docs/config, and deprecate -readconfig.
> > 
> > Fine with me. That would make introducing the new config file format a
> > priority, though, even if it can't support every option yet (similar to
> > -readconfig). I didn't have the impression so far that we are planning
> > to do that. Is anyone working on it?
> 
> Indeed, my plan was to focus on QMP-based configuration, not on
> configuration file formats.
> 
> However I hit the same snag, in that my patches broke -readconfig for
> -object, -M and -accel.  I'm thinking of decoupling config file parsing from
> QemuOpts, using QDicts instead and moving the QemuOpts part into
> softmmu/vl.c.

QDicts are one step closer to the final result, but would also have to
be processed separately as they need only half of the processing that
command line options need. Eventually, qobject_input_visitor_new_str()
is what we want to use to parse strings directly into QAPI objects, and
QDicts are only an internal intermediate result there.

So while it's even uglier, maybe what we should do with -readconfig is
convert it back to strings and then run the result through the normal
command line processing? This would get rid of the special cases.

Both options are probably only hacks for the short term, so either way I
think I'd still prefer deprecating -readconfig now, in favour of command
line options as long as we don't have a QAPI based config file.

Kevin


