Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F0C30F5A3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:58:45 +0100 (CET)
Received: from localhost ([::1]:41950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7g5l-0007Fc-0v
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7g4d-0006KM-Tl
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:57:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7g4b-0008Iq-6Y
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612450651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EB5FahsKfEpR0GyZChw1f0qlTOFkqmvClSnBtx5tQHU=;
 b=G1BudPXFBeycwjA+7rA6PPQJBJY7geT8LLsm7SNJ3jRr2qe4uIUjf2VMeioiTlT224Uv7+
 2JXj+jTOpXNtWmXIM+9v4LjoMQRArXrDxjaEBkuA9dwHEZ2+TFhxxR1cveotkNoAXEGQVL
 e5c9gY6Bnstn4aPN4F1K+4dHBP1/BFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-bmIb88fXMqKV62TFY-58vQ-1; Thu, 04 Feb 2021 09:57:29 -0500
X-MC-Unique: bmIb88fXMqKV62TFY-58vQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70479801960;
 Thu,  4 Feb 2021 14:57:28 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-162.ams2.redhat.com [10.36.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B447E60C05;
 Thu,  4 Feb 2021 14:57:20 +0000 (UTC)
Date: Thu, 4 Feb 2021 15:57:19 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [RFC] Move tools sources to the tools directory (was Re: [PATCH
 v2] MAINTAINERS: Fix the location of tools manuals)
Message-ID: <20210204145719.GJ6496@merkur.fritz.box>
References: <20210204135425.1380280-1-wainersm@redhat.com>
 <516694bd-42fe-7929-811b-545f257c58bf@redhat.com>
 <0e0f9745-fe21-0bc6-2d02-431d67a6b57e@redhat.com>
 <CAFEAcA9nwnii1geGFpwEg8CFfST8B21y0BRL5ci=4ykiwqJywQ@mail.gmail.com>
 <20210204144006.GI6496@merkur.fritz.box>
 <20210204144700.GN549438@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210204144700.GN549438@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.02.2021 um 15:47 hat Daniel P. Berrangé geschrieben:
> On Thu, Feb 04, 2021 at 03:40:06PM +0100, Kevin Wolf wrote:
> > Am 04.02.2021 um 15:31 hat Peter Maydell geschrieben:
> > > On Thu, 4 Feb 2021 at 14:23, Wainer dos Santos Moschetta
> > > <wainersm@redhat.com> wrote:
> > > > Unrelated too, but allow me to ask:
> > > >
> > > > Should we move the tools (qemu-img, qemu-io, qemu-nbd...etc) to the
> > > > tools directory (virtiofsd seems to feel alone there)?
> > > 
> > > I think that would be a good thing, yes (things documented in docs/tools
> > > should have their source code in tools).
> > 
> > Maybe we should define then what a tool is. I think contrib/ has a few
> > more things that could be considered tools.
> 
> The distinction of contrib/ vs tools/ is supposed to be more a
> reflection on the quality of the program.
> 
> contrib/ should be considered demo-ware, no back compat guaranteed,
> may or may not work, no testing guaranteed, no man pages.
> 
> tools/ should be for any program that we intend end users to actively
> use in real world, with an expectation of quality and stable CLI and
> man pages.

Maybe the difference should be related to what we build by default then?
Just checking what executables my build directory contains, I guess
these are candidates for tools/:

qemu-bridge-helper
qemu-edid
qemu-img
qemu-io
qemu-keymap
qemu-nbd
qemu-pr-helper

Almost all of them are currently in the root directory today. Only
qemu-pr-helper is in scsi/.

And then there is qemu-storage-daemon which lives in storage-daemon/
today and whose executable ends up in a storage-daemon/ subdirectory of
the build directory since the Meson conversion, which is inconsistent
with all other tools.

I haven't checked other subdirectories for more executables that might
exist.

Kevin


