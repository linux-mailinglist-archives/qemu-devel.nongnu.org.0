Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6471EAE92
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 20:55:23 +0200 (CEST)
Received: from localhost ([::1]:57740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfpak-00059j-JA
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 14:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jfpZl-0004R2-Ow
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 14:54:21 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58870
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jfpZk-0003YY-Ty
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 14:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591037659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o5oEyfkpuAU1tS/7WUnKPbSzsrM3ln+CoxiVQAtZa08=;
 b=PURzpLrsSV3A8SHfx+VUb1n3NutDgvi2HAL4GpBo3fDaigkpm3wvLLL1Di6XA0v1Hglb86
 9RXDF9dPgCXZHxm+wh8pt3dcT9Wc5awIujXvWTee6P4eZ8HwZeBr9rIWueccBnlwvxxXF3
 t4PRvxHlF2dLw1fgXptEXr6xU0hz0D8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-icEK8Ej2NJOovwrdNBdVyg-1; Mon, 01 Jun 2020 14:54:15 -0400
X-MC-Unique: icEK8Ej2NJOovwrdNBdVyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FD7F464;
 Mon,  1 Jun 2020 18:54:14 +0000 (UTC)
Received: from kaapi (ovpn-116-42.sin2.redhat.com [10.67.116.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10C9F610F3;
 Mon,  1 Jun 2020 18:54:07 +0000 (UTC)
Date: Tue, 2 Jun 2020 00:24:04 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] msix: add valid.accepts methods to check address
In-Reply-To: <729e8bd2-ee11-5e6a-4b09-86bc1c56b9d3@redhat.com>
Message-ID: <nycvar.YSQ.7.77.849.2006020022070.62159@xnncv>
References: <20200601051454.826415-1-ppandit@redhat.com>
 <729e8bd2-ee11-5e6a-4b09-86bc1c56b9d3@redhat.com>
MIME-Version: 1.0
Content-ID: <nycvar.YSQ.7.77.849.2006020023550.62159@xnncv>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 BOUNDARY="-1463810047-186318904-1591037608=:62159"
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 13:44:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Anatoly Trosinenko <anatoly.trosinenko@gmail.com>, Ren Ding <rding@gatech.edu>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 Hanqing Zhao <hanqing@gatech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463810047-186318904-1591037608=:62159
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <nycvar.YSQ.7.77.849.2006020023551.62159@xnncv>

+-- On Mon, 1 Jun 2020, Philippe Mathieu-Daudé wrote --+
| Fixes: CVE-2020-xxxxx

'CVE-2020-13754' assigned to this issue by Mitre.
  -> https://bugzilla.redhat.com/show_bug.cgi?id=1842363

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810047-186318904-1591037608=:62159--


