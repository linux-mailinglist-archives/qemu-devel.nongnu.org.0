Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449B414C92B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 11:59:32 +0100 (CET)
Received: from localhost ([::1]:44240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwl4E-0003zJ-Rc
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 05:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54347)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iwl3X-0003WO-Sy
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 05:58:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iwl3W-00055Z-Nd
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 05:58:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33950
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1iwl3W-00052i-0N
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 05:58:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580295524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N5P+kGffx69R/pI7ohPBZ06A15rOr2PW8AY13ZJOhvA=;
 b=T5YMJPJegpcry7R+yKAWhps8YQwna46uwOMXjPs9OzUg3rgjcbvg/0euzEzlmUQC9usCmv
 AJR4at7cEkl33rp4WWIJS7U1N1ZJOaVwLlvX3DMXpbgve42CcX3teTM/6LX03EAYIvdims
 W6g9JuJ1hPeIgcOsPuK971c2+S+4nCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-G1jycoQmPx-Rldzkzax8-g-1; Wed, 29 Jan 2020 05:58:41 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35ACC8F70C0;
 Wed, 29 Jan 2020 10:58:40 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9465C5D9C5;
 Wed, 29 Jan 2020 10:58:27 +0000 (UTC)
Message-ID: <13958eb73d344e9c5184d8b7bb6737d3579dd399.camel@redhat.com>
Subject: Re: [PATCH v3 12/13] add 'error' prefix to vreport
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Date: Wed, 29 Jan 2020 12:58:27 +0200
In-Reply-To: <87o8um5z03.fsf@dusky.pond.sub.org>
References: <20200127103647.17761-1-mlevitsk@redhat.com>
 <20200127103647.17761-13-mlevitsk@redhat.com>
 <cc410f54aeb01a517b74283a497e7ce861c92dab.camel@redhat.com>
 <87o8um5z03.fsf@dusky.pond.sub.org>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: G1jycoQmPx-Rldzkzax8-g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2020-01-29 at 11:38 +0100, Markus Armbruster wrote:
> Maxim Levitsky <mlevitsk@redhat.com> writes:
> 
> > On Mon, 2020-01-27 at 12:36 +0200, Maxim Levitsky wrote:
> > > This changes most of qemu's error messages,
> > > but it feels like the right thing to do.
> > > 
> > > This is WIP patch, since I updated most of iotests but not all of them,
> > > and will be updated if this patch is accepeted in the review.
> > > Also few error message already have 'error' prefix, which should be removed.
> > > 
> > > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > 
> > Since Peter Krempa pointed out that libvirt doesn't need the error prefixes any more
> > (this wasn't the case when I developed this sadly) I guess I'll drop that patch,
> > although to me it looks just better to have errors cleanly prefixed to be honest.
> 
> The "libvirt needs this" justification is gone.  But perhaps we want it
> anyway.  It's hardly an "HMP monitor handlers cleanups", though.
> Suggest to split it off this series, so it can't hold it back.  Posting
> it separately should also give it a better chance to be noticed.

Fully agree. Thanks!

Best regards,
	Maxim Levitsky


