Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38BF4DBA7E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 23:04:59 +0100 (CET)
Received: from localhost ([::1]:40506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUblK-0007RT-RY
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 18:04:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nUbiZ-0006cT-LK
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 18:02:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nUbiW-00041A-SS
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 18:02:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647468124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1+O6HUZMRWJ3LtsTPEIcyhWJx8R4AuFooizZywZ2qF0=;
 b=dEuuGPKUZFuaBlXVJDCIexyjbpRqyNYnbxFKVYpkJf6vTPRoUfdVYHAU24MeuiPee8oz3O
 n1cPg4rcy133Bn9Q6B/MdpxLTSoGWLC18oS6NRDysKYbHWoEIoZQuis97QJeEuot2rwpfb
 MsiE8OFyChnnGVF9SZi6LfRC1eDC/aw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-TA9X6QziMbyzf0qQioC62g-1; Wed, 16 Mar 2022 18:02:01 -0400
X-MC-Unique: TA9X6QziMbyzf0qQioC62g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2470A8002BF;
 Wed, 16 Mar 2022 22:02:00 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C73A400F73F;
 Wed, 16 Mar 2022 22:01:58 +0000 (UTC)
Date: Wed, 16 Mar 2022 17:01:56 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Subject: Re: [PATCH v2 3/3] iotests/223: check new possibility of exporting
 bitmaps by node/name
Message-ID: <20220316220156.eahxmdjeufoubhv7@redhat.com>
References: <20220314213226.362217-1-v.sementsov-og@mail.ru>
 <20220314213226.362217-4-v.sementsov-og@mail.ru>
MIME-Version: 1.0
In-Reply-To: <20220314213226.362217-4-v.sementsov-og@mail.ru>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, v.sementsov-og@ya.ru,
 yuriy.vasiliev@virtuozzo.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 12:32:26AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
> 
> Add simple test that new interface introduced in previous commit works.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
> ---
>  tests/qemu-iotests/223     | 16 +++++++++++++
>  tests/qemu-iotests/223.out | 47 ++++++++++++++++++++++++++++++++++++--
>  2 files changed, 61 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


