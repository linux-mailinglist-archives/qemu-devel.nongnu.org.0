Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4788C4CE47C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 12:19:29 +0100 (CET)
Received: from localhost ([::1]:36674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQSRc-0002TY-DF
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 06:19:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQSNa-0006nY-9V
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 06:15:19 -0500
Received: from [2607:f8b0:4864:20::530] (port=33541
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQSNX-000588-MZ
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 06:15:16 -0500
Received: by mail-pg1-x530.google.com with SMTP id 6so5094841pgg.0
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 03:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aJvPmq4dGgLLzO7ZBsI7VGmaUf8lxjIDS150jIpPTss=;
 b=MXFqldxJVspi9II4lzsb4AnGDY/kpNNcPMJfEepaW/PH4b2GMT98jSuTTuzcPmc3a4
 oGY7BL6bmsW+2lUcrFkFXhjQrv3FiIZLgzQocTX+jjMpHCp+sf4Cc3NdM1GW8M4XmgjZ
 GdsdINx7Ri19IuVtITxyYxeK7+6GY+eZcLL+9pYEn4Z04Z62t4pUU3OfuiSqrjSPJEXn
 7kECoSy9MmsXGt6kkc8X43FDvI1wZOL2Llnn8EuL7sPbv3FaFxPwldrxqw8LwuR9CP13
 RdIMARIVJeuA+1O6H5VRp8E5ueR2hWqGslBe24ZM6WA1r7uNNBItGljBRkZaxMGTQFgf
 YYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aJvPmq4dGgLLzO7ZBsI7VGmaUf8lxjIDS150jIpPTss=;
 b=EBdNtVMeXpjs7WnhKFM4csFTINBldJW7OyrW3s8NzNCW05h/EGFTVeiIm0tNrgz05h
 9Q2C/lDAqcPU6JpogNSa8rR9KE15Aa4kkZ7Gnyuwew5+0se5urD8swlk3XDE2ZOGlftJ
 /irW7ZB+TJhoQ29RYTX3hR8dfrHEK0I+9Zg7bjxTgCRtjvtc1aeNaNfxBMCRDGR+vARi
 uPcCzG3IvWb816uSmoMSZPI+W+xydxnrAPggFz3KrIKkPi2c0oT5XZ7Hg2GHMWgDv54Q
 +ZpDLDh43fa5yVssf64lVL+3ismI5Q73MfK1+PXU+ldcL4Qr/nh6/p6C5R1OfA0EJ6PF
 R/Jw==
X-Gm-Message-State: AOAM531LVDAkBoEXOI0m8OcOsWjcj0Xfn0kXCO2Ns1j9Llw7b8XwpBjx
 L3phD2hDtaBYK4npk3ziiiY=
X-Google-Smtp-Source: ABdhPJxRtnIG8tpn79mY9cZNw5XBj3shep31/MT/69uYihR0VvAj5fcnShMgdyhETfTAPxegsHolbQ==
X-Received: by 2002:a63:e854:0:b0:372:fa33:c0a4 with SMTP id
 a20-20020a63e854000000b00372fa33c0a4mr2379339pgk.379.1646478913105; 
 Sat, 05 Mar 2022 03:15:13 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a056a0015d300b004f6e4dc74b5sm174482pfu.92.2022.03.05.03.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 03:15:12 -0800 (PST)
Message-ID: <201294ed-9c3c-3920-ed34-361463aa46dd@gmail.com>
Date: Sat, 5 Mar 2022 12:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 1/3] nsis installer: List emulators in alphabetical order
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220305105743.2384766-1-peter.maydell@linaro.org>
 <20220305105743.2384766-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220305105743.2384766-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/22 11:57, Peter Maydell wrote:
> We currently list the emulators in the Windows installer's dialog
> in an essentially random order (it's whatever glob.glob() returns
> them to, which is filesystem-implementation-dependent). Add a
> call to sorted() so they appear in alphabetical order.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   scripts/nsis.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


