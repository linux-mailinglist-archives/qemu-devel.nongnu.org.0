Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433823DE690
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 08:05:47 +0200 (CEST)
Received: from localhost ([::1]:35010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAnYg-0006OP-Bn
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 02:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAnXv-0005hz-Dt
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 02:04:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAnXu-0002dp-34
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 02:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627970697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F0JlHWgvfrnKjVohGJCL5BQ+Q/IZpMSX024lv3U6acc=;
 b=RciV2hyDB/UnXzuQuqIV7qoAo3WIGLCXGWJHVo61Gk4QJVsj+GHmNa19YMutyYy0iurdvO
 hexvG6ZUgdJGTzNUoTr6jGPqvH5ZZYTMqVDbTgAj5KmfIFHldrR1KLKWnvzysJn7ndVQ4F
 hLcnFrWxlee3daAQuEn5l6KUTRysGC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-zpOToQS2NsaRJA176RrRxQ-1; Tue, 03 Aug 2021 02:04:54 -0400
X-MC-Unique: zpOToQS2NsaRJA176RrRxQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D91539382
 for <qemu-devel@nongnu.org>; Tue,  3 Aug 2021 06:04:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D8CB19C44;
 Tue,  3 Aug 2021 06:04:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C516211380A0; Tue,  3 Aug 2021 08:04:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/6] Updates for Coverity modeling file
References: <20210731062741.301102-1-pbonzini@redhat.com>
Date: Tue, 03 Aug 2021 08:04:51 +0200
In-Reply-To: <20210731062741.301102-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Sat, 31 Jul 2021 08:27:35 +0200")
Message-ID: <87o8afjc70.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

[...]

> This series is a sort of FYI; since the only way to debug the model file
> is to upload it to scan.coverity.com, these changes are all already live.

When I mess with Coverity, I test with my locally installed version
first.  Version skew and lack of the web interface can make that less
than useful sometimes.

This is not criticism of your work flow.

> The last will be as of the next build, but was effective last Thursday
> and worked (I tried disabling it on Friday in something like a bisection,
> but it failed and I have now reverted to Thursday's model).


