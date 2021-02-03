Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34D530D728
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 11:14:30 +0100 (CET)
Received: from localhost ([::1]:37458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7FB8-0005Iq-0y
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 05:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l7F9A-0003PA-GF
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:12:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l7F96-00014N-Ow
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:12:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612347142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zRfu06y/XG+fdBnGNSmlJstjvayMJBodv2RcwOtkZj8=;
 b=Qea0QNuuVvZ1XH5jHXu6rjdO173/CwORUk6U2yInrVxaS5diBdwU08vu74Jy+Ff8gsiPkq
 2r2oV2GVPYirltlD+0afUjwCJGaT1s6Xkqos+pqupV2iqcb8RwNXojtc3W1GfyFB5k7qXe
 IkoiWIIe58328k14nbjhBNPZzDLoFDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-MSa5Xc-jMfCMcOqd2NKjnw-1; Wed, 03 Feb 2021 05:12:16 -0500
X-MC-Unique: MSa5Xc-jMfCMcOqd2NKjnw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B8A284A61D;
 Wed,  3 Feb 2021 10:12:15 +0000 (UTC)
Received: from kaapi (ovpn-112-152.ams2.redhat.com [10.36.112.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E347977309;
 Wed,  3 Feb 2021 10:12:12 +0000 (UTC)
Date: Wed, 3 Feb 2021 15:42:07 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PULL 00/21] target-arm queue
In-Reply-To: <dc90c90a-b9fd-d89c-629a-e588c47d9953@redhat.com>
Message-ID: <r6n9sqos-6288-ss76-n92q-47r9q2s355p@erqung.pbz>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
 <dc90c90a-b9fd-d89c-629a-e588c47d9953@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463811718-783106300-1612347134=:1137702"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463811718-783106300-1612347134=:1137702
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

+-- On Wed, 3 Feb 2021, Philippe Mathieu-Daudé wrote --+
| FYI Prasad mentioned a CVE was requested:
| https://www.mail-archive.com/qemu-devel@nongnu.org/msg778659.html
| 
| As you said it is an odd configuration, I am not sure it is worth
| to wait for the CVE number to add it to the commit (which helps
| downstream distributions tracking these).
| 
| [updating]
| 
| Just got detail from Prasad on IRC, it usually takes ~1 day to get
| the CVE number assigned, so maybe worth postponing this until tomorrow.
| 
| Prasad, can you reply to this message ASAP once you get the number?

'CVE-2021-20221' assigned by Red Hat Inc.
  -> https://bugs.launchpad.net/qemu/+bug/1914353/comments/3

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463811718-783106300-1612347134=:1137702--


