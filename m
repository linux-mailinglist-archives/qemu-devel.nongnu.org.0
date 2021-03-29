Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF3034D5AE
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 19:06:22 +0200 (CEST)
Received: from localhost ([::1]:49106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQvLJ-0003c3-84
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 13:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQvJ9-0002YM-TN
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:04:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQvJ6-0002g4-18
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:04:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617037440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wp3AEvLGv/7V8ORRBrh5sT92kKx9EamLMt8CM35s/v8=;
 b=KcFMPeDVSU151/vAVljoMHrfFqF2PgsdTz8v0ilJOg/L3BFcb5kzLVb+5NQ3lvmUrK9PLE
 gbHTcvm4PZUpB6QKaXdNq56j4cCbx/CcATHawTuxEvZHtPluudfzLjqxgKbXNkHNNIc6jn
 9/Oc6UZZiNXADfnUkMmV5eRos3dybbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-7MZmLcB7MVutQA79rxqKUg-1; Mon, 29 Mar 2021 13:03:56 -0400
X-MC-Unique: 7MZmLcB7MVutQA79rxqKUg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D227E10866A0;
 Mon, 29 Mar 2021 17:03:54 +0000 (UTC)
Received: from localhost (ovpn-114-227.ams2.redhat.com [10.36.114.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9598371282;
 Mon, 29 Mar 2021 17:03:50 +0000 (UTC)
Date: Mon, 29 Mar 2021 18:03:49 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [RFC 1/8] memory: Allow eventfd add/del without starting a
 transaction
Message-ID: <YGIIdUlzJR7TlhTR@stefanha-x1.localdomain>
References: <20210325150735.1098387-1-groug@kaod.org>
 <20210325150735.1098387-2-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210325150735.1098387-2-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N91tuIoE9rW0q5BO"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--N91tuIoE9rW0q5BO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 04:07:28PM +0100, Greg Kurz wrote:
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 5728a681b27d..98ed552e001c 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1848,13 +1848,25 @@ void memory_region_clear_flush_coalesced(MemoryRe=
gion *mr);
>   * @match_data: whether to match against @data, instead of just @addr
>   * @data: the data to match against the guest write
>   * @e: event notifier to be triggered when @addr, @size, and @data all m=
atch.
> + * @transaction: whether to start a transaction for the change

"start" is unclear. Does it begin a transaction and return with the
transaction unfinished? I think instead the function performs the
eventfd addition within a transaction. It would be nice to clarify this.

>   **/
> -void memory_region_add_eventfd(MemoryRegion *mr,
> -                               hwaddr addr,
> -                               unsigned size,
> -                               bool match_data,
> -                               uint64_t data,
> -                               EventNotifier *e);
> +void memory_region_add_eventfd_full(MemoryRegion *mr,
> +                                    hwaddr addr,
> +                                    unsigned size,
> +                                    bool match_data,
> +                                    uint64_t data,
> +                                    EventNotifier *e,
> +                                    bool transaction);
> +
> +static inline void memory_region_add_eventfd(MemoryRegion *mr,
> +                                             hwaddr addr,
> +                                             unsigned size,
> +                                             bool match_data,
> +                                             uint64_t data,
> +                                             EventNotifier *e)
> +{
> +    memory_region_add_eventfd_full(mr, addr, size, match_data, data, e, =
true);
> +}
> =20
>  /**
>   * memory_region_del_eventfd: Cancel an eventfd.
> @@ -1868,13 +1880,25 @@ void memory_region_add_eventfd(MemoryRegion *mr,
>   * @match_data: whether to match against @data, instead of just @addr
>   * @data: the data to match against the guest write
>   * @e: event notifier to be triggered when @addr, @size, and @data all m=
atch.
> + * @transaction: whether to start a transaction for the change

Same here.

--N91tuIoE9rW0q5BO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBiCHUACgkQnKSrs4Gr
c8jP2QgApDEJasjLBfIH2fF5FgSxhN0Y/rT1Qjj8h5avR0Aewe1Nbn+PP1War7T5
zRkx2V8+JNB/ydWsfK1Zu1CxoIF9gehPyEDtydDmtzdOkak+UQjx+f5s+5z1j1Qo
jGilOijvnTMTDZMSqKU3Jn/BtQlKUlujcnk76WJi+crS7lnX7qDag/1yHw9w+hQJ
CbH5MTIn+oXIee3LGfkWv4VRlQ/WFD38HqLveMFWchcRH1VcF556gajos07D0GiV
ly+Y03V8N9wnl4mAl5iGt8I4tnnOndAg4mOBELBUp304MKUK8oDsDOaZvVS4qIt/
dMW6KfAf024Mbw2m8oY6OHc4owuLaQ==
=itIn
-----END PGP SIGNATURE-----

--N91tuIoE9rW0q5BO--


