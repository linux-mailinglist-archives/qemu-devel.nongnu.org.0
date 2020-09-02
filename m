Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A5C25B1F4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 18:47:47 +0200 (CEST)
Received: from localhost ([::1]:54454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDVvG-00044w-3C
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 12:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kDVuB-00039L-DN
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 12:46:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kDVu8-0006fz-Vc
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 12:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599065195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KTVc7qDcVbM+QBMvC4kp0RrN9LF6xS0Bimh2twZRfBg=;
 b=gb60VDn4h00/NpPI6jJPcJhv3uMrWG7xyFOhyDuxpkPjBNBohu/xOJM2zShjIldlqhBLJj
 s2YbgQPofNjA1sVEL4mKx0WOX5C0aT7QKED0MCMgFYX1NPlKOboc230jxGeO4X60kgRkEo
 G4O0lfiJfrAQAvhrDPyFNO99Y4VBQX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-aRkCjUqdPwyL7B-zX9sf7Q-1; Wed, 02 Sep 2020 12:46:30 -0400
X-MC-Unique: aRkCjUqdPwyL7B-zX9sf7Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDF1380BCA1;
 Wed,  2 Sep 2020 16:46:28 +0000 (UTC)
Received: from kaapi (ovpn-112-116.phx2.redhat.com [10.3.112.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05BD7805C0;
 Wed,  2 Sep 2020 16:46:26 +0000 (UTC)
Date: Wed, 2 Sep 2020 22:16:24 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] sd: sdhci: check data_count is within fifo_buffer
In-Reply-To: <6337568d-e443-7107-9dcc-ab3ea2296525@amsat.org>
Message-ID: <nycvar.YSQ.7.78.906.2009022213350.2047119@xnncv>
References: <20200827115336.1851276-1-ppandit@redhat.com>
 <6337568d-e443-7107-9dcc-ab3ea2296525@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463810047-2030958368-1599065188=:2047119"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:42:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Ruhr-University <bugs-syssec@rub.de>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463810047-2030958368-1599065188=:2047119
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

+-- On Wed, 2 Sep 2020, Philippe Mathieu-Daudé wrote --+
| > +            if (s->data_count <= begin || s->data_count > s->buf_maxsz) {
| > +                break;
| > +            }
| 
| Thanks for your patch. Note however this kind of security fix hides
| the bug in the model, furthermore it makes the model behaves differently
| that the real hardware (which we aim to model).

  Right, got it.

| I posted a different fix for this problem (fixing the model bug):
| https://www.mail-archive.com/qemu-devel@nongnu.org/msg735715.html
| (you already reviewed it, thank you - I still comment it for the
| other reviewers).
| 
| Can you replace by an assert() call instead? Since this should never
| happen.

  Replace above check with an assert() call? Even with your revised fix above?


Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810047-2030958368-1599065188=:2047119--


