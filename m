Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76C92F8109
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 17:42:16 +0100 (CET)
Received: from localhost ([::1]:45550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0SAx-00085z-Vm
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 11:42:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1l0S0U-0006J0-Hk
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 11:31:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1l0S0Q-0004ZO-BE
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 11:31:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610728279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A4p1M4NCsvFL52USQXmMTDiGQGYf/Bv2xiQJ5c6bEPc=;
 b=eDBlG4GE3rvyQhNBmJp4n83ytMDVtrYxx3iEXnTWRADsO2pckbaJ/IawR9Bmnng56dgvy4
 //Ls6RH4WarOyLdc2cTlbRgLGACFXGPlcHXCmuIn+MKP1MRyuzo5/GQiLU7oj2TKVgkUaO
 ndp8dglIsWnUIK3Jhuf79ViOACo9Ch4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-szDgQYBsNEKceAK005quIA-1; Fri, 15 Jan 2021 11:31:17 -0500
X-MC-Unique: szDgQYBsNEKceAK005quIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3BEC107ACF8;
 Fri, 15 Jan 2021 16:31:16 +0000 (UTC)
Received: from paraplu.localdomain (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DA265C675;
 Fri, 15 Jan 2021 16:31:13 +0000 (UTC)
Received: by paraplu.localdomain (Postfix, from userid 1001)
 id E3D123E0497; Fri, 15 Jan 2021 17:31:10 +0100 (CET)
Date: Fri, 15 Jan 2021 17:31:10 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: Call for Google Summer of Code 2021 project ideas
Message-ID: <20210115163110.GB94798@paraplu.home>
References: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
 <92903d8d-24c4-5177-67c9-1690ea794739@redhat.com>
 <87pn29kxcp.fsf@dusky.pond.sub.org>
 <b860c470-cbe3-00b5-1966-59fa87045024@redhat.com>
 <87h7njsnui.fsf@dusky.pond.sub.org>
 <c26786ac-159e-149a-aa5e-dd08f418d11e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c26786ac-159e-149a-aa5e-dd08f418d11e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 11:36:23AM -0500, John Snow wrote:
> On 1/14/21 7:29 AM, Markus Armbruster wrote:

[...]

> So I see two possible options for "not inventing a language":
> 
> 1. Raw QMP
> 2. The existing qmp-shell syntax, warts and all.
> 
> I don't see a tremendous problem with doing both; but we can start with raw
> QMP. The existing qmp-shell syntax is at least definitely very easy to write
> a new parser for, even if it's kind of ugly and insufficient. I still see
> value in designing a new TUI with the old syntax.
> 
> > The project then aims to build a tool that adds useful features over
> > "socat "READLINE,history=$HOME/.qmp_history,prompt=QMP>"
> > UNIX-CONNECT:/path/to/socket".
> > 
> > If it succeeds, you can still design and implement a "better" language,
> > and let users choose the one they prefer.  Or you could add features to
> > help with typing QMP.
> > 
> > >                                                             I don't
> > > think it's a blocker to have someone work on the TUI and asynchronous
> > > dispatch elements. I think even just keeping our current parsing but
> > > adding some of the features outlined in the proposal would be a big
> > > usability win.
> > 
> > I don't feel this particular itch, but I'm certainly not objecting to
> > anyone scratching.
> > 
> 
> It's something I'd like to see so that I can walk non-QEMU devs through
> interacting with QEMU at a low level for the purposes of debugging,
> reproducing problems, prototyping features, etc.
>
> I use qmp-shell all the time for debugging things myself, I find it easier
> to use than copy-pasting things directly into socat. I wouldn't mind the
> shell getting a little smarter to help me out -- the ability to see async
> events and reconnect on disconnect would already be a massive improvement to
> *my* quality of life.

As an infrequent user of `qmp-shell`, the async events stuff is really
beneficial to me too.  And, I'm happy to play the test guinea pig to
give the patchs a spin.  (I'm somewhat behind on the goings-on in this
area, very slowly catching up.)

> So much so that I spent a lot of time in December to write an async qmp
> library O:-)

Nice, I recall that you planned to use the 'asyncio' primitives from
Python 3.6.

-- 
/kashyap


