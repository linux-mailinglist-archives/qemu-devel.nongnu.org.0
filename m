Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66AB1C8E93
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 16:29:31 +0200 (CEST)
Received: from localhost ([::1]:54546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWhWk-00065x-7a
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 10:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jWhVu-0005H5-PV
 for qemu-devel@nongnu.org; Thu, 07 May 2020 10:28:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40168
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jWhVo-0003oM-Hv
 for qemu-devel@nongnu.org; Thu, 07 May 2020 10:28:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588861710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tfVk8TUOCV6RMTlqjfRmz+Yd+A9AkPLLO/INNvcQ+Ws=;
 b=O5D2k09uwXkYgb/9MHzuEixVL/ieS5frTwB5lt7oRiNwDizPDWJSS6q4w87D9T4SZWPvNy
 HM28NRzFCuE1I1Ei633box/Ot969UAb3l80XbT+1pM05P0N1Rvwsfs3qllZmUebZTx8x0V
 GR2HofhIfdzphwQH7d7iS6yx3PXbP/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364--Peun-FRPyWu7ktVxWouwA-1; Thu, 07 May 2020 10:28:25 -0400
X-MC-Unique: -Peun-FRPyWu7ktVxWouwA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8AAB106B277;
 Thu,  7 May 2020 14:28:24 +0000 (UTC)
Received: from work-vm (ovpn-114-224.ams2.redhat.com [10.36.114.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7C676443A;
 Thu,  7 May 2020 14:28:23 +0000 (UTC)
Date: Thu, 7 May 2020 15:28:21 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Subject: Re: [PATCH v2] migration: fix bad indentation in error_report()
Message-ID: <20200507142821.GA17348@work-vm>
References: <09f7529c665cac0c6a5e032ac6fdb6ca701f7e37.1585329482.git.maozhongyi@cmss.chinamobile.com>
MIME-Version: 1.0
In-Reply-To: <09f7529c665cac0c6a5e032ac6fdb6ca701f7e37.1585329482.git.maozhongyi@cmss.chinamobile.com>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 03:15:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_HK_NAME_DR=0.01, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Mao Zhongyi (maozhongyi@cmss.chinamobile.com) wrote:
> bad indentation conflicts with CODING_STYLE doc.
>=20
> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>

Queued

> ---
>  migration/migration.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/migration/migration.c b/migration/migration.c
> index c4c9aee15e..2b7b5bccfa 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2495,7 +2495,7 @@ retry:
>          if (header_type >=3D MIG_RP_MSG_MAX ||
>              header_type =3D=3D MIG_RP_MSG_INVALID) {
>              error_report("RP: Received invalid message 0x%04x length 0x%=
04x",
> -                    header_type, header_len);
> +                         header_type, header_len);
>              mark_source_rp_bad(ms);
>              goto out;
>          }
> @@ -2504,9 +2504,9 @@ retry:
>              header_len !=3D rp_cmd_args[header_type].len) ||
>              header_len > sizeof(buf)) {
>              error_report("RP: Received '%s' message (0x%04x) with"
> -                    "incorrect length %d expecting %zu",
> -                    rp_cmd_args[header_type].name, header_type, header_l=
en,
> -                    (size_t)rp_cmd_args[header_type].len);
> +                         "incorrect length %d expecting %zu",
> +                         rp_cmd_args[header_type].name, header_type, hea=
der_len,
> +                         (size_t)rp_cmd_args[header_type].len);
>              mark_source_rp_bad(ms);
>              goto out;
>          }
> @@ -2561,7 +2561,7 @@ retry:
>              }
>              if (header_len !=3D expected_len) {
>                  error_report("RP: Req_Page_id with length %d expecting %=
zd",
> -                        header_len, expected_len);
> +                             header_len, expected_len);
>                  mark_source_rp_bad(ms);
>                  goto out;
>              }
> --=20
> 2.17.1
>=20
>=20
>=20
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


