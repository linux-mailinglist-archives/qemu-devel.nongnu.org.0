Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF3738A22A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 11:37:30 +0200 (CEST)
Received: from localhost ([::1]:45922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljf7R-0003O3-DR
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 05:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljf6G-0002gP-S5
 for qemu-devel@nongnu.org; Thu, 20 May 2021 05:36:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljf6F-0005th-17
 for qemu-devel@nongnu.org; Thu, 20 May 2021 05:36:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621503373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vN6BMUgFczRczHb0WYxlwV3u2Ebnamhl5JPvuxx7WnM=;
 b=Ckv382sXR/P2zY+Yc90VPjo6WQ4e34UmF/pZsPUFfSXDPv4W+oySZLJvlUn28kh5HfOPgO
 n6YTiJ547bAZCF29jiZXKDf1dQPuy/2nHkUm8vE6bM1LQGGMMVpG+EfvU+mkCHYVvDsbwq
 bDYu4i9aoRFARec9UVQ8bK8Z0gFgpkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-Csd8mYHCNceqAnUcimioqQ-1; Thu, 20 May 2021 05:36:11 -0400
X-MC-Unique: Csd8mYHCNceqAnUcimioqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B293107ACE6;
 Thu, 20 May 2021 09:36:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE8CC10016F4;
 Thu, 20 May 2021 09:36:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6778B113861E; Thu, 20 May 2021 11:36:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 14/15] qapi/parser: allow 'ch' variable name
References: <20210519183951.3946870-1-jsnow@redhat.com>
 <20210519183951.3946870-15-jsnow@redhat.com>
Date: Thu, 20 May 2021 11:36:08 +0200
In-Reply-To: <20210519183951.3946870-15-jsnow@redhat.com> (John Snow's message
 of "Wed, 19 May 2021 14:39:50 -0400")
Message-ID: <878s49bvcn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Uh, one more little thing... this commit message isn't quite right:

John Snow <jsnow@redhat.com> writes:

> We can have a two-letter variable name, as a treat.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
>
> --

This line is not a separator.

>
> I don't want to use 'chr' or 'char', and in context 'ch' works well
> enough. I will assume that any possible future uses will also be obvious
> enough.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---

This one is.

Two S-o-b.  Okay to manually toss everything after the "--" line?

>  scripts/qapi/pylintrc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
> index 88efbf71cb2..c5275d5f59b 100644
> --- a/scripts/qapi/pylintrc
> +++ b/scripts/qapi/pylintrc
> @@ -43,6 +43,7 @@ good-names=i,
>             _,
>             fp,  # fp = open(...)
>             fd,  # fd = os.open(...)
> +           ch,
>  
>  [VARIABLES]


