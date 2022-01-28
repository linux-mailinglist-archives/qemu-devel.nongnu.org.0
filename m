Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3FB49FFA8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 18:36:38 +0100 (CET)
Received: from localhost ([::1]:51812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDVAr-00037o-KW
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 12:36:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nDU6O-0005gB-5I
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:27:56 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:48997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nDU6M-0006bM-7e
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:27:55 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-2Qcq0hdoPmeepIAFYFiGLg-1; Fri, 28 Jan 2022 11:27:50 -0500
X-MC-Unique: 2Qcq0hdoPmeepIAFYFiGLg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B24C884DA43;
 Fri, 28 Jan 2022 16:27:48 +0000 (UTC)
Received: from bahia (unknown [10.39.192.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90B537CAF9;
 Fri, 28 Jan 2022 16:27:41 +0000 (UTC)
Date: Fri, 28 Jan 2022 17:27:40 +0100
From: Greg Kurz <groug@kaod.org>
To: Will Cohen <wwcohen@gmail.com>
Subject: Re: [PATCH v3 02/11] 9p: Rename 9p-util -> 9p-util-linux
Message-ID: <20220128172740.1e0731b7@bahia>
In-Reply-To: <20220128005611.87185-3-wwcohen@gmail.com>
References: <20220128005611.87185-1-wwcohen@gmail.com>
 <20220128005611.87185-3-wwcohen@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 19:56:02 -0500
Will Cohen <wwcohen@gmail.com> wrote:

> From: Keno Fischer <keno@juliacomputing.com>
>=20
> The current file only has the Linux versions of these functions.
> Rename the file accordingly and update the Makefile to only build
> it on Linux. A Darwin version of these will follow later in the
> series.
>=20
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> [Michael Roitzsch: - Rebase for NixOS]
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/9pfs/{9p-util.c =3D> 9p-util-linux.c} | 2 +-
>  hw/9pfs/meson.build                    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename hw/9pfs/{9p-util.c =3D> 9p-util-linux.c} (97%)
>=20
> diff --git a/hw/9pfs/9p-util.c b/hw/9pfs/9p-util-linux.c
> similarity index 97%
> rename from hw/9pfs/9p-util.c
> rename to hw/9pfs/9p-util-linux.c
> index 3221d9b498..398614a5d0 100644
> --- a/hw/9pfs/9p-util.c
> +++ b/hw/9pfs/9p-util-linux.c
> @@ -1,5 +1,5 @@
>  /*
> - * 9p utilities
> + * 9p utilities (Linux Implementation)
>   *
>   * Copyright IBM, Corp. 2017
>   *
> diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
> index 99be5d9119..1b28e70040 100644
> --- a/hw/9pfs/meson.build
> +++ b/hw/9pfs/meson.build
> @@ -4,7 +4,6 @@ fs_ss.add(files(
>    '9p-posix-acl.c',
>    '9p-proxy.c',
>    '9p-synth.c',
> -  '9p-util.c',
>    '9p-xattr-user.c',
>    '9p-xattr.c',
>    '9p.c',
> @@ -14,6 +13,7 @@ fs_ss.add(files(
>    'coth.c',
>    'coxattr.c',
>  ))
> +fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-util-linux.c'))
>  fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
>  softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
> =20


