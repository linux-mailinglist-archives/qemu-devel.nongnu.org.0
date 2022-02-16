Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1034C4B8B5D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 15:24:38 +0100 (CET)
Received: from localhost ([::1]:43450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKLET-0003kr-6V
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 09:24:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nKLDN-00032Y-S3
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 09:23:29 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:25803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nKLDM-00044Z-G4
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 09:23:29 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-AtcQx2whNRuBPzXEfrwwFQ-1; Wed, 16 Feb 2022 09:23:20 -0500
X-MC-Unique: AtcQx2whNRuBPzXEfrwwFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C7D1839A43;
 Wed, 16 Feb 2022 14:23:18 +0000 (UTC)
Received: from bahia (unknown [10.39.192.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF2A97BE46;
 Wed, 16 Feb 2022 14:23:16 +0000 (UTC)
Date: Wed, 16 Feb 2022 15:23:15 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PULL 0/5] 9p queue 2022-02-10
Message-ID: <20220216152315.0467c545@bahia>
In-Reply-To: <1736989.e8qiMhLugc@silver>
References: <cover.1644492115.git.qemu_oss@crudebyte.com>
 <20220214144351.dp57o6jyfvliwkos@altlinux.org>
 <20220215080137.021f6938@bahia> <1736989.e8qiMhLugc@silver>
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
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Vitaly Chikunov <vt@altlinux.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, "Dmitry V . Levin" <ldv@altlinux.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Feb 2022 11:30:12 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Dienstag, 15. Februar 2022 08:01:37 CET Greg Kurz wrote:
> > On Mon, 14 Feb 2022 17:43:51 +0300
> >=20
> > Vitaly Chikunov <vt@altlinux.org> wrote:
> > > Why g_new0 and not just g_malloc0? This is smallest code change, whic=
h
> > > seems appropriate for a bug fix.
> >=20
> > I prefer g_new0() for the exact reasons that are provided in QEMU's
> > official coding style docs/devel/style.rst:
> [...]
> > I'm fine with the acceptable version as well. The only important thing =
is
> > to fix the synth backend.
> >=20
> > Cheers,
>=20
> Hi, is anybody working on a v5 of this patch? If not I will send one this=
=20
> evening to bring this issue forward, because it is blocking my queue.
>=20

I'm not, please post a patch and I'll review it ASAP.

Cheers,

--
Greg

> Best regards,
> Christian Schoenebeck
>=20
>=20


