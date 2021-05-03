Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD364371076
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 03:53:21 +0200 (CEST)
Received: from localhost ([::1]:52522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldNlw-0005QT-8B
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 21:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1ldNjG-0004So-Oe
 for qemu-devel@nongnu.org; Sun, 02 May 2021 21:50:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1ldNjC-0007ZK-NL
 for qemu-devel@nongnu.org; Sun, 02 May 2021 21:50:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620006627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vjtXabNIvlhZIJlMXjyMsDdOI5M5bkljs8hqu0EXQr8=;
 b=HRAKYFY3KloTSJvNumtPvMNNnO/MJQe0Vm+K3f7jmnvuHmuNg9jDQX+ceQAaqgCIDzeBp4
 VY3K/j+GHFFD0nRyuKG+xLF2pl8/6UXCkthvBMiAjrp679n4PkyaHhaCxT7nhbSy59ERyp
 v+GoAsiXCV2Xp9P51xHn1C0sZxY+VM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297--AOJHY32N_K79ITX4zqFBA-1; Sun, 02 May 2021 21:50:25 -0400
X-MC-Unique: -AOJHY32N_K79ITX4zqFBA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17CBF801FD8;
 Mon,  3 May 2021 01:50:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FE8719D7D;
 Mon,  3 May 2021 01:50:24 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF4E45534B;
 Mon,  3 May 2021 01:50:23 +0000 (UTC)
Date: Sun, 2 May 2021 21:50:23 -0400 (EDT)
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <262314931.15107240.1620006623468.JavaMail.zimbra@redhat.com>
In-Reply-To: <ec80a132-969e-1428-51b2-05c94c2447bc@redhat.com>
References: <20210414161144.1598980-1-crosa@redhat.com>
 <ec80a132-969e-1428-51b2-05c94c2447bc@redhat.com>
Subject: Re: [PATCH 0/1] Acceptance Tests: bump Avocado version requirement
 to 87.0
MIME-Version: 1.0
X-Originating-IP: [10.3.112.153, 10.4.195.19]
Thread-Topic: Acceptance Tests: bump Avocado version requirement to 87.0
Thread-Index: Gt6+mIwxFOjNPfXsjBBQiUIJdUIVOw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



----- Original Message -----
> From: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> To: "Cleber Rosa" <crosa@redhat.com>, qemu-devel@nongnu.org
> Cc: "Thomas Huth" <thuth@redhat.com>, "Beraldo Leal" <bleal@redhat.com>, =
"Wainer dos Santos Moschetta"
> <wainersm@redhat.com>, "Alex Benn=C3=A9e" <alex.bennee@linaro.org>, "Will=
ian Rampazzo" <wrampazz@redhat.com>, "Eduardo
> Habkost" <ehabkost@redhat.com>
> Sent: Sunday, May 2, 2021 11:24:44 AM
> Subject: Re: [PATCH 0/1] Acceptance Tests: bump Avocado version requireme=
nt to 87.0
>=20
> On 4/14/21 6:11 PM, Cleber Rosa wrote:
> > This is being proposed as a separate single patch simply to show
> > that no known regressions have been introduced as far as the
> > acceptance tests/jobs are related.  CI job:
> >=20
> >    https://gitlab.com/cleber.gnu/qemu/-/pipelines/286347312
> >=20
> > This version (and 86.0) contain improvements that address specific
> > QEMU use cases, including:
> >=20
> >  * Fix to the error message given when downloading assets
> >=20
> >  * Asset listing/purging capabilities
> >=20
> > Cleber Rosa (1):
> >   Acceptance Tests: bump Avocado version requirement to 87.0
> >=20
> >  tests/requirements.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
>=20
> Ping? This patch should fix the mainstream pipeline error:
> https://gitlab.com/qemu-project/qemu/-/jobs/1229752162
>=20

Hi Phil,

I'll send with my python-next (and other) patches to be queued in a day
or two... but the bad news is: I don't think Avocado 87.0 has the fix for
the pipeline issue above.  I looked at the test log, and the kernel boot
hangs right after:

11:43:53 DEBUG| Freeing unused kernel memory: 1176K
11:43:53 DEBUG| This architecture does not have kernel memory protection.

And then gets interrupted by Avocado some 90 seconds after that.  I'll try
to reproduce it and debug.

> (see
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg794416.html)
>=20
>=20

Avocado 87.0 does fix the issue you referenced here though.

Regards,
- Cleber.


