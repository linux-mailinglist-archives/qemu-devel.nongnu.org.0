Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8424E95D7
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 13:55:03 +0200 (CEST)
Received: from localhost ([::1]:53610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYnxd-0005xt-Fu
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 07:55:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nYnrZ-00045v-Us
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 07:48:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nYnrV-0006XG-HS
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 07:48:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648468119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tZAmaO/26PbhZ8VeL3nvigBK2y4yTDX0iBfKhsqPKDA=;
 b=bJ9a5qxHNSdzZljMe1pJMqKY2CNKkWDoFUr6r8qI73eBFRGomry+kySl+E5hp6/jHLrkp5
 1mi27im5QdEAzfYDXOhv3DcCSveSlN/b85S4rqycrwLZ1tv5iYOpPoySIZDGJ7qlbODcs4
 CFE2ZaEHQMkH8An4NDw6fI9HN3GDbF0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-B30aFHp0NDib_BYKDcpw_A-1; Mon, 28 Mar 2022 07:48:38 -0400
X-MC-Unique: B30aFHp0NDib_BYKDcpw_A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFE62899EC4
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 11:48:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C029F401E8B;
 Mon, 28 Mar 2022 11:48:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 95F2F21E691D; Mon, 28 Mar 2022 13:48:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Subject: Re: [PATCH] schemas: add missing vim modeline
References: <20220325221605.53995-1-victortoso@redhat.com>
Date: Mon, 28 Mar 2022 13:48:31 +0200
In-Reply-To: <20220325221605.53995-1-victortoso@redhat.com> (Victor Toso's
 message of "Fri, 25 Mar 2022 23:16:05 +0100")
Message-ID: <87a6da9u28.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Victor Toso <victortoso@redhat.com> writes:

> This is the last qapi schema that is missing the modeline.
> Fixes 7e7237cd2b "schemas: add missing vim modeline"
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/pragma.json | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/qapi/pragma.json b/qapi/pragma.json
> index 3bc0335d1f..e6a021c19c 100644
> --- a/qapi/pragma.json
> +++ b/qapi/pragma.json
> @@ -1,3 +1,6 @@
> +# -*- Mode: Python -*-
> +# vim: filetype=python
> +
>  { 'pragma': { 'doc-required': true } }
>  
>  # Whitelists to permit QAPI rule violations; think twice before you


