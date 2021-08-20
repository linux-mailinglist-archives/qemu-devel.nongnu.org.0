Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ECD3F2A9B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 13:05:22 +0200 (CEST)
Received: from localhost ([::1]:50198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH2Kv-00010h-EL
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 07:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH2IR-0007VA-Io
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 07:02:47 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:39762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH2IP-0008Iz-QQ
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 07:02:46 -0400
Received: by mail-ej1-x62e.google.com with SMTP id gr13so19436930ejb.6
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 04:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2qPCBF0htItOU/1mPUQE+bhmd7YEDOC5rZjaPp2iWyU=;
 b=MmWRFxxZQ0IOuJHWoekDdk+byiaz05rDMreeeTKX1gWjMokemWAGC3XOuaci3/iaW3
 mBK2Gi4gc5+ITbwqV0o0eydsHXAPc79pvABgqjvcIcV97lQS/FCnhlNlxdkc5wYvS++G
 8awrAf6tZvHcFysNq3/wO53PNLYuWnCAbpkDHj0ortsRtPgmnaPI3IrQ0S9iCimgUaAW
 Otd2BPfT3j9jXOk4abYqDQ8QIEl4sTXX+IX+Akehy1BwQCvkgnjT/67JVzMWqvGWNUnB
 6gH10rs/VFHI0tADaZj368yIFkQKICi7IyK4e5aKgPSl3XhveBp0bIu3bplXvMXeKIQf
 KMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2qPCBF0htItOU/1mPUQE+bhmd7YEDOC5rZjaPp2iWyU=;
 b=cubsm0zRpofQUau4eDiwxFBBO+uNegVEkUROsVAJ8QrntzATmy2c9PssX8B5HJOhgx
 IwAUzKOt6G1bNh4/yzMZ652koRCNfAuPM3YPP7+pcwEh7V3+/n2I9xD6KTT1+aM8IVkz
 yqJ10yQN09Z4dt3TeKsYtqPkmymuUqpPB6w9IqgAXgVWDd9Ifv8kQpjARImVRntG4Aqr
 WrOCHaR9sKAfI3avHWa0Kfh/Fg5WWhC4vK6vKI21SOn2y8w+H0ioi6OUvdwM1AUjV7OK
 mbL69T76++Y6jtI46kR822inEb5VwxME+fdC8gqdrY+xFF2prT/dQMqU7o9RXXSNc1Rw
 pq2Q==
X-Gm-Message-State: AOAM533D6fCL8frtFFOV6PVPSm/k8IdVxUbuHRE35IKydAtUoGPlVMGg
 4pMoV1OQU7Wcl1xE/jUnW+FqNAVhpuk/fSE/j94pwpvxnbQ=
X-Google-Smtp-Source: ABdhPJw9UJWU0nEvjoc3rKebgQxDOYKO+NKiuoNWUd/qm1fVvvoHDh0Q+GwQuAolIpcb4cO3zFi+HjD5643Q8NRBAVg=
X-Received: by 2002:a17:906:aac7:: with SMTP id
 kt7mr21060028ejb.4.1629457359755; 
 Fri, 20 Aug 2021 04:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210818212912.396794-1-richard.henderson@linaro.org>
 <20210818212912.396794-6-richard.henderson@linaro.org>
In-Reply-To: <20210818212912.396794-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 12:01:53 +0100
Message-ID: <CAFEAcA-saYVAOKbj0qBCtNU0iM0We6BC2fGxQDWHZG-rqCXkng@mail.gmail.com>
Subject: Re: [PATCH v3 05/14] tcg/arm: Examine QEMU_TCG_DEBUG environment
 variable
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the environment variable to test an older ISA from
> the one supported by the host.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

I think we should document this environment variable somewhere...



> +    /*
> +     * For debugging/testing purposes, allow the ISA to be reduced
> +     * (but not extended) from the set detected above.
> +     */
> +#ifdef CONFIG_DEBUG_TCG
> +    {
> +        char *opt = g_strdup(getenv("QEMU_TCG_DEBUG"));

Consider g_autofree ?

> +        if (opt) {
> +            for (char *o = strtok(opt, ","); o ; o = strtok(NULL, ",")) {
> +                if (o[0] == 'v' &&
> +                    o[1] >= '4' &&
> +                    o[1] <= '0' + arm_arch &&
> +                    o[2] == 0) {
> +                    arm_arch = o[1] - '0';
> +                    continue;
> +                }
> +                if (strcmp(o, "!neon") == 0) {
> +                    use_neon_instructions = false;
> +                    continue;
> +                }
> +                if (strcmp(o, "help") == 0) {
> +                    printf("QEMU_TCG_DEBUG=<opt>{,<opt>} where <opt> is\n"
> +                           "  v<N>   select ARMv<N>\n"
> +                           "  !neon  disable ARM NEON\n");
> +                    exit(0);
> +                }

We should complain about something in the variable we don't understand,
rather than just ignoring it.

> +            }
> +            g_free(opt);
> +        }
> +    }
> +#endif
> +

-- PMM

