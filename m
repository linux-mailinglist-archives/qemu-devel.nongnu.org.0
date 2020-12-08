Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE232D2FCE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 17:37:17 +0100 (CET)
Received: from localhost ([::1]:48418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmfzI-0002QC-D3
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 11:37:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmft0-0007jB-UB
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:30:48 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:42934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmfsy-0001yY-FM
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:30:46 -0500
Received: by mail-ej1-x643.google.com with SMTP id d17so25402016ejy.9
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 08:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O6d8/sZG3A5xoCVUYV5vAwfGwQR5n1cU4F9BmRSseSk=;
 b=BBxVb3vGtsOOtw1311vylJ0YOChBxANfKrMdmycMi3OAvUTVGMpZ8SxbJIsm+sVepb
 AdGNKypDNFvmwhAwK5Q0GK00Ya9hCOCShhZPg+ZZQQOtIrw0vxUlDmORxCdcviIsi2S0
 9n1ErNx8knmMJesNRhL8zfo7fdLRwmWAWV6foEgmJYOcAyQNgfuM7m4u1FC/RjE/ztRx
 kD2vpyEHGiMzUKCuVh9ix2rcIqJ6WIy5GBKBkRZKRidGk72i03dnLpJ6Qok2fgXXLcpE
 gHAFrJ5HwX6wIUBNEs0JoBm4bYbxM0/Smq7CVrlYhfC9exhpmPwj4bQzyE8Igmrwm0cP
 z2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O6d8/sZG3A5xoCVUYV5vAwfGwQR5n1cU4F9BmRSseSk=;
 b=PIUw8iMB6TfHdB9gsHsmSK4vSKwMUMRpUVdVw1Sbs8qda4RlZkL9+qu1DHHfEQ2cOW
 xLMoKtXR3h1TIfprl4beips8Py7gRt6w5mbnfixJqnxxdDEWUfnmdkHU42jz8SpQXOtP
 ZKcTIrz9HyzQxVXFzrosxvBqcE43hQP9tLGRpy582sH4L6M70ZckWjLbx5QVVbXdv14Z
 i58dubabSkVk1sPnxPBeqxmznSfI1wXndwmbqKW0eMAYLJZTtRKOqZnfpaPvQXC/7Czk
 8q8RjH+TuVFki0cLHx5ginTu1ddtozN3NGxnY+LxbEbfh9tDhk+kNo4Qn3eRzySG38xp
 0mKA==
X-Gm-Message-State: AOAM532z/8RLB5muu1WZhy9t+iBvLxqN6F1ro1ghyGzIvLsLbqPeZlgX
 jsSFUPnKO0XtG7myT1z3Q+o=
X-Google-Smtp-Source: ABdhPJwNNItsXNMXYvb17v+JQzXFi1XmjmQaADDh0N9cTR9eyEJQ3Z3KTUIRhwUpmN3smg77Pjv7ZA==
X-Received: by 2002:a17:906:8354:: with SMTP id
 b20mr23948190ejy.397.1607445041952; 
 Tue, 08 Dec 2020 08:30:41 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id t26sm16081856eji.22.2020.12.08.08.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 08:30:41 -0800 (PST)
Subject: Re: [PATCH 00/17] target/mips: Convert MSA ASE to decodetree
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20201208003702.4088927-1-f4bug@amsat.org>
 <CAAdtpL69-8DEYb2832fcZosNjMogPGt1a9HNT7NdLVvnbKZBFQ@mail.gmail.com>
Message-ID: <489ecbec-ca9e-85a2-b0c9-508319a25288@amsat.org>
Date: Tue, 8 Dec 2020 17:30:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAAdtpL69-8DEYb2832fcZosNjMogPGt1a9HNT7NdLVvnbKZBFQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x643.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm <kvm@vger.kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 1:39 AM, Philippe Mathieu-Daudé wrote:
> On Tue, Dec 8, 2020 at 1:37 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Finally, we use decodetree with the MIPS target.
>>
>> Starting easy with the MSA ASE. 2700+ lines extracted
>> from helper.h and translate.c, now built as an new
>> object: mod-msa_translate.o.
>>
>> While the diff stat is positive by 86 lines, we actually
>> (re)moved code, but added (C) notices.
>>
>> The most interesting patches are the 2 last ones.
>>
>> Please review,
> 
> I forgot to mention, only 4/17 patches miss review!
> - 11, 14, 16, 17

Full series available here:
https://gitlab.com/philmd/qemu/-/tags/20201208003702.4088927-1-f4bug@amsat.org

