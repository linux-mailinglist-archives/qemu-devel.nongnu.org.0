Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ED533C188
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:21:52 +0100 (CET)
Received: from localhost ([::1]:55270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpyZ-000313-PV
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLpvy-0000kw-5L
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:19:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLpvw-000391-HJ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615825147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ieuWGHl06zF0oh62RA4jy69jAI74meV+GM6IE8iAQIU=;
 b=Bj5hBonoZaziqpgH/7KgRszULg7C6hLJZYW5tBSkNVA/2ND1vTkppV1GPq7jR7bknj5gFl
 JrO/maiYYjmudIRt7AZrHo7GS2DOxg/K12yprTt7a0HuR390wyrzUsXXpy3zgIFGlElIJ2
 I8q/9MRkAQL8IXkCxkcy0khgbN42rvY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-5zs4lcZQMwmFFsgZKg4umA-1; Mon, 15 Mar 2021 12:19:06 -0400
X-MC-Unique: 5zs4lcZQMwmFFsgZKg4umA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EC9A100D684;
 Mon, 15 Mar 2021 16:19:05 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B347E1757E;
 Mon, 15 Mar 2021 16:19:04 +0000 (UTC)
Subject: Re: [PATCH v6 10/10] qapi: New -compat deprecated-input=crash
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210312153210.2810514-1-armbru@redhat.com>
 <20210312153210.2810514-11-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <05106c70-bd1d-9c05-dc04-2ea7db531f38@redhat.com>
Date: Mon, 15 Mar 2021 11:19:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312153210.2810514-11-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: marcandre.lureau@gmail.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 9:32 AM, Markus Armbruster wrote:
> Policy "crash" calls abort() when deprecated input is received.
> 
> Bugs in integration tests may mask the error from policy "reject".
> Provide a larger hammer: crash outright.  Masking that seems unlikely.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  qapi/compat.json             | 9 +++++----
>  qapi/qmp-dispatch.c          | 1 +
>  qapi/qobject-input-visitor.c | 1 +
>  qemu-options.hx              | 4 +++-
>  4 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/qapi/compat.json b/qapi/compat.json
> index d2c02a21aa..ae3afc22df 100644
> --- a/qapi/compat.json
> +++ b/qapi/compat.json
> @@ -11,11 +11,12 @@
>  #
>  # @accept: Accept silently
>  # @reject: Reject with an error
> +# @crash: abort() the process
>  #
> -# Since: 5.2
> +# Since: 6.0

Rebase churn once you fix this earlier in the series.

R-b still stands.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


