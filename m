Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8D52197A9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 07:04:52 +0200 (CEST)
Received: from localhost ([::1]:35142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtOjr-0005KB-6X
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 01:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jtOig-0004rl-4l
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 01:03:38 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34962
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jtOie-0007BL-H2
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 01:03:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594271015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OzowdzJjytkvrL3V3R/gUib9z4LX4H7qJGOJWoOMqbY=;
 b=EgxUelMR7yWfLC8JdR6WXWEXVToiNIwQLKouI1xkO7QXQuWeI3sN6kLfzEjHBJsuYswi3Y
 GREaAiY9Va9tocJHsIlj8Jv2WMB8OZUfHsCxGfis/LArGtwJ30ZIyV6Pil28XEP1vFg3RA
 4BaLtY5NyiPwMwSqfGzRXlacuJ5KLt4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-IGRLgwL2O_OngPFLQ-XvrQ-1; Thu, 09 Jul 2020 01:03:33 -0400
X-MC-Unique: IGRLgwL2O_OngPFLQ-XvrQ-1
Received: by mail-wr1-f69.google.com with SMTP id y16so1014607wrr.20
 for <qemu-devel@nongnu.org>; Wed, 08 Jul 2020 22:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=OzowdzJjytkvrL3V3R/gUib9z4LX4H7qJGOJWoOMqbY=;
 b=ZJYPMIDlgJiRL7WCfUilOZRdMbh3mZubPgiCzdOyWYTeITI3bVDLU59eU/ntgt+2DN
 7QAA6dwIvA6360Cv9Va2xPHrmL6iP0FQYClfTTYPck+iRNuOB3OCmTsqN4NzbMiUyarb
 2iROBj0nHdtQwKKz8Z2X3r68uxkfw5+uYXj4M3+/hubRSCTVm9gUxLHIqSZDn+UIXBbN
 IkaTuxU3SpJy1Wdav47B3uHfE9ckYPox98+dBHlI3a0gGV/DjcsCP+HSWC052VZAqQ2H
 /Br7nzkejRL9hynAkl12b+N4ga7Pexr3OMcRbL54LBe9LhhfHWuSwqxTWR9RroWoZae2
 EjgQ==
X-Gm-Message-State: AOAM533u7CqHaz+fbP6iLT/RN73TAghIfsFsYrIos2dQz2YuEckqf3A4
 h3SmvfGmRYY7CIobyyeHRL8gchKpOV+lE4yfVvH4xy01iKMvBe7Lx3Z8dRz4QNJ2L0746vMa+sL
 DKu9Oia1NkC+whRE=
X-Received: by 2002:a05:600c:2dc1:: with SMTP id
 e1mr11643741wmh.108.1594271012181; 
 Wed, 08 Jul 2020 22:03:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyURnh0+2rku1ggCn4zB6DpA7hAI6gQlWROCCNb/QGl8i05Zb3tYaeSD6Pv6Ej/LuzFybqFiw==
X-Received: by 2002:a05:600c:2dc1:: with SMTP id
 e1mr11643724wmh.108.1594271011975; 
 Wed, 08 Jul 2020 22:03:31 -0700 (PDT)
Received: from [192.168.1.36] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id s8sm3297152wru.38.2020.07.08.22.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2020 22:03:31 -0700 (PDT)
Subject: Re: [PATCH-for-5.1 2/2] fuzz: add missing header for rcu_enable_atfork
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20200708200104.21978-1-alxndr@bu.edu>
 <20200708200104.21978-3-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <96f1c98a-982b-c146-80af-8f83e8117ac5@redhat.com>
Date: Thu, 9 Jul 2020 07:03:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200708200104.21978-3-alxndr@bu.edu>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 liq3ea@163.com, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/20 10:01 PM, Alexander Bulekov wrote:
> In 45222b9a90, I fixed a broken check for rcu_enable_atfork introduced
> in d6919e4cb6. I added a call to rcu_enable_atfork after the
> call to qemu_init in fuzz.c, but forgot to include the corresponding
> header, breaking --enable-fuzzing --enable-werror builds.
> 
> Fixes: 45222b9a90 ("fuzz: fix broken qtest check at rcu_disable_atfork")
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  tests/qtest/fuzz/fuzz.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
> index a36d9038e0..0b66e43409 100644
> --- a/tests/qtest/fuzz/fuzz.c
> +++ b/tests/qtest/fuzz/fuzz.c
> @@ -19,6 +19,7 @@
>  #include "sysemu/runstate.h"
>  #include "sysemu/sysemu.h"
>  #include "qemu/main-loop.h"
> +#include "qemu/rcu.h"
>  #include "tests/qtest/libqtest.h"
>  #include "tests/qtest/libqos/qgraph.h"
>  #include "fuzz.h"
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


