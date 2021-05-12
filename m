Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4F037B334
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 02:49:20 +0200 (CEST)
Received: from localhost ([::1]:42416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgd3v-0007Ft-KX
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 20:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgczJ-0001sM-GV
 for qemu-devel@nongnu.org; Tue, 11 May 2021 20:44:33 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:42680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgczH-00042k-NJ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 20:44:33 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 g15-20020a9d128f0000b02902a7d7a7bb6eso19142292otg.9
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 17:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iMySLAcZQp8dDH1PXfF7PvP7Wkhnku+/DThyEMDWYW0=;
 b=m1No4r7lajtKWIrwkwz6lsbbeYSO+hrd01dBzTMGx3L26HyhcR2R0R/GfsEvsKCqqL
 5Gajqe4LPYULL6XD/iEfETCW6UrvA+dCLpAszJ7TbmpavX2G0Col+TN3uEsiGxYUVtuo
 R8MuLGT5wtMqJwo0dwEwCiz+XuZmssjqOsEqExf+ci8hRuGeMG+6eHDXCk6e9ML3dElZ
 pxh9LqXCTiqZXOR03rh8tJXnjlVdftVri+m6cBhINmOpftthQueuAKuSaaYSHixy55tq
 bvp2pqjAhSo5fZu0uCdVh0Wd4q15IJtpnTUSRiCiGAeFQ1bkGPSQ6wlv7BxknlfGOZhm
 gnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iMySLAcZQp8dDH1PXfF7PvP7Wkhnku+/DThyEMDWYW0=;
 b=E7WBMFNmiJbYaZCXzDTCou7Ll7GiWhsfh2AKraml616hOF1n9OKJ6SK/KPvEwS5pff
 lZnu1a3zPA/hG/0HHmDokHEboQZO/pb5souICVs40SkfJvS6YqjB6tFBDbhHgDl48dLM
 Eq/mI4+6+WcsI8kx3bhHIwXMv08wMOKaRVWXaBjFUEqfwdCyfGi7en8IKwDGArFTWoZN
 I0lFUZ6jCNHgbsLzgikiv+KQ81ZHw5NuaoWXBwyYbjvPl8afxnNwmGIlhs/IHI4eDJN4
 Vdk+8sXULx96hjSRIVLPnDWIXAEhe8icWWgrmft/tgb04JMjeCa+z/ME88yZYIS5WXjM
 n8rw==
X-Gm-Message-State: AOAM5301LxAQsH81i/kGMIqhV+nPVETSnl4WTo9sMm5PhYNC5K71yRMp
 B3DPC9pNE7Bqq5SHsbve7oBD6VC0nJGfYMCYfto=
X-Google-Smtp-Source: ABdhPJztO4ELxfSAX5V03+NODyywjgAOZiRsR9mz/TsT+CPd1lXauVz6m6w2oUvexIkDXctdmT0phA==
X-Received: by 2002:a9d:6242:: with SMTP id i2mr28121717otk.273.1620780270480; 
 Tue, 11 May 2021 17:44:30 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id 65sm2967184oid.26.2021.05.11.17.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 17:44:30 -0700 (PDT)
Subject: Re: [PATCH 12/12] configure: bump min required CLang to 7.0.0 / XCode
 10.2
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-13-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f829d762-af02-c7d9-8c88-2527c4fab154@linaro.org>
Date: Tue, 11 May 2021 19:44:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-13-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 8:26 AM, Daniel P. Berrangé wrote:
> Several distros have been dropped since the last time we bumped the
> minimum required CLang version.
> 
> Per repology, currently shipping versions are:
> 
>               RHEL-8: 10.0.1
>       Debian Stretch: 7.0.1
>        Debian Buster: 7.0.1
>   openSUSE Leap 15.2: 9.0.1
>     Ubuntu LTS 18.04: 10.0.0
>     Ubuntu LTS 20.04: 11.0.0
>           FreeBSD 12: 8.0.1
>            Fedora 33: 11.0.0
>            Fedora 34: 11.1.0
> 
> With this list Debian Stretch is the constraint at 7.0.1
> 
> An LLVM version of 7.0.1 corresponds to macOS XCode version of 10.2
> which dates from March 2019.
> 
> Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   configure | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

