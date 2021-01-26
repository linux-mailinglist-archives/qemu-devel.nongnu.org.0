Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB5A303D00
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 13:29:34 +0100 (CET)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4NTR-0005YH-JD
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 07:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4NSF-000562-6C
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:28:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4NSD-0007XC-Mz
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:28:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611664096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WSGk64UBg7WMqqYWR856wxTOpyjjqygMAdTxFYvL1nU=;
 b=fcKgMp9q8mVTVzDDbxXyCakPCNTpF7eKJ8rSPxMxWatIHTRsRCGtC+mOIgzqIzBcPu0Gwc
 d8I4ESywNeO24s27RvvlGDdQJP3eGtwYHArUFFcn9ip+mP/PwsTOovT/vTTdN+eH8PXRwY
 SWsDvtE5NYphFUlEpVX/fjeDmfIPd6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-_ehVjiYuM0mAYgqrgDOa6A-1; Tue, 26 Jan 2021 07:28:13 -0500
X-MC-Unique: _ehVjiYuM0mAYgqrgDOa6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C037107ACE3;
 Tue, 26 Jan 2021 12:28:12 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-202.ams2.redhat.com [10.36.114.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D4E45D751;
 Tue, 26 Jan 2021 12:28:11 +0000 (UTC)
Date: Tue, 26 Jan 2021 13:28:10 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] iotests/118: Drop 'change' test
Message-ID: <20210126122810.GD4385@merkur.fritz.box>
References: <20210126104833.57026-1-mreitz@redhat.com>
 <427f2bc6-1eee-fb76-2053-d3dcd0bbb170@redhat.com>
MIME-Version: 1.0
In-Reply-To: <427f2bc6-1eee-fb76-2053-d3dcd0bbb170@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.01.2021 um 12:30 hat Paolo Bonzini geschrieben:
> On 26/01/21 11:48, Max Reitz wrote:
> > Commit 0afec75734331 removed the 'change' QMP command, so we can no
> > longer test it in 118.
> > 
> > Fixes: 0afec75734331a0b52fa3aa4235220eda8c7846f
> >         ('qmp: remove deprecated "change" command')
> > Signed-off-by: Max Reitz <mreitz@redhat.com>
> > ---
> >   tests/qemu-iotests/118     | 17 -----------------
> >   tests/qemu-iotests/118.out |  4 ++--
> >   2 files changed, 2 insertions(+), 19 deletions(-)
> 
> How come this didn't break GitLab CI?...

The test case is not in the auto group.

Kevin


