Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEB0447A36
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 06:43:49 +0100 (CET)
Received: from localhost ([::1]:45654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjxRc-0003Ih-B7
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 00:43:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mjxPE-0002VW-DR
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 00:41:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mjxPB-0003kf-MP
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 00:41:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636350076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u9PgLQqrNNacEdHgXgQuSkmovfWt16VAT4RSfgldIaY=;
 b=UZLeIYBtx/uc+feb+ktV7iGRqCfKFFUCwR7ONnfERS17Fn8QFkc3KAVnUaZjK1EW7W4PZc
 LooCqxhiWmvTQM6UUFCwSdudSC6WfyDw9zo66HjarWwy4/yhcakq4UpEtG7lD/xqBl8U6r
 MexAFTm66Lrz4LRddJaSTPqm6G2tCUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-El8ctj7APQWqJuppXaVqsQ-1; Mon, 08 Nov 2021 00:41:14 -0500
X-MC-Unique: El8ctj7APQWqJuppXaVqsQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E992E1023F56;
 Mon,  8 Nov 2021 05:41:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E5A65B826;
 Mon,  8 Nov 2021 05:41:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D0F9F11380A7; Mon,  8 Nov 2021 06:41:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PULL 2/2] docs: fix qemu incorrect tag
References: <20211106232941.46184-1-quintela@redhat.com>
 <20211106232941.46184-3-quintela@redhat.com>
Date: Mon, 08 Nov 2021 06:41:07 +0100
In-Reply-To: <20211106232941.46184-3-quintela@redhat.com> (Juan Quintela's
 message of "Sun, 7 Nov 2021 00:29:41 +0100")
Message-ID: <87ee7rqk5o.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?utf-8?Q?Hyman_Huang=28=E9=BB=84?= =?utf-8?Q?=E5=8B=87=29?=
 <huangy81@chinatelecom.cn>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Juan Quintela <quintela@redhat.com> writes:

> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> The patchset merged in 71864eadd9a ("migration/dirtyrate:
> introduce struct and adjust DirtyRateStat") was targeting
> QEMU 6.1 but got merged later, so correct the tag for 6.2.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  qapi/migration.json | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 87146ceea2..f0aefdab64 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1740,7 +1740,7 @@
>  #
>  # @dirty-rate: dirty rate.
>  #
> -# Since: 6.1
> +# Since: 6.2
>  #
>  ##
>  { 'struct': 'DirtyRateVcpu',
> @@ -1774,7 +1774,7 @@
>  #
>  # @dirty-bitmap: calculate dirtyrate by dirty bitmap.
>  #
> -# Since: 6.1
> +# Since: 6.2
>  #
>  ##
>  { 'enum': 'DirtyRateMeasureMode',
> @@ -1796,13 +1796,13 @@
>  # @calc-time: time in units of second for sample dirty pages
>  #
>  # @sample-pages: page count per GB for sample dirty pages
> -#                the default value is 512 (since 6.1)
> +#                the default value is 512 (since 6.2)

This one got merged into 6.1 in commit 7afa08cd8fd.  Please revert this
line.

>  #
>  # @mode: mode containing method of calculate dirtyrate includes
> -#        'page-sampling' and 'dirty-ring' (Since 6.1)
> +#        'page-sampling' and 'dirty-ring' (Since 6.2)
>  #
>  # @vcpu-dirty-rate: dirtyrate for each vcpu if dirty-ring
> -#                   mode specified (Since 6.1)
> +#                   mode specified (Since 6.2)
>  #
>  # Since: 5.2
>  #


