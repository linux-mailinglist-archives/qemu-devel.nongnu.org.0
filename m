Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AECAA258727
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 06:58:45 +0200 (CEST)
Received: from localhost ([::1]:45628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCyNY-0003m5-R2
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 00:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kCyMt-0003Lf-6V
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 00:58:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38716
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kCyMq-0000Uh-VR
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 00:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598936279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZIK8z7H0yjZPm75IRm985CwA2QYdlQqCEWM3WlyKf4Q=;
 b=DZnOQ3SEPVzvxfwD7huLrwGgYQLXsce99rwzbQlunB142Z83XiQ+ul0M8mLcDc+HLp3due
 pVBq0QcjLwYn8gtv5dlG7jCA7l2DBwWgcaA1zGkH3+Qn0oAsxJG3J/m1XkIue4RDmoEoqT
 EEZevpiQun2x1ZmwSgye1iFzplqFGqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-k4wmzA9kMtetTU1OHel1Vw-1; Tue, 01 Sep 2020 00:57:55 -0400
X-MC-Unique: k4wmzA9kMtetTU1OHel1Vw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77B451009440;
 Tue,  1 Sep 2020 04:57:54 +0000 (UTC)
Received: from kaapi (unknown [10.74.8.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D001614F5;
 Tue,  1 Sep 2020 04:57:49 +0000 (UTC)
Date: Tue, 1 Sep 2020 10:27:46 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: Li Qiang <liq3ea@gmail.com>
Subject: Re: [PATCH] usb: fix setup_len init (CVE-2020-14364)
In-Reply-To: <CAKXe6SKrTLAgRE4Wnk4sJkxzvXHD_FoaXBBrM_utLRtbJrCvRw@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.78.906.2009011021440.306228@xnncv>
References: <20200825053636.29648-1-kraxel@redhat.com>
 <CAKXe6SKrTLAgRE4Wnk4sJkxzvXHD_FoaXBBrM_utLRtbJrCvRw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ppandit@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 00:57:59
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
Cc: Gonglei <arei.gonglei@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hello Li,

+-- On Tue, 25 Aug 2020, Li Qiang wrote --+
| Just see the page.
| -->https://access.redhat.com/security/cve/CVE-2020-14364
| 
| The 'Attack Vector' of the CVSS score here is 'local'.
| 
| I think this should be 'network' as the guest user can touch this in cloud 
| environment? What's the consideration here?

  -> https://www.first.org/cvss/v3.1/user-guide#3-5-Scope-Vulnerable-Component-and-Impacted-Component

AV:Network or Adjacent is generally used when issue involves network stack. In 
this case it's a usb device r/w operation.


Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


