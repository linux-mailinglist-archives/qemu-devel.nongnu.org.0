Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6FC179F4E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 06:33:16 +0100 (CET)
Received: from localhost ([::1]:43480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9j8E-0008IV-Nw
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 00:33:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51350)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j9j7J-0007qo-9s
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 00:32:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j9j7H-0000XT-AG
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 00:32:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43363
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j9j7H-0000X5-54
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 00:32:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583386333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yazq3E9HhQri+jcMqN3NvXAVQ+2so0YJQFSkSqmfmNU=;
 b=VbYq8sZMQW+sboXRvTXgU/aU6WHPXbmtUlMhDb1MWMd0duug2tTVkc4GoWYK+KryVFza+d
 uhnADjPMz3m/+zwVG+xHAc1ThuXhnOJJC0pccl5CMDDxDUVqAK64CKreLu66lpeejFUvb7
 P8NLBdK1Tqh87Ah8jYpD3I30ooaRWGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-vjSFNMZ-P6Cd0gVh_lJejg-1; Thu, 05 Mar 2020 00:32:10 -0500
X-MC-Unique: vjSFNMZ-P6Cd0gVh_lJejg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0151107ACC7;
 Thu,  5 Mar 2020 05:32:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A593E46;
 Thu,  5 Mar 2020 05:32:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3337011386A6; Thu,  5 Mar 2020 06:32:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Rui Prior <rprior@dcc.fc.up.pt>
Subject: Re: vmx=on with -accel hax
References: <19980599-1cbf-9179-070d-59aa68847968@dcc.fc.up.pt>
Date: Thu, 05 Mar 2020 06:32:07 +0100
In-Reply-To: <19980599-1cbf-9179-070d-59aa68847968@dcc.fc.up.pt> (Rui Prior's
 message of "Wed, 4 Mar 2020 17:42:03 +0000")
Message-ID: <87tv331i5k.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing people listed by "scripts/get_maintainer.pl -f target/i386/hax*".

Rui Prior <rprior@dcc.fc.up.pt> writes:

> Dear qemu developers,
>
> I found a bug/limitation of qemu on windows (qemu-w64-setup-20200201.exe
> from https://qemu.weilnetz.de/w64/ ) that makes qemu terminate
> immediately with "VCPU shutdown request" (twice) if I try to use the
> "vmx=3Don" CPU option while simultaneously using "-accel hax".  Without
> "vmx=3Don", it works fine (but it prevents me from using nested
> virtualization).
>
> I am using HAXM v7.5.6.
>
> Should you need any further information, please let me know.
>
> Best regards,


