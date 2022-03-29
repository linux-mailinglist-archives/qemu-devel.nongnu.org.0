Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC654EB124
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:58:01 +0200 (CEST)
Received: from localhost ([::1]:35604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZEEK-0003o4-Jk
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:58:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZECL-0001gx-S0
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:55:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZECK-0004rv-CP
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:55:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648569355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y6UYnqXRp1ye0aqG34u1Pzjyc7J3KqEvkGAkRLo1q0g=;
 b=R1a39tEfBDxd+/aRQNin2OhcoWKNXz89FocLp0/EyuTLSDtrvjMxTs7zf0rIwaZjL8Y571
 /nR9+UzybvNfYTn/P90emtkLC8BZAlv/qQYDtjVUI3O7cO4YQadaKJQ0feSGJRCt6QdtMN
 KB+XFWieQLQINizP++H2Wfh7Mx2JTIk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672--JHXWUeqNW6xomcUtoy7cQ-1; Tue, 29 Mar 2022 11:55:54 -0400
X-MC-Unique: -JHXWUeqNW6xomcUtoy7cQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07847380391C
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 15:55:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5875C15E71;
 Tue, 29 Mar 2022 15:55:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9976F21E691D; Tue, 29 Mar 2022 17:55:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Subject: Re: [PATCH v3 13/14] qapi: fix example of ACPI_DEVICE_OST event
References: <20220328140604.41484-1-victortoso@redhat.com>
 <20220328140604.41484-14-victortoso@redhat.com>
Date: Tue, 29 Mar 2022 17:55:52 +0200
In-Reply-To: <20220328140604.41484-14-victortoso@redhat.com> (Victor Toso's
 message of "Mon, 28 Mar 2022 16:06:03 +0200")
Message-ID: <87o81ozrav.fsf@pond.sub.org>
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

> Example output lacks mandatory member @timestamp.  Provide it.
>
> Event's @data member is missing @info object. Provide it.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> Reviewed-by: John Snow <jsnow@redhat.com>
> ---
>  qapi/acpi.json | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/acpi.json b/qapi/acpi.json
> index 51f0d55db7..d148f6db9f 100644
> --- a/qapi/acpi.json
> +++ b/qapi/acpi.json
> @@ -133,8 +133,9 @@
>  # Example:
>  #
>  # <- { "event": "ACPI_DEVICE_OST",
> -#      "data": { "device": "d1", "slot": "0",
> -#                "slot-type": "DIMM", "source": 1, "status": 0 } }
> +#      "data": { "info": { "device": "d1", "slot": "0",
> +#                          "slot-type": "DIMM", "source": 1, "status": 0 } },
> +#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
>  #
>  ##
>  { 'event': 'ACPI_DEVICE_OST',

Reviewed-by: Markus Armbruster <armbru@redhat.com>


