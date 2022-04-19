Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657B3507967
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:49:19 +0200 (CEST)
Received: from localhost ([::1]:60818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngsuc-0006zL-6C
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngspj-00036J-Ss
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:44:15 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:39747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngspi-0002Y1-Bf
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:44:15 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 mp16-20020a17090b191000b001cb5efbcab6so2688797pjb.4
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 11:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=m8lWloNN3Se/AH9V9cJ26hi4QrIsbqFEyi409JkvP8Y=;
 b=VfTMHkdoHcAIZBbZ5SS2DatAbgJTKZygO/kwzsgajtJBjjZv6oOMCEeT2srzdgvivj
 TJxrcgHJRIOqY0oRmO1+Vz2U3jeufhe9fO9Ngo0WSpHfM42b8l7QnsYwh+fj29Sy2iWZ
 OO1NOS6nGdu6HNHslyqKx2FGXpSrPX3Af5p+6ah41epWO3doWN6zOpc6QN9DCf/71j96
 1xO9oAVSDfRgdAtMk2q/kvEX8ryLohsW+cWoNwabqs7wP9RSD45hzaJlyHD1c74Fcllb
 /OX13qB3HrUaoJKbGmEZjHuRn8jDz3mtzcyquITA04NlwYJPMLL/nAu3ksp+l3cAIfoB
 aCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m8lWloNN3Se/AH9V9cJ26hi4QrIsbqFEyi409JkvP8Y=;
 b=sj8ENuyJ+Zo0z9Qw2bZ7+11j9xgjpEa5gXS5nClHIrMVNMYzTaxI5Mqf7ICL/WL5P/
 YitFu2ckRzJ6qKU3bVhzIC2PshCgGrE57TAwFkSsYvpv6PwTBXQDrp039wMI+sgJoqTz
 DxgfvBJoQ5Vd1FjuUaVeg1QtiCk50cMRT7yu+b2xRCaSMN5hVd6qLRwB/TzOuuChXXIU
 U1tkcN7YSPRkL5KB2wo94+tQEzstbpzUXqwCKEKqry0pwSLOrfx3MdsxtlVSTV8sVIVm
 dQVDb9BfSf0AeSV5IsY42g/4s/vJEUsF7P02PYtLPY8h3VrRUuJyrwGiYgahB/GHWFos
 07mw==
X-Gm-Message-State: AOAM531DZHFZSgXJdceE6xppwt4JyVLcTMQyVeUHojPcqqXmUME6NFap
 kpwDeQL3jwHo7IEMzNWTk3ULcw==
X-Google-Smtp-Source: ABdhPJxQzD3LSGhWq048TIwhkYWur9Dg1pimPoCaKTxHmGzN8SwpdTRZ6UCuHo4Zm8KTo8Tto78m/g==
X-Received: by 2002:a17:902:7fc5:b0:158:1de9:4646 with SMTP id
 t5-20020a1709027fc500b001581de94646mr16712764plb.91.1650393850146; 
 Tue, 19 Apr 2022 11:44:10 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a63e80a000000b0039e5c888996sm17417625pgh.86.2022.04.19.11.44.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 11:44:09 -0700 (PDT)
Message-ID: <d1313d2b-ffe3-5fc8-36c4-9ebfb133fc30@linaro.org>
Date: Tue, 19 Apr 2022 11:44:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 09/25] tests/docker: remove unnecessary filtering of
 $(DOCKER_IMAGES)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> Now that DOCKER_IMAGES is only defined after DOCKER_VIRTUAL_IMAGES is
> complete, there is no need to re-filter DOCKER_IMAGES against it.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Message-Id:<20220401141326.1244422-7-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

