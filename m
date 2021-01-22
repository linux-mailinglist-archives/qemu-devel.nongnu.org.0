Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEC6300215
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:55:55 +0100 (CET)
Received: from localhost ([::1]:34042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2v2g-00022I-Og
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:55:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l2v12-0001CH-Gx
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:54:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l2v0z-00041w-77
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:54:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611316447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UMar3zMSMGf21Kw1XfMRNpvsczso7dJlh6LUdmEs50U=;
 b=A9L6FQfL1b4Ch6y2Cug3uToH1CUSXopbWOefKpSFD2vvRnWYV6gYc+POPDBuh7z5+2kahl
 VPmRYlVbzGvLmBgalb7bkJyhz4LthPA//60/JhCFG59J/MQC1tTk2oTdAfPknf8tBN0u6J
 ux0VLrTCZlbBgHjBBbx2Sw6jUEOk3U0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-wxOY75kcPA259UNEBVVNvQ-1; Fri, 22 Jan 2021 06:54:04 -0500
X-MC-Unique: wxOY75kcPA259UNEBVVNvQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDF371835861;
 Fri, 22 Jan 2021 11:53:53 +0000 (UTC)
Received: from kaapi (vpn2-54-157.bne.redhat.com [10.64.54.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5658C5D9CA;
 Fri, 22 Jan 2021 11:52:57 +0000 (UTC)
Date: Fri, 22 Jan 2021 17:22:47 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [Qemu-devel] [PATCH v2 07/11] chardev: Let IOReadHandler use
 unsigned type
In-Reply-To: <3eefc179e8217ef0ec52080fc003796f70b112fe.camel@linuxfoundation.org>
Message-ID: <s33o7756-7r9n-329n-6664-99p3o665qoos@erqung.pbz>
References: <20181012002217.2864-1-philmd@redhat.com>
 <20181012002217.2864-8-philmd@redhat.com>
 <3eefc179e8217ef0ec52080fc003796f70b112fe.camel@linuxfoundation.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463810047-866185254-1611316431=:583157"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Jason Wang <jasowang@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Clark <mjc@sifive.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Markus Armbruster <armbru@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Laurent Vivier <lvivier@redhat.com>, Corey Minyard <minyard@acm.org>,
 Amit Shah <amit@kernel.org>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, Peter Chubb <peter.chubb@nicta.com.au>,
 Zhang Chen <zhangckid@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Michael Walle <michael@walle.cc>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463810047-866185254-1611316431=:583157
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

+-- On Fri, 22 Jan 2021, Richard Purdie wrote --+
| If so can anyone point me at that change?
| 
| I ask since CVE-2018-18438 is marked as affecting all qemu versions
| (https://nvd.nist.gov/vuln/detail/CVE-2018-18438).
| 
| If it was fixed, the version mask could be updated. If the fix wasn't deemed 
| worthwhile for some reason that is also fine and I can mark this one as such 
| in our system. I'm being told we only need one of the patches in this series 
| which I also don't believe as I suspect we either need the set or none of 
| them!
| 
| Any info would be most welcome.

  -> https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg02239.html
  -> https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg02231.html

* Yes, the type change fix had come up during patch reviews above, and this 
  series implemented the change.

* Series is required IIUC, didn't realise it's not merged.


Thank you. 
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810047-866185254-1611316431=:583157--


