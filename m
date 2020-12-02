Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150F42CBAE5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:48:06 +0100 (CET)
Received: from localhost ([::1]:47436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPg5-0005bp-6A
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:48:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kkOIY-00070t-TY
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:19:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kkOIS-0001Ud-Ns
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:19:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606900774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qb+i8kG6P70cYE0arzYEguAiYUcfPmkaF/5mlYLMj9c=;
 b=Pyxglm5vXKpQfX/kV/DEvOxAWK5xdyIMgygbcoZB/IlNj8E2ng7DMs7MGwSJBKfNlxLmRW
 XGoKBBpVbkJWaTKHbhZMpCk5nmS/wRRxHFc0QaxfP2xYIh9zg8IHSXUDKFJVGM37JmtuDj
 MPB+EnPh0sCGsvnxXWpuyBrjM6zVxfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-3ucfDSeOOVSvl294n5S7-w-1; Wed, 02 Dec 2020 04:19:32 -0500
X-MC-Unique: 3ucfDSeOOVSvl294n5S7-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 468001092BB3;
 Wed,  2 Dec 2020 09:19:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80BF05C1B4;
 Wed,  2 Dec 2020 09:19:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 10E0E113864E; Wed,  2 Dec 2020 10:19:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] scripts/checkpatch.pl: Modify the line length limit of
 the code
References: <20201105154208.12442-1-ganqixin@huawei.com>
 <CAFEAcA9QMBqF0Bm44q4m1d=QaPVBJodH9rwuYhGx5H6zy6ULcg@mail.gmail.com>
 <87d00qk51l.fsf@dusky.pond.sub.org>
 <CAFEAcA-_5vRbsi5fFpyLV2OyDX5TVrpAx7_Z43wqvb1zhQO_8w@mail.gmail.com>
 <37c519e4-d72b-944c-ed70-038f9c606be9@redhat.com>
 <CAFEAcA_a=vBjLM8_-KDkYfFuTLDW6cMsQ48or70uwwVusW2q7w@mail.gmail.com>
 <87zh3ufoy4.fsf@dusky.pond.sub.org>
 <CAFEAcA-3a8gYRPzk4jzv3QfLAw3tL74LoFTMy+VhXZA3QdOfPg@mail.gmail.com>
 <87mtzqsy2r.fsf@dusky.pond.sub.org>
 <CAFEAcA-JCLUn5BxwH71CmFB3Q+KMSK0pid8nGH9hLUokNcoLSw@mail.gmail.com>
Date: Wed, 02 Dec 2020 10:19:24 +0100
In-Reply-To: <CAFEAcA-JCLUn5BxwH71CmFB3Q+KMSK0pid8nGH9hLUokNcoLSw@mail.gmail.com>
 (Peter Maydell's message of "Mon, 30 Nov 2020 13:26:11 +0000")
Message-ID: <87o8jc5zvn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gan Qixin <ganqixin@huawei.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 9 Nov 2020 at 09:01, Markus Armbruster <armbru@redhat.com> wrote:
>> CODING_STYLE.rst: "Lines should be 80 characters; try not to make them
>> longer."  I'd like to keep the tooling we have to help us with trying
>> not to make them longer.
>>
>> If we have lost the ability to differentiate between "warning" and
>> "error", call it something else.
>
> Personally I just want checkpatch with its default arguments not
> to complain about code that we'd be happy to accept in the tree.

This means losing complaints about code we don't want to accept, because
there is a grey area where checkpatch can't be sure.

CODING_STYLE.rst demands "try not to make lines longer than 80
characters, but if you decide you need to, don't make them longer than
90".

As long as we have this grey area where we want developers to try,
checkpatch's job is to remind them to try.

> It's unnecessary noise when I write and check the code locally,
> when patchew runs on the patch on the list and then when it goes
> into a pullreq.

Checking locally: noise or not is up to you.

Patchew: no, it's not noise here.  Patch review is exactly where the
reminder is needed.

Pull request: assuming patch review did its job, all that's left is
noise.

>                 Do we need a new "be really strict" option?

No objection, as long as we stick to strict for patch review.


