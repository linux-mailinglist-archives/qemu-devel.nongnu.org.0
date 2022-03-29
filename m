Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DC44EB107
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:51:39 +0200 (CEST)
Received: from localhost ([::1]:52722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZE8A-0004Yd-Kw
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:51:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZE35-0000Wg-4y
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:46:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZE32-0003A7-K9
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648568778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9VUrHEceE+xmOsyHp8LnRuNOTJ3g14koc/tRCJxlj+c=;
 b=gDevA8S/oJVRYFDYfd5a8tyZi0huBow7gCjCXhyK2NsuPRSn/XP6/Mqt5b76lNtEJXnXs1
 Pl3giwfe8XbV37fpyeUbvqRMDldFan3cehxuS7q0jTU9TjsTBFUSBFEyTwIAPyZK0fowZx
 qVT+mjhIDjCw3LSclxb012qXNMz7mz4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-2Q7OFrgqNZyd5VhQkwjS-Q-1; Tue, 29 Mar 2022 11:46:15 -0400
X-MC-Unique: 2Q7OFrgqNZyd5VhQkwjS-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0775E801585
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 15:46:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 870F9C15E71;
 Tue, 29 Mar 2022 15:46:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8001C21E691D; Tue, 29 Mar 2022 17:46:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Subject: Re: [PATCH v3 10/14] qapi: run-state examples: add missing @timestamp
References: <20220328140604.41484-1-victortoso@redhat.com>
 <20220328140604.41484-11-victortoso@redhat.com>
Date: Tue, 29 Mar 2022 17:46:13 +0200
In-Reply-To: <20220328140604.41484-11-victortoso@redhat.com> (Victor Toso's
 message of "Mon, 28 Mar 2022 16:06:00 +0200")
Message-ID: <871qyk224a.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

> The changed examples were lacking mandatory member @timestamp.
> Provide it.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> Reviewed-by: John Snow <jsnow@redhat.com>
> ---
>  qapi/run-state.json | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/run-state.json b/qapi/run-state.json
> index 1b9f64c9cd..7f1c788c4e 100644
> --- a/qapi/run-state.json
> +++ b/qapi/run-state.json
> @@ -426,7 +426,8 @@
>  # Example:
>  #
>  # <- { "event": "GUEST_PANICKED",
> -#      "data": { "action": "pause" } }
> +#      "data": { "action": "pause" },
> +#      "timestamp": { "seconds": 1648245231, "microseconds": 900001 } }
>  #
>  ##
>  { 'event': 'GUEST_PANICKED',
> @@ -446,7 +447,8 @@
>  # Example:
>  #
>  # <- { "event": "GUEST_CRASHLOADED",
> -#      "data": { "action": "run" } }
> +#      "data": { "action": "run" },
> +#      "timestamp": { "seconds": 1648245259, "microseconds": 893771 } }
>  #
>  ##
>  { 'event': 'GUEST_CRASHLOADED',

Reviewed-by: Markus Armbruster <armbru@redhat.com>


