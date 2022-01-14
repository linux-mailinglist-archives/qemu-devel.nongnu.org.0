Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668D848F064
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 20:17:25 +0100 (CET)
Received: from localhost ([::1]:38040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8S4i-0003IP-2J
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 14:17:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1n8S0t-00020D-4m
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 14:13:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1n8S0q-0001bM-Tt
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 14:13:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642187604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pj1nF4JCLsQLQtagKJ4NfUNzVK8aa1TEJx7YGiefK9g=;
 b=Vz0THpgm338sRk9rGMWwKZOo0UyKxhQG87AD1cZkKO8bFosch5woUvB8nc0AxmgbjKXA/h
 /ySNSbhDGNMb4Xb4u+lIKOWJXcLWpmE1BLPRcJqiXXqeinyKtkPwqRJMyWfReiceGLJ4B1
 E2fpnnNV1YIsBA9VuN75klJr7AIoEIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-4KcyC6YlN2C7d00gfXC_Qg-1; Fri, 14 Jan 2022 14:13:16 -0500
X-MC-Unique: 4KcyC6YlN2C7d00gfXC_Qg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF32F81CCB4;
 Fri, 14 Jan 2022 19:13:15 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CDF75D9D5;
 Fri, 14 Jan 2022 19:13:01 +0000 (UTC)
Date: Fri, 14 Jan 2022 13:12:59 -0600
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 23/31] iotests: switch to AQMP
Message-ID: <20220114191259.m4vxhpfqpmf75h3z@redhat.com>
References: <20220110232910.1923864-1-jsnow@redhat.com>
 <20220110232910.1923864-24-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110232910.1923864-24-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-182-90c72c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Wainer Moschetta <wainersm@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 06:29:02PM -0500, John Snow wrote:
> Simply import the type defition from the new location.

definition

> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Beraldo Leal <bleal@redhat.com>
> ---
>  tests/qemu-iotests/iotests.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


