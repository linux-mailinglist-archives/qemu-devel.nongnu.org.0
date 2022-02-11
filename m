Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF6D4B2B18
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:58:21 +0100 (CET)
Received: from localhost ([::1]:46458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIZFU-0001EO-9i
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:58:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIYvu-0003Ig-J6
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:38:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIYvr-0002ed-Og
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:38:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644597482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7jkSU8Fl/4muno+XeaFyIi2bnAPEwabGQ0POQLEBGjA=;
 b=O0i97XrqugcPBDWkQVHn4kW2Bp95dg3AiMAb5w+7Hfe7549kkdEWGB1y3qicTCKZ2GnvA3
 CLsISf8KIGFeTxObQzlLpTfYAjR6lkrqFYoUiF7IKPpiiTqijKqkgO96NWBlimtpN+wYX9
 G6+LNZaToT8PasNck8dkX1qyR+xRX2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-6G3LvVUgOZqc71MBF0K9kA-1; Fri, 11 Feb 2022 11:38:00 -0500
X-MC-Unique: 6G3LvVUgOZqc71MBF0K9kA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7471F1091DAD;
 Fri, 11 Feb 2022 16:37:59 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF5E37D474;
 Fri, 11 Feb 2022 16:37:55 +0000 (UTC)
Date: Fri, 11 Feb 2022 17:37:54 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH] hw/block/fdc-isa: Respect QOM properties when building AML
Message-ID: <YgaQ4rYJcAwN3SYD@redhat.com>
References: <20220209191558.30393-1-shentey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220209191558.30393-1-shentey@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, "open list:Floppy" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.02.2022 um 20:15 hat Bernhard Beschow geschrieben:
> Other ISA devices such as serial-isa use the properties in their
> build_aml functions. fdc-isa not using them is probably an oversight.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Thanks, applied to the block branch.

Kevin


