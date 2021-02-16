Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1804831CCDA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:24:17 +0100 (CET)
Received: from localhost ([::1]:42126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC2D2-0007aI-2e
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lC23n-0000uS-10
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:14:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lC23k-0007QR-6U
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:14:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613488479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m47PQ4vaMwg3O9uAtaToJpLvGBGRAO6D4F3ocV+auzQ=;
 b=PZbfJeVOyMvK0SziGsWHyc++/rteTHd0Gy5ETATJ+s/qqfvNKBWUyH48udWo6wqMuMRLpd
 zCaB0Bg5DNYnkHdlWK4+kQphhpCSIf6da1vSp7K1pP7+e4yBnjhTuxNfB0tPA2Xyd7v/Jn
 jxWKDZfhqNeFwqr7SrAqX3zx4/PrP/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-ZaYRJvXENieDP3uGSJ1dLQ-1; Tue, 16 Feb 2021 10:14:37 -0500
X-MC-Unique: ZaYRJvXENieDP3uGSJ1dLQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 465F21005501
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 15:14:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-100.ams2.redhat.com
 [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BFBD60C15;
 Tue, 16 Feb 2021 15:14:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8F4B4113865F; Tue, 16 Feb 2021 16:14:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 6/6] tests/qapi-schema: Test cases for aliases
References: <20210211183118.422036-1-kwolf@redhat.com>
 <20210211183118.422036-7-kwolf@redhat.com>
Date: Tue, 16 Feb 2021 16:14:34 +0100
In-Reply-To: <20210211183118.422036-7-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 11 Feb 2021 19:31:18 +0100")
Message-ID: <87eehgrqn9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
[...]
> diff --git a/tests/qapi-schema/alias-name-bad-type.err b/tests/qapi-schema/alias-name-bad-type.err
> new file mode 100644
> index 0000000000..489f45ff9b
> --- /dev/null
> +++ b/tests/qapi-schema/alias-name-bad-type.err
> @@ -0,0 +1,2 @@
> +alias-name-bad-type.json: In struct 'AliasStruct0':
> +alias-name-bad-type.json:1: alias member 'name' requires a string name

Would "'aliases' member 'name'..." be more consistent?

> diff --git a/tests/qapi-schema/alias-name-bad-type.json b/tests/qapi-schema/alias-name-bad-type.json
> new file mode 100644
> index 0000000000..17442d5939
> --- /dev/null
> +++ b/tests/qapi-schema/alias-name-bad-type.json
> @@ -0,0 +1,3 @@
> +{ 'struct': 'AliasStruct0',
> +  'data': { 'foo': 'int' },
> +  'aliases': [ { 'name': ['bar'], 'source': ['foo'] } ] }
> diff --git a/tests/qapi-schema/alias-name-bad-type.out b/tests/qapi-schema/alias-name-bad-type.out
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qapi-schema/alias-source-bad-type.err b/tests/qapi-schema/alias-source-bad-type.err
> new file mode 100644
> index 0000000000..b1779cbb8e
> --- /dev/null
> +++ b/tests/qapi-schema/alias-source-bad-type.err
> @@ -0,0 +1,2 @@
> +alias-source-bad-type.json: In struct 'AliasStruct0':
> +alias-source-bad-type.json:1: alias member 'source' must be an array

Would "'aliases' member 'source'..." be more consistent?

> diff --git a/tests/qapi-schema/alias-source-bad-type.json b/tests/qapi-schema/alias-source-bad-type.json
> new file mode 100644
> index 0000000000..d6a7430ee3
> --- /dev/null
> +++ b/tests/qapi-schema/alias-source-bad-type.json
> @@ -0,0 +1,3 @@
> +{ 'struct': 'AliasStruct0',
> +  'data': { 'foo': 'int' },
> +  'aliases': [ { 'name': 'bar', 'source': 'foo' } ] }
> diff --git a/tests/qapi-schema/alias-source-bad-type.out b/tests/qapi-schema/alias-source-bad-type.out
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qapi-schema/alias-source-elem-bad-type.err b/tests/qapi-schema/alias-source-elem-bad-type.err
> new file mode 100644
> index 0000000000..f73fbece77
> --- /dev/null
> +++ b/tests/qapi-schema/alias-source-elem-bad-type.err
> @@ -0,0 +1,2 @@
> +alias-source-elem-bad-type.json: In struct 'AliasStruct0':
> +alias-source-elem-bad-type.json:1: member of alias member 'source' requires a string name

Would "member of 'aliases' member 'source'..." be more consistent?

[...]


