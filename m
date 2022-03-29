Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C974EB0DD
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:43:06 +0200 (CEST)
Received: from localhost ([::1]:40624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZDzt-0004M4-N4
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:43:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZDxg-0002XT-DJ
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:40:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZDxe-00021D-7M
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648568445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=//EQWjVzIUeEHb87IFviRMmgOlJeAQCTWW8MDvpd6k0=;
 b=GhZ3m4FmbouzjJB/wkaoby+lwyDwmRbcsT8Zpss9v9sernSVUJ2ZLyAvm2x0lcqE0MGVVS
 ivDyaBe2y5Lin2NaF3+w6Awq6tdRh3rlaejf/7pirl+OWIon4b/DQkHhcPXcuH38a1lMtg
 RYQfFaJPZheqTGJZqRpxlrr6vSMi3ig=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-l1Gg1UX4MlGTswosJ7HG-A-1; Tue, 29 Mar 2022 11:40:43 -0400
X-MC-Unique: l1Gg1UX4MlGTswosJ7HG-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B02C7899ED8
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 15:40:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89186C15E74;
 Tue, 29 Mar 2022 15:40:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7CB1521E691D; Tue, 29 Mar 2022 17:40:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Subject: Re: [PATCH v3 07/14] qapi: fix example of UNPLUG_PRIMARY event
References: <20220328140604.41484-1-victortoso@redhat.com>
 <20220328140604.41484-8-victortoso@redhat.com>
Date: Tue, 29 Mar 2022 17:40:42 +0200
In-Reply-To: <20220328140604.41484-8-victortoso@redhat.com> (Victor Toso's
 message of "Mon, 28 Mar 2022 16:05:57 +0200")
Message-ID: <87ee2k22dh.fsf@pond.sub.org>
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Victor Toso <victortoso@redhat.com> writes:

> Example output lacks mandatory member @timestamp.  Provide it.
>
> Example output is not properly formatted. Fixing it by:
> - Adding '<-' to signalize it is receiving the data;
> - Breaking lines similar to the other examples.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> Reviewed-by: John Snow <jsnow@redhat.com>
> ---
>  qapi/migration.json | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 18e2610e88..092a63354b 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1736,7 +1736,9 @@
>  # Since: 4.2
>  #
>  # Example:
> -#   {"event": "UNPLUG_PRIMARY", "data": {"device-id": "hostdev0"} }
> +# <- { "event": "UNPLUG_PRIMARY",
> +#      "data": { "device-id": "hostdev0" },
> +#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
>  #
>  ##
>  { 'event': 'UNPLUG_PRIMARY',

Reviewed-by: Markus Armbruster <armbru@redhat.com>


