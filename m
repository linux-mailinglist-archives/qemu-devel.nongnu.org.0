Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F051D361B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 18:12:00 +0200 (CEST)
Received: from localhost ([::1]:52192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZGSl-0002aW-BN
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 12:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jZGRZ-0001YX-2w
 for qemu-devel@nongnu.org; Thu, 14 May 2020 12:10:45 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49611
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jZGRY-0003na-9n
 for qemu-devel@nongnu.org; Thu, 14 May 2020 12:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589472643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4kY3B7Y4f7ZgtNy9BtOWuYzWsA38hoYleVF0FcgWdWs=;
 b=aHZsQoeRpa93T6D+869Z92PPzESwdk8jC7jje5oIb+QmfIWyLOAHzb11oeqIdHoDS9fpV2
 Jyhqw+xxhhjIQj5FSY4pw3eQZYQvofmb4efTXMzc4m0Q6VcjLbrYRGjlfhbLskwZJ87w9p
 /hww0YxHEa1UGmPSEtp/rOrKZEx0VSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-YBg5EdNONZ6gTn-xUZUZkQ-1; Thu, 14 May 2020 12:10:25 -0400
X-MC-Unique: YBg5EdNONZ6gTn-xUZUZkQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BC70474;
 Thu, 14 May 2020 16:10:24 +0000 (UTC)
Received: from kaapi (unknown [10.40.192.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB6085D9CA;
 Thu, 14 May 2020 16:10:16 +0000 (UTC)
Date: Thu, 14 May 2020 21:40:13 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: Darren Kenny <darren.kenny@oracle.com>
Subject: Re: [PATCH v2 1/3] megasas: use unsigned type for reply_queue_head
 and check index
In-Reply-To: <m2k11ek62b.fsf@oracle.com>
Message-ID: <nycvar.YSQ.7.76.2005142121420.1451610@xnncv>
References: <20200513192540.1583887-1-ppandit@redhat.com>
 <20200513192540.1583887-2-ppandit@redhat.com> <m2k11ek62b.fsf@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 11:41:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, QEMU Developers <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Ding Ren <rding@gatech.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 Hanqing Zhao <hanqing@gatech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hello Darren,

+-- On Thu, 14 May 2020, Darren Kenny wrote --+
| > Update v1 -> v2: fix OOB access when index > MEGASAS_MAX_FRAMES(=2048)
| >  -> https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg03131.html
| >
| > diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
| > -    int reply_queue_head;
| > +    uint16_t reply_queue_head;
| > @@ -445,7 +445,7 @@ static MegasasCmd *megasas_lookup_frame(MegasasState *s,
| >  
| >      index = s->reply_queue_head;
| 
| While it is probably unlikely that it would cause an integer underflow
| here,

Yes, integer overflow is unlikely going from uint16_t -> to -> int type.

  s->reply_queue_head = ldl_le_pci_dma(pcid, s->producer_pa);
  s->reply_queue_head %= MEGASAS_MAX_FRAMES;

Also here 's->reply_queue_head' is restricted between 0...MEGASAS_MAX_FRAMES=2048

| -    while (num < s->fw_cmds) {
| +    while (num < s->fw_cmds && index < MEGASAS_MAX_FRAMES) {

And this patch would help keep 'index' within the same 0..MEGASAS_MAX_FRAMES 
range.

| for consistency, index probably should also be declared as unsigned, but 
| from what I can tell it is still an 'int'.

It did cross my mind, but it's generally advised to keep these fixes to 
minimum possible changes and specific to the issue they fix. Index being a 
local variable, changing it to an unsigned type wouldn't help much to fix the 
issue or otherwise I think.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


