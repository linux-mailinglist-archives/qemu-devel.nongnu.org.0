Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE9E51C40D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 17:38:06 +0200 (CEST)
Received: from localhost ([::1]:57376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmdYL-0001y1-7F
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 11:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmdRy-0006ll-5D
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:31:30 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:49447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmdRr-00029F-Va
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651764682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2gqJHsV17JanDy/WYIJlBmiZs8u0bZV3fLRw4KqMuOY=;
 b=SF+/5KiytTQJsZESr3s1NhfQ/qUUlyiYU98WOyZTpy0iNgWv6zFHk4m6yYPFVT/F40XP7a
 SDKs739YO8I83EyHa5Ef0n9nuLh/iLWiBgigy8MQB5UYQP8q/1CjSUfiybAkW+RaTo99qA
 KrUAaNjD2o0V2Yhgaic1MF7qwAt4+xI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-ts9ktUf8OSeHvlwcmhyzzA-1; Thu, 05 May 2022 11:31:19 -0400
X-MC-Unique: ts9ktUf8OSeHvlwcmhyzzA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE73B85A5BE;
 Thu,  5 May 2022 15:31:18 +0000 (UTC)
Received: from localhost (unknown [10.39.194.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52E8C55BCBB;
 Thu,  5 May 2022 15:31:18 +0000 (UTC)
Date: Thu, 5 May 2022 16:31:17 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, mst@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 imammedo@redhat.com, peterx@redhat.com, john.levon@nutanix.com,
 thanos.makatos@nutanix.com, elena.ufimtseva@oracle.com,
 john.g.johnson@oracle.com, kanth.ghatraju@oracle.com
Subject: Re: [PATCH v9 05/17] configure: require cmake 3.19 or newer
Message-ID: <YnPtxWTsx2uwz5JD@stefanha-x1.localdomain>
References: <cover.1651586203.git.jag.raman@oracle.com>
 <c5ddf3cc02486a0dbc965c8bebab79aa75383a4f.1651586203.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RCuFe+FKcRxEKx2/"
Content-Disposition: inline
In-Reply-To: <c5ddf3cc02486a0dbc965c8bebab79aa75383a4f.1651586203.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.74; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--RCuFe+FKcRxEKx2/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 03, 2022 at 10:16:46AM -0400, Jagannathan Raman wrote:
> cmake needs to accept the compiler flags specified with
> CMAKE_<LANG>_COMPILER variable. It does so starting with
> version 3.19
>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  configure | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--RCuFe+FKcRxEKx2/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJz7cUACgkQnKSrs4Gr
c8jKCAgAmiI88+pj8Q/gDzP/tYCKxCmU7ZFBI/6hEsu0VTeRGAjYEpgWzgVO4Cpj
K9K7ydt2+QpbzEjmZzO/Y75AfABfscIHcLPWNSPloDeBJWz2wHI6lvXhisKJcg3x
VrhrL/eJ5cvccKWnV1OJzW29ONnFCFV+ywtlxhJu2HspyXDbVLslBPFNgE5oYgIp
S/gJGKMxErk8egZKvOgRdQFlorHb00JMPtXe3TKV/P4+Rm6vY2NMCSyaIq4JZ4z1
21v15JhGlhLPgiB1j/IJYA8tmD3xTnFcZ8VPAcC3ObDlWxoYZ2aPICs3S/9arrjT
GHDFbSsMAJllm0nyHcYQkIq9quYJ+g==
=RuGO
-----END PGP SIGNATURE-----

--RCuFe+FKcRxEKx2/--


