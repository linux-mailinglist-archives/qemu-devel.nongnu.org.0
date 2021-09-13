Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BED7409227
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:08:57 +0200 (CEST)
Received: from localhost ([::1]:53382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmdk-0004a5-FT
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPmQN-0007fV-MJ
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:55:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPmQJ-00044r-Kw
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:55:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631541301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8BdFb5BSnrnnS+m8pbjkXqoREUU8V9z1M8dv3rB99aw=;
 b=BMKy8+JruKONJRV31XAWD3Ul7tim1prvBm9aLHiHNTNvqWtdTBSj+Qv45JTLbUMwah7QnC
 kLwQhx0cqJkx7QKm5jGq5qLIaaxvt1i8zREX+CRMmia5wUqxxQB2hEVyRZMwa5O6nL/S09
 36VeJHV2+QIaRWWb1+ucuRfGVocgvuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223--6dK9R6ZMF2mGnlSKN-18g-1; Mon, 13 Sep 2021 09:54:58 -0400
X-MC-Unique: -6dK9R6ZMF2mGnlSKN-18g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14BE81018732
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 13:54:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1263E6A8EE;
 Mon, 13 Sep 2021 13:54:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9C450113865F; Mon, 13 Sep 2021 15:54:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 01/22] qapi: Tidy up unusual line breaks
References: <20210913123932.3306639-1-armbru@redhat.com>
 <20210913123932.3306639-2-armbru@redhat.com>
 <CAMxuvaxE4fbkK-nX-K7ni9C4tUdXTTbCe=S1eAPvHCb2RUpFOQ@mail.gmail.com>
Date: Mon, 13 Sep 2021 15:54:53 +0200
In-Reply-To: <CAMxuvaxE4fbkK-nX-K7ni9C4tUdXTTbCe=S1eAPvHCb2RUpFOQ@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Mon, 13 Sep 2021
 17:29:36 +0400")
Message-ID: <87mtogk2c2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: John Snow <jsnow@redhat.com>, "Blake, Eric" <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> Hi
>
> On Mon, Sep 13, 2021 at 4:39 PM Markus Armbruster <armbru@redhat.com> wro=
te:
>
>> Break lines between members instead of within members.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> I wish we would just automated tools to format files. With that git 2.23
> feature, no more excuses :):
> https://www.moxio.com/blog/43/ignoring-bulk-change-commits-with-git-blame

Interesting.

> Sadly, our mixed json/py format doesn't get parsed after "blake" reformat=
s
> it (strings or trailing commas).

Naming QAPI schema files .json even though their contents isn't was a
mistake.

We discussed possible improvements in the thread below

    Message-ID: <87ime52wxd.fsf@dusky.pond.sub.org>
    https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg08325.html

Too much to read, but there's a summary:

    Message-ID: <877dt5ofoi.fsf@dusky.pond.sub.org>
    https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg02553.html

The least invasive way to achieve formatting automation could be
switching from bastardized JSON to proper subset of Python.

What's "blake"?


