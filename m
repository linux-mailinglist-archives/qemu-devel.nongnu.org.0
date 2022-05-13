Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CD652674D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:43:07 +0200 (CEST)
Received: from localhost ([::1]:56750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npYNe-0000FG-QB
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1npXrN-00074e-5z
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:09:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1npXrK-0004A5-Ii
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:09:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652458181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QzZHdmpOZqcn6YyzNfMMEd+DleaHK9DPkOBarAF1w9g=;
 b=T9yqkdNMdUtMIh6InWdfVZZgrVenyuycNOFiaW/ADyWsDplfw6jJKtGKh92VYrfrU8ziE0
 7VEuG6ypthlBZA3JqzM24iJ7dPZZND3FmjSl+eL7Gsj/0MS/a/Xlz0H/QSa4c2aG5E5r0R
 D4YqWVuD0/z/pAxDczmo6JI2Hevg8iw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-lAUkJE18O-GavawFPzM1jw-1; Fri, 13 May 2022 12:09:33 -0400
X-MC-Unique: lAUkJE18O-GavawFPzM1jw-1
Received: by mail-wm1-f70.google.com with SMTP id
 n26-20020a1c721a000000b003941ea1ced7so3176108wmc.7
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 09:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QzZHdmpOZqcn6YyzNfMMEd+DleaHK9DPkOBarAF1w9g=;
 b=HjSTgptEFzs+dBWxOgiXmPtBwqLuO9v9syGbV9NTESOm4Wt6Tv3ZiPhxD3Jl2Mr5lc
 2LF3IRQDhTJXmm6aXR/42nklK0TxWU339geLANdi/YiyntDGGV7ISGlkKjP/BslvP7kX
 9xSz9DwoIYhvTwuHX/frC1MjPWsDnnRpwnHFDcof3bFoXIlYn4vLrr4Vz8bG0zYeEjnu
 wjysEwQtfDM91zgYjxrKz/J3EZW4dv7wiKlGV0cpBfDIVKqG0mv49EH0QBWAMc3EK3s8
 ES1o52H1b5uK/lw4Fftx/aV8HcszU93CRiHDUJoXQmV3FQFAJndF467gxFErNDmsrloS
 /e4w==
X-Gm-Message-State: AOAM532WQyBYZUDD230gJT8hUVhzM7tS8WZGqir5Jln1xbCnZPnI6yQq
 +hoY6DBaHTZ5/19djxmeCNYJaHqIzmu2GGb9TTutyIF7NRvir3+xcSMvWB9sNpJBMnDLgJDyToJ
 mblUSZ65PCGf+UNI=
X-Received: by 2002:a5d:60c5:0:b0:20a:ed1a:9f9 with SMTP id
 x5-20020a5d60c5000000b0020aed1a09f9mr4515971wrt.623.1652458171859; 
 Fri, 13 May 2022 09:09:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwH+u5sGbXNcHB0q89s/un78Y6tEmOQNFj+H5BcebE0RPkHpvj59g8fuBtQZW2BI11pBvm5/A==
X-Received: by 2002:a5d:60c5:0:b0:20a:ed1a:9f9 with SMTP id
 x5-20020a5d60c5000000b0020aed1a09f9mr4515963wrt.623.1652458171635; 
 Fri, 13 May 2022 09:09:31 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 y11-20020adfc7cb000000b0020cf41017b4sm1481372wrg.19.2022.05.13.09.09.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 09:09:31 -0700 (PDT)
Message-ID: <d4444992-0fe0-9e01-6b98-8bf1741f482c@redhat.com>
Date: Fri, 13 May 2022 18:09:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/2] tests/qtest: use prctl(PR_SET_PDEATHSIG) as
 fallback to kill QEMU
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20220513154906.206715-1-berrange@redhat.com>
 <20220513154906.206715-3-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220513154906.206715-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/05/2022 17.49, Daniel P. Berrangé wrote:
> Although we register a ABRT handler to kill off QEMU when g_assert()
> triggers, we want an extra safety net. The QEMU process might be
> non-functional and thus not have responded to SIGTERM. The test script
> might also have crashed with SEGV, in which case the cleanup handlers
> won't ever run.
> 
> Using the Linux specific prctl(PR_SET_PDEATHSIG) syscall, we
> can ensure that QEMU gets sent SIGKILL as soon as the controlling
> qtest exits, if nothing else has correctly told it to quit.
> 
> Note, technically the death signal is sent when the *thread* that
> called fork() exits. IOW, if you are calling qtest_init() in one
> thread, letting that thread exit, and then expecting to run
> qtest_quit() in a different thread, things are not going to work
> out. Fortunately that is not a scenario that exists in qtests,
> as pairs of qtest_init and qtest_quit are always called from the
> same thread.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qtest/libqtest.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 4a4697c0d1..2e49618454 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -19,6 +19,9 @@
>   #include <sys/socket.h>
>   #include <sys/wait.h>
>   #include <sys/un.h>
> +#ifdef __linux__
> +#include <sys/prctl.h>
> +#endif /* __linux__ */
>   
>   #include "libqtest.h"
>   #include "libqmp.h"
> @@ -301,6 +304,20 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
>       s->expected_status = 0;
>       s->qemu_pid = fork();
>       if (s->qemu_pid == 0) {
> +#ifdef __linux__
> +        /*
> +         * Although we register a ABRT handler to kill off QEMU
> +         * when g_assert() triggers, we want an extra safety
> +         * net. The QEMU process might be non-functional and
> +         * thus not have responded to SIGTERM. The test script
> +         * might also have crashed with SEGV, in which case the
> +         * cleanup handlers won't ever run.
> +         *
> +         * This PR_SET_PDEATHSIG setup will ensure any remaining
> +         * QEMU will get terminated with SIGKILL in these cases.
> +         */
> +        prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);
> +#endif /* __linux__ */
>           if (!g_setenv("QEMU_AUDIO_DRV", "none", true)) {
>               exit(1);
>           }

Reviewed-by: Thomas Huth <thuth@redhat.com>


