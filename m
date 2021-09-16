Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCFE40D400
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 09:45:22 +0200 (CEST)
Received: from localhost ([::1]:43156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQm5A-0002V6-7b
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 03:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mQm4A-0001i1-21
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 03:44:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mQm46-0005Nr-HI
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 03:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631778253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wn+nhpg2TTS5xbETIvwCun9JyvZlQMDRvn6pXiV0kds=;
 b=X4ANH6LYfiNCuZF6YJd+zfTtiMl1S0QazO5EJlLu8iigccZaOsYRS7dH//Dg/ZAEZOgCwJ
 hf6JlWau+XjUKJlI+U7Cabq6g5wxH7q7xGEjTcYW6eMBfb9z4b6Csgk6U296jugYugias7
 9fp0XUzvErUAselDylNsSH32+vuVu4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-6PCD7awVM86kLXRSs9BmTw-1; Thu, 16 Sep 2021 03:44:11 -0400
X-MC-Unique: 6PCD7awVM86kLXRSs9BmTw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB5798E3C1F;
 Thu, 16 Sep 2021 07:43:30 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DD5226E51;
 Thu, 16 Sep 2021 07:43:28 +0000 (UTC)
Date: Thu, 16 Sep 2021 09:43:27 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] qemu-storage-daemon: Only display FUSE help when FUSE is
 built-in
Message-ID: <YUL1n5CLLQdmLfCr@redhat.com>
References: <20210816180442.2000642-1-philmd@redhat.com>
 <152eb50e-621f-cbac-4748-dc689aa08635@redhat.com>
MIME-Version: 1.0
In-Reply-To: <152eb50e-621f-cbac-4748-dc689aa08635@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Qing Wang <qinwang@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.09.2021 um 23:36 hat Philippe Mathieu-Daudé geschrieben:
> ping & Cc'ing qemu-trivial@ (reviewed twice) ...
> 
> On 8/16/21 8:04 PM, Philippe Mathieu-Daudé wrote:
> > When configuring QEMU with --disable-fuse, the qemu-storage-daemon
> > still reports FUSE command line options in its help:
> > 
> >   $ qemu-storage-daemon -h
> >   Usage: qemu-storage-daemon [options]
> >   QEMU storage daemon
> > 
> >     --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>
> >              [,growable=on|off][,writable=on|off]
> >                            export the specified block node over FUSE
> > 
> > Remove this help message when FUSE is disabled, to avoid:
> > 
> >   $ qemu-storage-daemon --export fuse
> >   qemu-storage-daemon: --export fuse: Invalid parameter 'fuse'
> > 
> > Reported-by: Qing Wang <qinwang@redhat.com>
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks, applied to the block branch.

Kevin


