Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA7E3F4B7F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 15:15:46 +0200 (CEST)
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI9nk-0007Xk-IS
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 09:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1mI9kh-0005tk-PE
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 09:12:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1mI9kc-0000V1-RW
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 09:12:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629724345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4AQDN3vUy/DlPQviiRQz2cF3beNBgy++/PSmrr7ALs=;
 b=ahwqOTXhs/6IW5iEI2RvglQ+ZOCTifoh7gM03gx2WM69iBKkjS5QuNFq3v8Nmtp5hiaj+r
 6Idb8JVk5BO6XeytVfltQMfLhLD5ai0Zchq1vVS6VT9ccS6bXBu1CGX6ukFP267FjOeFrA
 bk5owhPnFsDhhn6kOwZ5YmUOq53j8V4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-RLAtkUS9MnaczcN6DNrmtQ-1; Mon, 23 Aug 2021 09:12:23 -0400
X-MC-Unique: RLAtkUS9MnaczcN6DNrmtQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE1DA190A7A1;
 Mon, 23 Aug 2021 13:12:21 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.193.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0E2C60CC4;
 Mon, 23 Aug 2021 13:12:20 +0000 (UTC)
Subject: Re: vmgenid no maintainers
To: Ani Sinha <ani@anisinha.ca>, Roman Kagan <rkagan@virtuozzo.com>,
 Ben Warren <ben@skyportsystems.com>
References: <alpine.DEB.2.22.394.2108222034070.810518@anisinha-lenovo>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <761b0c1a-ea71-4cd4-764e-fa6bad1a5b2f@redhat.com>
Date: Mon, 23 Aug 2021 15:12:19 +0200
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2108222034070.810518@anisinha-lenovo>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/22/21 17:09, Ani Sinha wrote:
> Hi :
> 
> All of you have contributed to vmgenid device at some point.
> Unfortunately, this code currently has no maintainers. I had looked into
> this feature as a part of another project for a previous company, hence
> noticed it. Will any of you would want to be the maintainer of this
> codebase in Qemu?

No, not me, thank you.
Laszlo

> I do not know all the parts of this feature and the
> spec well enough to be confident to be a maintainer but I can be a
> reviewer if you want.
> 
> Thanks
> ani
> 


