Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869D132A1B1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 14:59:28 +0100 (CET)
Received: from localhost ([::1]:49754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH5Yd-0006wt-KP
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 08:59:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH5XD-0005zG-8s
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 08:57:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH5XB-0005jt-Ij
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 08:57:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614693476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HPnxp1WmnhfvoTjdu79PJomx2iLiifRL03nYSI3Rwy4=;
 b=V6WL9k0MJV0ecNx2x4ap9ZMS3xLC8pZs9jonXQ8E+pLmrl2xC5g1r0YGm0Lt1taVG0eAWD
 R7agi45/rvgt+noDSWU7Igc8oU6+t2rWBj4l41txZx18LrBdhoNaUr+HXjEMybfIPDjiYT
 KUWxcGjMY16uxzBnmNG1CMxa7P/4q8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154--y1TtAyCMaSugZ-ykxi7bg-1; Tue, 02 Mar 2021 08:57:54 -0500
X-MC-Unique: -y1TtAyCMaSugZ-ykxi7bg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FDE81005501;
 Tue,  2 Mar 2021 13:57:53 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-197.ams2.redhat.com [10.36.113.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AD1F5D723;
 Tue,  2 Mar 2021 13:57:49 +0000 (UTC)
Date: Tue, 2 Mar 2021 14:57:47 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2] qemu-storage-daemon: add --pidfile option
Message-ID: <20210302135747.GA5527@merkur.fritz.box>
References: <20210302092926.163080-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210302092926.163080-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: afrosi@redhat.com, Daniel Berrange <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.03.2021 um 10:29 hat Stefan Hajnoczi geschrieben:
> Daemons often have a --pidfile option where the pid is written to a file
> so that scripts can stop the daemon by sending a signal.
> 
> The pid file also acts as a lock to prevent multiple instances of the
> daemon from launching for a given pid file.
> 
> QEMU, qemu-nbd, qemu-ga, virtiofsd, and qemu-pr-helper all support the
> --pidfile option. Add it to qemu-storage-daemon too.
> 
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

I think we should also mention --pidfile in the --help output.

Kevin


