Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F623CD546
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:59:04 +0200 (CEST)
Received: from localhost ([::1]:47568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5SrP-0005Bv-C8
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SpU-0003gv-DM
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:57:04 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:36357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SpS-0006gq-UX
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:57:04 -0400
Received: by mail-ej1-x62a.google.com with SMTP id nd37so28527335ejc.3
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 05:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zYvO5vH/6ycZ3HLaq9mAB8JCvyq3PmppixcoiEfCufI=;
 b=yymkiuruDumPphv3lqfIRv8wCJFWor7muUDfj0rUU8XDQfk6ezJdt+Govha2zmjQs3
 CqTlZgxlkwKVMCqLim9V+DII90AXqWXlX87Mg5JzdROsvadHlN/Ai3ID9kVcMkxhjxGq
 UMGBK4052EUZNZkD0aElzt+bSTsjT4j7rrwnmdL0bBr9Ec7p+6lP/Ef2sjKZKEQr/tK/
 lUe3ArOirfT8rlBu4JmqnPPg29IQ6hs5w7riwIVmKhk2IiEy6BI/PfpIex2UNlD1jdcZ
 hunip624Ln/Upy2t7rGPVSa9gg+A+PO9xq3FHD5WtgFgDkbb0DJkpgYZp8p/T05pMm88
 ookg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zYvO5vH/6ycZ3HLaq9mAB8JCvyq3PmppixcoiEfCufI=;
 b=ZBKpSzhf9uE/l9Y/gu2F+ugy0VKNddm+umfNHh2TzVLZuvi8sRiefP5w49zOMccNia
 olMjKwKfr08yHXmmHbrm6lOC/yhpUXx3WLsL4UxDsv3S8agHcXzcdqBuizgSVnYDgvdr
 kQXZYQO6R6vjHEB4u5nddP79tF53mv6lR1V2IssHLSbsjmK7s/kLAO9JxYEaYWExqllI
 t8560oPkfyzlMH++eEZfy77Wt7ByyMhEWOe/Xz2pl1sQ7uT9YPlH/CY2QzcuEvnuR8Bm
 G8pMqR4LMILKMp7ZTYX8JHMnE2VVZ7IfoJFlABoRFHdXg3e5Uj62vTdxQxYOfjZ85xeq
 ESig==
X-Gm-Message-State: AOAM533VsgYR3JO7QowjfeZePcjoeRA07m//X7QjKrBwKIyAiWr0p8nC
 OW87shbnPWcfXClTnCZ+Qh7GQ0bQ34tpH+NnRH6tT7UGI7A=
X-Google-Smtp-Source: ABdhPJzELCPBG8MNLKTHts1zlQKjBB+dWci8rMCvXvC7MfeTJN1lM+2kJnU2rzggIM/9Lj/SH7MQHy6R12RLaS/AqPQ=
X-Received: by 2002:a17:906:a2d7:: with SMTP id
 by23mr26667995ejb.382.1626699421334; 
 Mon, 19 Jul 2021 05:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
 <1626413223-32264-5-git-send-email-ishii.shuuichir@fujitsu.com>
In-Reply-To: <1626413223-32264-5-git-send-email-ishii.shuuichir@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:56:20 +0100
Message-ID: <CAFEAcA-Dd0eh35CUo7_-_adye+DrTuFK471-A3JfBbegxoU9Jg@mail.gmail.com>
Subject: Re: [PATCH 4/4] docs/system: Add a64fx(Fujitsu A64FX processor) to
 supported guest CPU type
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Jul 2021 at 06:27, Shuuichirou Ishii
<ishii.shuuichir@fujitsu.com> wrote:
>
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  docs/system/arm/virt.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 27652ad..5329e95 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -55,6 +55,7 @@ Supported guest CPU types:
>  - ``cortex-a53`` (64-bit)
>  - ``cortex-a57`` (64-bit)
>  - ``cortex-a72`` (64-bit)
> +- ``a64fx`` (64-bit)
>  - ``host`` (with KVM only)
>  - ``max`` (same as ``host`` for KVM; best possible emulation with TCG)

This adds a64fx to the list of CPUs we support in the 'virt' board,
but it hasn't changed the valid_cpus[] array in hw/arm/virt.c, so
trying to actually use -cpu a64fx with -machine virt will fail.

thanks
-- PMM

