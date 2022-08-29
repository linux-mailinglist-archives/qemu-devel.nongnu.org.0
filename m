Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A0F5A577D
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 01:16:15 +0200 (CEST)
Received: from localhost ([::1]:40284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSnzK-0005wi-Tp
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 19:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oSnxH-0003ze-3B
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 19:14:07 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oSnxF-00082S-Jg
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 19:14:06 -0400
Received: by mail-pg1-x533.google.com with SMTP id 73so708462pga.1
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 16:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=t2NnmLQYVx5hkysty8QrLvolbzZnrXylXpaXlFuycgk=;
 b=NF1NPdbep/xsuycIe6kRwoXSl2m+e+Vgp3diYB7ilcyjsRtSHfQ4TkhlGNgGYbi/ka
 ETKSv2o09OGwydBmf9m1qmn6UK+0gPh38sVQf/5EG0DHAeR1bhHqvcAHWJqomy5Ykwvm
 SLAKsE/kWMB7sGubPP29EG7ty/VLi6em9zzkdxdVAWvwMk5K4iYgui32ZE7suqwS9QWL
 QCgkln55bep+594N4TquOfQftA8SAJ9EWRCpwXR2TjpSjhH4T1rM3p7fSDHsXNsAdPes
 s36zr9fkBbwwoa0/zFitrtgkOSAuRyL2jkRkGk1XlrsNvzt3eKjJv93U9zNEkeGCO9bz
 zp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=t2NnmLQYVx5hkysty8QrLvolbzZnrXylXpaXlFuycgk=;
 b=AQ7/RFCZfFRPmnC1uyIdm18gRmWUrhI4cY5GxZnniEWS8qSUgWdQV0BaORAlYKKxD5
 aRmHrobX8Z/R/oyUsdbJ06XNC/HuiwAbO7cEeAoY7gN7niAqVNMzel/lgJNHNo6B2PLR
 dVyrmwPMnkOBq7c7l3fVkQR/DUAdn5GVFM63RhBueOy3YqKj2rWc3W5FprmGYj6oh4Tm
 A1Cb5PVY4eACFhvlA2yjVkorBG7nWETAVyplDsUP09xiTDot4+7G6tlf/hdeMKX6iQR9
 DPuN9YgWkA4Ssu21H61r9eTLJsvou+n1QKRAqrKNMqTSAmZ2FmQQ9f2qufqpbaky91cL
 zZ4g==
X-Gm-Message-State: ACgBeo2KRK41gY4jorSIBxaC87/wNTixJse5o96f+pgrjhLUGdt76F8w
 RFUcXd2+PYA1DuWLBotW2k0=
X-Google-Smtp-Source: AA6agR4X/EejwZl6DnfpYXWCWsz/jDJeA2ufipsJt+O8HzsQbcQV4PL7D/EexEk9VlewWpuffRa8kw==
X-Received: by 2002:a62:3086:0:b0:52b:fd6c:a49d with SMTP id
 w128-20020a623086000000b0052bfd6ca49dmr18432930pfw.26.1661814844313; 
 Mon, 29 Aug 2022 16:14:04 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a170902da8300b0017508d2665dsm758745plx.34.2022.08.29.16.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 16:14:03 -0700 (PDT)
Message-ID: <a0a91aab-43c5-8e0f-cc95-1dece7701353@amsat.org>
Date: Tue, 30 Aug 2022 01:13:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v1 12/25] tests/vm: Remove obsolete Fedora VM test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-13-alex.bennee@linaro.org>
In-Reply-To: <20220826172128.353798-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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

On 26/8/22 19:21, Alex Bennée wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> It's still based on Fedora 30 - which is not supported anymore by QEMU
> since years. Seems like nobody is using (and refreshing) this, and it's
> easier to test this via a container anyway, so let's remove this now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20220822175317.190551-1-thuth@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/vm/Makefile.include |   3 +-
>   tests/vm/fedora           | 190 --------------------------------------
>   2 files changed, 1 insertion(+), 192 deletions(-)
>   delete mode 100755 tests/vm/fedora

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

