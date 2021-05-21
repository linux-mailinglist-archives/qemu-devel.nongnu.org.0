Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E0B38BF45
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 08:26:41 +0200 (CEST)
Received: from localhost ([::1]:38786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljycJ-00082m-O4
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 02:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1ljyaE-0007AN-7Y
 for qemu-devel@nongnu.org; Fri, 21 May 2021 02:24:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1ljya7-0000RL-Gs
 for qemu-devel@nongnu.org; Fri, 21 May 2021 02:24:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621578260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dMTzDQT++A0lzkmgtWKI19ziT8BI+rKUmgtmrwNuPMU=;
 b=Uy+rQ1IFBC6JxdJMhCI31FloukEf/Gf2sdzRxRboz5h07VXPnszH2pRn8yvYFTJHMorn23
 5ySbln9iQumt4HEisypkvRrm6U15SYxLoJMR4FPrt/gh3TjZFuTtt9QsHpAgo5pnCs6m3g
 qWpahofEmqocC1H2Bd/HKPomXdYyd0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-nDZ0Tdy0Nt-fy0Q0PBAyag-1; Fri, 21 May 2021 02:24:18 -0400
X-MC-Unique: nDZ0Tdy0Nt-fy0Q0PBAyag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBE438030A0;
 Fri, 21 May 2021 06:24:16 +0000 (UTC)
Received: from kaapi (ovpn-112-36.ams2.redhat.com [10.36.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEB9810013C1;
 Fri, 21 May 2021 06:24:11 +0000 (UTC)
Date: Fri, 21 May 2021 11:54:07 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Mauro Matteo Cascella <mcascell@redhat.com>
Subject: Re: [PATCH] ui/spice-display: check NULL pointer in
 interface_release_resource()
In-Reply-To: <20210520105833.183160-1-mcascell@redhat.com>
Message-ID: <ss95os4q-r456-5opq-4q6r-325652r2p48r@erqung.pbz>
References: <20210520105833.183160-1-mcascell@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: ini.universe@gmail.com, qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+-- On Thu, 20 May 2021, Mauro Matteo Cascella wrote --+
| diff --git a/ui/spice-display.c b/ui/spice-display.c
| index d22781a23d..f59c69882d 100644
| --- a/ui/spice-display.c
| +++ b/ui/spice-display.c
| @@ -561,6 +561,10 @@ static void interface_release_resource(QXLInstance *sin,
|      SimpleSpiceCursor *cursor;
|      QXLCommandExt *ext;
|  
| +    if (!rext.info) {
| +        return;
| +    }
| +
|      ext = (void *)(intptr_t)(rext.info->id);
|      switch (ext->cmd.type) {
|      case QXL_CMD_DRAW:

Looks okay.

Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>

Thank you.
--
 - P J P
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


