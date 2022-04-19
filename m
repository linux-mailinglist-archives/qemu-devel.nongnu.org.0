Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6648C5079E6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 21:12:32 +0200 (CEST)
Received: from localhost ([::1]:39372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngtH5-0006Fk-HR
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 15:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngtFE-0005Sl-Sf
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:10:36 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:33645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngtFD-0006hv-7g
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:10:36 -0400
Received: by mail-pg1-x532.google.com with SMTP id k14so25025224pga.0
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 12:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7xmckKuMILXWm820pxn6WL5w+NllQ1yqi49rcQMPazU=;
 b=jV2PzR8m1PFZ/SlYVM0mIkHU5lQLAPKe0vCnNwBJnJQmGd+17JBFlpLfCA1sHbkqQF
 nE5F9xo9bNIjC6cFSa6d8eAPl65ByQjWDBG01nFmfJr5b33mhEpiHvu7/UtzAO/W9Wt9
 ytQxo1Nteqx3bLMeSm5YFuRyJcaXacUVGaIXuFloFBp2mxG4mREWFaM0/yeT/RRqG1Dr
 aQAXyRHEoEpd0idwQzYoztPy5n/4y9RcT6ZrPNogJxgtVCygUmP85sPvn7vgcX3pbHBd
 37dNUI/KjcBzwasDP+QXWRzj6gQ9C0xzUPEICI3w+eBxGdNcLSzDHIcG3HkNgJo8QXRb
 kL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7xmckKuMILXWm820pxn6WL5w+NllQ1yqi49rcQMPazU=;
 b=uimGc6EwdwTO3d1CFDjX7LN4vNknGYWQJG0LGiu5avJT3W17sPrD1s69kIHdH1Y4hv
 ePQxfVGFN4M3Wux93Md12Ssdpw542SAMPo/WTQl4JOfv76X3sLAVI7r/aRXIrEqjWFGv
 LxzJIjAznnrrujoP99qeejdKVa86b+uRynZtVTvWLXcAq2NEWpk8veS+95f+i5XzkjTQ
 dmrGrQ6AU9d8Zbqvsn0vOn8XJAYxlKIDbixN7kJJ4fNwWNQ2TmmcE2lCQSdRAs4Vllwm
 C/HxuBvctG2IZ/gjnYUVNsj8oF9pLA0CV/aHcZJUNqMRGM1pPEd6iaYubQrk230phs19
 /0nQ==
X-Gm-Message-State: AOAM531+6NPoUAcHNMvTIojyz+2S58F2x6uEWHpvnA7Uil3GxOz13xXi
 PJ8sfnDM71ax09Fnry/LnGEUHg==
X-Google-Smtp-Source: ABdhPJyXsiaCHKxUKhbIVBeOELrcLc5J7W7qvvjHqNRzpSFJh4sWopVSOUt3r1iYdfL0yuWtqn2lfA==
X-Received: by 2002:a63:2b4f:0:b0:398:49ba:a268 with SMTP id
 r76-20020a632b4f000000b0039849baa268mr15822324pgr.546.1650395433734; 
 Tue, 19 Apr 2022 12:10:33 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 t63-20020a625f42000000b0050a7eaff8c9sm7607363pfb.189.2022.04.19.12.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 12:10:33 -0700 (PDT)
Message-ID: <415757e8-c01e-2d9c-4dc1-3bf0f7357a39@linaro.org>
Date: Tue, 19 Apr 2022 12:10:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 20/25] tests/tcg: fix non-static build
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-21-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> If linking with -static fails at configure time, -static should not be used
> at build time either. Do not include BUILD_STATIC in $config_target_mak.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20220401141326.1244422-18-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/configure.sh | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

