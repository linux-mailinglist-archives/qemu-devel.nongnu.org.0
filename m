Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A164839FA2B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 17:17:21 +0200 (CEST)
Received: from localhost ([::1]:47580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqdTk-00064I-Oe
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 11:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lqdST-0004h2-4j
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:16:01 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:37086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lqdSR-0007S5-F4
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:16:00 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-H640SHF6M3efz9TLs-R6lw-1; Tue, 08 Jun 2021 11:15:46 -0400
X-MC-Unique: H640SHF6M3efz9TLs-R6lw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3225580ED8B;
 Tue,  8 Jun 2021 15:15:44 +0000 (UTC)
Received: from bahia.lan (ovpn-112-185.ams2.redhat.com [10.36.112.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C70D760853;
 Tue,  8 Jun 2021 15:15:41 +0000 (UTC)
Date: Tue, 8 Jun 2021 17:15:40 +0200
From: Greg Kurz <groug@kaod.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 4/5] monitor: removed cpustats command
Message-ID: <20210608171540.6c67bcc3@bahia.lan>
In-Reply-To: <8735tsxuhj.fsf@dusky.pond.sub.org>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-5-bruno.larsen@eldorado.org.br>
 <20210527084038.512c5270@bahia.lan>
 <8735tsxuhj.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 08 Jun 2021 17:10:32 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Greg Kurz <groug@kaod.org> writes:
>=20
> > On Wed, 26 May 2021 17:21:03 -0300
> > "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> wrote:
> >
> >> Since ppc was the last architecture to collect these statistics and
> >> it is currently phasing this collection out, the command that would qu=
ery
> >> this information is being removed.
> >>=20
> >
> > So this is removing an obviously user visible feature. This should be
> > mentioned in docs/system/removed-features.rst... but, wait, I don't
> > see anything for it in docs/system/deprecated.rst. This is dropping
> > a feature without following the usual deprecation policy, i.e.
> > marking the feature as deprecated and only remove it 2 QEMU versions
> > later. Any justification for that ?
>=20
> Our deprecation policy applies to stable interfaces, which HMP is not.
>=20
> We don't break things there just because.  But dropping a command right
> away when it is no longer useful is just fine.  No need to deprecate and
> wait for the grace period.
>=20
> [...]
>=20

Ah, good to know.

Thanks!

--
Greg


