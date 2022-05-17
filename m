Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F7752AA71
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 20:19:04 +0200 (CEST)
Received: from localhost ([::1]:49118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr1mZ-0003iw-P0
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 14:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1km-0002Ci-Tk
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:17:06 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:45007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1kk-0003Iy-Tm
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:17:04 -0400
Received: by mail-pg1-x529.google.com with SMTP id v10so17613146pgl.11
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 11:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kvyaaCiLpzW5nYS1Fy3j1lG8KYyGT6Jt/iwiRrc+L00=;
 b=MPidGyo9MaLOqjWjxd/esYMBrqGxVGsXbUa9fHCkzDkRfv6xV+vfTvf8bXFYOHUqY9
 vtLyHbi+r8vFABClM/XDQHZVM0KX/uDHAMBlOoJUGxvngaQ6reGY3TJ8rJwRtk52ci9i
 DXCjW5QgAtmrBq7MFlAKVALL/n3NaU7E1T0x4/JvvSRSHOj6bWyiKAnHdN/Ud8ghxPRs
 9C2OC8/tnP9CVqLdfw5aeQqh2g38uYLXY/9i7Hn4gW8txhtCMUpwgZ2pDfeXzo1oEcDK
 N1XxIECYPeRwOYHO+ZqS4mgIdW+8Cen/Aow69tf/3n80BkQSL5zqApKULTork4qykWUr
 vglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kvyaaCiLpzW5nYS1Fy3j1lG8KYyGT6Jt/iwiRrc+L00=;
 b=aE4BJZend7813t5oNA3uivw3C8xNLWoGgeGgynIih0ziP4S2tmS17Gx+JWhdprvM6G
 he3gOGTUa/GSCqEZLsTcSbpf3SlaR/UC4RB/4vj0b83tKG1i90sNOCtlD5k9FxEwCMac
 DddPrIkOeCkhcBTi+MotNAdT4abt9M8mH0QUYV2xov0UDdGgR6KL/9uqu9w0pHXV+1AP
 lrKTzag8LUyC2UN+Lgb7dpQhirznXBkONlSJtHzcDOI0j2jlfTA+9i14vNIGCuDUsoq3
 NuGPAC6YCuU0LUMpNt0/kwZcOMSFUjPtNt7GJOXEusRoglYUCjuQhjgPe9Qgu5itJd/7
 Phmw==
X-Gm-Message-State: AOAM5310PoHOJuFE3cFFUgETqKN1jvQ3SWwlpngTMVAmlbLw3QisOybv
 +9moO8B2FD0SBk7jumwnGqldXA==
X-Google-Smtp-Source: ABdhPJxTiLk5sEsUNgOI5nYrX4dS8eNuka6gHqqqbXm7cwVLUdNRkH2+2EFIfspX0bLNCKfD001PXQ==
X-Received: by 2002:a05:6a00:2310:b0:505:a8ac:40e7 with SMTP id
 h16-20020a056a00231000b00505a8ac40e7mr23846539pfh.11.1652811421210; 
 Tue, 17 May 2022 11:17:01 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a629709000000b005180df18990sm26616pfe.168.2022.05.17.11.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 11:17:00 -0700 (PDT)
Message-ID: <2511dd21-95ff-593b-4bf9-77ba1e846721@linaro.org>
Date: Tue, 17 May 2022 11:16:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 09/16] configure: handle host compiler in
 probe_target_compiler
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20220517092616.1272238-1-pbonzini@redhat.com>
 <20220517092616.1272238-10-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517092616.1272238-10-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/22 02:26, Paolo Bonzini wrote:
> In preparation for handling more binaries than just cc, handle
> the case of "probe_target_compiler $cpu" directly in the function,
> setting the target_* variables based on the ones that are used to
> build QEMU.  The clang check also needs to be moved after this
> fallback.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure | 25 ++++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

