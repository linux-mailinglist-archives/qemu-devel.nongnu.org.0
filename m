Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 022574EB0E4
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:45:46 +0200 (CEST)
Received: from localhost ([::1]:45428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZE2T-0007fU-48
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:45:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZDy0-0002xb-VA
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:41:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZDxz-00024A-Ex
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:41:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648568467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H7dvEms1itzW/usS3okWo/JN/1G90BwDqTDVqgPoHyE=;
 b=JRWWGi0TPVgTk2jr5NT0SttX6h9vEwAw26RhUSDzpW/NJq7dh4eNiWx4i++Klx4yIvQ6Wj
 qiv5yEuZDQiqse5IMrFOyvEVnNzUonDRq3eyzJSFMES52GXd5Ru8irKq9HsRV5QgX4ef4O
 OOfxr2KiQ/sqe4At+MqWq33ZyJZsTe4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-beljs1raOmePmtJcQp_uJQ-1; Tue, 29 Mar 2022 11:41:05 -0400
X-MC-Unique: beljs1raOmePmtJcQp_uJQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49B46899ED6
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 15:41:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1890440CF8ED;
 Tue, 29 Mar 2022 15:41:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0CEC521E691D; Tue, 29 Mar 2022 17:41:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Subject: Re: [PATCH v3 08/14] qapi: fix example of FAILOVER_NEGOTIATED event
References: <20220328140604.41484-1-victortoso@redhat.com>
 <20220328140604.41484-9-victortoso@redhat.com>
Date: Tue, 29 Mar 2022 17:41:04 +0200
In-Reply-To: <20220328140604.41484-9-victortoso@redhat.com> (Victor Toso's
 message of "Mon, 28 Mar 2022 16:05:58 +0200")
Message-ID: <87a6d822cv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

> Example output lacks mandatory member @timestamp.  Provide it.
>
> Event's documentation is not properly formatted. Fix it by:
> - Adding @ to "device-id"
> - Adding extra line for "Since" section
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> Reviewed-by: John Snow <jsnow@redhat.com>
> ---
>  qapi/net.json | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/net.json b/qapi/net.json
> index 7fab2e7cd8..0d4578bd07 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -685,13 +685,15 @@
>  # Failover primary devices which were hidden (not hotplugged when requested)
>  # before will now be hotplugged by the virtio-net standby device.
>  #
> -# device-id: QEMU device id of the unplugged device
> +# @device-id: QEMU device id of the unplugged device
> +#
>  # Since: 4.2
>  #
>  # Example:
>  #
>  # <- { "event": "FAILOVER_NEGOTIATED",
> -#      "data": "net1" }
> +#      "data": { "device-id": "net1" },
> +#      "timestamp": { "seconds": 1368697518, "microseconds": 326866 } }
>  #
>  ##
>  { 'event': 'FAILOVER_NEGOTIATED',

Reviewed-by: Markus Armbruster <armbru@redhat.com>


