Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62D039D081
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 20:47:56 +0200 (CEST)
Received: from localhost ([::1]:33754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpxoR-0006Na-5q
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 14:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lpxmD-0004TZ-69
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 14:45:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lpxm9-0003SU-RF
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 14:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623005131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BdFbkKqgvU3pedi6rAGS+BTKR+b1L4+4bcP5Rl6qS70=;
 b=D9giodRWNBM0je9zraR9ntoTVkJ9IXsPFmsLW0AKfFV8K0J84Vz6GrMo2HZoRLTK8wi0iZ
 uxleBkI86ewpMd0rERDsvUu1ku0ybRDvYpy/86o8M6Yb8a22qgSgDYJaAYDc97tmNT9jlj
 31/cBMCJ+o11zWMYe4TZIJFB5x2oFJ4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-vxpBP0_pP-aTQUieuOc57g-1; Sun, 06 Jun 2021 14:45:29 -0400
X-MC-Unique: vxpBP0_pP-aTQUieuOc57g-1
Received: by mail-wr1-f70.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso7113069wrh.12
 for <qemu-devel@nongnu.org>; Sun, 06 Jun 2021 11:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BdFbkKqgvU3pedi6rAGS+BTKR+b1L4+4bcP5Rl6qS70=;
 b=B8kyaqxYZ9behq/3zfPZCxZMFXKdHd+gSoMsu2cQlgOIGhAT4wyLVZVmtsg0dUfjkM
 JnOPbTtGFdWWnaFpSp/9m5NM7R3tuW2QH11A5chja2m9mqDWgtwxuFC40uuV6YA7Wr6v
 Hwe7swzCiLvPA+3eTnfLRHHMFFJtR5BWVDNnvB0YH4tfykqmKmyqehpDC1SxoUd/8E3/
 Uu2w+qkfyszcadmF7MeY1LNaMc5rGpS1Fud4DpulHQWrM7CjSyCTfSFiyjNhwHDaO38q
 VTrAQ29paBPjOwuQBFaZO75eixpTmfjD9O+aEqHc4GClxHmIl5vy4MRTmVGzWqNVEThb
 fcbA==
X-Gm-Message-State: AOAM531G9e+DLjS7R8pcsfiRELtrwZdbYWqFiDWhHbOcBnJgIiqziUAG
 AXIbjxAFxbh3udV3ySesfj9/9Cfe1EJB+ke3okPLP4oZ59nEUnIc1WevpByNdcyouTLToghUS6I
 4/4I0/fxzEETygc8=
X-Received: by 2002:adf:bc02:: with SMTP id s2mr13671025wrg.87.1623005128706; 
 Sun, 06 Jun 2021 11:45:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDN7nOrFaQNtknD0+nStbvgHyCMfb/GVjvC3rBtThVv0Yy+yLOQ5Palj1dczBGSi+n/BEyoQ==
X-Received: by 2002:adf:bc02:: with SMTP id s2mr13671009wrg.87.1623005128499; 
 Sun, 06 Jun 2021 11:45:28 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id o3sm6207463wrc.0.2021.06.06.11.45.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 11:45:28 -0700 (PDT)
Subject: Re: [PATCH 1/3] target/arm: Diagnose UNALLOCATED in
 disas_simd_two_reg_misc_fp16
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210604183506.916654-1-richard.henderson@linaro.org>
 <20210604183506.916654-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d60bf128-dd7a-95de-88e5-6f801ac1d287@redhat.com>
Date: Sun, 6 Jun 2021 20:45:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604183506.916654-2-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:35 PM, Richard Henderson wrote:
> This fprintf+assert has been in place since the beginning.
> It is prior to the fp_access_check, so we're still good to
> raise sigill here.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/381
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


