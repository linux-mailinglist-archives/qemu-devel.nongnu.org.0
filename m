Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5812A2F64B7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:36:04 +0100 (CET)
Received: from localhost ([::1]:40902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04fL-0004eb-Bz
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:36:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l04b0-0002eB-GD
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:31:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l04ax-0005Zt-UX
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610638290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BVkXEhXN3NRP6ajWn7EvNV9gUO3UK8dQBjp1ycosb2g=;
 b=NzQNhj5mb78A3UXPngh0Wt/cz7t0wv6e7UsbTBYYD0JIIoMAPIxJQoFI+a1jEhvg8KiifL
 tKbUyVUqbf6D6wjG5+x4mxU5rrpnysy/zAiTpvEHTmv+ZJ4J62i5l6Toz8ZgB4hYKSBNgq
 CheprG0lwunZ25BVlnNf4au+MzF6/cY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-58luJNe4MxSI_kC89DaAlg-1; Thu, 14 Jan 2021 10:31:28 -0500
X-MC-Unique: 58luJNe4MxSI_kC89DaAlg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9774A18C8C01;
 Thu, 14 Jan 2021 15:31:26 +0000 (UTC)
Received: from kaapi (unknown [10.33.36.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A796D60C47;
 Thu, 14 Jan 2021 15:31:17 +0000 (UTC)
Date: Thu, 14 Jan 2021 21:01:13 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 1/1] security-process: update process information
In-Reply-To: <73cb359c-164e-13ed-dccf-1706e03ea52b@redhat.com>
Message-ID: <r8pon75n-3o56-646-os49-os67578r64n@erqung.pbz>
References: <20201203142902.474883-1-ppandit@redhat.com>
 <20201203142902.474883-2-ppandit@redhat.com>
 <73cb359c-164e-13ed-dccf-1706e03ea52b@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463810047-754959606-1610638285=:330428"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Petr Matousek <pmatouse@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?ISO-8859-15?Q?Daniel_P_=2E_Berrang=E9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463810047-754959606-1610638285=:330428
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

+-- On Thu, 14 Jan 2021, Philippe Mathieu-Daudé wrote --+
| What is the status of this, is something missing?

 -> https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg04469.html

 It is up and running.^^

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810047-754959606-1610638285=:330428--


