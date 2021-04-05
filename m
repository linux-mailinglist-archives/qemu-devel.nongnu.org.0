Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90878354285
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 16:02:41 +0200 (CEST)
Received: from localhost ([::1]:58510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTPoI-0005SU-Oc
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 10:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgplap30@gmail.com>)
 id 1lTPma-0004oB-A8
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:00:48 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sgplap30@gmail.com>)
 id 1lTPmY-0007qE-Io
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:00:47 -0400
Received: by mail-pg1-x532.google.com with SMTP id k8so8187365pgf.4
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=myBlg05crpO0OYF79UJZijuieNmDQc3rF35VJ69xbuk=;
 b=J/LTOokYUcqKHjkDMwzj1V+9Q8E1rWSazhhI2OxE8LfeB92Vfh50+tLcn5r+gOpjGj
 JKWhOByOhTFFCiYsh6QjRSuyYoO+lPcz++8+9+lI3QpHw67FqD8T2uWXNVtGm3AuLG+x
 7E/K5HFnoHw9+X+bXNzpfZUrsoZ25s28/n973F71XpMfGz96VyD3w3To2huC8YLcgRKG
 wDigbc7YCkn03+8IZFLGT/A5A0AungEj7Ar6RFXYV0CA8P0xh/JDAHHwqjmB5UcG8gyO
 FjpVRHEAxgoiamlp2yfBEfpJVZgtbxaTEmNffhc1tHPZ3Cyodwrdg0eG7wdfgTNlZqZP
 GBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=myBlg05crpO0OYF79UJZijuieNmDQc3rF35VJ69xbuk=;
 b=cVKkdcy0IoA3iBYDaa131ue4Nmoy9a99ItLB3X7RU6aJjevTlJLf0t4h5vyjiL2V+M
 lPoPQdXSjPImLr3FcB1oiVJTOLnIJJbWUbzfDUXgmwnEc0jwF6xlbXBnBsufVetuHl/V
 XtXNA4ufIy971p6o+jCa0XnsiJbnT5c6rploxy9veQnyLnLW0Qjn9xfp0ox6Ig6wDIv1
 77IofZHBr2oTIRlKYm2LyDvWQ+4lbciIcy21vMr7d8UAJDxJxRqpgb9eZsI7qRRJjd3p
 zCxADpGak3e0DwMtKy0uMA9zR2An8Xo/a4t97yr9LaxJ2ReJGlXaRTP8+3g2i5cIVksj
 aLmw==
X-Gm-Message-State: AOAM530uTK6HEXli3ujnHAvdgBlLa5BVqY2eCaQ7PeGENbwy4qNLPxbA
 nQvU9wj0UCUaTYESVvl/84w=
X-Google-Smtp-Source: ABdhPJwLnAwlgqZ+NtqumCAhgKxGNgfILd+g6h7FvLLiGNOmtYOU/c6ACqdRoCv72164PizaK9REZw==
X-Received: by 2002:a63:2e47:: with SMTP id u68mr23414158pgu.6.1617631244282; 
 Mon, 05 Apr 2021 07:00:44 -0700 (PDT)
Received: from [192.168.50.193] (bb116-14-124-222.singnet.com.sg.
 [116.14.124.222])
 by smtp.gmail.com with ESMTPSA id j10sm15584607pjs.11.2021.04.05.07.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Apr 2021 07:00:43 -0700 (PDT)
Subject: Re: qemu-system-sparc64 instruction set architecture compatibility
 (sparc v8+ vs sparc v9)
To: Peter Maydell <peter.maydell@linaro.org>
References: <33e27175-688d-3f9e-d999-cda18122f3d9@gmail.com>
 <CAFEAcA-vkEei56zGpa5x1kqcZA1-_d__34LxNdVkS1+LP86NSw@mail.gmail.com>
From: CKIM <sgplap30@gmail.com>
Message-ID: <a88e8c34-84c5-9ba8-ae14-ec2ca0dc359f@gmail.com>
Date: Mon, 5 Apr 2021 22:00:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-vkEei56zGpa5x1kqcZA1-_d__34LxNdVkS1+LP86NSw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=sgplap30@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Cc: cheolyon38@naver.com, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/5/2021 7:16 PM, Peter Maydell wrote:
> On Sun, 4 Apr 2021 at 23:26, CKIM <sgplap30@gmail.com> wrote:
>> I have very old binary (testgen) which was built from old sparc station.
>> (no source code)
>>
>> If I run "file testgen", I get the following.
>> ELF 32-bit MSB executable SPARC32PLUS Version 1, V8+ Required,
>> UltraSPARC1 Extensions Required, statically linked, not stripped
> 
> You don't say what OS this binary is intended to run on.

The binary is running on Sun Solaris 5.8.
SunOS sinuc035 5.8 Generic_117350-62 sun4u sparc SUNW,Sun-Fire-V440

> 
>> I was able to install most of sun4m / sun4u guests listed in the wiki
>> and network setup was also ok but none of them could run the "testgen"
>> binary.
>>
>> I always get "Cannot execute ELF binary" error message.
> 
> Are any of them the OS that the binary requires? You should
> start by using the right OS, not by trying to test all of them.

Yeah.. I started the Solaris first. Solaris 2.6, 7, 8, 9 all sun4m. None 
of them worked.

The solaris10 (OpenSPARCT1_Arch.1.5.tar.bz2) doesn't have info how to 
setup network...

Do you mean the binary from SunOS won't work on other OS like NetBSD ?
I thought NetBSD/sparc64 can run solaris binaries.

> 
> thanks
> -- PMM
> 

