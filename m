Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BBD3ECDD4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 06:57:34 +0200 (CEST)
Received: from localhost ([::1]:51926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFUgm-0005QL-VZ
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 00:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mFUfl-0004j2-HO
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 00:56:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mFUfj-00050p-2R
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 00:56:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629089785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VozFFuChF6H63dEHqQhYFbJobAYCH4cFbsvertFruZI=;
 b=St71Rm5jIrtngoO4y86eCandG66MaKIDU1kCM/MvykO7mJKqBFBa1s7z11zb4GycKb0T3y
 Us7Bl7wfp8djlgUt0vAU25xJ0pS7+5xwz4gUCYlHxEM0LbpJaA3YznYWj2CcfxdHRNuF46
 8392QTwbgoI0z13UoP77TY7HD5EPgNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517--CKUALBCO5CcJfmG0OmuQg-1; Mon, 16 Aug 2021 00:56:23 -0400
X-MC-Unique: -CKUALBCO5CcJfmG0OmuQg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCB6F87D549;
 Mon, 16 Aug 2021 04:56:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F3B810074E1;
 Mon, 16 Aug 2021 04:56:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 93F8B1800382; Mon, 16 Aug 2021 06:56:19 +0200 (CEST)
Date: Mon, 16 Aug 2021 06:56:19 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 3/7] MAINTAINERS: update audio entry.
Message-ID: <20210816045619.qvxk7atwm45kvb4b@sirius.home.kraxel.org>
References: <20210810083450.2377374-1-kraxel@redhat.com>
 <VE1P192MB0733ED7BB482A45E5768464CDEF89@VE1P192MB0733.EURP192.PROD.OUTLOOK.COM>
 <20210812084210.kbzoneze3izsrboa@sirius.home.kraxel.org>
 <77562211.GzqkouU55n@silver>
 <6a9ce32c-b6fb-91e5-efaf-82e883dd1796@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6a9ce32c-b6fb-91e5-efaf-82e883dd1796@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: clamky@hotmail.com, Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 =?utf-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> First idea, split the current entry in too, allowing developers
> with different interests to add their contact to the relevant entries.

This makes sense indeed.  Maybe split the backends into even more
entries, specifically the os-specific ones (coreaudio for macos, ...),
similar to the separate ui/cocoa entry we already have.

take care,
  Gerd


