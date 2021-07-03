Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9E33BA979
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 18:27:03 +0200 (CEST)
Received: from localhost ([::1]:35094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lziTt-0000cH-W3
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 12:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lziSq-0008Hb-6N
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:25:56 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:45623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lziSo-0006wn-H6
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:25:55 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso8351855wmj.4
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 09:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EYlVJA5skLwCOnbYzeT69TRX8eiteh/m97Uy0wqEPTk=;
 b=hxHFvVBZKdYPYQrsP2Iujktx/koQE3GrRov1jOeqZdUTkT5vY7FnypcssXkvb2AXnt
 cw7bMhbzy/RWJY5Ni+2Kfr4cKoWJiOrP7ywkxVVoOvEvD4gXCo8V5YUrEXDk+Ofd+Ata
 C6uwkBm6Uws1NJYMB+LkQQ8/lBE1YZALwY5ZRuAKrEyE2OYSOAu6KyBo+WvcNX9OrdMt
 ApbHuR1wdVD5lirHBauPkdg8BeCMWTRGqzFyFy9670lZkmrP7Npu19n24JhuZpocRgU3
 vPYfzQeo65xKf2J6G1wrcKz7WGWfCSl2YAtb8F7Y3laecZBnkG8+LrMfBXg9CpJrAqgB
 G87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EYlVJA5skLwCOnbYzeT69TRX8eiteh/m97Uy0wqEPTk=;
 b=t79oZn94VW9VJ6Af34nrueb/EdWDjzd09GN+5VFkwWNL9HRaMrejGATwoK3RbhRssS
 XZvYYtlK5guvIhRKF7VK1inZYbxSaelp0nMK6piKHDFSqR1RpJlF3DXwE2IaHm37gVVD
 k8uy6BUMfwH3XyUlRglnF2lm8L/oXFLCu6yR6SIGqETVAE7E18EOtJwTrolOmXIv7BER
 xBna/F9HeWhkd/Jd+LXrINlediF9UyozxE8mG72Rj7QVSH5r//ZGu68yf+/QNQjzYwX0
 BjzDInh5bL1NDj9MjcJp0XHMff3V7jys+isN+D78g27LPaREAvQcTQRxTk82l9ssqMBe
 gI4w==
X-Gm-Message-State: AOAM531Vl0LeT324ibIR8uLJXDlnou1S4Rq53NY6HA1EIRec1NA6D3Fs
 XFNtaI4WueOd543jMgWpS12hsMCDYAK+Ww==
X-Google-Smtp-Source: ABdhPJwN/IbZjeHze6/oAqjF1yhLwZhQm/57Lj98hrfvMG0CrL812AZIc0Ge7VBCOU7POZpQi5+zlw==
X-Received: by 2002:a1c:4cd:: with SMTP id 196mr5333938wme.145.1625329552496; 
 Sat, 03 Jul 2021 09:25:52 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id y66sm6716129wmy.39.2021.07.03.09.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jul 2021 09:25:51 -0700 (PDT)
Subject: Re: clang build error on i686
To: Cole Robinson <crobinso@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <abc8f7fe-2afe-0f5d-d391-6277db6e6f42@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1ea9bea4-7fd1-fef9-dc96-710417c8e7d3@amsat.org>
Date: Sat, 3 Jul 2021 18:25:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <abc8f7fe-2afe-0f5d-d391-6277db6e6f42@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/21 4:34 PM, Cole Robinson wrote:
> Hi, I'm hitting build errors with clang on i686 userspace on x86_64
> kernel. Affects both qemu 6.0.0 and qemu.git, tested with fedora
> clang-12.0.1~rc3-1.fc35.i686.
> 
> Full build log from the 6.0.0 build:
> https://gist.githubusercontent.com/crobinso/7b1206044eac7326490b2adce829e861/raw/9dddef968051fd6383ba7adb9e595081ad4f8fa4/gistfile1.txt
> 
> Lots of errors like:
> 
> /usr/bin/ld: libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: in
> function `helper_atomic_cmpxchgq_le_mmu':
> /builddir/build/BUILD/qemu-6.0.0/accel/tcg/atomic_template.h:86:
> undefined reference to `__atomic_compare_exchange_8'
> /usr/bin/ld: libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: in
> function `helper_atomic_xchgq_le_mmu':
> /builddir/build/BUILD/qemu-6.0.0/accel/tcg/atomic_template.h:134:
> undefined reference to `__atomic_exchange_8'

Marc-André reported this one recently:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg814163.html

Peter once replied smth related:
https://lists.gnu.org/archive/html/qemu-devel/2018-01/msg02103.html

