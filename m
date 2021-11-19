Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B564572FA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:31:52 +0100 (CET)
Received: from localhost ([::1]:38414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6nn-0004Zp-N3
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:31:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mo6fq-00075G-EI
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:23:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mo6fn-0005Mi-Rr
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637339014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A41A1UGsUCgmBJoKu1eFJuwQR4wEx16nwik+2np6lXY=;
 b=DUqR5jgczuT1F2hEveLoOeitvFUCHYBpHNykjUC2gUqswY74JSHrxRNFTU47Pyb7+yEBfV
 sdRw5hl2LVrkGvvY0MK/teWiTWW3WtBc/fXmTQPcd3tJgn2MB/6ZTMOlHjRXS4QnUhqYod
 Rt5ojMY38bih+HfUWWZsQvj/JXLfd7s=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-KU8bxXyrO9eTG3zVO0nwfA-1; Fri, 19 Nov 2021 11:23:32 -0500
X-MC-Unique: KU8bxXyrO9eTG3zVO0nwfA-1
Received: by mail-pj1-f69.google.com with SMTP id
 h15-20020a17090a648f00b001a96c2c97abso3478789pjj.9
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:23:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A41A1UGsUCgmBJoKu1eFJuwQR4wEx16nwik+2np6lXY=;
 b=bTcjA+zOOzWQzVToP/7uw7F9SKumaPpqz9CWCNoCUGQcImYnZX0WIri0N/S25MV2+7
 FiuWP08ErmroPtbXhCh0HyjdjP7lYNgaTg8giVUJinAbxAIfWkLNoD3kAIBfYhf5zMoF
 KHjzKhV8Bkoz/zfvIkf8l5Hv78ClwVyQMGW+8pfdYoHHYC0yIXv9SXCQaLf8aD7KJpv3
 hwZ4duYff/ZINTrQKGWJfSJkNivAp4uM766KoMLuDJIt5lsNS7BhkQHlyz2s9m1z7cVW
 NjOl4EZ5j886vxV6FoudVcjJ3pO+1f454cUYJ8c3h5ALgoV4G5dpe4uLSEF4nOdivL+s
 FJpw==
X-Gm-Message-State: AOAM531NII4rWGMzVRU7LJ3Sr9Kw8dadQKQRZfvfeSfKm0f3VhDDfJvI
 dko+ol08et3FJwFO/rpXmzaGddrFaf5phEdsG1cTEDqCwk6wruWSGfFK2O9pTJqAG2vGt5aBHRi
 v/29V2YokMCwULfZBKmf7vKqavyxZcDk=
X-Received: by 2002:a63:1007:: with SMTP id f7mr2047295pgl.212.1637339011266; 
 Fri, 19 Nov 2021 08:23:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLK6eJAcP039wqbfAZ2NqSPCnOX9vuafGR70GPH3x4A48kjGuMCjVwOGLy4BK6HiPf62HoAwg3DuVy0xs+rao=
X-Received: by 2002:a63:1007:: with SMTP id f7mr2047273pgl.212.1637339011072; 
 Fri, 19 Nov 2021 08:23:31 -0800 (PST)
MIME-Version: 1.0
References: <20211119135348.407679-1-farosas@linux.ibm.com>
In-Reply-To: <20211119135348.407679-1-farosas@linux.ibm.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 19 Nov 2021 13:23:04 -0300
Message-ID: <CAKJDGDZxV9prPohFkXJB85ZLxFgTs4B0NS5Ri88BcoRC7XYdMw@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: ppc: Add smoke tests for MPC7400 and
 MPC7450 families
To: Fabiano Rosas <farosas@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Wainer Moschetta <wainersm@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 10:54 AM Fabiano Rosas <farosas@linux.ibm.com> wrote:
>
> These tests ensure that our emulation for these cpus is not completely
> broken and we can at least run OpenBIOS on them.
>
> $ make check-avocado AVOCADO_TESTS=../tests/avocado/ppc_74xx.py
>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>
> ---
> Note that the 7450s are currently broken, depending on the fix for
> https://gitlab.com/qemu-project/qemu/-/issues/86 that is being
> discussed in the thread:
>
> https://lists.nongnu.org/archive/html/qemu-ppc/2021-11/msg00289.html
> ---
>  tests/avocado/ppc_74xx.py | 134 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100644 tests/avocado/ppc_74xx.py
>
> diff --git a/tests/avocado/ppc_74xx.py b/tests/avocado/ppc_74xx.py
> new file mode 100644
> index 0000000000..72b99d39c0
> --- /dev/null
> +++ b/tests/avocado/ppc_74xx.py
> @@ -0,0 +1,134 @@
> +# Smoke tests for 74xx cpus (aka G4).
> +#
> +# Copyright (c) 2021, IBM Corp.
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +from avocado import skip

You are not using this import in the file. No need to import it here.

Removing the unused import, the code looks good to me, so:

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


