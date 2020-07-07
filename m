Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D48217413
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 18:38:47 +0200 (CEST)
Received: from localhost ([::1]:57152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsqcI-0002l2-8w
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 12:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jsq97-0006bi-R4
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 12:08:37 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:59763
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jsq96-0007Cu-1I
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 12:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594138115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rRF06x4AP6FPE5HTzsEqzMYpwgR0+j+oUBclduMjByA=;
 b=AXPrggNlMYWJgNt7wdqT2g6nL4vi6SgDNQNSr0/8FILbTDeZvm+vvfjgkN6ZW43Bljgt2x
 VJMTH44wvF/eTP1sY0pscWTN1e4pUSBnry3Drk1TKyQ5Pa2MnQ7ZjEKfVMFEHx5EYmK6NW
 KLtFbsfRf7d6OAeglI6sqYTHGc32pQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-JclbFqonOyKr9Lwu-nldaw-1; Tue, 07 Jul 2020 12:08:27 -0400
X-MC-Unique: JclbFqonOyKr9Lwu-nldaw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2F4F804001;
 Tue,  7 Jul 2020 16:08:26 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-113.ams2.redhat.com [10.36.114.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F36219D7B;
 Tue,  7 Jul 2020 16:08:22 +0000 (UTC)
Date: Tue, 7 Jul 2020 18:08:21 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v6 00/10] Tighten qemu-img rules on missing backing format
Message-ID: <20200707160821.GF7002@linux.fritz.box>
References: <20200706203954.341758-1-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200706203954.341758-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:20:54
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
Cc: pkrempa@redhat.com, qemu-block@nongnu.org, kchamart@redhat.com,
 libvir-list@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.07.2020 um 22:39 hat Eric Blake geschrieben:
> v5 was here:
> https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg00679.html
> In v6:
> - add a few more patches
> - change qcow semantics based on several iterations of mailing list
> debates on what behavior is easiest to support
> - add iotesting that a probed raw file cannot be committed into
> - instead of recording an implicit probed raw file, instead we record
> only a non-raw file
> - rebase to a few more affected iotests, plus s/5.0/5.1/
> 
> Yes, I know this is really short notice to make it in before feature
> freeze for 5.1 (removal in 6.0), so it may end up slipping into 5.2
> (removal in 6.1); but we'll see how things go.

Thanks, applied to the block branch.

Kevin


