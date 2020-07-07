Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAEA2176EB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 20:39:20 +0200 (CEST)
Received: from localhost ([::1]:36696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jssUx-0008PG-64
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 14:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jssRU-0003I7-AA
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 14:35:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27749
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jssRS-0005dR-Sn
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 14:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594146942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bnssqk3//d4cKjQEyXQiziMyAh5ZEnf6XtwyK32EO7g=;
 b=Z6rgklTD8y2eq12u4czndooyZbUBeCfaT53Dpz15Q2ri9lxIyzHqK/0ug0spDSoYMzA9cc
 yjpM9caFGpVueXr4Xw9tfhiEl+YswxFhj8lG8utJFt0SZXovyyjvcINEi5BaEpoDrO5edh
 FWVnwTUvbWZFu4JtnM9sgObr5oRr1OU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-InsvAxxJNryryLs89fpPyA-1; Tue, 07 Jul 2020 14:35:27 -0400
X-MC-Unique: InsvAxxJNryryLs89fpPyA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA9A31005510;
 Tue,  7 Jul 2020 18:35:24 +0000 (UTC)
Received: from [10.3.115.46] (ovpn-115-46.phx2.redhat.com [10.3.115.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12B7071674;
 Tue,  7 Jul 2020 18:35:24 +0000 (UTC)
Subject: Re: [PATCH v4 01/45] error: Fix examples in error.h's big comment
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200707160613.848843-1-armbru@redhat.com>
 <20200707160613.848843-2-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f1428a22-24d0-b8f6-ff7d-25a10f521c11@redhat.com>
Date: Tue, 7 Jul 2020 13:35:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200707160613.848843-2-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:46:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, groug@kaod.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/20 11:05 AM, Markus Armbruster wrote:
> Mark a bad example more clearly.  Fix the error_propagate_prepend()
> example.  Add a missing declaration and a second error pileup example.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> ---
>   include/qapi/error.h | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
> 

I know you kept my R-b because you only trimmed this in relation to v3, 
but I agree that this patch is still looking fine.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


