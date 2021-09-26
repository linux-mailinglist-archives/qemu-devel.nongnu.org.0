Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE313418704
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 09:18:42 +0200 (CEST)
Received: from localhost ([::1]:42386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUOQr-0001Nh-Ti
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 03:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUOPi-0000ix-KN
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 03:17:30 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUOPh-0004I1-7f
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 03:17:30 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d21so41010292wra.12
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 00:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=grCVvQDt4nXRQnl8cJztSYAvz4J9C7n9I3G2a/Op4f8=;
 b=LtlHWa4ZeYThla1fFBrNjS3n0vzdGZB9C9SRKwlTlWSOXZcM0spyIQGmITBp7v8Mbm
 M6QV3rl6YXRpPfd5ElDxW9bY+OvCn0UwLsYrAhpkAD4qlWcc9AVFNJuznlQmKYm5euY0
 gDamowBYaapKcJVayl19pKwEKQQlNQBfbvWRnX2ohTWnxke+FfT3hzI/yC62UJok6GGR
 9gAloFi+WmGnSd61Af0oEfDDJ8EZHjXp9BjCTSYECdpV/BQFyLdUAu4QEXhoNBz3x0t2
 9JEQOeG9DpQLB22hkiJVcLMk3tKklniVvh36qYI0Ak4+KayMXIwH/5HtAwz4Yz7hB9tn
 36wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=grCVvQDt4nXRQnl8cJztSYAvz4J9C7n9I3G2a/Op4f8=;
 b=kOPMgYLDFrEbhD0A934e7ZP5bgnVH+cScTSbVg7bkOVNf7/Y4fXaQVgL7cvm1jvRoN
 DiI28r0Q2PCKYMS5N65attaBLAr7z7p5a6jgEq1fqluFWX2r7oQFV360RJIwfk588SZ0
 u7pBOS+SCmHd17dNpbR/kzgyjKE/Ea1aTYxg2v1bBS9WNt8DS+LN9aUKaJ2wO3fpnQMM
 fx61t9/FwK5rKAQ7HzopPkDEH/9U7brKNmQFPQqaCTeFDlzzDG96zR9T6LHu/7Y5qwDL
 Fy28/uxygMwjOLJ5zYIMeAudtk1AtmhmVpY5VUmsWzVXgWsJbyIQzYzGDF0ySvhpuL9v
 qB6A==
X-Gm-Message-State: AOAM533CMcGZwjAFldl3fGnCVGVAlnegq7TF8tjhYvg+n+OzOx2QZ4oX
 AaDL6DDSlza2unvw5n4isBA=
X-Google-Smtp-Source: ABdhPJxoZiLdK5U42bjVNj7jR9Z+fCbnFO4eH/3fcNhTUmLzJBODw9r37XQukrRD0ki3I1Ggg/YCaQ==
X-Received: by 2002:a5d:664c:: with SMTP id f12mr20977065wrw.213.1632640647776; 
 Sun, 26 Sep 2021 00:17:27 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z8sm3059989wrm.63.2021.09.26.00.17.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 00:17:27 -0700 (PDT)
Message-ID: <61023dea-2e17-71ec-a8e4-b99a5ae44b3b@amsat.org>
Date: Sun, 26 Sep 2021 09:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v6 30/30] configure, meson.build: Mark support for
 loongarch64 hosts
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210925173032.2434906-1-git@xen0n.name>
 <20210925173032.2434906-31-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210925173032.2434906-31-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 19:30, WANG Xuerui wrote:
> Example output of `uname -a` on an initial Gentoo LA64 port, running
> the upstream submission version of Linux (with some very minor patches
> not influencing output here):
> 
>> Linux <hostname> 5.14.0-10342-g37a00851b145 #5 SMP PREEMPT Tue Aug 10 12:56:24 PM CST 2021 loongarch64 GNU/Linux
> 
> And the same on the vendor-supplied Loongnix 20 system, with an early
> in-house port of Linux, and using the old-world ABI:
> 
>> Linux <hostname> 4.19.167-rc5.lnd.1-loongson-3 #1 SMP Sat Apr 17 07:32:32 UTC 2021 loongarch64 loongarch64 loongarch64 GNU/Linux

Thanks, helpful.

> 
> So a name of "loongarch64" matches both, fortunately.
> 
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  configure   | 7 ++++++-
>  meson.build | 2 +-
>  2 files changed, 7 insertions(+), 2 deletions(-)

