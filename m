Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DD33CD47E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:16:14 +0200 (CEST)
Received: from localhost ([::1]:53068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5SBx-0002HJ-EU
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1m5SAp-0001Ot-Mk
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:15:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1m5SAo-0004AT-7U
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:15:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626696901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=42i2AVS4ekXonvZvknPzkpvBN7X926Y4ZMoFftHqHeI=;
 b=ZWvTvdlYo1Ow6GxD0SQwCNn8ackqWvJlEWwN65elI16E5gsDdZfk9GROSteD1rV+T4XbZI
 i54+e+YuRS2DUW4ksWM5MCf2o6lSnkqeLHl4HgIaLlmooARWx+xtghgoQsrsESbVVK3NRG
 HnrIlNQtaClV/Lo7hFZW/gRZi2r2iqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-nDKk7NXfOkWdKRjG40223Q-1; Mon, 19 Jul 2021 08:13:48 -0400
X-MC-Unique: nDKk7NXfOkWdKRjG40223Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31C2F800FF0;
 Mon, 19 Jul 2021 12:13:47 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5440D17CC8;
 Mon, 19 Jul 2021 12:13:42 +0000 (UTC)
Date: Mon, 19 Jul 2021 14:13:39 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 13/13] docs/deprecated: deprecate passing plugin args
 through `arg=`
Message-ID: <YPVsc92kZMvnNC03@angien.pipo.sk>
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
 <20210717100920.240793-14-ma.mandourr@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210717100920.240793-14-ma.mandourr@gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>, cota@braap.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 17, 2021 at 12:09:20 +0200, Mahmoud Mandour wrote:
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  docs/system/deprecated.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index e2e0090878..aaf0ee5777 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -126,6 +126,12 @@ other options have been processed.  This will either have no effect (if
>  if they were not given.  The property is therefore useless and should not be
>  specified.
>  
> +Plugin argument passing through ``arg=<string>`` (since 6.1)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Passing arguments through ``arg=`` is redundant is makes the command-line less
> +readable, especially when the argument itself consist of a name and a value,
> +e.g. ``arg="arg_name=arg_value"``. Therefore, the usage of ``arg`` is redundant.

Based on this entry itself it's hard to figure out that this is for TCG
plugings. Preferably reword that entry so it's more clear.

Libvirt isn't setting these so it's okay to deprecate/remove from our
point of view.


