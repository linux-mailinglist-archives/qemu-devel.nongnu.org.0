Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2DA2CBA5F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:21:51 +0100 (CET)
Received: from localhost ([::1]:39584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPGg-0002Wz-SU
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:21:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kkOtg-0000IF-K3
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:58:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kkOtf-0004qS-0D
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:58:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606903082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CQRWZ1dGgGJR/LGZXhMXO9qmxKCRNGCN8wcvq0erzoo=;
 b=Qg3izmjnieZfR5Q3PIq1D8Yt6UUCOJ/gPcKiIhuG4OfoDx4XBDS0Lql9clyEF2+oIxoDlS
 3qAWLZrPYBCAVOk8Ewx94qXpHdRS4f/MLx9bWQUGhNIB4il8/H48GmqzXxtZmO+BIPtg43
 RvLRATDhPq816r0f/hL3tLFZpv8fpLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-tkFjf_BJP2utvVH0HdguJA-1; Wed, 02 Dec 2020 04:58:00 -0500
X-MC-Unique: tkFjf_BJP2utvVH0HdguJA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75B2F185E48F;
 Wed,  2 Dec 2020 09:57:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DEE35D9C6;
 Wed,  2 Dec 2020 09:57:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C0E71113864E; Wed,  2 Dec 2020 10:57:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zihao Chang <changzihao1@huawei.com>
Subject: Re: [PATCH] docs/devel/writing-qmp-commands.txt: Fix docs
References: <20201201143308.1626-1-changzihao1@huawei.com>
Date: Wed, 02 Dec 2020 10:57:57 +0100
In-Reply-To: <20201201143308.1626-1-changzihao1@huawei.com> (Zihao Chang's
 message of "Tue, 1 Dec 2020 22:33:08 +0800")
Message-ID: <87czzs5y3e.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, xiexiangyou@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zihao Chang <changzihao1@huawei.com> writes:

> Fix the example of add qmp hello-world example.
> Without ":", make will report error:
> ../qapi/misc.json:573:2: line should end with ':'
>
> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
> ---
>  docs/devel/writing-qmp-commands.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/devel/writing-qmp-commands.txt b/docs/devel/writing-qmp-commands.txt
> index 46a6c48683..28984686c9 100644
> --- a/docs/devel/writing-qmp-commands.txt
> +++ b/docs/devel/writing-qmp-commands.txt
> @@ -243,7 +243,7 @@ There are many examples of such documentation in the schema file already, but
>  here goes "hello-world"'s new entry for qapi/misc.json:
>  
>  ##
> -# @hello-world
> +# @hello-world:
>  #
>  # Print a client provided string to the standard output stream.
>  #

Queued, thanks!


