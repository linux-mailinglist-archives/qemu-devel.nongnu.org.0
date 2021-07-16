Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221F23CB781
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 14:49:09 +0200 (CEST)
Received: from localhost ([::1]:33976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4NHA-0007y8-5d
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 08:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m4NG9-0007Il-MA
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 08:48:05 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:48063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m4NG7-0001pd-Ht
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 08:48:05 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-SsBEuo6fNDelgazjL7qS-g-1; Fri, 16 Jul 2021 08:48:01 -0400
X-MC-Unique: SsBEuo6fNDelgazjL7qS-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6ADC1804140;
 Fri, 16 Jul 2021 12:48:00 +0000 (UTC)
Received: from bahia.lan (ovpn-112-127.ams2.redhat.com [10.36.112.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF6915D6AB;
 Fri, 16 Jul 2021 12:47:58 +0000 (UTC)
Date: Fri, 16 Jul 2021 14:47:57 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v5 4/7] qapi/qdev.json: fix DEVICE_DELETED parameters doc
Message-ID: <20210716144757.6c53cec3@bahia.lan>
In-Reply-To: <20210712194339.813152-5-danielhb413@gmail.com>
References: <20210712194339.813152-1-danielhb413@gmail.com>
 <20210712194339.813152-5-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 eblake@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 16:43:36 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> Clarify that @device is optional and that 'path' is the device
> path from QOM.
>=20
> This change follows Markus' suggestion verbatim, provided in full
> context here:
>=20
> https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg01891.html
>=20
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  qapi/qdev.json | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index b83178220b..d1d3681a50 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -108,9 +108,9 @@
>  # At this point, it's safe to reuse the specified device ID. Device remo=
val can
>  # be initiated by the guest or by HMP/QMP commands.
>  #
> -# @device: device name
> +# @device: the device's ID if it has one
>  #
> -# @path: device path
> +# @path: the device's path within the object model
>  #
>  # Since: 1.5
>  #


