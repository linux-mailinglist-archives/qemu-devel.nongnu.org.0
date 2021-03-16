Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375A033D0D5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 10:30:33 +0100 (CET)
Received: from localhost ([::1]:48144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM624-0003zF-07
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 05:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lM60n-00038D-Se
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 05:29:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lM60k-0002ua-1A
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 05:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615886949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yS4lZ5+7wIHqixQy+6fZz8H26r35rl0C9UO6y7V5Hm4=;
 b=bYZ3/lvpbgm4H9mHRhgMWQrEHnQ48GwkZFpqxRlSkrq84v7537uSKOyfIN7p6m+Ljz8YJE
 QaitHUIyVv2qvKUWYwUOnyJBOW/9fITH9MMJrU04mwyLZ77VO10sPTN7mM+3w/zl8c8tXp
 DiWYAizGdin1ExfwSlgbDYZHhaVSpWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-dMXZuizfNL2kn1jC8D3Mdw-1; Tue, 16 Mar 2021 05:29:06 -0400
X-MC-Unique: dMXZuizfNL2kn1jC8D3Mdw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2907F100C660;
 Tue, 16 Mar 2021 09:29:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B7166A045;
 Tue, 16 Mar 2021 09:29:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 093691132C12; Tue, 16 Mar 2021 10:29:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH] docs/devel: expand style section of memory management
References: <20210315165312.22453-1-alex.bennee@linaro.org>
 <CAFEAcA8gnFdOprY=yj+voN+DJ44zx3+9ABM3yMPdWJSQ3X6QrQ@mail.gmail.com>
 <b5db40d9-1a51-3690-a1ac-0ac345619376@redhat.com>
 <YE+UuX2Hqr2BjsRh@redhat.com>
Date: Tue, 16 Mar 2021 10:29:00 +0100
In-Reply-To: <YE+UuX2Hqr2BjsRh@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Mon, 15 Mar 2021 17:09:13 +0000")
Message-ID: <877dm78n1f.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Mar 15, 2021 at 06:04:10PM +0100, Thomas Huth wrote:
>> On 15/03/2021 17.57, Peter Maydell wrote:
>> > On Mon, 15 Mar 2021 at 16:53, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> > > -Prefer g_new(T, n) instead of g_malloc(sizeof(T) ``*`` n) for the f=
ollowing
>> > > +Care should be taken to avoid introducing places where the guest co=
uld
>> > > +trigger an exit. For example using ``g_malloc`` on start-up is fine
>> > > +if the result of a failure is going to be a fatal exit anyway. Ther=
e
>> > > +may be some start-up cases where failing is unreasonable (for examp=
le
>> > > +speculatively loading debug symbols).
>> > > +
>> > > +However if we are doing an allocation because of something the gues=
t
>> > > +has done we should never trigger an exit. The code may deal with th=
is
>> > > +by trying to allocate less memory and continue or re-designed to al=
locate
>> > > +buffers on start-up.
>> >=20
>> > I think this is overly strong. We want to avoid malloc-or-die for
>> > cases where the guest gets to decide how big the allocation is;
>> > but if we're doing a single small fixed-size allocation that happens
>> > to be triggered by a guest action we should be OK to g_malloc() that
>> > I think.
>>=20
>> I agree with Peter. If the host is so much out-of-memory that we even ca=
n't
>> allocate some few bytes anymore (let's say less than 4k), the system is
>> pretty much dead anyway and it might be better to terminate the program
>> immediately instead of continuing with the out-of-memory situation.
>
> On a Linux host you're almost certainly not going to see g_malloc
> fail for small allocations at least. Instead at some point the host
> will be under enough memory pressure that the OOM killer activates
> and reaps arbitrary processes based on some criteria it has, freeing
> up memory for malloc to succeed (unless OOM killer picked you as the
> victim).

This happens even for large allocations.  In a prior iteration of the
"When it's okay to treat OOM as fatal?" discussion[1], I showed that
Linux malloc() and g_malloc() happily give me a terabyte of memory I
don't have in 1024 chunks of 1 GiB each.  I just reran the test, same
results.

See also [2].


[1] https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg04229.html
[2] http://turnoff.us/geek/bad-malloc/


