Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 063E430ACBB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:37:06 +0100 (CET)
Received: from localhost ([::1]:59158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6cCH-0003uO-4w
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:37:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1l6c9g-000207-Ec
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:34:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1l6c9c-0003O7-9s
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612197256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ObxWY/aurmASZ+PpjeQYahak2MFh02zkxtAAfEUVFW0=;
 b=LDmL0HFZ2eAZk1fkNgQQ1RS+H3V5JcoEsVn1oOp+QvcSrE/91U9nDNEHkNYKZe7/ZMH7ue
 z1F67ZOxhqYtxVLOIpn0VTY6kf0T5adzQ1kqYqCG2O4BlvF+kHjSeDulkgSjOiGZwdhT+I
 c01eeNAnmPfKt1+Us35zgeZJw9BQFhk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-Kp4QF6-oMJeIyw-pLFDrlg-1; Mon, 01 Feb 2021 11:34:03 -0500
X-MC-Unique: Kp4QF6-oMJeIyw-pLFDrlg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E24A11015C98;
 Mon,  1 Feb 2021 16:34:01 +0000 (UTC)
Received: from oldenburg.str.redhat.com (ovpn-113-35.ams2.redhat.com
 [10.36.113.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9F8A2B431;
 Mon,  1 Feb 2021 16:33:55 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH RFC 1/4] docs: add a table showing x86-64 ABI
 compatibility levels
References: <20210201153606.4158076-1-berrange@redhat.com>
 <20210201153606.4158076-2-berrange@redhat.com>
Date: Mon, 01 Feb 2021 17:33:53 +0100
In-Reply-To: <20210201153606.4158076-2-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 1 Feb 2021 15:36:03
 +0000")
Message-ID: <87sg6foiha.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fweimer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=fweimer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrang=C3=A9:

> and supported by GCC, CLang, GLibC and more.

Clang and glibc are the official spellings, I think.

> diff --git a/docs/system/cpu-models-x86-abi.csv b/docs/system/cpu-models-=
x86-abi.csv
> new file mode 100644
> index 0000000000..4565e6a535
> --- /dev/null
> +++ b/docs/system/cpu-models-x86-abi.csv

> +Icelake-Client,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Icelake-Client-noTSX,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Icelake-Client-v1,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Icelake-Client-v2,=E2=9C=85,=E2=9C=85,=E2=9C=85,

Icelake Client supports x86-64-v4 according to Intel ARK and a quick
test on a reference system.  Have you defined it differently in QEMU?

> +KnightsMill,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +KnightsMill-v1,=E2=9C=85,=E2=9C=85,=E2=9C=85,

This one is correct.  Even though Knights Mill supports AVX-512, it does
not cover the variants that are considered definitive for x86-64-v4.

> +Skylake-Server,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Skylake-Server-IBRS,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Skylake-Server-noTSX-IBRS,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Skylake-Server-v1,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Skylake-Server-v2,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Skylake-Server-v3,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Skylake-Server-v4,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85

This one is a little bit odd.  Skylake Xeons which are not Xeon Scalable
Processors exist, and they do not support x86-64-v4.  Is this again a
matter of different naming in QEMU?

Thanks,
Florian
--=20
Red Hat GmbH, https://de.redhat.com/ , Registered seat: Grasbrunn,
Commercial register: Amtsgericht Muenchen, HRB 153243,
Managing Directors: Charles Cachera, Brian Klemm, Laurie Krebs, Michael O'N=
eill


