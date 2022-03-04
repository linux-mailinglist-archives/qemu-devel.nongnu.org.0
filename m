Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FE54CCF2E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 08:41:22 +0100 (CET)
Received: from localhost ([::1]:42964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ2Yy-0006sY-M6
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 02:41:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nQ2XS-00066d-1P
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 02:39:46 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:27481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nQ2XQ-00052n-BM
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 02:39:45 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-AOS2clMEMIO5UPttcssHtw-1; Fri, 04 Mar 2022 02:39:39 -0500
X-MC-Unique: AOS2clMEMIO5UPttcssHtw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B637D180FD72;
 Fri,  4 Mar 2022 07:39:38 +0000 (UTC)
Received: from bahia (unknown [10.39.192.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE5E17B14C;
 Fri,  4 Mar 2022 07:39:37 +0000 (UTC)
Date: Fri, 4 Mar 2022 08:39:36 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 0/6] 9pfs: convert Doxygen -> kerneldoc format
Message-ID: <20220304083936.2e0ceb02@bahia>
In-Reply-To: <cover.1646314856.git.qemu_oss@crudebyte.com>
References: <cover.1646314856.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Mar 2022 14:40:56 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> This patch set converts occurrences of API doc comments from Doxygen form=
at
> into kerneldoc format. No behaviour change whatsoever.
>=20
> Christian Schoenebeck (6):
>   9pfs/9p.h: convert Doxygen -> kerneldoc format
>   9pfs/codir.c: convert Doxygen -> kerneldoc format
>   9pfs/9p.c: convert Doxygen -> kerneldoc format
>   9pfs/9p-util.h: convert Doxygen -> kerneldoc format
>   9pfs/coth.h: drop Doxygen format on v9fs_co_run_in_worker()
>   fsdev/p9array.h: convert Doxygen -> kerneldoc format
>=20
>  fsdev/p9array.h   | 38 ++++++++++++++++-------------
>  hw/9pfs/9p-util.h | 10 ++++----
>  hw/9pfs/9p.c      | 62 ++++++++++++++++++++++++++---------------------
>  hw/9pfs/9p.h      | 12 ++++-----
>  hw/9pfs/codir.c   | 30 +++++++++++------------
>  hw/9pfs/coth.h    |  4 +--
>  6 files changed, 84 insertions(+), 72 deletions(-)
>=20

LGTM.

Reviewed-by: Greg Kurz <groug@kaod.org>


