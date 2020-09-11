Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23896266119
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 16:22:07 +0200 (CEST)
Received: from localhost ([::1]:47984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGjwE-0007Hn-7U
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 10:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kGjuo-0006D5-Bg
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 10:20:39 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31785
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kGjul-0002il-SK
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 10:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599834034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=HoTk5ew0fEIbsN72UlDeAExrg0AkmLgVuh/liKjE7qQ=;
 b=DmBUUtLgI7dmFqACcZ83pJKWWtl2fVI970cb2va3qIi0lQpTv+Mro1BRQOd/UhU2kU24pw
 YnHAGYZxZbwSZaISusXS/dffsSUewcgUS56tFdCToF7P7FvdwzKnkYQcDbnwwqFm/YcG0y
 DI9R4S3HtznSAaJGc779bUrA37AVuGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-F4tixe8SPBmODN4SOb_ONw-1; Fri, 11 Sep 2020 10:20:30 -0400
X-MC-Unique: F4tixe8SPBmODN4SOb_ONw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD4A5801ABC
 for <qemu-devel@nongnu.org>; Fri, 11 Sep 2020 14:20:29 +0000 (UTC)
Received: from kaapi (unknown [10.40.192.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D0C4821E0;
 Fri, 11 Sep 2020 14:20:27 +0000 (UTC)
Date: Fri, 11 Sep 2020 19:50:24 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: About 'qemu-security' mailing list
Message-ID: <nycvar.YSQ.7.78.906.2009111910280.36374@xnncv>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 00:33:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

   Hello all,

Recently while conversing with DanPB this point came up

    -> https://www.qemu.org/contribute/security-process/

* Currently QEMU security team is a handful of individual contacts which
   restricts community participation in dealing with these issues.

* The Onus also lies with the individuals to inform the community about QEMU
   security issues, as they come in.


Proposal: (to address above limitations)
=========

* We set up a new 'qemu-security' mailing list.

* QEMU security issues are reported to this new list only.

* Representatives from various communities subscribe to this list. (List maybe
   moderated in the beginning.)

* As QEMU issues come in, participants on the 'qemu-security' list shall
   discuss and decide about how to triage them further.

Please kindly let us know your views about it. I'd appreciate if you have any 
suggestions/inputs/comments about the same.


Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


