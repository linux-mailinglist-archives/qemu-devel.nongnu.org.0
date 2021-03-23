Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87B4346D49
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:38:16 +0100 (CET)
Received: from localhost ([::1]:52382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpfD-00071D-Vh
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOpTo-0005gV-VF
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:26:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOpTk-0007P4-V0
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:26:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616538382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h5fS5qWbbvj7pcrnkIC41n0cvKM0AXKLqKeFlixVTFM=;
 b=V4cyAKz/lbTds6xL8q5ln24wDzwcyZaP3qbkRmF0F87VwwsJViAjPUa5Crl2J8yzmaHAmT
 DLY/v4XB77dt+P0CR8CgBkb8l61QkMnDL+WjYbSSc3kb73PrmHGLwIDm/cLiNfuLFkD3P/
 g9fycDqROfaknDZWekcO5pX1ESKszq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-mQVCosXjO6mrVkwjgipMag-1; Tue, 23 Mar 2021 18:26:20 -0400
X-MC-Unique: mQVCosXjO6mrVkwjgipMag-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E96C51084D68;
 Tue, 23 Mar 2021 22:26:18 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3B7E61F59;
 Tue, 23 Mar 2021 22:26:14 +0000 (UTC)
Subject: Re: [PATCH 12/28] qapi: Consistently permit any case in downstream
 prefixes
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-13-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <734edfa4-5498-05b2-e549-425ef05dff90@redhat.com>
Date: Tue, 23 Mar 2021 18:26:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323094025.3569441-13-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 5:40 AM, Markus Armbruster wrote:
> We require lowercase __RFQDN_ downstream prefixes only where we
> require the prefixed name to be lowercase.  Don't; permit any case in
> __RFQDN_ prefixes anywhere.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>   scripts/qapi/expr.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index a815060ee2..b5fb0be48b 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -51,7 +51,7 @@ def check_name_upper(name, info, source):
>   def check_name_lower(name, info, source,
>                        permit_upper=False):
>       stem = check_name_str(name, info, source)
> -    if not permit_upper and name.lower() != name:
> +    if not permit_upper and re.search(r'[A-Z]', stem):
>           raise QAPISemError(
>               info, "%s uses uppercase in name" % source)
>       # TODO reject '_' in stem
> 


