Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A84371396
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:25:54 +0200 (CEST)
Received: from localhost ([::1]:39124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldVly-0004DP-27
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ldVkW-0003iw-Hx
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:24:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ldVkU-0007EV-Eq
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:24:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620037460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xj/MUs4kM0hyOOMILcRbxP9oMvEtVE4RaVXF/DyfZLw=;
 b=irIuCth4zOxr5xTGOAqWOPY5HCWuatSxdCOSEXbMsMZWY/uHF1xOHmmVB3DKoHqWGZCSks
 Jb6lMmRCXVbN7c7eQPsw+TXj5C2ldikaNgrj0q1tc8oj8i0fRuRHZbhCQUkAYwXiAIGlJj
 Vz3ae+jPh5sPc88+AkgGzmELDLfU66k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-rm3MrnshPlq6tf2xIarbdQ-1; Mon, 03 May 2021 06:24:17 -0400
X-MC-Unique: rm3MrnshPlq6tf2xIarbdQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F34A780ED8D;
 Mon,  3 May 2021 10:24:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB25919C45;
 Mon,  3 May 2021 10:24:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2A138113525D; Mon,  3 May 2021 12:24:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH 1/2] Drop the deprecated lm32 target
References: <20210503084034.3804963-1-armbru@redhat.com>
 <20210503084034.3804963-2-armbru@redhat.com>
 <c8a153ce872c6df9e9433291dc41edad@walle.cc>
Date: Mon, 03 May 2021 12:24:14 +0200
In-Reply-To: <c8a153ce872c6df9e9433291dc41edad@walle.cc> (Michael Walle's
 message of "Mon, 03 May 2021 11:30:04 +0200")
Message-ID: <87mttcaze9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Michael Walle <michael@walle.cc> writes:

> Am 2021-05-03 10:40, schrieb Markus Armbruster:
>> Target lm32 was deprecated in commit d8498005122, v5.2.0.  See there
>> for rationale.
>> 
>> Some of its code lives on in device models derived from milkymist
>> ones: hw/char/digic-uart.c and hw/display/bcm2835_fb.c.
>
> yaay ;)

Even at a glance, it was obvious to me that a lot of care went into the
code being removed.  Thanks for serving as its maintainer!

>> Cc: Michael Walle <michael@walle.cc>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Acked-by: Michael Walle <michael@walle.cc>

And for this, too :)


