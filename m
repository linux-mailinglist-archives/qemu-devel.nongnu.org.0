Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003D02042B1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 23:30:50 +0200 (CEST)
Received: from localhost ([::1]:50236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnU1i-00028H-2X
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 17:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jfreimann@redhat.com>)
 id 1jnTyg-0007yq-HW
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 17:27:42 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41407
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jfreimann@redhat.com>)
 id 1jnTye-0003gd-S4
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 17:27:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592861260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KyFJS957bPbKxbClOI3SztIRUuOS59X865hmYa5SwzU=;
 b=ArKCqa8LDAFrfBJnOPyjblk5R4dmXWCfbHFnjnA0/SGWcyODAytY+Ee4W7SfkCr4tABS1W
 rgJ9dvmzqZDmH2cdJwMf8InNLPhy9uFCRySviR1+rY9k08tGH+xy7CzzP1gPXcuqZUzZuB
 aS/nh/3Qq84EnnViZi1n40wCR+lONBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-jEHTo0f8OjyG905yC2Masw-1; Mon, 22 Jun 2020 17:26:27 -0400
X-MC-Unique: jEHTo0f8OjyG905yC2Masw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD44D1B18BC1
 for <qemu-devel@nongnu.org>; Mon, 22 Jun 2020 21:26:26 +0000 (UTC)
Received: from localhost (ovpn-112-208.ams2.redhat.com [10.36.112.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B643419D61;
 Mon, 22 Jun 2020 21:26:23 +0000 (UTC)
Date: Mon, 22 Jun 2020 23:26:22 +0200
From: Jens Freimann <jfreimann@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 02/22] pci: Delete useless error_propagate()
Message-ID: <20200622212622.GE18041@jenstp.localdomain>
References: <20200622104250.1404835-1-armbru@redhat.com>
 <20200622104250.1404835-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200622104250.1404835-3-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jfreimann@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 22, 2020 at 12:42:30PM +0200, Markus Armbruster wrote:
>Cc: Jens Freimann <jfreimann@redhat.com>
>Cc: Michael S. Tsirkin <mst@redhat.com>
>Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>Signed-off-by: Markus Armbruster <armbru@redhat.com>
>---
> hw/pci/pci.c | 3 ---
> 1 file changed, 3 deletions(-)
>

Reviewed-by: Jens Freimann <jfreimann@redhat.com>

Thanks!

regards,
Jens 


