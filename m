Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EE45794CB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 10:03:31 +0200 (CEST)
Received: from localhost ([::1]:36392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDiCY-0004D4-CD
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 04:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1oDi9n-0001Em-Qc
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:00:41 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:41493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1oDi9l-0003IQ-K4
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:00:39 -0400
Received: by mail-pf1-x435.google.com with SMTP id l124so12801923pfl.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 01:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=l69W5vwPqWed3k654wFyZhxwZMTzcI7IwXc31lg+pN8=;
 b=OlQ+R+qrCtlWYGt08gc9e1tJOPDz4afM5JMojpfCM4EJ39FIhzIq5GysuppVtReqgr
 mHx0s849/wuiL4qrOLlvvYkewuBsfhL9r6bcSyTW2489hOEhMzmKr/TYdJPjJOBYMYfF
 B/TYFZW0IkglkMvU8MT72T2LKmrPHKzQSZw97wczQF2WKW+UmLWCgjvfwsZCuhFKiHme
 8gMv08PA7nDgxzCqf4yHvnxCTnBA1XoME0g5yaL/Kgsy9itFajJrAG0nA1h0z+4skTpE
 V8HODaT4ZEuCvxeR94i/xsxtQeghUaP7NR0ad6zVTOfHOzvfw6uRuH4d/b3DOOfTOtSz
 8eBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l69W5vwPqWed3k654wFyZhxwZMTzcI7IwXc31lg+pN8=;
 b=MPPgmLtvClita7F7nbm1NgsLKnMHRBgR6w1/XqyP76aePK1CT0qg+7svoU3aukXTPG
 YAg7P/262/66MQlgLZUzVhYaldbUZT3o/QQV/TYugr9qyenYgcX1de2p3WEhNH+Bwc5w
 GwxTEtM4CAw05Y5eYZ7g1Uk/qPysFZoE8MA++TwJkSsAvtVhmKLvH1kw2K6VEBDd9hQq
 TbfYhkIJx39ayJpzIE17e1S7mXitjd/i9+TVBwmaF72i1RUCjsn3HTJ647TDnOmhZTJE
 6grEblVmcboY0Q5tOu8AVmyBRfyGRwC0V/oHkP7I9Mi+qAxJHX7RPK3xOdSxhURV9map
 8DCQ==
X-Gm-Message-State: AJIora/pxqnabHo+fI+EnvTyHOFmEKA/eUOco//qmasx2/+fSyKmXRoy
 ZknXXHWQfgCxjR+BUCN0VahkKw==
X-Google-Smtp-Source: AGRyM1vF503dtH6lQw2O1B7+JAp5WD525Leo7Glc/Tna8c8ukx2lTIhAnigvaleodqAVSfGyWq7SQA==
X-Received: by 2002:a63:194c:0:b0:408:a9d1:400c with SMTP id
 12-20020a63194c000000b00408a9d1400cmr28483194pgz.559.1658217635896; 
 Tue, 19 Jul 2022 01:00:35 -0700 (PDT)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id
 b23-20020a62a117000000b0052a53f8ece3sm10732239pff.42.2022.07.19.01.00.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 01:00:35 -0700 (PDT)
Message-ID: <c6931ca4-0c37-5ecc-e7c0-56545ab258c1@ozlabs.ru>
Date: Tue, 19 Jul 2022 18:00:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:103.0) Gecko/20100101
 Thunderbird/103.0
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20220719075930.315237-1-aik@ozlabs.ru>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220719075930.315237-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=aik@ozlabs.ru; helo=mail-pf1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

oops wrong maintainer :)



On 19/07/2022 17:59, Alexey Kardashevskiy wrote:
> The following changes since commit d2066bc50d690a6605307eaf0e72a9cf51e6fc25:
> 
>    target/ppc: Check page dir/table base alignment (2022-07-18 13:59:43 -0300)
> 
> are available in the Git repository at:
> 
>    git@github.com:aik/qemu.git tags/qemu-slof-20220719
> 
> for you to fetch changes up to 17c1ad657904787b1d986fb4c85431fee006a6ea:
> 
>    pseries: Update SLOF firmware image (2022-07-19 17:50:46 +1000)
> 
> ----------------------------------------------------------------
> Alexey Kardashevskiy (1):
>        pseries: Update SLOF firmware image
> 
>   docs/system/ppc/pseries.rst |   2 +-
>   pc-bios/README              |   2 +-
>   pc-bios/slof.bin            | Bin 992384 -> 995176 bytes
>   roms/SLOF                   |   2 +-
>   4 files changed, 3 insertions(+), 3 deletions(-)
> 
> 
> *** Note: this is not for master, this is for pseries
> *** Note2: this has not sync'd to git.qemu.org but softfreeze is
> too soon so I am posting it anyway.
> 
> 
> The image grew in size because of change of the toolchain from
> native PPC to cross on x86.
> 
> 
> The only change is that now SLOF can also boot big endian zImage
> but kernel-addr=0 is still required.
> 

-- 
Alexey

