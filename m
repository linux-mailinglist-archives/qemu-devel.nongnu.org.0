Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC4F253D81
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 08:11:27 +0200 (CEST)
Received: from localhost ([::1]:47732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBB8A-0005P3-A7
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 02:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kBB6y-0004MW-2Y
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 02:10:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kBB6w-0004zO-FQ
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 02:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598508609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ipkAN57+4Q0PnF2HH+GzeujjzxOt6yJAXxN4OVv4LPI=;
 b=K5vO5t7HK1H2mmCcSMXfKfko3buT/pb2P4uy0aQnKc7RbrAYQF83jjUlxg8LA5v4VYN/yZ
 Dbdh7R7E/MoqYs7VOUCOAja0zCBZ8BjXx87U1IaP2Cvl/fBy4QPsbgpIGMguDUKHRTlu4f
 wH+D4uw8wDOKGO++t5fBfMvylVG+prQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-4cm4h2_DMoWPdnbb8m5zjg-1; Thu, 27 Aug 2020 02:10:05 -0400
X-MC-Unique: 4cm4h2_DMoWPdnbb8m5zjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44A72801AF9;
 Thu, 27 Aug 2020 06:10:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-74.ams2.redhat.com
 [10.36.112.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEA291992F;
 Thu, 27 Aug 2020 06:10:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 67A5E112D737; Thu, 27 Aug 2020 08:10:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Rohit Shinde <rohit.shinde12194@gmail.com>
Subject: Re: [PATCH v5] qapi/opts-visitor: Added missing fallthrough
 annotations
References: <20200818105021.4998-1-rohit.shinde12194@gmail.com>
 <87o8mzjm7r.fsf@dusky.pond.sub.org>
 <CA+Ai=tD2QK9+GaXQoQWzKTPY-uZhLSCBeLUfz95eCiHv0v2i+A@mail.gmail.com>
Date: Thu, 27 Aug 2020 08:10:02 +0200
In-Reply-To: <CA+Ai=tD2QK9+GaXQoQWzKTPY-uZhLSCBeLUfz95eCiHv0v2i+A@mail.gmail.com>
 (Rohit Shinde's message of "Wed, 26 Aug 2020 20:55:53 -0400")
Message-ID: <87r1rsoc05.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 02:10:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rohit Shinde <rohit.shinde12194@gmail.com> writes:

> I am just compiling with cflag set to -Wimplicit-fallthrough. I am using
> gcc.

-Wimplicit-fallthrough is the same as -Wimplicit-fallthrough=3.  Our
-code is not prepared for that.  What should work is
--Wimplicit-fallthrough=2.

If you have patches to make the entire tree compile with
-Wimplicit-fallthrough=3, we can talk.  You'd have to test them on all
supported hosts, and with a sufficient range of configurations to ensure
they are not breaking builds.


