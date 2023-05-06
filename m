Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D876F9032
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 09:34:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvCQu-00060S-On; Sat, 06 May 2023 03:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pvCQs-000604-7m
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:34:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pvCQq-0007NT-DV
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683358454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9/QgGjs4Ucoq2AHEh7bh3EbX9TByD1fm4d8jnqawi8=;
 b=EGe37mBQNBhlNpcR0sbWL3nxbR4Q574NJgAaDi4vTO9aGs0BNCklnhbXI0yctUFgLZX2T3
 X/Ww2vLtWDlF++kUATwgz0EO9Ozx+YReMQef5pQx3lakZGgWAXPtGDkjKF5uizjuLC7ZbN
 MQ5vCpdnkhGtRIWOY/NjuYy3AQj0xl4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-R5Mm7sXvOcKcvuwtgM152w-1; Sat, 06 May 2023 03:34:10 -0400
X-MC-Unique: R5Mm7sXvOcKcvuwtgM152w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09B6080080E;
 Sat,  6 May 2023 07:34:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2508C164E7;
 Sat,  6 May 2023 07:34:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6E42C21E6924; Sat,  6 May 2023 09:34:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,  qemu-devel@nongnu.org,  Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,  Christian Schoenebeck
 <qemu_oss@crudebyte.com>,  Michael Roth <michael.roth@amd.com>,  Eric
 Blake <eblake@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Greg
 Kurz <groug@kaod.org>,  Eduardo Habkost <eduardo@habkost.net>,  Yanan Wang
 <wangyanan55@huawei.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,  Warner Losh <imp@bsdimp.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Riku Voipio <riku.voipio@iki.fi>
Subject: Re: [PATCH v3 04/10] scripts/qapi: document the tool that generated
 the file
References: <20230505155336.137393-1-alex.bennee@linaro.org>
 <20230505155336.137393-5-alex.bennee@linaro.org>
Date: Sat, 06 May 2023 09:34:08 +0200
In-Reply-To: <20230505155336.137393-5-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Fri, 5 May 2023 16:53:30 +0100")
Message-ID: <87zg6hrk0f.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> This makes it a little easier for developers to find where things
> where being generated.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20230503091756.1453057-5-alex.bennee@linaro.org>
> ---
>  scripts/qapi/gen.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index 8f8f784f4a..e724507e1a 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -162,7 +162,7 @@ def __init__(self, fname: str, blurb: str, pydoc: str=
):
>=20=20
>      def _top(self) -> str:
>          return mcgen('''
> -/* AUTOMATICALLY GENERATED, DO NOT MODIFY */
> +/* AUTOMATICALLY GENERATED by QAPIGenC, DO NOT MODIFY */
>=20=20
>  /*
>  %(blurb)s
> @@ -195,7 +195,7 @@ def _bottom(self) -> str:
>=20=20
>  class QAPIGenTrace(QAPIGen):
>      def _top(self) -> str:
> -        return super()._top() + '# AUTOMATICALLY GENERATED, DO NOT MODIF=
Y\n\n'
> +        return super()._top() + '# AUTOMATICALLY GENERATED by QAPIGenTra=
ce, DO NOT MODIFY\n\n'
>=20=20
>=20=20
>  @contextmanager

Nitpicking...  would "GENERATED BY {os.path.basename(sys.argv[0])}" be
more useful?  The people who know what QAPIGenC and QAPIGenTrace mean
are probably the ones that need this warning the least :)


