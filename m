Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570624EB115
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:54:01 +0200 (CEST)
Received: from localhost ([::1]:58424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZEAS-0008Tz-Ey
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:54:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZE9N-00076m-AK
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:52:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZE9L-0004Jr-AP
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:52:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648569170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XGEt4wUVnMlKJKHzNP34QEKPd4p9iRz2O3yY3jV+UxE=;
 b=B+4Axe9q6dumpDAQvVQkmC5mFJkmSt6+1Jo3SH+aBZFGde6Lz/TnuKWJud3AjevZ+0FUN3
 7idnu+EUgw8Z/w0Z6RVUELBzp/AbgrmTNUy/frTPM5GkANRPS2HackHBI6oPL7FygIamiA
 jKWpi7QFlsAIh8zzWqFN1D4MeRFgkOQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-LHZWzCcqMz60AlU6pAZIEw-1; Tue, 29 Mar 2022 11:52:48 -0400
X-MC-Unique: LHZWzCcqMz60AlU6pAZIEw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 799491C05EC5
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 15:52:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5533B40149B2;
 Tue, 29 Mar 2022 15:52:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 48D9721E691D; Tue, 29 Mar 2022 17:52:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Subject: Re: [PATCH v3 11/14] qapi: fix example of MEMORY_FAILURE
References: <20220328140604.41484-1-victortoso@redhat.com>
 <20220328140604.41484-12-victortoso@redhat.com>
Date: Tue, 29 Mar 2022 17:52:47 +0200
In-Reply-To: <20220328140604.41484-12-victortoso@redhat.com> (Victor Toso's
 message of "Mon, 28 Mar 2022 16:06:01 +0200")
Message-ID: <87wngczrg0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Victor Toso <victortoso@redhat.com> writes:

> Example output lacks mandatory member @timestamp.  Provide it.
>
> While @flags is an optional member,

Uh, it isn't.

>                                     if it is defined then all its
> members should be include. For that reason, we add @recursive member.

Perhaps:

  Example output lacks mandatory member flags.recursive.  Provide it.

Happy to make such a change in my tree.

> Minor: Change quotes from '' to "" in @action-required member.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> Reviewed-by: John Snow <jsnow@redhat.com>
> ---
>  qapi/run-state.json | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/run-state.json b/qapi/run-state.json
> index 7f1c788c4e..8124220bd9 100644
> --- a/qapi/run-state.json
> +++ b/qapi/run-state.json
> @@ -571,7 +571,9 @@
>  # <- { "event": "MEMORY_FAILURE",
>  #      "data": { "recipient": "hypervisor",
>  #                "action": "fatal",
> -#                "flags": { 'action-required': false } }
> +#                "flags": { "action-required": false,
> +#                           "recursive": false } },
> +#      "timestamp": { "seconds": 1267061043, "microseconds": 959568 } }
>  #
>  ##
>  { 'event': 'MEMORY_FAILURE',

With the commit message fixed:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


