Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F312D648298
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 13:51:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3cqI-0006Y0-TA; Fri, 09 Dec 2022 07:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3cq7-0006Vr-DG
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 07:50:55 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3cq1-0008NG-Vm
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 07:50:54 -0500
Received: by mail-wr1-x429.google.com with SMTP id o5so5117646wrm.1
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 04:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n1aIy93sthrKJF2VnyoNqgNSAWEn0dbp8qkr7zXNGq0=;
 b=EtsySdXqT3BGqhZ/1guRo9RkFA/oDirTWNikrStHJvnZ3PiGHCwpQuKlCurRR6r5SS
 +t7OlPbadlCzq0oWb6oxRYCicKlkyCQw4yN+jhRWIloTzx3folRfVxyDTh5XPya/UcQJ
 X1ipbpKsSoeK7EsoCJjMV/XM3Lpxn/Ojhbe6QIPF0AjkrmtxpHnc1rYl505c19NWuuRR
 iMVmK+o8LGNY2RczS/80pA+oowjkX2hkxFk8r1VdEUZSoSYsptDd2h8cXxG2tL/5IAEd
 sggdLj7v8xicoHn74rjpTDB/3o7iYKHuwDhlmG5BWR3YuCV2ubhBAa861F9rYFpiaRxs
 mx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n1aIy93sthrKJF2VnyoNqgNSAWEn0dbp8qkr7zXNGq0=;
 b=aNFpaTWX+PzU+Dijd1lvxc/kUs9FoZMl20UCu1kZlfkzSUPMmf8pPEQWiZC3LtbANg
 HautW3Cov+ax5CHQnQ8aJoIzjRDcjonj/5QDhKaSNwgQzoG+8MamPY1ekhSFIW1lKuSC
 r4ami/iK8BqiyXETCZK8VNAtkq5has0aHmVYJPkhXD9UBLfluZabzGc66vCzvnWLvUQ7
 pDSveoxlmCE2QMoAhLOOVGDmEe0mDi1StPAD50nnuBJ5M8pQk8dRg9metGwu3Nw7Qrqu
 oiDNm+NwdIDX5J+JEdnPfl5ElY4+A41wKMPBnhFRDA5HGnKZUKfxSWGzIBZdFnII5qJ3
 MJpA==
X-Gm-Message-State: ANoB5pnA/zjiceTztyy6nSYldUtHJP1XPlfWdUA2aUhwPN5wThBXkSB5
 ifeYZAHjRVDOQDIXXS2/vB6bFg==
X-Google-Smtp-Source: AA0mqf7qlQqKyxbcuyL7upNvX1jkzMEdndxwAVqBukIrP8aLrLBNb07lPGLOjHsmX4maVIwcNDqNow==
X-Received: by 2002:a05:6000:5c8:b0:242:7493:3eca with SMTP id
 bh8-20020a05600005c800b0024274933ecamr4222389wrb.49.1670590246649; 
 Fri, 09 Dec 2022 04:50:46 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h8-20020a056000000800b00242710c9910sm1345349wrx.8.2022.12.09.04.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 04:50:46 -0800 (PST)
Message-ID: <ea313503-d8ff-58a9-9906-ca952e4356c2@linaro.org>
Date: Fri, 9 Dec 2022 13:50:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 16/30] build: move glib detection and workarounds to meson
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-17-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209112409.184703-17-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/12/22 12:23, Paolo Bonzini wrote:
> QEMU adds the path to glib.h is added to all compilation commands.

add/add/ not clear...

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


> This is simpler due to the pervasive use of static_library, and was
> grandfathered in from the previous Make-based build system.  Until
> Meson 0.63 the only way to do this was to detect glib in configure
> and use add_project_arguments, but now it is possible to use
> add_project_dependencies instead.
> 
> gmodule is detected in a separate variable and added via both
> block_ss (for --enable-modules) and plugins/meson.build (for
> --enable-plugins).
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/meson.build        |  1 +
>   configure                | 83 +---------------------------------------
>   contrib/plugins/Makefile |  4 +-
>   meson.build              | 81 +++++++++++++++++++++++++++++++++------
>   plugins/meson.build      |  2 +-
>   5 files changed, 74 insertions(+), 97 deletions(-)


