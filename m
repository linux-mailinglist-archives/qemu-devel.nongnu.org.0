Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698DF1FEFD7
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 12:45:03 +0200 (CEST)
Received: from localhost ([::1]:37188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jls2Y-0008Eb-6E
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 06:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jls1Y-0007QJ-HG
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 06:44:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27415
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jls1W-0000hb-EM
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 06:44:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592477037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BcXIb6VA/T5SU80SFBUclucp4SsFdLq22zMGlpsctA0=;
 b=h0Y5JGnLSooOYaLep8KiZeURv/6qGNDFBHZM8aosuqfnxqjTCXOv8xosWu9qUbpiHavtGJ
 kftMxVwPMv5A/c4Kip48YFMcsBsT9DHATPisoDANdZyMBA74/1A/oaVm7FTIGFXPQ1Mgn0
 /7eVHn8ZgsdwRFCdeZPqUH5rJ95cL/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-Blt1uWtLOQ-l91mXn0_qnA-1; Thu, 18 Jun 2020 06:43:53 -0400
X-MC-Unique: Blt1uWtLOQ-l91mXn0_qnA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78133EC1A1;
 Thu, 18 Jun 2020 10:43:52 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-87.ams2.redhat.com [10.36.114.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE3DD10013D6;
 Thu, 18 Jun 2020 10:43:48 +0000 (UTC)
Date: Thu, 18 Jun 2020 12:43:47 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Coiby Xu <coiby.xu@gmail.com>
Subject: Re: [PATCH v9 1/5] Allow vu_message_read to be replaced
Message-ID: <20200618104347.GB6012@linux.fritz.box>
References: <20200614183907.514282-1-coiby.xu@gmail.com>
 <20200614183907.514282-2-coiby.xu@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200614183907.514282-2-coiby.xu@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:21:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: bharatlkmlkvm@gmail.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.06.2020 um 20:39 hat Coiby Xu geschrieben:
> Allow vu_message_read to be replaced by one which will make use of the
> QIOChannel functions. Thus reading vhost-user message won't stall the
> guest.
> 
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>

_vu_queue_notify() still has a direct call of vu_message_read() instead
of using the pointer. Is this intentional?

Renaming the function would make sure that such semantic merge conflicts
don't stay unnoticed.

> @@ -1704,6 +1702,7 @@ vu_deinit(VuDev *dev)
>          }
>  
>          if (vq->kick_fd != -1) {
> +            dev->remove_watch(dev, vq->kick_fd);
>              close(vq->kick_fd);
>              vq->kick_fd = -1;
>          }

This hunk looks unrelated.

Kevin


