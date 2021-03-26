Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEE134B106
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 22:03:27 +0100 (CET)
Received: from localhost ([::1]:37728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPtc5-0005CV-IY
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 17:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPtVk-0001Gq-9L
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 16:56:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPtVf-0005t2-DO
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 16:56:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616792205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L9y3YCiX+HayROhcNSPttoBNahkNMZ/3mGHN58m3pvg=;
 b=OzyDaezmrgeBFf8zo8TeXPXA1+si9ErrEydNs0tJeaXBIqRxl1H9Folk7O0n47txpLgruR
 EmzRnVoAoZO7ZRntZzPEvm2NWmiw4E8XNyXtL6lndaEUo2gZ8TQdR/6RjzFnJYh1Wtvoj8
 h07Tg511Q+W3EOePcuKst0LvWZUm1VY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-Mcj-wdwVMPqdAoekX2dM0A-1; Fri, 26 Mar 2021 16:56:41 -0400
X-MC-Unique: Mcj-wdwVMPqdAoekX2dM0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E34158189CE;
 Fri, 26 Mar 2021 20:56:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A753419C71;
 Fri, 26 Mar 2021 20:56:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3CAD911327E1; Fri, 26 Mar 2021 21:56:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PULL for 6.0 0/6] Yank fixes
References: <cover.1616779714.git.lukasstraub2@web.de>
 <CAFEAcA_xF18iG3da8EfTSE7oLQrP056+RjdNrNGpk3F+Qj7NYg@mail.gmail.com>
 <20210326191855.0c1dfd99@gecko.fritz.box>
Date: Fri, 26 Mar 2021 21:56:38 +0100
In-Reply-To: <20210326191855.0c1dfd99@gecko.fritz.box> (Lukas Straub's message
 of "Fri, 26 Mar 2021 19:18:55 +0100")
Message-ID: <87o8f5r5vd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lukas Straub <lukasstraub2@web.de> writes:

> On Fri, 26 Mar 2021 17:52:40 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
>> On Fri, 26 Mar 2021 at 17:34, Lukas Straub <lukasstraub2@web.de> wrote:
>> >
>> > The following changes since commit 5ca634afcf83215a9a54ca6e66032325b5f=
fb5f6:
>> >
>> >   Merge remote-tracking branch 'remotes/philmd/tags/sdmmc-20210322' in=
to staging (2021-03-22 18:50:25 +0000)
>> >
>> > are available in the Git repository at:
>> >
>> >   https://github.com/Lukey3332/qemu.git tags/pull-26-03-2021
>> >
>> > for you to fetch changes up to 7c2f1ddcaa1c97462cb0b834d5aa7368283aa67=
d:
>> >
>> >   tests: Add tests for yank with the chardev-change case (2021-03-26 1=
7:12:18 +0000)
>> >
>> > ----------------------------------------------------------------
>> > Yank fixes for 6.0:
>> >  -Remove qiochannel dependency from the yank core code
>> >  -Always link in the yank code to increase test coverage
>> >  -Fix yank with chardev-change
>> >  -Add tests for yank with chardev-change =20
>>=20
>> Can we get these through some established submaintainer tree, please?
>>=20
>> thanks
>> -- PMM
>
> I guess Marc-Andr=C3=A9 Lureau or Markus Armbruster can take it trough th=
eir tree.

My Easter break starts basically now.  Marc-Andr=C3=A9, could you take care
of it?  Alternatively, perhaps Eric?


