Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE2D25FC32
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 16:41:59 +0200 (CEST)
Received: from localhost ([::1]:55068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFILG-0001bS-G0
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 10:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kFIKW-00018F-1w
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 10:41:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kFIKU-0000cP-DH
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 10:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599489669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p+kXwY/hUoP35+VjL2AIVZAksqDZt0gW8CHNmXAJoaA=;
 b=L7ouVUv9Sp0AURPw4p9Y+z1Yi1XDtS22x4rbDV84h+YCgWBAx4fhTqQ5xK/pIcfqtv290C
 kEVB1uodHpvSBLf/HUZP0vOJyVhvqHCKYK6OLWK/Syd/xD5J4DPzwH3SmAL6y9BkmeNYR4
 tKIiuPVdvAw6ja6/eQ0UbBzv0B36muI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-F4Y9BL6uM0Sbk5h4JP_J1g-1; Mon, 07 Sep 2020 10:41:07 -0400
X-MC-Unique: F4Y9BL6uM0Sbk5h4JP_J1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 778E918B9F14;
 Mon,  7 Sep 2020 14:41:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-68.ams2.redhat.com
 [10.36.113.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47FDE5D9D2;
 Mon,  7 Sep 2020 14:41:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B9B3B1132B59; Mon,  7 Sep 2020 16:41:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: peter.maydell@linaro.org
Subject: Re: [PATCH 0/2] qapi: A section heading bug fix, and maybe an
 improvement
References: <20200320091805.5585-1-armbru@redhat.com>
Date: Mon, 07 Sep 2020 16:41:04 +0200
In-Reply-To: <20200320091805.5585-1-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 20 Mar 2020 10:18:03 +0100")
Message-ID: <874ko9lke7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 03:52:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> PATCH 1 fixes an old defect in the doc comment parser.  I figure it'll
> simplify the rST generator's job.
>
> PATCH 2 might simplify it further.  It's RFC because I'm not sure it
> does.  Peter, you tell me :)

I dropped the ball on this one.  I think both patches make sense, but I
don't want to upset Peter's "Convert QAPI doc comments to generate rST
instead of texinfo" apple cart.  Peter, please tell me what you'd like
me to do:

* Post a pull request, so you can base your v6 on it.

* Nothing, so you can cherry-pick zero, one or both of my patches into
  your v6.


