Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F632604607
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 14:55:09 +0200 (CEST)
Received: from localhost ([::1]:47096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol8bC-0002Pq-Mm
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 08:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ol8Ra-0002D6-S6
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:45:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ol8RR-0000uu-Iu
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:45:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666183496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B1hiiiEY4ddmlMQ9tEzbXZrVVzNsVo4OeeW/NecDlpU=;
 b=b3x72NpzRyXVMyH7TqQ85hvezENrXkqu3dEt+5JYdvooZCyThaCF48qGgTCDcX6tMH2Lxp
 LKDWgDltSzq15uGxVvquD+YKwwacFoLuXwomls3ViAbavsOcW8UtIbg5wB3Gj8e86noTTR
 E/mVKpb7TjHTTmn89UTxml8LfbRzaKw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-T9FiLDKAPgeiwjHJfreeXg-1; Wed, 19 Oct 2022 08:44:53 -0400
X-MC-Unique: T9FiLDKAPgeiwjHJfreeXg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EC462932489;
 Wed, 19 Oct 2022 12:44:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D00B49BB64;
 Wed, 19 Oct 2022 12:44:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A80C421E6686; Wed, 19 Oct 2022 14:44:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Stefan Hajnoczi <stefanha@redhat.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  Thomas Huth
 <huth@tuxfamily.org>, Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Replace my amsat.org email address
References: <20221017182005.43015-1-philmd@linaro.org>
Date: Wed, 19 Oct 2022 14:44:50 +0200
In-Reply-To: <20221017182005.43015-1-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 17 Oct 2022 20:20:05
 +0200")
Message-ID: <87pmeohtj1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> The amsat.org domain is having issues with DMARC / SPF / DKIM:
> https://lore.kernel.org/qemu-devel/CAMVc7JUy5NeEN0q=3D4zfZvn_rppgqn9wicV1=
z=3DTsLuHKS3RY3Sw@mail.gmail.com/
>
> Consolidate all of my MAINTAINERS entries on my work address.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  .mailmap    |  4 +++-
>  MAINTAINERS | 62 ++++++++++++++++++++++++++---------------------------
>  2 files changed, 34 insertions(+), 32 deletions(-)
>
> diff --git a/.mailmap b/.mailmap
> index 1f7319b70b..35dddbe27b 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -70,7 +70,9 @@ Paul Burton <paulburton@kernel.org> <paul.burton@mips.c=
om>
>  Paul Burton <paulburton@kernel.org> <paul.burton@imgtec.com>
>  Paul Burton <paulburton@kernel.org> <paul@archlinuxmips.org>
>  Paul Burton <paulburton@kernel.org> <pburton@wavecomp.com>
> -Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> <philmd@redhat.com>
> +Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> <f4bug@amsat.org>
> +Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> <philmd@redhat.com>

I think this retroactively credits all your contributions to Linaro.
Intentional?

> +Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> <philmd@fungible.com>
>  Stefan Brankovic <stefan.brankovic@syrmia.com> <stefan.brankovic@rt-rk.c=
om.com>
>  Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
>=20=20

[...]


