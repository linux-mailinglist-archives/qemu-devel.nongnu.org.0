Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA3D21238A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 14:40:46 +0200 (CEST)
Received: from localhost ([::1]:56128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqyWD-0007Rs-6h
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 08:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqyVJ-0006yQ-4L
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 08:39:49 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqyVH-0004wO-NO
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 08:39:48 -0400
Received: by mail-wr1-x441.google.com with SMTP id k6so28111309wrn.3
 for <qemu-devel@nongnu.org>; Thu, 02 Jul 2020 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vubpZi/mRE5M1Rf4FEjDKdzxGMYDJkWsMdW9+7FWEwo=;
 b=XW9kVTSdsN+Mj01oUOMlm7WVz9iB2N1oo6W6tyCMj3FVHKL63fZkGYgazJukMBS1XA
 TeQCMLzbZLX6Xr7EaB5/jyPHfd8yu0kdr1lKylhH3yKcS4iTlfu/DSX9MnOBrj5e4zmQ
 DYhFeY9Fsx1yEhbHrBaZZ+Wn1pPhMtpIEgh+yBT3aVfEQEUTbhnAKEMJZHZtpyjeIrUx
 h9SL9qMvbbhai1Zs1jVwdWJH2m9PMFWlizzX5eaMgsXHF/02Icn0TlHwVqmPiVT/SCv2
 Jzjq8J566Ho3212rjb69Y+74vrg4Ej7j/TC9au1p1OP38ZXvZPH93lqcLr7/uwbuomgZ
 Gz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vubpZi/mRE5M1Rf4FEjDKdzxGMYDJkWsMdW9+7FWEwo=;
 b=ayXNj84Le1FJalDS4KvdxZJcRP6Yzh1F4cksoJ6IyJIdGGc+trfUAoU2oNuq9JimDo
 XCDStyNHKsChi+uqkEDGblLDrZ5M3f8LE5PtvhFyeMiUfosGUEbowUVDr1UPEPAxP6bu
 RA7cd79t7+MAVELzhh9ESo/1y1MmxRj/7cX3e/MFusbDHU6J8fDBysxytj3E2Pir9FZO
 Egd/qPS3FDXW1y7lJ1R8xqOQQBAHeaSUoCmzqQoGoDvqQC+7M3qETimZJrgSZWfD9MPE
 jdSobOvTc5wwozzwryRaHSwFN0CdVqyIZ5LTfHtw87GJ46Xa9UVBITQskRFj6vAwHbvP
 ZvgA==
X-Gm-Message-State: AOAM5314+tn+iN+Mq9931+lpJjeh35+g8Wxqea+uVpk6pSNw8eeMKROJ
 ltK2CEXhs6egO7eRrUItK88=
X-Google-Smtp-Source: ABdhPJxOu9OLgayXKMaJCfCuSepo4jwpb86ybGqNPvydD160F+IThXdhRcZe0OdRY8hX/tw/1Bi3Yg==
X-Received: by 2002:a5d:6288:: with SMTP id k8mr30547107wru.373.1593693586177; 
 Thu, 02 Jul 2020 05:39:46 -0700 (PDT)
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id y17sm11171685wrd.58.2020.07.02.05.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2020 05:39:45 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] target mips: Misc fixes and improvements
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 qemu-devel@nongnu.org
References: <20200701182559.28841-1-aleksandar.qemu.devel@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a97c16a0-4f21-ef84-b2cf-9b861efcbe11@amsat.org>
Date: Thu, 2 Jul 2020 14:39:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200701182559.28841-1-aleksandar.qemu.devel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Huacai Chen <chenhc@lemote.com>, aleksandar.rikalo@syrmia.com,
 Paul Burton <paulburton@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/20 8:25 PM, Aleksandar Markovic wrote:
> A collection of pending fixes and improvements.
> 
> v2->v3:
> 
>     - minor content and commit message changes
> 
> v1->v2:
> 
>     - minor content and commit message changes
> 
> Aleksandar Markovic (2):
>   target/mips: Remove identical if/else branches
>   MAINTAINERS: Adjust MIPS maintainership

Thanks, added to mips-next, splitting the 2nd patch in 3:
MAINTAINERS: Adjust MIPS maintainership (remove Aurelien Jarno)
MAINTAINERS: Adjust MIPS maintainership (remove Paul Burton)
MAINTAINERS: Adjust MIPS maintainership (Add Huacai Chen & Jiaxun Yang)

