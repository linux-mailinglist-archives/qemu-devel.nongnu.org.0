Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FA72CCE71
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 06:23:11 +0100 (CET)
Received: from localhost ([::1]:57228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkh5C-0004BE-IW
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 00:23:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kkh3Z-0003dS-6C
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 00:21:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kkh3W-0004Rm-ON
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 00:21:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606972884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u8YQUqpaPChXDuKHO28KrMR4zqS+U/AxgYe4AQOoJcU=;
 b=Q0M2/PmtfQ8lpOQzqzyRX1lAkZcBnZNJPN9TvaC5Sm3oRMIqlTQ19+ueRKr3sP/gUtO3Qn
 oOa8PlqXXcOSDQ2Xzs/000yVLwshGUzWGf4P/OTq4e9Gdxw0dSdPeYPkpmE5oHCNdVSyzP
 zl335LBc1C7jgOKs3z+efRDsZcgXQoI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-4cVQI2r7OxGBEJ9q01S9qg-1; Thu, 03 Dec 2020 00:21:21 -0500
X-MC-Unique: 4cVQI2r7OxGBEJ9q01S9qg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D235D100C661;
 Thu,  3 Dec 2020 05:21:19 +0000 (UTC)
Received: from kaapi (unknown [10.74.9.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97AAB1000232;
 Thu,  3 Dec 2020 05:21:07 +0000 (UTC)
Date: Thu, 3 Dec 2020 10:51:03 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v1 1/1] security-process: update process information
In-Reply-To: <d48ca955-b84e-429d-3abf-c275ff2ede52@redhat.com>
Message-ID: <228r378q-53o2-9so-9rso-6ro87983qr38@erqung.pbz>
References: <20201130134907.348505-1-ppandit@redhat.com>
 <20201130134907.348505-2-ppandit@redhat.com>
 <d48ca955-b84e-429d-3abf-c275ff2ede52@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463810047-1130521290-1606972878=:373362"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Petr Matousek <pmatouse@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>, Michael Roth <michael.roth@amd.com>,
 =?ISO-8859-15?Q?Daniel_P_=2E_Berrang=E9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463810047-1130521290-1606972878=:373362
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

+-- On Wed, 2 Dec 2020, Philippe Mathieu-Daudé wrote --+
| Maybe:
| 
|      0) **Acknowledge reception**
|        - A non-automated response email is sent to acknowledge the
|          reception of the request.
|          This is the starting date for the maximum **60 days** required
|          to process the issue, including bullets 1) and 2).
| 
| > +    - Create an upstream fix patch
| 
|          with the proper Buglink/CVE/Reported-by tags.
| 
|        - Participate in the review process until the patch is merged.
|          Test the fix updates with the private reproducer if required.
|        - Close the upstream [bug] with 'Fix released', including the
|          commit SHA-1 of the fix.
... 
| >  Email sent to us is read and acknowledged with a non-automated response. For
| >  issues that are complicated and require significant attention, we will open an
| 
|    ^^^ You can remove that, as now covered by bullet 0).

Okay, will do. Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810047-1130521290-1606972878=:373362--


