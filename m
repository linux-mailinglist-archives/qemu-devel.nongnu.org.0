Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F80A400051
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:14:22 +0200 (CEST)
Received: from localhost ([::1]:38598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM91R-0007sW-AU
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vt-00075Y-VS
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vq-0001ME-IR
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630674514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQMHC6zK2tNs3PcSwnAkqH1f8ykryN0vefwgqKzdZaI=;
 b=YxMIa9weJtzpLOsJjxZWhjMvY/j1h1E31sKWKtSdYJw1xKarkb6DhXtZZbkUPqCHwrmkFB
 Ypr6bgFGbd/GtptiV/YWOPZLDttynfdpkhKAWkyfz+8dSwRUciGF3xT9iECjvzAITSKT9Z
 b2vSyAvoSlTQxkh0O6w5t8SzXalKu4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-YuElEnSHOdSXCBfHustl-w-1; Fri, 03 Sep 2021 09:08:32 -0400
X-MC-Unique: YuElEnSHOdSXCBfHustl-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CEB91966324
 for <qemu-devel@nongnu.org>; Fri,  3 Sep 2021 13:08:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8332710016F2;
 Fri,  3 Sep 2021 13:08:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 771091136421; Thu,  2 Sep 2021 13:37:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 3/3] softmmu/vl: Deprecate the -sdl and -curses option
References: <20210825092023.81396-1-thuth@redhat.com>
 <20210825092023.81396-4-thuth@redhat.com>
 <CABgObfb8GHK0F=GCmDtaB=RqZT9+JnG+RRfNK+4XQ-ofoOxumA@mail.gmail.com>
 <a03ba523-ac40-3090-442e-7cc38022a2cc@redhat.com>
 <YTCuQB5dWMhYC3fW@redhat.com>
Date: Thu, 02 Sep 2021 13:37:35 +0200
In-Reply-To: <YTCuQB5dWMhYC3fW@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 2 Sep 2021 11:58:08 +0100")
Message-ID: <87fsunmcn4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Sep 02, 2021 at 12:51:02PM +0200, Thomas Huth wrote:
>> On 31/08/2021 15.53, Paolo Bonzini wrote:
>> > As an alternative, you may want to turn it into "-display sdl" rather
>> > than poke at dpy. This isn't much more code, but it keeps the shortcut
>> > isolated within a single "case". This follows a lot of recently cleane=
d
>> > up command line parsing code such as -no-hpet, -enable-kvm, -smp etc.
>> >=20
>> > In the end (spoiler alert for my upcoming KVM Forum presentation=E2=80=
=94slides
>> > are already on sched.com <http://sched.com> :)) what really produces
>> > complexity is the lack of isolation/modularity. As long as UI code
>> > doesn't care about command line parsing, and command line parsing
>> > doesn't care about global variables from all over the place, the cost =
of
>> > shortcuts is so small that it may tilt in favor of keeping them.
>>=20
>> Honestly, I'd rather like to see them removed in the end. Our user inter=
face
>> is so terribly inconsistent here that I think that these options are rat=
her
>> confusing for the users than helpful. For example, why do we have -sdl a=
nd
>> -curses, but no -gtk ? And as a normal user, I'd also always wonder what=
's
>> the difference between "-display sdl" and "-sdl", since the difference i=
n
>> the amount of characters that you have to type here is not that much tha=
t it
>> justifies the shortcut option. So IMHO let's rather clean this up comple=
tely
>> than dragging the shortcut options along forever.
>
> There's also the elephant in the room "-vnc" which has never been mapped
> into -display, but which is also one of the most widely used options for
> display backends :-(

There's -display vnc=3D...  Option -help shows it, -display help doesn't,
but that's just a bug, I guess.  More serious: -display '{"type": "vnc",
...} isn't implemented.


