Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC38648D69
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 08:27:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3uEv-0007EM-SH; Sat, 10 Dec 2022 02:25:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3uEt-0007E3-OZ
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 02:25:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3uEs-0003Hz-0n
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 02:25:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670657136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z1KvkwSbecAfpu4sTxMlKVFnZ0hupaHWTE/QIHrOUyM=;
 b=X+VKS6JmWLsi3c/0ozYVPDZiYGcGq3KRuctadzpDDYStD0aoxD5OatNFeMQrkK2y3fzHp0
 wrAmGVelOAl5uVtzErNIRlzCSf4Ak417X/BfJhs0eh9ZuxXbq5tO9kitKJnJ/O/erLcU0T
 2+UwuMYgMg6pn0T+g5nf27VK2uOHexM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-pX0bV4ijM_Sn9kQJplx6vA-1; Sat, 10 Dec 2022 02:25:33 -0500
X-MC-Unique: pX0bV4ijM_Sn9kQJplx6vA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07A461C05AFB;
 Sat, 10 Dec 2022 07:25:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A063C15BAB;
 Sat, 10 Dec 2022 07:25:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ED16521E6921; Sat, 10 Dec 2022 08:25:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org,  marcel.apfelbaum@gmail.com,
 jonathan.cameron@huawei.com,  philmd@linaro.org
Subject: Re: [PATCH 1/5] include/hw/pci: Clean up superfluous inclusion of
 pci*/*.h cxl/*.h
References: <20221209134802.3642942-1-armbru@redhat.com>
 <20221209134802.3642942-2-armbru@redhat.com>
 <20221209120234-mutt-send-email-mst@kernel.org>
Date: Sat, 10 Dec 2022 08:25:28 +0100
In-Reply-To: <20221209120234-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Fri, 9 Dec 2022 12:03:51 -0500")
Message-ID: <87359nbtzr.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Fri, Dec 09, 2022 at 02:47:58PM +0100, Markus Armbruster wrote:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Thanks!
> How can I verify this is correct, i.e. that none
> of the headers that we remove is actually needed?

I think the pragmatic way forward is to let the compiler check.

"But how can we be confident the compiler's check is complete?" you
might ask.  So let's consider how it could be incomplete.

Any .c that (transitively) includes one of the headers that now include
less could be affected.

* Test builds fail to compile such a .c.

  To actually miss a problem, the code not covered must use something
  from a header that is no longer included.

* Test builds compile such a .c, but fail to cover all build
  configurations.

  To actually miss a problem, the conditional code not covered must use
  something from a header that is no longer included.

* Test builds silently miscompile such a .c, i.e. the build succeeds,
  "make check" passes, but the generated code is wrong.

  For this, the code must use something from a header that is no longer
  included *and* it still needs to make sense to the compiler.  Seems
  far-fetched to me, except for #ifdef FOO where FOO comes from such a
  header.

In my opinion, breaking something not covered by CI and in a way that is
trivial to fix doesn't really matter.

In addition to building various configurations, I tested that each
affected header compiles on its own, by compiling

    #include "qemu/osdep.h"
    #include THE_HEADER

There are two failures, hw/cxl/cxl_device.h and include/hw/pci/pcie.h,
but they both fail before this patch as well, and they don't fail
anymore at the end of this series.

Anything else you'd like me to do?


