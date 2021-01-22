Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA443003ED
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:17:04 +0100 (CET)
Received: from localhost ([::1]:52692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2wJB-0005AY-Jy
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:17:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l2wFo-0004K5-27
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:13:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l2wFk-00067b-5v
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:13:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611321206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9e2YD7iX1tRcfzotb4gZr2zJeK77nL7DwijFZfDEUWw=;
 b=HeE/rr23mVVyoyd6WLGLpnsCspqxDmdhEXD3M/rrSh/Bi+554HIp/Y1bEf/2HtiYxcPabc
 e+vV2tFTpMZMu8Qc9pK7D1uigIVei6AQ9sObN5gNEWkBni77YldvQ3khltSxWwoZlYDds9
 Hbfe9EoA6sRL6iS2JnCjnGyFdbZffsc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-H5ihtyULP5SMx-oRAsMzkg-1; Fri, 22 Jan 2021 08:13:24 -0500
X-MC-Unique: H5ihtyULP5SMx-oRAsMzkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16FA7801817
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 13:13:24 +0000 (UTC)
Received: from kaapi (vpn2-54-157.bne.redhat.com [10.64.54.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99ACC100AE4D;
 Fri, 22 Jan 2021 13:13:18 +0000 (UTC)
Date: Fri, 22 Jan 2021 18:43:08 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: About 'qemu-security' list subscription process
In-Reply-To: <20210115181029.GY1692978@redhat.com>
Message-ID: <5rqo7o5p-289n-4p99-2o3p-323o70q813r5@erqung.pbz>
References: <r95p856o-o5r3-1r88-p675-2111r17p7794@erqung.pbz>
 <20210115181029.GY1692978@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463810047-1819628035-1611321201=:583157"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: Michael Tsirkin <mtsirkin@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463810047-1819628035-1611321201=:583157
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

+-- On Fri, 15 Jan 2021, Daniel P. Berrangé wrote --+
| IOW ideally there should be some web of trust whereby some existing 
| member(s) knows the person/entity who is requesting acces. Other cases would 
| have to be evaluated case-by-case basis.

* True, sounds reasonable. I'll probably start a thread on the -sec list for 
  pending requests.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810047-1819628035-1611321201=:583157--


