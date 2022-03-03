Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9174CBAD3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 10:55:34 +0100 (CET)
Received: from localhost ([::1]:58708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPiBJ-0000Oq-EQ
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 04:55:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nPi9g-0007Nf-51
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 04:53:52 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:49043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nPi9d-0008QP-16
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 04:53:51 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-80-itAgwCELMFi5bHO8hYR0qw-1; Thu, 03 Mar 2022 04:53:39 -0500
X-MC-Unique: itAgwCELMFi5bHO8hYR0qw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 413FA805EE5;
 Thu,  3 Mar 2022 09:53:38 +0000 (UTC)
Received: from bahia (unknown [10.39.193.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41F4078215;
 Thu,  3 Mar 2022 09:53:36 +0000 (UTC)
Date: Thu, 3 Mar 2022 10:53:32 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [SPAM] [PATCH] 9pfs: drop Doxygen format from qemu_dirent_dup()
 API comment
Message-ID: <20220303105332.5ce078a9@bahia>
In-Reply-To: <E1nPTwO-0006pl-Np@lizzy.crudebyte.com>
References: <E1nPTwO-0006pl-Np@lizzy.crudebyte.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 19:30:39 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> API doc comments in QEMU are supposed to be in kerneldoc format, so drop
> occurrences of "@c" which is Doxygen format for fixed-width text.
>=20
> Link: https://lore.kernel.org/qemu-devel/CAFEAcA89+ENOM6x19OEF53Kd2DWkhN5=
SN21Va0D7yepJSa3Jyg@mail.gmail.com/
> Based-on: <E1nP9Oz-00043L-KJ@lizzy.crudebyte.com>
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

Sorry for not catching these during previous reviews :-\

Reviewed-by: Greg Kurz <groug@kaod.org>

FWIW it seems some more de-doxygenation is needed :

fsdev/p9array.h: * Consider the following user struct @c Foo which shall be=
 used as scalar
fsdev/p9array.h: * @code
fsdev/p9array.h: * and assume it has the following function to free memory =
allocated by @c Foo
fsdev/p9array.h: * @code
fsdev/p9array.h: * @code
fsdev/p9array.h: * @code
fsdev/p9array.h: * @code
hw/9pfs/9p.h:     * Lenght of the affix, that is how many (of the lowest) b=
its of @c value
             extra nit  ^^
hw/9pfs/codir.c: * @note You must @b ALWAYS call @c v9fs_free_dirents(entri=
es) after calling

Detected with basic git grepping. Probably not exhaustive.


>  hw/9pfs/9p-util.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index 8b92614e6c..22835c5f61 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -116,8 +116,8 @@ static inline off_t qemu_dirent_off(struct dirent *de=
nt)
>   * Duplicate directory entry @dent.
>   *
>   * It is highly recommended to use this function instead of open coding
> - * duplication of @c dirent objects, because the actual @c struct @c dir=
ent
> - * size may be bigger or shorter than @c sizeof(struct dirent) and corre=
ct
> + * duplication of dirent objects, because the actual struct dirent
> + * size may be bigger or shorter than sizeof(struct dirent) and correct
>   * handling is platform specific (see gitlab issue #841).
>   *
>   * @dent - original directory entry to be duplicated


