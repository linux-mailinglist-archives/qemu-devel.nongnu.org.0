Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051854A51C5
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 22:42:16 +0100 (CET)
Received: from localhost ([::1]:54566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEeRD-0003PX-2R
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 16:42:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nEeMO-0006dC-26
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 16:37:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nEeMK-0001Cw-RO
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 16:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643665032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ST4AVF55fqzUgM1RbzLPzBWv3mCBlcI0cUwUoC0Qk6I=;
 b=I9Lb2H1oY8Exb5So4Yyr0CeH1ayTpWuCjX5oYu6QDCYoPSqlLquBHLOHoxixdjeES52v2S
 3bym6JkgKmsSa7+szh3upiQHNJxpqpBJfzMGBJjwJdgbK5cinZlJJJRxcXWcFBoasw15SG
 9oa5diIrAzvrAl5p/nhNVWeFrzzcKRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-ud_POe-1PuG29qXuG5cPdA-1; Mon, 31 Jan 2022 16:37:06 -0500
X-MC-Unique: ud_POe-1PuG29qXuG5cPdA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F53283DD20;
 Mon, 31 Jan 2022 21:37:05 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD7525DB94;
 Mon, 31 Jan 2022 21:37:02 +0000 (UTC)
Date: Mon, 31 Jan 2022 15:37:00 -0600
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] qapi/block: Cosmetic change in BlockExportType schema
Message-ID: <20220131213700.7smrzizfuhg2befo@redhat.com>
References: <20220119121439.214821-1-f4bug@amsat.org>
 <20220128205430.ispmytuw2vrpar4g@redhat.com>
 <50848a6d-98a9-3218-479b-7406850a06a2@amsat.org>
MIME-Version: 1.0
In-Reply-To: <50848a6d-98a9-3218-479b-7406850a06a2@amsat.org>
User-Agent: NeoMutt/20211029-256-77b59a
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 30, 2022 at 07:50:41PM +0100, Philippe Mathieu-Daudé wrote:
> On 28/1/22 21:54, Eric Blake wrote:
> > On Wed, Jan 19, 2022 at 01:14:39PM +0100, Philippe Mathieu-Daudé wrote:
> > > From: Philippe Mathieu-Daude <f4bug@amsat.org>

'git am' used this line to insert the authorship...

> > > 
> > > From: Philippe Mathieu-Daudé <f4bug@amsat.org>

...then left this line in the commit body, which I manually deleted,
without spotting the difference between the two.

> > 
> > The doubled From: looks odd here.  I'll double-check that git doesn't
> > mess up the actual commit once I apply the patch.
> 
> I played with the git --from option to not appear in the list as
> '"Philippe Mathieu-Daudé via" <qemu-devel@nongnu.org>':
> https://lore.kernel.org/qemu-devel/efc5f304-f3d2-ff7b-99a6-673595ff0259@amsat.org/
> by using a different sendemail.from (removing the acute in my
> lastname) to force a correct author.from.
> git-am should have picked the 2nd form, but I see the 1st in commit
> 3a8fa0edd1. Just curious, did you had to modify it manually?

Alas, since I managed to overlook the change in the acute (I suppose
I'm cursed with having a boring name, so unlike many list participants
who are overjoyed by the power of UTF-8 to make self-expression more
accurate, I have not had as much experience with thinking about it),
my manual edits explain why the merged commit ended up with a less
desirable spelling.  I apologize for the mishap.  Do we need/want a
.mailmap entry to aid git at listing your preferred spelling?

> 
> Anyway, thanks for merging this :)

And thanks for bearing with developers that are still learning to
overcome accidental cultural bias!

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


