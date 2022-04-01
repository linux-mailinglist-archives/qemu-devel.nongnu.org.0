Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F504EE978
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 10:03:20 +0200 (CEST)
Received: from localhost ([::1]:48126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naCFa-0007ho-EF
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 04:03:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1naC9G-0004xd-FS
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 03:56:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1naC9E-0003eI-1q
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 03:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648799803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nfpymmPQ3jCbS4pr+JXfCWbzdUie9BBO3g8BNuLo4PE=;
 b=Hg6RA+tmkS0o8tQFioTw48gZmlkaNL/me/uelFcC2APvHRf+H8rW7nt4/rW6/RGuVniWtC
 ebxmv8rKlgOfwSdAEsyGDRpEiP6/ZJ5R2KOnXEeB6zurMs1lmzKZGfky6S9tFDru2Had40
 HmZi8xqfOaMOcb0TefvuIBo7YZUijpw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-uaSaSVIfOXKmTArZyVHzIQ-1; Fri, 01 Apr 2022 03:56:41 -0400
X-MC-Unique: uaSaSVIfOXKmTArZyVHzIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9546D2803584
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 07:56:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64D3F1454536;
 Fri,  1 Apr 2022 07:56:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3D91B21E691D; Fri,  1 Apr 2022 09:56:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Subject: Re: [PATCH v1 1/9] qapi: fix example of netdev_add command
References: <20220331190633.121077-1-victortoso@redhat.com>
 <20220331190633.121077-2-victortoso@redhat.com>
Date: Fri, 01 Apr 2022 09:56:40 +0200
In-Reply-To: <20220331190633.121077-2-victortoso@redhat.com> (Victor Toso's
 message of "Thu, 31 Mar 2022 21:06:25 +0200")
Message-ID: <87tubdb5jb.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

> Example output has the optional member @dnssearch as string type. It
> should be an array of strings instead. Fix it.
>
> For reference, see NetdevUserOptions.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/net.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qapi/net.json b/qapi/net.json
> index 0d4578bd07..efc0bae170 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -51,7 +51,7 @@
>  #
>  # -> { "execute": "netdev_add",
>  #      "arguments": { "type": "user", "id": "netdev1",
> -#                     "dnssearch": "example.org" } }
> +#                     "dnssearch": [ "example.org" ] } }
>  # <- { "return": {} }
>  #
>  ##

Uh, @dnssearch is ['String']...  shouldn't this be something like

   #                     "dnssearch": [ { "str": "example.org" } ] } }

?


