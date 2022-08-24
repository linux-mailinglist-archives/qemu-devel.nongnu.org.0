Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B795A011C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 20:09:52 +0200 (CEST)
Received: from localhost ([::1]:60996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQup5-0006ed-Hh
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 14:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQuhB-0005yh-55
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:01:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQuh9-0008Hm-DA
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661364098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m5/BgDRNhY5P/EVG3C31Ny/2iI/rtCWvqfG7divRu7w=;
 b=ikx0o8ZI9KPzpCZ83b47wCs8kuZdYF4FtuZ42GPzDan2jMN4TS6OyEZgn/By7/WiGG2V5y
 upKf/ueknPupofxBd2F5ILxbTfhIHkFhk5XFgeI9JiyDVqhwSC141XXx9F9eNYnpZw6O8f
 F0Ja1pncHxc9IJWC5ARm03OBGocOJ+0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-fjSzEgD2POK6HMjBnpemJw-1; Wed, 24 Aug 2022 14:01:35 -0400
X-MC-Unique: fjSzEgD2POK6HMjBnpemJw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D57CF18812CA;
 Wed, 24 Aug 2022 18:01:34 +0000 (UTC)
Received: from localhost (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55251C15BB3;
 Wed, 24 Aug 2022 18:01:34 +0000 (UTC)
Date: Wed, 24 Aug 2022 14:01:32 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
Cc: qemu-devel@nongnu.org, mst@redhat.com, raphael.norwitz@nutanix.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 yc-core@yandex-team.ru
Subject: Re: [PATCH v1 4/5] vhost-user-blk: make 'config_wce' part of
 'host_features'
Message-ID: <YwZnfM9MzHgTPFSt@fedora>
References: <20220824091837.301708-1-d-tatianin@yandex-team.ru>
 <20220824091837.301708-5-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="evzf3LLf84Sf5W4u"
Content-Disposition: inline
In-Reply-To: <20220824091837.301708-5-d-tatianin@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


--evzf3LLf84Sf5W4u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 24, 2022 at 12:18:36PM +0300, Daniil Tatianin wrote:
> @@ -591,7 +588,8 @@ static Property vhost_user_blk_properties[] = {
>      DEFINE_PROP_UINT16("num-queues", VHostUserBlk, num_queues,
>                         VHOST_USER_BLK_AUTO_NUM_QUEUES),
>      DEFINE_PROP_UINT32("queue-size", VHostUserBlk, queue_size, 128),
> -    DEFINE_PROP_BIT("config-wce", VHostUserBlk, config_wce, 0, true),
> +    DEFINE_PROP_BIT64("config-wce", VHostUserBlk, host_features,
> +                      VIRTIO_BLK_F_CONFIG_WCE, true),

Please use parent_obj.host_features instead of a VHostUserBlk
host_features field.

--evzf3LLf84Sf5W4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMGZ3wACgkQnKSrs4Gr
c8hxEwgAm7R+yevEgEjDbEUev04zufFjJeNJ/YD8ce4HVBR6sj0KO/Sz8E/MPrh+
ZjvYlJk+1dGnL32sSuuutesDihfQnl78VUutcu5dRD9nIRFuy7jIZqPcoSs5PT9P
rWyqL3p1DoWxPww2NiLZnA1aDFuZu2KrzDtpmeGczAQu33Ps/kUhBm8KoXJpfYZU
WgHxpgDBRhoks673bY9Btc+rE66BOMfVtPrfy8qGUZeO2YMBh0j4X0BZW4Xy5Bum
/HlPdKE4nDwgEtbgpCOQiuzVJv/Dqsgsl9BgwHs70/QjIQHfJ18bxR9mgumvINcS
4z0IaC7UKFFTPm0n4bNkSVU/vPWPKg==
=AeQW
-----END PGP SIGNATURE-----

--evzf3LLf84Sf5W4u--


