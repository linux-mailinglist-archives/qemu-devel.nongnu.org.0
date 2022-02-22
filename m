Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02034BF735
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 12:24:45 +0100 (CET)
Received: from localhost ([::1]:51426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMTHg-0001g1-KS
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 06:24:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMTFC-0000mo-6T
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 06:22:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMTF9-0007LC-6u
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 06:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645528926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EuU57THBz2qYAGgc2mBmccRUJmQWboiTovPVXqZ0Xt0=;
 b=I4aCLwUudtVjtpMqx4O3Qw3XYcqKPEWxeWDHCF5P9Ba9VUaoTb7sahqipdmKA4fKm/wb5x
 w4Aiab0lyruxOjID9FG+pgeyexsR/pjmrixs88DHFQzFWaUiKM9nsRZsZk2HgwQergzM29
 K9EjfAmLxwmxAHod3Bo/vpSTKYLeOAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-zHBnY4bKMeG4h3NmtQP7kQ-1; Tue, 22 Feb 2022 06:22:05 -0500
X-MC-Unique: zHBnY4bKMeG4h3NmtQP7kQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2278D824FA6;
 Tue, 22 Feb 2022 11:22:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD20D7B5EA;
 Tue, 22 Feb 2022 11:22:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4897521608D6; Tue, 22 Feb 2022 12:22:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 2/3] qapi: Document some missing details of
 RTC_CHANGE event
References: <20220221192123.749970-1-peter.maydell@linaro.org>
 <20220221192123.749970-3-peter.maydell@linaro.org>
Date: Tue, 22 Feb 2022 12:22:02 +0100
In-Reply-To: <20220221192123.749970-3-peter.maydell@linaro.org> (Peter
 Maydell's message of "Mon, 21 Feb 2022 19:21:22 +0000")
Message-ID: <87sfsbno2t.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> The RTC_CHANGE event's documentation is missing some details:
>  * the offset argument is in units of seconds
>  * it isn't guaranteed that the RTC will implement the event
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2: add the "RTC might not implement this" note
> ---
>  qapi/misc.json | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 7a70eaa3ffc..0ab235e41f7 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -533,10 +533,12 @@
>  #
>  # Emitted when the guest changes the RTC time.
>  #
> -# @offset: offset between base RTC clock (as specified by -rtc base), and
> -#          new RTC clock value
> +# @offset: offset in seconds between base RTC clock (as specified
> +#          by -rtc base), and new RTC clock value
>  #
>  # Note: This event is rate-limited.
> +#       It is not guaranteed that the RTC in the system implements
> +#       this event, or even that the system has an RTC at all.
>  #
>  # Since: 0.13
>  #

Reviewed-by: Markus Armbruster <armbru@redhat.com>


