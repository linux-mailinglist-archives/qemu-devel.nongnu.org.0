Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6832F63B0
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:06:08 +0100 (CET)
Received: from localhost ([::1]:37094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04CN-0001kC-JP
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l044W-0007QM-NL
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:58:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l044S-0007KH-Ji
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610636275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LVkOH1LXOEKJ+59MLpt3hqBIfhGk6SyyQlkfdGmH16g=;
 b=Dc4xuhTPutxvpDenJ2jkcueTnq66ihJVUaOia5eBOofnr8x6UMo0V79hpWzCtf5nnNWwzc
 aMgnJeH+6uFJQzwZncTsQIeTzmG4FNAnKRVWysCia1v0g003fp1nPYnx+cWxKmaYe7c6K2
 uQLDMO83yOidsdAoCP/2dh3Jxa6StB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-uC8_pKHyNiiV_EpI-IR1uA-1; Thu, 14 Jan 2021 09:57:53 -0500
X-MC-Unique: uC8_pKHyNiiV_EpI-IR1uA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03DA9875057;
 Thu, 14 Jan 2021 14:57:39 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-18.ams2.redhat.com [10.36.115.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D94281A839;
 Thu, 14 Jan 2021 14:57:31 +0000 (UTC)
Date: Thu, 14 Jan 2021 15:57:30 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: Call for Google Summer of Code 2021 project ideas
Message-ID: <20210114145730.GD6058@merkur.fritz.box>
References: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
 <92903d8d-24c4-5177-67c9-1690ea794739@redhat.com>
 <87pn29kxcp.fsf@dusky.pond.sub.org>
 <b860c470-cbe3-00b5-1966-59fa87045024@redhat.com>
 <87h7njsnui.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87h7njsnui.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.01.2021 um 13:29 hat Markus Armbruster geschrieben:
> John Snow <jsnow@redhat.com> writes:
> 
> > On 1/13/21 4:19 AM, Markus Armbruster wrote:
> >> John Snow <jsnow@redhat.com> writes:
> >> 
> >>> On 1/11/21 6:47 AM, Stefan Hajnoczi wrote:
> >>>> Dear QEMU, KVM, and rust-vmm community,
> >>>> QEMU will apply for Google Summer of Code
> >>>> (https://summerofcode.withgoogle.com/) again this year.  This internship
> >>>> program offers paid, 10-week, remote work internships for
> >>>> contributing to open source.  QEMU can act as an umbrella organization
> >>>> for KVM kernel and rust-vmm projects too.
> >>>> Please post project ideas on the QEMU wiki before February 14th:
> >>>> https://wiki.qemu.org/Google_Summer_of_Code_2021
> >>>> What's new this year:
> >>>>    * The number of internship hours has been halved to 175 hours over
> >>>>      10 weeks. Project ideas must be smaller to fit and students will have
> >>>>      more flexibility with their working hours.
> >>>>    * Eligibility has been expanded to include "licensed coding school or
> >>>>      similar type of program".
> >>>> Good project ideas are suitable for 175 hours (10 weeks half-day)
> >>>> work by a
> >>>> competent programmer who is not yet familiar with the codebase.  In
> >>>> addition, they are:
> >>>>    * Well-defined - the scope is clear
> >>>>    * Self-contained - there are few dependencies
> >>>>    * Uncontroversial - they are acceptable to the community
> >>>>    * Incremental - they produce deliverables along the way
> >>>> Feel free to post ideas even if you are unable to mentor the
> >>>> project.
> >>>> It doesn't hurt to share the idea!
> >>>>
> >>>
> >>> I have one that is probably way too ambitious, but requires a
> >>> particular skillset that might be of good interest to a student that
> >>> has some experience in the area already.
> >>>
> >>> The idea is for a TUI qmp-shell (maybe using urwid?) to create an
> >>> irssi-like REPL interface for QMP. The idea would be to mimic the
> >>> mitmproxy TUI interface (Check it out if you haven't!)
> >>>
> >>> All the ideas below are extremely tentative to give a basic gist of
> >>> what I mean; exact layouts/hotkeys/etc are for the sake of explanation
> >>> only.
> >>>
> >>> Essentially, I want an interface like this:
> >>>
> >>> -----------------------------------------------------------
> >>> | QMP Mode                                                |
> >>> |=========================================================|
> >>> |                                                         |
> >>> | Welcome to the Qemu Machine Protocol shell.             |
> >>> | Please type /help or Ctrl+H to see available commands.  |
> >>> |                                                         |
> >>> |                                                         |
> >>> |                                                         |
> >>> |---------------------------------------------------------|
> >>> | >                                                       |
> >>> -----------------------------------------------------------
> >>>
> >>> commands are entered in the bottom and appear in a log window above,
> >>> appearing most-recent last, like irssi works.
> >>>
> >>> As an example, let's say we issue block-dirty-bitmap-add:
> >>>
> >>> --------------------------------------------------------
> >>> | > block-dirty-bitmap-add node=ide0hd0 name=mybitmap0 |
> >>> --------------------------------------------------------
> >>>
> >>> (...syntax up for debate...! We want something easy to parse, but easy
> >>> to type. For structured data, that's Hard.)
> >> "Hard" is a red flag for such a brief internship.  We need to solve
> >> or
> >> somehow exclude this design problem before we hand the task to the
> >> student.
> >> [...]
> >> 
> >
> > Yes, there is a reason I capitalized "Hard". :~)
> >
> > This task CAN be split out, though. For starters, we can use an
> > extremely simplified parsing strategy while we work on the REPL and
> > and UI elements.
> >
> > We can accept things of the form:
> > command arg=value arg2=value
> >
> > and we can worry about how to input structured data later.
> 
> Bzzzt!  You just designed a language.  The fact that it is obviously
> inadequate for the task does not make this not language design.
> 
> Two outcomes:
> 
> 1. The project fails for other reasons.  The language doesn't matter.
> 
> 2. The project succeeds, i.e. it becomes useful to people.  Very quickly
> these people will demand you evolve your inadequate language into a less
> inadequate one, compatibly.  Your evasion of the language design problem
> (because hard) has now added accidental constraints, making the design
> problem even harder.

We don't even promise compatibility for HMP, which is a part of the
system emulator binary and has existed since I first used QEMU, which
must have been around 0.6 times. If it's possible to simply say "no" to
compatibility demands there, then surely an external shell with a
similar target audience can do the same.

I think it would be useful to have a raw QMP mode (especially so you can
point people to that when they ask for compatibility), but it's probably
not the focus for this project because you can already have raw QMP
today.

Kevin


