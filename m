Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5423213595
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 09:58:38 +0200 (CEST)
Received: from localhost ([::1]:38414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrGaj-00026a-QM
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 03:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jrGa2-0001ca-53
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 03:57:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47709
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jrGa0-0005vq-Km
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 03:57:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593763072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EllTH0OXFlTbNz2P8OwChJos2upSgpyWunC2wid6z/s=;
 b=EvuDoNEBGRSKC9EvUfHPPibyvwLkQIgWLK2w6l9xvbqaqqYsymMJOkEvz+ITOv7VIGNxEu
 07SoFXyrKdBL6DF/1IFyx2mnVE/jSUbHtHT/6g0X4dEatYec3N/S8r3I1Tv43gE1G1szkF
 9rjwYbku+7WmOUGm7FBkguSkUhc0jE8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-3bCeemakNhaxMXa3yaLwaA-1; Fri, 03 Jul 2020 03:57:48 -0400
X-MC-Unique: 3bCeemakNhaxMXa3yaLwaA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC53C804012;
 Fri,  3 Jul 2020 07:57:47 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-90.ams2.redhat.com [10.36.114.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA9A479258;
 Fri,  3 Jul 2020 07:57:46 +0000 (UTC)
Date: Fri, 3 Jul 2020 09:57:44 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] iotests.py: Do not wait() before communicate()
Message-ID: <20200703075744.GB5285@linux.fritz.box>
References: <20200630083711.40567-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200630083711.40567-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 02:53:25
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 30.06.2020 um 10:37 hat Max Reitz geschrieben:
> Waiting on a process for which we have a pipe will stall if the process
> outputs more data than fits into the OS-provided buffer.  We must use
> communicate() before wait(), and in fact, communicate() perfectly
> replaces wait() already.
> 
> We have to drop the stderr=subprocess.STDOUT parameter from
> subprocess.Popen() in qemu_nbd_early_pipe(), because stderr is passed on
> to the child process, so if we do not drop this parameter, communicate()
> will hang (because the pipe is not closed).
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Thanks, applied to the block branch.

Kevin


