Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C308931869F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 10:14:25 +0100 (CET)
Received: from localhost ([::1]:45142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA83M-0003ns-SY
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 04:14:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lA81R-0002EI-CS
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:12:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lA81K-0004rd-Ds
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:12:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613034737;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R0QJBhRRdVkEfkUNm2tFhopimSCZmhhWZr4ET//S9m0=;
 b=AqDpyoSaHQc6/DUblmpzevlAqJaz+RP/pxxyt3+UhUp7Z/ltB4FpJpCRkwkxRf8OaGcgF/
 nAoSZRQcaD5sbK390lyHMB+tROVZNCroso31lUmYqe+6PMLc2tF/TVbFrX5zlmMs8O6/iC
 JXEm7it30ze/SZ8v+nKFQXjr0H6yh9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-d6Yilr1KNYWDvzQskaZW9A-1; Thu, 11 Feb 2021 04:12:09 -0500
X-MC-Unique: d6Yilr1KNYWDvzQskaZW9A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CCE6801962;
 Thu, 11 Feb 2021 09:12:08 +0000 (UTC)
Received: from redhat.com (ovpn-114-239.ams2.redhat.com [10.36.114.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABCA82CF79;
 Thu, 11 Feb 2021 09:12:06 +0000 (UTC)
Date: Thu, 11 Feb 2021 09:12:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Doug Evans <dje@google.com>
Subject: Re: [PATCH v3 0/3]
Message-ID: <20210211091203.GA1302824@redhat.com>
References: <20210203233539.1990032-1-dje@google.com>
 <20210204100349.GF549438@redhat.com>
 <CADPb22THtnaRgz3MAa+=U+dgZeZR4+FDO_SvpfsqKbnSJRnOmA@mail.gmail.com>
 <CADPb22Q2k0EpEG6=h=Riswitpha0okeEeoP9Use3yfYtV7t6ZA@mail.gmail.com>
 <20210210093102.GB1240644@redhat.com>
 <CADPb22QzGYw3z9tgVgcZv3vywVN_ejt_PjUrHmB4O-DLkAeT=Q@mail.gmail.com>
 <20210210164919.GL1240644@redhat.com>
 <CADPb22Sdk1Ao5wGFBEiJ2mNqeRfo81vp1U1gXYA9caf9Ht1n4g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADPb22Sdk1Ao5wGFBEiJ2mNqeRfo81vp1U1gXYA9caf9Ht1n4g@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 02:40:17PM -0800, Doug Evans wrote:
> On Wed, Feb 10, 2021 at 8:49 AM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Wed, Feb 10, 2021 at 08:31:40AM -0800, Doug Evans wrote:
> > > On Wed, Feb 10, 2021 at 1:31 AM Daniel P. Berrangé <berrange@redhat.com>
> > > wrote:
> > >
> > > > On Tue, Feb 09, 2021 at 06:16:57PM -0800, Doug Evans wrote:
> > > > > On Thu, Feb 4, 2021 at 10:25 AM Doug Evans <dje@google.com> wrote:
> > > > >
> > > > > > On Thu, Feb 4, 2021 at 2:03 AM Daniel P. Berrangé <
> > berrange@redhat.com
> > > > >
> > > > > > wrote:
> > > > > >
> > > > > >> On Wed, Feb 03, 2021 at 03:35:36PM -0800, dje--- via wrote:
> > > > > >> > Add support for ipv6 host forwarding
> > > > > >> >
> > > > > >> > This patchset takes the original patch from Maxim,
> > > > > >> >
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html
> > > > > >> > and updates it.
> > > > > >> >
> > > > > >> > New option: -ipv6-hostfwd
> > > > > >> >
> > > > > >> > New commands: ipv6_hostfwd_add, ipv6_hostfwd_remove
> > > > > >> >
> > > > > >> > These are the ipv6 equivalents of their ipv4 counterparts.
> > > > > >>
> > > > > >> Before I noticed this v3, I send a reply to your v2 sugesting
> > > > > >> that we don't need to add any new commands/options. We can
> > > > > >> use existing inet_parse() helper function to parse the address
> > > > > >> info and transparently support IPv4/6 in the existing commands
> > > > > >> and options. This matches normal practice elsewhere in QEMU
> > > > > >> for IP dual stack.
> > > > > >>
> > > > > >
> > > > > > I'm all for this, fwiw.
> > > > > >
> > > > >
> > > > >
> > > > > I should say I'm all for not adding new commands/options.
> > > > > Looking at inet_parse() it cannot be used as-is.
> > > > > The question then becomes: Will refactoring it buy enough?
> > > >
> > > > What's the problem your hitting with inet_parse ?
> > > >
> > >
> > >
> > > First, this is the inet_parse() function we're talking about, right?
> > >
> > > int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
> > >
> > >
> > https://gitlab.com/qemu-project/qemu/-/blob/master/util/qemu-sockets.c#L618
> >
> > Yes, that's right.
> >
> 
> 
> Thanks, just wanted to be sure.
> 
> The syntax it supports is not the same as what's needed for host forwarding.
> inet_parse: address:port,option1,option2 (where options are to=,ipv4,etc).
> hostfwd: address:port-address:port
> If we wanted to have a utility that parsed "address:port" for v4+v6 then
> we'd have to split the "address:port" part out of inet_parse.
> 
> Plus the way inet_parse() parses the address, which is fine for its
> purposes, is with sscanf.
> Alas the terminating character is not the same (',' vs '-').
> IWBN to retain passing sscanf a constant format string so that the compiler
> can catch various errors,
> and if one keeps that then any kind of refactor loses some appeal.
> [Though one could require all callers to accept either ',' or '-' as the
> delimiter.]

I think the key useful part to keep common impl for is the handling
of the [] brackets for IPv6 raw addrs. I'd suggest we try to pull the
"address:port" part out into a new inet_addr_parse() helper that can be
called from inet_pase and from slirp.

inet_parse() can split on the first ",", and then call inet_addr_parse
on the first segment.

slirp can split on "-", and call inet_addr_parse with both segments.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


