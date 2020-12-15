Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04712DB07C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:51:41 +0100 (CET)
Received: from localhost ([::1]:38560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCc0-0005XD-W6
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpCa6-0004ab-1n
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:49:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpCa3-00060o-JE
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608047378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JY7iyBvd2ipOqh16NumjCAzcJsZpMnxD9VbALKcG31s=;
 b=EazE2wO8mbOmyqfBZTOxDubB7ENJBSggLlGXKjHppvZvTzCjcJ0u0WF3DM7f+alu785BCs
 aAY3KqS9EF2tI6TDIsCCpYnXSeGW5F0uMBTXEg7d+r4nJPg2LgZqaKok8f+CQHSxal8byY
 zX4zZY1lFp+GBukwg1bjo2veWZgPQyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96--72ZgsA_PWCOVv0g-EAriw-1; Tue, 15 Dec 2020 10:49:37 -0500
X-MC-Unique: -72ZgsA_PWCOVv0g-EAriw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6449D8015F7;
 Tue, 15 Dec 2020 15:49:36 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 687A817C58;
 Tue, 15 Dec 2020 15:49:35 +0000 (UTC)
Date: Tue, 15 Dec 2020 16:49:33 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] iotests: Quote $cmd in _send_qemu_cmd
Message-ID: <20201215154933.GG8185@merkur.fritz.box>
References: <20201214175837.301658-1-mreitz@redhat.com>
 <20201215114320.GB8185@merkur.fritz.box>
 <61dede63-7561-88a7-312e-ec5babf667a1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <61dede63-7561-88a7-312e-ec5babf667a1@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.12.2020 um 13:14 hat Max Reitz geschrieben:
> On 15.12.20 12:43, Kevin Wolf wrote:
> > Am 14.12.2020 um 18:58 hat Max Reitz geschrieben:
> > > With bash 5.1, the output of the following script (which creates an
> > > array with a single element, then takes a single-element slice from that
> > > array, and echos the result) changes:
> > > 
> > >    a=("double  space")
> > >    a=${a[@]:0:1}
> > >    echo "$a"
> > > 
> > > from "double space" to "double  space", i.e. all white space is
> > > preserved as-is.  This is probably what we actually want here (judging
> > > from the "...to accommodate pathnames with spaces" comment), but before
> > > 5.1, we have to quote the ${} slice to get the same behavior.
> > > 
> > > In any case, without quoting, the reference output of many iotests is
> > > different between bash 5.1 and pre-5.1, which is not very good.  We
> > > should fix it by quoting here, and then adjusting all the reference
> > > output of all iotests using _send_qemu_cmd accordingly.  (The only
> > > ones we do not need to change are those that do not have multiple
> > > consecutive whitespaces in their _send_qemu_cmd parameters.)
> > > 
> > > Signed-off-by: Max Reitz <mreitz@redhat.com>
> > > ---
> > > Alternatively, we could explicitly collapse all whitespace sequences
> > > into single spaces, but I believe that would defeat the purpose of
> > > "accomodat[ing] pathnames with spaces".
> > 
> > I agree that quoting is the better alternative.
> > 
> > The whole thing shouldn't be needed if callers propertly quote
> > filenames. If I understand correctly, these lines just try to merge
> > back filenames that have been split into multiple words because the
> > caller wasn't careful. But we can't reliably do that because we don't
> > know which and how much whitespace was removed.
> 
> No, without quoting here, the slice operation will actually collapse spaces
> inside of array elements, as shown in the commit message
> (a=("x  y") creates an array with a single element that just has two spaces
> in it).  If the caller didn’t quote, then quoting in _send_qemu_cmd wouldn’t
> help either, because the whitespace would no longer be present in $@.

This is exactly what I mean. The whole slicing seems to be an attempt at
reconstructing an original unquoted string, which can't work because you
can't reconstruct the right whitespace.

So if it can't work anyway, we probably shouldn't even attempt to and
just use a single parameter instead of an array slice and require
callers to do proper quoting...

> Most callers of _send_qemu_cmd actually do something like this:
> 
> _send_qemu_cmd \
>     $QEMU_HANDLE \
>     "{ 'execute': 'something',
>        'arguments': ... }" \
>     'return'
> 
> So they do quote all of their arguments, and actually only pass three (or
> four, with success_or_failure=y), so basically the slicing is generally
> unnecessary and we’d just need cmd=$1 (not $2, because _send_qemu_cmd likes
> to invoke “shift”).

...which they apparently already do.

> In fact, if you do that on top of this patch (cmd=$1 instead of the fancy
> slice), you’ll see that the only test that then doesn’t pass is 102.  I
> think that’s because it has this one _send_qemu_cmd invocation that forgot
> to pass $QEMU_HANDLE...?
> 
> So, alternatively to quoting the slice, we could also just set cmd=$1 and
> fix 102.

Ah, looks like you don't even need to quote it like cmd="$1"? Maybe I
should learn bash sometime...

But yes, this is what I was thinking of.

Kevin


