Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF86E59CBE8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:07:51 +0200 (CEST)
Received: from localhost ([::1]:33404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQGWM-0001tb-UK
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQGU5-0000JI-Li
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:05:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQGU3-0002fz-Rc
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661209526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BcDmozudvO5EKhIpt3BCeSUKFyU0/vlLO39xDUwYMNY=;
 b=A4V2EOLKAInABjaJAyUe3X6BoOYb60+0bHOzsxQ0LQcYnjkdaS1ciFqkTnAu5ALCMDgPz9
 II3c3FhNAH222fM8V0Pu2FieBx7dx3GClkx8nFymVyYxlQ1YATV37nGsayfDB9aAUm5Xln
 75TrA5+/SDjEtS8NPNaQVMEKiZM0zyU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-kyJTUP_5MYiWwu-PzF0zUA-1; Mon, 22 Aug 2022 19:05:23 -0400
X-MC-Unique: kyJTUP_5MYiWwu-PzF0zUA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9CE6804184;
 Mon, 22 Aug 2022 23:05:22 +0000 (UTC)
Received: from localhost (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2FFE4010D24;
 Mon, 22 Aug 2022 23:05:21 +0000 (UTC)
Date: Mon, 22 Aug 2022 19:05:20 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, hare@suse.de, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com,
 qemu-block@nongnu.org, damien.lemoal@opensource.wdc.com
Subject: Re: [PATCH v7 2/8] file-posix: introduce get_sysfs_str_val for
 device zoned model
Message-ID: <YwQLsL01jP89Dp5k@fedora>
References: <20220816062522.85714-1-faithilikerun@gmail.com>
 <20220816062522.85714-3-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6XoFijmJ2Sk/6zPe"
Content-Disposition: inline
In-Reply-To: <20220816062522.85714-3-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--6XoFijmJ2Sk/6zPe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 16, 2022 at 02:25:16PM +0800, Sam Li wrote:
> +static int hdev_get_max_segments(int fd, struct stat *st) {
> +    int ret;
> +    if (S_ISCHR(st->st_mode)) {
> +        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {

The ioctl must be within #ifdef CONFIG_LINUX since SG_GET_SG_TABLESIZE
will be undefined on other operating systems and a compiler error will
be encountered. Maybe keep the #ifdef around the entire body of this
hdev_get_max_segments().

> +            return ret;
> +        }
> +        return -ENOTSUP;
>      }
> -    g_free(sysfspath);
> -    return ret;
> -#else
> -    return -ENOTSUP;
> -#endif
> +    return get_sysfs_long_val(st, "max_segments");

Where is get_sysfs_long_val() defined? Maybe in a later patch? The code
must compile after each patch. You can test this with "git rebase -i
origin/master" and then adding "x make" lines after each commit in the
interactive rebase file. When rebase runs it will execute make after
each commit and will stop if make fails.

--6XoFijmJ2Sk/6zPe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMEC68ACgkQnKSrs4Gr
c8jAkQf9HUrBF7kYxIDli8R/NetMzbE0Y+YgMVcnRODuXNMl8bs1BNy78DkYtTJM
z+OJT7nQHiQ7s9Dti6pZ/ADrXtwcqMkrcl7h5ymrbUoYdlFzEBisF9ate8GLGFq0
1ze44IxTGbCS5fCm1SjU9DILe1vTgD8cneIKpdUsLcayJTJCeHY1EtofKABKKUVh
8InRyXZumMd1EqyFNU1Up21zJRUP0zjmE6lTyOl6bpVFBea/zZ/8iEtm5HZJS6Ds
DEqvbZ6Kt3zXGqeqjypeHHiFw5laY/8t2nsifZdy6c/qCdUcvfefaCZAb5kFIXuA
3SScmgi6rwDE7q3tsmjlTu4xR2WGAg==
=CBC7
-----END PGP SIGNATURE-----

--6XoFijmJ2Sk/6zPe--


