Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23676A6864
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 08:48:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXHBo-0003n0-0W; Wed, 01 Mar 2023 02:47:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pXHBi-0003fQ-Sq
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 02:47:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pXHBh-0006cR-2i
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 02:47:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677656864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8YK00QYa3zpwqhhK4wHacABD4ojhIsV6IHyjOSDlTVk=;
 b=eNgypIZ1SbBQbH3DZfgWrdAct1LjCQA0tVrSW1Ymk8LwJCjeZWdnSU0GwwVRNQyATGhfkI
 HdCYa00XyUn1FT97XS63G73kb7bC7QA1f6uRY1/1BnARBWIMtRFs0C4OT36Sb2atD4+pKS
 J9b7j7L2oCeerymuWmq6WUPvF+MdIWY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-j9rtPBJSNMuNUg6x-ZpClQ-1; Wed, 01 Mar 2023 02:47:39 -0500
X-MC-Unique: j9rtPBJSNMuNUg6x-ZpClQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C36386476C;
 Wed,  1 Mar 2023 07:47:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DC872166B26;
 Wed,  1 Mar 2023 07:47:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E2D7021E6A1F; Wed,  1 Mar 2023 08:47:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Thomas Huth <thuth@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] hw/vfio/migration: Remove unused 'exec/ram_addr.h'
 header
References: <20230227103258.13295-1-philmd@linaro.org>
 <20230227103258.13295-2-philmd@linaro.org>
 <20230227084621.15cab9da.alex.williamson@redhat.com>
 <87o7pfgjm6.fsf@linaro.org>
 <20230227101325.1ba4f5c4.alex.williamson@redhat.com>
Date: Wed, 01 Mar 2023 08:47:37 +0100
In-Reply-To: <20230227101325.1ba4f5c4.alex.williamson@redhat.com> (Alex
 Williamson's message of "Mon, 27 Feb 2023 10:13:25 -0700")
Message-ID: <87h6v452w6.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Alex Williamson <alex.williamson@redhat.com> writes:

> On Mon, 27 Feb 2023 16:24:16 +0000
> Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
>> Alex Williamson <alex.williamson@redhat.com> writes:
>>=20
>> > On Mon, 27 Feb 2023 11:32:57 +0100
>> > Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
>> >=20=20
>> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>=20=20
>> >
>> > Empty commit logs are a pet peeve of mine, there must be some sort of
>> > motivation for the change, something that changed to make this
>> > possible, or perhaps why this was never necessary.  Thanks,=20=20
>>=20
>> I think that is a little unfair for this case as the motivation and
>> action are all covered by the summary line. Granted the overall goal is
>> covered by the cover letter and the following patch however for this
>> patch I would hope its self explanatory.
>
> The commit title only conveys that the include is unused and the action
> to therefore remove it.  The motivation is actually to create target
> independent objects and the specific reasoning here is that not only is
> this include file unnecessary, but forces per target builds.

I've been guilty of submitting patches with just a subject line, too.
E.g. commit 6f1e91f716a (error: Drop superfluous #include
"qapi/qmp/qerror.h"): I could have written that the header's contents
should go away, and the less we include it, the better.  I should have.

> This is exactly the "barrier to entry" I mention to Peter, it's obvious
> to the experts in the crowd, but it provides no underlying direction
> for those who might be more novice.  There is always some reasoning
> that can be included in a commit log beyond the simple "a therefore b"
> of the commit title.  Thanks,

Sometimes, the motivation is so obvious that omitting it for brevity's
sake feels harmless enough.  E.g. for commit 15b7646c7d0 (monitor: Drop
unnecessary includes) it's really just "include less to remake less".

Of course, when you explain motivation in the cover letter, it's almost
certainly best to explain it again in the commit messages.


