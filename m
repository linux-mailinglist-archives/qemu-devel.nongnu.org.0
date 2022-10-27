Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A298260FA95
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 16:40:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo42n-0002s5-Es; Thu, 27 Oct 2022 10:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oo42f-000282-IP
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:39:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oo42X-0004NC-OT
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666881564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HzvA0YOEugPiZ1hN3pYW7TIB1f7q/b266g5PXsLHw5c=;
 b=T/6rEaR0CVEX3ABiEhu9sBbOnBu7iHADszGpLA34yv2uGcxwqv6WNC8i0a2p7zRLJjS3QG
 mpPiLv/g3FUQZgIX5CabR9jQylXDX5ZfizD27xlRS8qMFNc0Me3f0bntocwtTr5jVYSRzU
 b1nD93UTRYHLtOCW34y3ZQ+PwwjVY18=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-wZXZQzrKPOWkyl9zl96OTg-1; Thu, 27 Oct 2022 10:39:21 -0400
X-MC-Unique: wZXZQzrKPOWkyl9zl96OTg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 734B91012464;
 Thu, 27 Oct 2022 14:39:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25B3AC15BAB;
 Thu, 27 Oct 2022 14:39:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EACB321E6921; Thu, 27 Oct 2022 16:39:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  David Hildenbrand <david@redhat.com>,  Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>,  Thomas Huth
 <thuth@redhat.com>,  qemu-s390x@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Laurent Vivier <laurent@vivier.eu>,
 Cornelia Huck <cohuck@redhat.com>,  qemu-trivial@nongnu.org
Subject: Re: [PATCH 0/3] target: Rename headers using .def extension to .h.inc
References: <20221025235006.7215-1-philmd@linaro.org>
Date: Thu, 27 Oct 2022 16:39:18 +0200
In-Reply-To: <20221025235006.7215-1-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 26 Oct 2022 01:50:03
 +0200")
Message-ID: <87bkpxl4a1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> We use the .h.inc extension to include C headers. To be consistent
> with the rest of the codebase, rename the C headers using the .def
> extension.
>
> IDE/tools using our .editorconfig / .gitattributes will leverage
> this consistency.
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   target/m68k: Rename qregs.def -> qregs.h.inc
>   target/s390x: Rename insn-data/format.def -> insn-data/format.h.inc
>   target/tricore: Rename csfr.def -> csfr.h.inc
>
>  target/m68k/{qregs.def =3D> qregs.h.inc}                 |  0
>  target/m68k/translate.c                                |  4 ++--
>  target/s390x/tcg/{insn-data.def =3D> insn-data.h.inc}    |  2 +-
>  .../s390x/tcg/{insn-format.def =3D> insn-format.h.inc}   |  0
>  target/s390x/tcg/translate.c                           | 10 +++++-----
>  target/tricore/{csfr.def =3D> csfr.h.inc}                |  0
>  target/tricore/translate.c                             |  4 ++--
>  7 files changed, 10 insertions(+), 10 deletions(-)
>  rename target/m68k/{qregs.def =3D> qregs.h.inc} (100%)
>  rename target/s390x/tcg/{insn-data.def =3D> insn-data.h.inc} (99%)
>  rename target/s390x/tcg/{insn-format.def =3D> insn-format.h.inc} (100%)
>  rename target/tricore/{csfr.def =3D> csfr.h.inc} (100%)

I wonder why we use any of .def, .h.inc, .inc.h, .c.inc, .inc.c.  Why
not .h and call it a day?  No need to configure each and every editor to
tread these as C code.


