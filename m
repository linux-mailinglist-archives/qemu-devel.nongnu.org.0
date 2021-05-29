Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0955394C39
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 14:38:36 +0200 (CEST)
Received: from localhost ([::1]:44042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmyEd-00029w-G9
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 08:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmyCN-0000qn-To
 for qemu-devel@nongnu.org; Sat, 29 May 2021 08:36:15 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmyCM-0007kl-65
 for qemu-devel@nongnu.org; Sat, 29 May 2021 08:36:15 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r10so5848562wrj.11
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 05:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/PAc4vjcsQFuQQj9MWpNS2ToV+3Roaghm5bwMAUJ1Fk=;
 b=ZBSvsl6EG8ejYSr6X20ISAkuIsst2g44xxuAZr97F2JcMU+5A4U0bfbwHXS+QvK2V3
 RSfBMz2RnouJ8qMKfHvz/h1hx85akWrbR61/eipC3S/rEDNGUFyFSh/w0Br2oZ9dCpmR
 rcuKXMkGVePlPh8Auyx+IOtqTCPxP97uYz9+4pjKEmWyDHUeZak5zPoU7xcrbAnQFkKJ
 rPdUcF4MG474MQXWLseruojh3AqbJ6+dmaONp/JaGBhfyJXqFrzjj+UhdOKmbliCDMza
 D+xSMTAjZ5ObRPie0bxXEl8WNfs/pleTytXF8tpSqTRaGskAtZTtZ9Kae//tq1Hy5GB3
 qHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/PAc4vjcsQFuQQj9MWpNS2ToV+3Roaghm5bwMAUJ1Fk=;
 b=h6/CGIbLgfButlUAv20wxpkOXQw1BM4acaZIM4jZfMh8U4uuRjmrdefcpEdcYZyjKp
 6NhYVD7tTPYyGlOe6LzVoa+55jRzYuonSkwKmwJ+qMRQw61KhAoeTqQ9u5y4MTItq0v2
 47LEeKFdaspaKwbA8gohi5Qv7+lJZhJSExsz87PHUQpPfq65b6aLAQ1CUc1bgPXIrQdr
 lgiL0kgEeov5xlmm2fiLxn+U0Q9qBteXXhnke7wTVMyNnRXTtFRC50j+kOHSk8tI8GvK
 OI4baLw6r+JsSUB2sWTf+8U3CXyDpiA5yhSx5xjv3Jwz2B2sTyHYHbGF+sD0nVp0b4IC
 t3Xw==
X-Gm-Message-State: AOAM530DeK2Ik4yynCD71hGkg+c0FAM95hmytYbzlO40xlbOrWEidOm1
 8Q8T/QKVZ/2EPQt6OSahXrI=
X-Google-Smtp-Source: ABdhPJyicPRh1O32Ryx3sq3295XvY8saM3bY33t2n/oIUfuMyMsMEoI+c1f9eMHHfrLIMskVYrAubQ==
X-Received: by 2002:a5d:5271:: with SMTP id l17mr6887699wrc.142.1622291771058; 
 Sat, 29 May 2021 05:36:11 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id h15sm9332296wmq.1.2021.05.29.05.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 May 2021 05:36:10 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v3 2/2] tests: tcg: mips: Remove old
 directories after moving source files
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
References: <1546621859-28227-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1546621859-28227-3-git-send-email-aleksandar.markovic@rt-rk.com>
 <87o98svhis.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2ce72c95-a34f-6bcb-ab97-e90e4b31469b@amsat.org>
Date: Sat, 29 May 2021 14:36:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87o98svhis.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: noring@nocrew.org, arikalo@wavecomp.com, qemu-devel@nongnu.org,
 smarkovic@wavecomp.com, amarkovic@wavecomp.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/19 12:22 PM, Alex Bennée wrote:
> 
> Aleksandar Markovic <aleksandar.markovic@rt-rk.com> writes:
> 
>> From: Aleksandar Markovic <amarkovic@wavecomp.com>
>>
>> Remove old directories after reorganization of MIPS TCG tests.
>>
>> Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
>> ---
>>  tests/tcg/mips/mips32-dsp/Makefile        | 136 -------------
>>  tests/tcg/mips/mips32-dspr2/Makefile      |  71 -------
>>  tests/tcg/mips/mips64-dsp/Makefile        | 306 ------------------------------
>>  tests/tcg/mips/mips64-dsp/head.S          |  16 --
>>  tests/tcg/mips/mips64-dsp/io.h            |  22 ---
>>  tests/tcg/mips/mips64-dsp/mips_boot.lds   |  31 ---
>>  tests/tcg/mips/mips64-dspr2/.directory    |   2 -
>>  tests/tcg/mips/mips64-dspr2/Makefile      | 116 -----------
>>  tests/tcg/mips/mips64-dspr2/head.S        |  16 --
>>  tests/tcg/mips/mips64-dspr2/io.h          |  22 ---
>>  tests/tcg/mips/mips64-dspr2/mips_boot.lds |  31 ---
>>  tests/tcg/mips/mipsr5900/Makefile         |  32 ----
> 
> Erm do we really want this? Ideally the Makefiles should be moved into
> their new locations and tested with whatever the out of tree build
> approach was before. Then my series can apply on top and translate them
> into new style check-tcg tests builds.

It seems Aleksandar missed your comment :(

