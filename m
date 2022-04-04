Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F724F0F34
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 08:22:02 +0200 (CEST)
Received: from localhost ([::1]:35712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbG6C-0007ts-I6
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 02:22:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbFyr-0006LD-QC
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 02:14:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbFyp-0003rL-5p
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 02:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649052861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W65qgceN4Il3Xvxwnl1ZTXv1SWdBzeC66tQk17IjDsg=;
 b=Y+sEU1aALn/jKMCPIBiQ2TcDNqETJqPS2b4P92X2RL6PIw7Kd2Z79oX1Avw90gtj97CLC3
 A4QKJ6/nxCg58m6hTjN5c505sOIQzRYTf0rTQ9n+5mkex1cceuBfUCkLHtuhCxp3eyj4H2
 HpuAHFqC8f9trEqKxoRRh/PY0YLlIoo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380--azQY_PiOaewGREwS2toVw-1; Mon, 04 Apr 2022 02:14:20 -0400
X-MC-Unique: -azQY_PiOaewGREwS2toVw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EAF61C12DE0
 for <qemu-devel@nongnu.org>; Mon,  4 Apr 2022 06:14:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E01752156897;
 Mon,  4 Apr 2022 06:14:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6A92E21E6906; Mon,  4 Apr 2022 08:14:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Subject: Re: [PATCH v1.1 1/9] qapi: fix example of netdev_add command
References: <20220331190633.121077-2-victortoso@redhat.com>
 <20220401110712.26911-1-victortoso@redhat.com>
Date: Mon, 04 Apr 2022 08:14:11 +0200
In-Reply-To: <20220401110712.26911-1-victortoso@redhat.com> (Victor Toso's
 message of "Fri, 1 Apr 2022 13:07:12 +0200")
Message-ID: <87ilrp1iks.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Victor Toso <victortoso@redhat.com> writes:

> Example output has the optional member @dnssearch as string type. It
> should be an array of strings instead. Fix it.

"of String objects".  Happy to fix this in my tree.

>
> For reference, see NetdevUserOptions.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/net.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qapi/net.json b/qapi/net.json
> index 0d4578bd07..b92f3f5fb4 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -51,7 +51,7 @@
>  #
>  # -> { "execute": "netdev_add",
>  #      "arguments": { "type": "user", "id": "netdev1",
> -#                     "dnssearch": "example.org" } }
> +#                     "dnssearch": [ { "str": "example.org" } ] } }
>  # <- { "return": {} }
>  #
>  ##

Preferably with the commit message tweak:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


