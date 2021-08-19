Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86A63F1BF2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:52:31 +0200 (CEST)
Received: from localhost ([::1]:40838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGjPD-0003NE-0g
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mGjNN-0001xr-VP
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:50:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mGjNK-00070Q-6w
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629384630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/jV5AOhehcXnsiVYnpwKAp9ndGWrR0UP11wArpKGrDM=;
 b=b3EeRp2kBiPWk2DYk6n2WsaXaf3swVmIhv85FdlBxXCIuaHxb7K/QAdOJrnGQPsoLEelQD
 eoH9X7T6r+iJ4I1NZgPNDzjhxXvpzTnBmDPe6WQbcn6D7fgLMfZWelwXX5jwWN64huchyZ
 XUJVXO5MbtDgtXxGNNJEP6fBfJ2gCXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421--LHDH04UNJeVKaI57N2vRg-1; Thu, 19 Aug 2021 10:50:26 -0400
X-MC-Unique: -LHDH04UNJeVKaI57N2vRg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B519DC73BA;
 Thu, 19 Aug 2021 14:50:25 +0000 (UTC)
Received: from redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD37717567;
 Thu, 19 Aug 2021 14:50:10 +0000 (UTC)
Date: Thu, 19 Aug 2021 09:50:09 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 09/25] python/aqmp: add AsyncProtocol.accept() method
Message-ID: <20210819145009.4feupwleh4iyltkw@redhat.com>
References: <20210803182941.504537-1-jsnow@redhat.com>
 <20210803182941.504537-10-jsnow@redhat.com>
 <20210817192949.cglc7ah2ohlmtf43@redhat.com>
 <CAFn=p-bhHBC2dxq3EiuVOo8UBTy5AhBMwDyzFu-c0L_o4=VsAg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-bhHBC2dxq3EiuVOo8UBTy5AhBMwDyzFu-c0L_o4=VsAg@mail.gmail.com>
User-Agent: NeoMutt/20210205-732-28786f
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 18, 2021 at 10:24:52AM -0400, John Snow wrote:
> > >
> > > +    @upper_half
> > > +    @require(Runstate.IDLE)
> > > +    async def accept(self, address: Union[str, Tuple[str, int]],
> > > +                     ssl: Optional[SSLContext] = None) -> None:
> > > +        """
> > > +        Accept a connection and begin processing message queues.
> > > +
> > > +        If this call fails, `runstate` is guaranteed to be set back to
> > `IDLE`.
> > > +
> > > +        :param address:
> > > +            Address to listen to; UNIX socket path or TCP address/port.
> >
> > Can't TCP use a well-known port name instead of an int?  But limiting
> > clients to just int port for now isn't fatal to the patch.
> >
> >
> The old QMP library didn't support this, and I used the old library as my
> template here. I'm willing to change the address format and types to be
> more comprehensive, but I was thinking that it should probably try to match
> or adhere to some standard; de-facto or otherwise. I wasn't sure which to
> pick, and we use a few different ones in QEMU itself. Any recommendations
> for me?

I asked because I know QAPI specifies TCP as string/string (the
hostname as a string makes absolute sense, but the port number as a
string is because of the less-used feature of a well-known port name).
I'm fine if the initial patch uses an int for the port number here; we
can always add support for more formats down the road when someone
actually has a use for them.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


