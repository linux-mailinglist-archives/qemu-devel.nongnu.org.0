Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597CB4EE98E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 10:11:27 +0200 (CEST)
Received: from localhost ([::1]:56622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naCNS-0006Pq-0e
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 04:11:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1naCEv-0001aX-3H
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:02:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1naCEs-0004hh-53
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:02:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648800153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aV1pKFdkADNW/119YtqX7k9wvvZXOVyD5LUG60M8NcU=;
 b=Rnk/GcBE8pTAare0w8iVQgJflH5emNpI9qfyuwqTHp0rvukRU+3ilk+YlvyemUfuj2HX1n
 Ty3TEQfIGVcLeFuXSRHetRkYSuP2Z/EP5B8w4vwffcyCHuW6ufsjUG4i2wwPXPXoHZslDi
 j3TKA/+CYhZPPU4NGeMr3ha5XUP1N4s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-IuWjpvE_NKmyj_VpJBBKJw-1; Fri, 01 Apr 2022 04:02:32 -0400
X-MC-Unique: IuWjpvE_NKmyj_VpJBBKJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42751101A52C
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 08:02:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DDBF1454536;
 Fri,  1 Apr 2022 08:02:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1645621E691D; Fri,  1 Apr 2022 10:02:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Subject: Re: [PATCH v1 3/9] qapi: fix example of query-named-block-nodes
 command
References: <20220331190633.121077-1-victortoso@redhat.com>
 <20220331190633.121077-4-victortoso@redhat.com>
Date: Fri, 01 Apr 2022 10:02:31 +0200
In-Reply-To: <20220331190633.121077-4-victortoso@redhat.com> (Victor Toso's
 message of "Thu, 31 Mar 2022 21:06:27 +0200")
Message-ID: <87lewpb59k.fsf@pond.sub.org>
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Victor Toso <victortoso@redhat.com> writes:

> Example output is missing mandatory member @detect_zeroes. Fix it.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/block-core.json | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 4a7a6940a3..beeb91952a 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -1776,6 +1776,7 @@
>  #                    "file":"disks/test.qcow2",
>  #                    "node-name": "my-node",
>  #                    "backing_file_depth":1,
> +#                    "detect_zeroes":"off",
>  #                    "bps":1000000,
>  #                    "bps_rd":0,
>  #                    "bps_wr":0,

Reviewed-by: Markus Armbruster <armbru@redhat.com>


