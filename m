Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097C33DFDC5
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:18:35 +0200 (CEST)
Received: from localhost ([::1]:54094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBD2n-0005Hr-LZ
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBD24-0004aV-HA
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 05:17:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBD21-00062L-GU
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 05:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628068663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ExvxJD16SHKpI6OODfkqEQWvCCmFk+Td5MKjZBFFgnA=;
 b=SiJzT2Atf/DwDqruM3iIV1oUTKGxWsfSy2/MkHJm2K4zquSV2Gvc78DkcGJfKvHqrjq6tp
 TVkxyowc1ZRTus4Jm5rm8CcRCg7JlURMJ/HsMwDH3qo4/stjfYJN63hx279YUvMzl8Xo9x
 lk5zVewcTDIDRmnKcF48B3td8sJgcJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-5l_SPG4FPqSGHUSPhfa2uQ-1; Wed, 04 Aug 2021 05:17:40 -0400
X-MC-Unique: 5l_SPG4FPqSGHUSPhfa2uQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAE2C801B3C
 for <qemu-devel@nongnu.org>; Wed,  4 Aug 2021 09:17:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C10A19C44;
 Wed,  4 Aug 2021 09:17:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EE0E411380A0; Wed,  4 Aug 2021 11:17:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] docs: convert writing-qmp-commands.txt to
 writing-qmp-commands.rst
References: <20210721165015.2180311-1-jsnow@redhat.com>
Date: Wed, 04 Aug 2021 11:17:37 +0200
In-Reply-To: <20210721165015.2180311-1-jsnow@redhat.com> (John Snow's message
 of "Wed, 21 Jul 2021 12:50:15 -0400")
Message-ID: <87eeb9in66.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> This does about the bare minimum, converting section headers to ReST
> ones and adding an indent for code blocks.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  docs/devel/index.rst                          |   1 +
>  ...-commands.txt => writing-qmp-commands.rst} | 581 +++++++++---------
>  2 files changed, 304 insertions(+), 278 deletions(-)
>  rename docs/devel/{writing-qmp-commands.txt => writing-qmp-commands.rst} (61%)
>
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index 153979caf4b..331004ad072 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -42,3 +42,4 @@ modifying QEMU's source code.
>     multi-process
>     ebpf_rss
>     vfio-migration
> +   writing-qmp-commands

Conflicts with your "[PATCH 0/3] docs: convert qapi-code-gen.txt to
qapi-code-gen.rst", resolution is straightforward.  Still, consider
avoiding even trivial conflicts by stacking your work.  Use Based-on:
tags to specify the dependencies.

Same question as for the other series: for 6.1, or "don't rock the boat
now"?

Regardless, both queued.  Thanks!


