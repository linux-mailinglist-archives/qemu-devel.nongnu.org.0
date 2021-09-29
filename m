Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7E941C4A0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 14:24:52 +0200 (CEST)
Received: from localhost ([::1]:47900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVYdm-0000pL-7h
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 08:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVYYC-0005bH-LC
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 08:19:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVYY3-0004fR-ND
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 08:19:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632917932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iXceV94Wbz2Dm4ychJEdRZoHmc2Dz/pO2cYI4Pmhc4U=;
 b=WOCa8UfNVZgaXaG/5QBmhLspW+P+o1hRi9N9p/oBJZqkUxn/WtjmhPEf7ktlaNMr+Apgbo
 4jBkpz7Eus7L0I1xvqxWhvjzpADA5DbcTRfwWvqAx8SOsDgradW/uN6yrCjRAt7q26hs7N
 QMvr1mW6lmZhAsAs97NiQ6bloMhff9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-lUI_65G0Npyn7f1ZuyMj3Q-1; Wed, 29 Sep 2021 08:18:51 -0400
X-MC-Unique: lUI_65G0Npyn7f1ZuyMj3Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C27C1966321
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 12:18:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9424819C59;
 Wed, 29 Sep 2021 12:18:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0DCF0113865F; Wed, 29 Sep 2021 14:18:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: QAPI sync meeting
References: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
 <YVMeUbGdnsTpwSbD@redhat.com>
 <CAFn=p-ZG6SAVDz-cOtviekvMvibw+ukhYmSOqH7UTrcH-9fCNA@mail.gmail.com>
Date: Wed, 29 Sep 2021 14:18:42 +0200
In-Reply-To: <CAFn=p-ZG6SAVDz-cOtviekvMvibw+ukhYmSOqH7UTrcH-9fCNA@mail.gmail.com>
 (John Snow's message of "Tue, 28 Sep 2021 13:43:26 -0400")
Message-ID: <87ee97y3q5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On Tue, Sep 28, 2021 at 9:53 AM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com>
> wrote:
>
>> On Mon, Sep 27, 2021 at 12:55:34PM -0400, John Snow wrote:

[...]

>> > - Any weekday after 13:00 UTC. Wednesdays, Thursdays and Fridays work
>> > particularly well for me at the moment.
>> > - bluejeans and google meeting both work well for me. Open to alternat=
ives.

Congratulations, you've just crowned yourself meeting organizer!  Pick a
date, time, and place, then herd the cats there.

I can't do next Friday.  I think we should aim for next week, to give us
time to coordinate and to prepare.

>> Are you suggesting a 1-off meeting or a regular meeting, or an adhoc
>> set of meetings ?
>>
>>
> I'm proposing a one-off here just for some initial discussion and plannin=
g.
> (We didn't have a QAPI BoF at KVM Forum and I'd like something similar
> now.) I don't expect we'll really "finish" plotting out a roadmap in a
> single 60 minute meeting, but it will probably give us good, targeted
> discussions on the ML to follow. If more meetings are desired to discuss
> specific topics, I'm not against scheduling them as-needed.

Let's have one now, and then more as needed.

Jumping into the meeting unprepared, then spending half of the alloted
time listening to people explaining where they want to take QAPI seems
like a bad use of our time.  Better: write it up and post it, so we can
all read before we meet.  Do not reply, except perhaps to ask for
clarification.  Discuss in the meeting.

I can see such posts from Marc-Andre, Kevin, and Daniel.  Some of them
could use a bit more detail, perhaps.

Thoughts?

> (I personally don't really mind semi-regular sync-up meetings, like once
> every other month or something to that effect -- it keeps me motivated an=
d
> on track. I suspect that Markus does not quite feel the same way about 'e=
m,
> so I'm just trying to not sign him up for stuff.)

More regular meetings sit fairly low on my personal wish list.


