Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31623538CE3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 10:30:18 +0200 (CEST)
Received: from localhost ([::1]:33164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvxGZ-0002jP-Qg
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 04:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvxDK-0000zn-64; Tue, 31 May 2022 04:26:54 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvxDB-00070X-KD; Tue, 31 May 2022 04:26:52 -0400
Received: by mail-pf1-x432.google.com with SMTP id j6so12537496pfe.13;
 Tue, 31 May 2022 01:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8Ulgr4YR51AZkm/zJfBd5kWIGH/FtY26ZRdFhOIrI0o=;
 b=Vaideg2VzuP9iuPgcVKpwP08Wd63mplP9SWoq4ryiXigmPGaALXrls1PScKO0chwwH
 r6n/oNvMqCauZv/3BcPLflnwVP1/pdFUvoaR90PHA88gHWsuQjT1uC9p9PcsYfD6czUm
 LI6t8ZhijCwYVqJ+ZawjnlVXcR1H7tnAgaZ628SpENboBRzOGZtobmkoKSnzhwjQ4Hdh
 rCoTm+C9NVgVRHzSnS4fS47YCitZnvU3JuwuZUXjF47400BxhHKT+sMcJMS7BRVtnn7q
 5hyDQMVAifSFdX19aECQ84MdK5bOaXUi8kuiq+yzzG6qmiUvQJ2SCVkkE2vcaQnlE0sO
 t0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8Ulgr4YR51AZkm/zJfBd5kWIGH/FtY26ZRdFhOIrI0o=;
 b=zLruaDgkwj3NpKAp2NS1XnBRF/joRpCxfa65RGvCR9ItafoYTeM9FDXtVVJwUhCbhH
 BoE3m+LupYe3+h8YC81MpZ2Ghxcdc04uxV0vv+J9YyqHAuGyJg6qKJfZdu3Njzq6qKKT
 hnpSNSNT6eMgd5Nszam4BXlEQSYQ+fm9E4S6kpwuZUmodHh+dxVzE4ofskL6BQ3b+w9t
 RzI4UYN0M2Og+muasjcRG0o1rWuhInvJ9+rAKhvD+7fY6AvxvpRJMyPJeBF68eA9hSvs
 MrzZmCpNKPvgQQRmCzpi1DL36UedZlJa9VcZeVCHRUhEhvmSKD3jKsNSTlbPErAuoJcK
 HPaQ==
X-Gm-Message-State: AOAM533YRckDo4Ed4ZvB3XClh4RQIUT+o17iFsLLK0mafzuYCkN7ChTT
 +ueG85hARXhOM+Sw5wIIXTk=
X-Google-Smtp-Source: ABdhPJwtAjEsjgNGzT0y9mrfVQhzW69fpTifGBLtybxGN562n9dih/xlIqgIgNm1N8gbUC0k6biZWw==
X-Received: by 2002:a63:854a:0:b0:3fb:a1a9:7d6d with SMTP id
 u71-20020a63854a000000b003fba1a97d6dmr16168021pgd.509.1653985603853; 
 Tue, 31 May 2022 01:26:43 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a170902b94900b001615f64aaabsm10395958pls.244.2022.05.31.01.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 01:26:43 -0700 (PDT)
Message-ID: <d2b5793b-6b84-fe1b-36b2-7ec58654bc5c@amsat.org>
Date: Tue, 31 May 2022 10:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v5] tests/qtest: add qtests for npcm7xx sdhci
Content-Language: en-US
To: Patrick Venture <venture@google.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Hao Wu <wuhaotsh@google.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Chris Rauer <crauer@google.com>,
 Shengtan Mao <stmao@google.com>, John Snow <jsnow@redhat.com>
References: <20220225174451.192304-1-wuhaotsh@google.com>
 <CAFEAcA8vcRme05raLOhtaxmvbbLhLrSZwEaz1BVk5uUYSdmL6w@mail.gmail.com>
 <CAO=notyz+SjAoomWGubV5pBuc4qSmNdJF5cmMBf7J8DevF9T4A@mail.gmail.com>
In-Reply-To: <CAO=notyz+SjAoomWGubV5pBuc4qSmNdJF5cmMBf7J8DevF9T4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 26/5/22 18:21, Patrick Venture wrote:
> On Thu, May 26, 2022 at 8:54 AM Peter Maydell <peter.maydell@linaro.org 
> <mailto:peter.maydell@linaro.org>> wrote:
> 
>     On Fri, 25 Feb 2022 at 17:45, Hao Wu <wuhaotsh@google.com
>     <mailto:wuhaotsh@google.com>> wrote:
>      >
>      > From: Shengtan Mao <stmao@google.com <mailto:stmao@google.com>>
>      >
>      > Reviewed-by: Hao Wu <wuhaotsh@google.com
>     <mailto:wuhaotsh@google.com>>
>      > Reviewed-by: Chris Rauer <crauer@google.com
>     <mailto:crauer@google.com>>
>      > Signed-off-by: Shengtan Mao <stmao@google.com
>     <mailto:stmao@google.com>>
>      > Signed-off-by: Patrick Venture <venture@google.com
>     <mailto:venture@google.com>>
> 
>     Hi; John Snow tells me that this test fails in the tests/vm/netbsd
>     VM (you can test this with 'make vm-build-netbsd') because the
>     assert() on the ftruncate() call fails:
> 
>      > +    ret = ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);
>      > +    g_assert_cmpint(ret, ==, 0);
> 
>      > +#define NPCM7XX_TEST_IMAGE_SIZE (1 << 30)
> 
>     I haven't investigated the exact cause, but this is a
>     gigabyte, right? That's a pretty massive file for a test case to
>     create -- can we make the test use a more sensible size of
>     sd card image ?
> 
> 
> It looks like the nuvoton part had an issue with a smaller image size, 
> but we can resurrect that thread and poke at it a bit and see what 
> shakes out.

Could you use the null-co block driver instead?

     -blockdev driver=null-co,size=1G,read-zeroes=on,node-name=null0
     -device sd-card,drive=null0

