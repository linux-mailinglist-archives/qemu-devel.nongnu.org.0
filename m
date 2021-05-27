Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF4A393497
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 19:12:32 +0200 (CEST)
Received: from localhost ([::1]:41816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmJYc-0001kq-R9
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 13:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lmJWw-0000IC-GX
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:10:46 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:48907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lmJWt-0007j7-Ar
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:10:45 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-2e8ZHxcaNbOWr9OnkjDBhg-1; Thu, 27 May 2021 13:10:35 -0400
X-MC-Unique: 2e8ZHxcaNbOWr9OnkjDBhg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B07F6107ACE3;
 Thu, 27 May 2021 17:10:33 +0000 (UTC)
Received: from bahia.lan (ovpn-112-46.ams2.redhat.com [10.36.112.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9938E74AAA;
 Thu, 27 May 2021 17:10:30 +0000 (UTC)
Date: Thu, 27 May 2021 19:10:28 +0200
From: Greg Kurz <groug@kaod.org>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH] HMP: added cpustats to removed_features.rst
Message-ID: <20210527191028.24febe7e@bahia.lan>
In-Reply-To: <20210527165034.23562-1-bruno.larsen@eldorado.org.br>
References: <20210527165034.23562-1-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 May 2021 13:50:34 -0300
"Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> wrote:

> Documented the removal of the HMP command cpustats
>=20

It is the 'info cpustats' command.

> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  docs/system/removed-features.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/docs/system/removed-features.rst b/docs/system/removed-featu=
res.rst
> index 5a462ac568..a88ff7aff4 100644
> --- a/docs/system/removed-features.rst
> +++ b/docs/system/removed-features.rst
> @@ -249,6 +249,12 @@ Use ``migrate-set-parameters`` and ``info migrate-pa=
rameters`` instead.
> =20
>  Use ``migrate-set-parameters`` instead.
> =20
> +``cpustats`` (removed in 6.1)
> +'''''''''''''''''''''''''''''

ditto

> +
> +This command didn't produce any output already. Removed to avoid expecta=
tions
> +of maintaining/fixing it.
> +

s/to avoid... it/with no replacement/ because that's what users
are interested in.

>  Guest Emulator ISAs
>  -------------------
> =20


