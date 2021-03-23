Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0461F3462A3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:17:57 +0100 (CET)
Received: from localhost ([::1]:48400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOin6-0002Xl-3n
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOilS-0001LR-Nz
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:16:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOilO-0000Xw-94
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616512568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSQgs0XwlPUJVpgLYlhgo0Zkwa1C0Alc7rMVS283pmA=;
 b=XwpUEUrZLRyeiDjVajPTe7PH6Cw6X7eLaWmB+1Xg6D/Ii8lsFK47EThQlK0++f9MsO9iTZ
 4+jIi9eBrmbFpUdk8koeYBuZjfIkelRFHjVU9Vq28ELyy+0x6iFTOx/fJbk3sU6HZFtdqq
 N6r1kqT5VuA5+Xhs4OUHGWIDhWJeg5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-jke1sXPAOseUnnNRJ1b4Kw-1; Tue, 23 Mar 2021 11:16:06 -0400
X-MC-Unique: jke1sXPAOseUnnNRJ1b4Kw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF6DF107ACCA;
 Tue, 23 Mar 2021 15:16:05 +0000 (UTC)
Received: from [10.3.112.201] (ovpn-112-201.phx2.redhat.com [10.3.112.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EA6B60C5D;
 Tue, 23 Mar 2021 15:16:02 +0000 (UTC)
Subject: Re: [PATCH 23/28] qapi: Enforce feature naming rules
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-24-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <d6d4f1dd-9daf-b22c-4a4d-e39cb5a3aef2@redhat.com>
Date: Tue, 23 Mar 2021 10:16:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323094025.3569441-24-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
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
Cc: michael.roth@amd.com, jsnow@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 4:40 AM, Markus Armbruster wrote:
> Feature names should use '-', not '_'.  Enforce this.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/qapi/expr.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thankfully no offenders ;)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index ce37b426c9..01a994412d 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -213,7 +213,7 @@ def check_features(features, info):
>          check_keys(f, info, source, ['name'], ['if'])
>          check_name_is_str(f['name'], info, source)
>          source = "%s '%s'" % (source, f['name'])
> -        check_name_lower(f['name'], info, source, permit_underscore=True)
> +        check_name_lower(f['name'], info, source)
>          check_if(f, info, source)
>  
>  
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


