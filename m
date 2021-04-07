Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABAC3570A9
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 17:44:10 +0200 (CEST)
Received: from localhost ([::1]:50778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUALg-0004Mz-Vd
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 11:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUAKH-0003rZ-9s
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 11:42:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUAKE-000188-52
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 11:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617810157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wr9Tam4ziQS66/Rol3pxFNshO3lDkBeNOgvhFOtmKuU=;
 b=dBaSy6f/Ph2oezZC8M/37+9KDr1WG9GXJsQZ1bRQpm2pItMadV6PxvMZsV/dgxFA1FrjUq
 q3kgrPajYZbuvDIBNZH3gfO+YUOGkivRezlc3fEpItFXhUWdxMK6Lm2TCkEhWKyaSMG3Q7
 XxWyftPl6PT7ohRBV/im3MW9MZrIH70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-f0X8ITpSMeWrl7xudxkZaA-1; Wed, 07 Apr 2021 11:42:35 -0400
X-MC-Unique: f0X8ITpSMeWrl7xudxkZaA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85A47108C30D;
 Wed,  7 Apr 2021 15:42:33 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-47.ams2.redhat.com [10.36.115.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02D3C18EDA;
 Wed,  7 Apr 2021 15:42:02 +0000 (UTC)
Date: Wed, 7 Apr 2021 17:42:01 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] docs: Add a QEMU Code of Conduct and Conflict Resolution
 Policy document
Message-ID: <YG3SyTLha8a9Itlo@merkur.fritz.box>
References: <20210331150527.14857-1-pbonzini@redhat.com>
 <YG2ILNrmn0+vVVKJ@merkur.fritz.box> <87wnteus7k.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87wnteus7k.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-devel@nongnu.org, agraf@csgraf.de,
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>, afaerber@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.04.2021 um 15:35 hat Alex Bennée geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> > Am 31.03.2021 um 17:05 hat Paolo Bonzini geschrieben:
> >> +respectful.  Examples of unacceptable behavior by participants include:
> >> +
> >> +* The use of sexualized language or imagery
> >> +
> >> +* Personal attacks
> >> +
> >> +* Trolling or insulting/derogatory comments
> >> +
> >> +* Public or private harassment
> >> +
> >> +* Publishing other's private information, such as physical or electronic
> >> +addresses, without explicit permission
> >
> > "Electronic addresses"? No more Cc: in emails without asking for
> > explicit permission first in each case, especially when looping in
> > people who are not subscribed to the list? And the same for attribution
> > in commits (turning informal statements into Reported-by, Acked-by
> > etc.)? Links to git repositories of other people?
> >
> > I'm sure that this is not what was intended, but it's pretty clearly the
> > implication of what is written here.
> 
> I'm pretty sure emails used to post to public mailing lists (or used
> in a dco tag) are considered public pieces of information. I read the
> above as covering things that are not public such as private email
> addresses or chat ids and the likes.

Yes, it's pretty clear that I'm not publishing new information about
people when I'm keeping them in Cc: when replying to a thread, or even
when they posted in another thread on the list recently. It becomes much
less clear for adding people who aren't usually part of the QEMU
community.

> > (This kind of "bugs" is one of the reasons why I'm not a huge fan of
> > written rules instead of trusting the judgement of community leaders.
> > In the communities I am involved in, I can't remember many cases where
> > they actually helped to resolve conflicts, but I can remember many
> > unproductive discussions about how to interpret the written text and
> > what it does and doesn't cover.)
> 
> Well we don't have to start here ;-)
> 
> We explicitly try to avoid rules lawyering with the very next statement:
> 
>   This isn't an exhaustive list of things that you can't do. Rather, take
>   it in the spirit in which it's intended: a guide to make it easier to
>   be excellent to each other.

Right, though it doesn't make any of the above rules any less strict. It
just tells me that I'm still in danger even if I follow the explicitly
mentioned things.

This might be the worst of both worlds: We explicitly threaten people
with consequences if they don't keep the rules, but then we don't tell
them what the rules even are and say they should use common sense
("you'll find out what the rules were when we punish you for breaking
them").

I _think_ I'm usually not misbehaving, but how can I know for sure that
others have the same impression? For me, this creates a situation of
uncertainty, and uncertainty makes me feel uneasy. Maybe I'm the only
one, though, and the benefits outweigh my uneasiness.

Kevin


