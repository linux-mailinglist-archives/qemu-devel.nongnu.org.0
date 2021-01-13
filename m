Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F342F4D62
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:42:38 +0100 (CET)
Received: from localhost ([::1]:53034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhM5-000184-Fe
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kzhI0-0005TP-Pk
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:38:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kzhHz-0000PN-5A
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:38:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610548702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LdJYRKhomY3B2CX/MQjde5g0R/W70d0R/aLXd9ST1NY=;
 b=E5oTOqip06p2V9oEp5vI1bjjPe92Nk/QumsQ76MjnNU+kexTx5XwDYMxIQVciJl666Swtm
 v281vLqUwnBgJNYa1/G81b6NC9Kkq8bCKxtNgVLHGMFqPyHjb4mSw73KHjaxMCKcRApYbh
 1RhLTPNuRh89cHp0tOJ6AS7CwNTqVnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-IUCGmw-gNRKjmixDXICfXA-1; Wed, 13 Jan 2021 09:38:19 -0500
X-MC-Unique: IUCGmw-gNRKjmixDXICfXA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB63B18C8C24;
 Wed, 13 Jan 2021 14:38:18 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-55.ams2.redhat.com [10.36.114.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D09D660C6C;
 Wed, 13 Jan 2021 14:38:17 +0000 (UTC)
Date: Wed, 13 Jan 2021 15:38:16 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 0/7] iotests/129: Fix it
Message-ID: <20210113143816.GB5928@merkur.fritz.box>
References: <20210113140616.150283-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210113140616.150283-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.01.2021 um 15:06 hat Max Reitz geschrieben:
> - pylint and mypy complain.
>   (Running mypy with the options given in 297.)
>   [Patch 4 removes one pylint complaint; patch 7 the rest.]

Should we add it to 297 then to make sure we won't regress?

At some point, I guess we'll want to cover all Python tests, but I
assume it was too much to change in the same series as for the
iotests.py cleanup.

Kevin


