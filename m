Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED952D455C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 16:27:55 +0100 (CET)
Received: from localhost ([::1]:33850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn1Ni-0001do-IJ
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 10:27:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1Ln-0000sq-Ny
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 10:25:56 -0500
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:44825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1Ll-00086P-0q
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 10:25:55 -0500
Received: by mail-oo1-xc44.google.com with SMTP id n20so458300ooq.11
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 07:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=viI5vrk7EiAHTVvmvfnKMG6eoEpdfqILmVpNFtfqTCE=;
 b=H5ZUdumapfaNqCxjpCmTLZV+kdGTBBz2I2QEO8VQZklWt98f47yYhl259OjErEFpx7
 4+nz94Y6vbpLlcOxYRLQjbEbBXOJChXPr5sblIn9IHgw1R0vG6RzyiUmJmSL5488iIK3
 gEP76I5Vcfzf3e26ImBtFqbt+N6+3167Z/EGL5ZeF2co26oOOCtjqh7NvttGXB9OCjeO
 m46hF0dy09fsh9D6JRKIpo63W5t8p863iZAKs+IXaDhc60A6N+lVvuh8gqIh9/emjWig
 yLpb53oCCdA52lONk8daHuefb24chRYKn83HK9lKPCqv822LEgzKnYHucnpIC55AR0eu
 SDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=viI5vrk7EiAHTVvmvfnKMG6eoEpdfqILmVpNFtfqTCE=;
 b=k2Zz8E/PLwk1+AtE4rBSabkxz4zhV987E3YqNkZSJ6nMOQMsHD3D7ySHgn+mUuQlQV
 HxS9g65UtKOg1YGlle9sG9+tG5HwKJDrdjXCuQgaSR1wo0eMX8JIDUT3jQTdkcULcMT3
 e6FGBFylrjUqyps6y8h6J2rC/9bJhd/G84VvuXDiPVCvAqSqOAGPrFaUwosMNpW2y11+
 sGMm3c2joQW4dabNmOxeW+MfQ4oOtYZIuUy96euqbcO8sQbqqdvJvoQ/Gj6Cha3JbL0P
 /d/Id4n8brMYO536VgsV2sOPiYamb20DKRg3DXX0Uqp121xsJKQzhEOmZejyIZoUUlCq
 WVpw==
X-Gm-Message-State: AOAM530NTbIVcheP909v+Zi+7RrPYOJoim0k2yNgNLQr/1lwLEPbguYn
 kHfhpDCvCf4jNbJPQOofWigc6g==
X-Google-Smtp-Source: ABdhPJxnvhlcBvObCgsIhXmcR2XwH2a7ygUMj0YUwqB7r+6uJ3ezWUuw89eCiIYnVtTVM/tGMfD2XA==
X-Received: by 2002:a4a:9502:: with SMTP id m2mr2233955ooi.93.1607527550647;
 Wed, 09 Dec 2020 07:25:50 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 11sm433334oty.65.2020.12.09.07.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 07:25:49 -0800 (PST)
Subject: Re: [PATCH 14/17] target/mips: Declare gen_msa/_branch() in
 'translate.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208003702.4088927-1-f4bug@amsat.org>
 <20201208003702.4088927-15-f4bug@amsat.org>
 <45ab33e0-f00e-097a-74fb-4c7c42e29e33@linaro.org>
 <b0cf35c4-a086-b704-5710-0f05bf7921bb@linaro.org>
 <58a0d6c4-fc01-3932-52b9-9deb13b43c51@linaro.org>
 <1d2a6f44-1eab-2e92-01c2-703a2ee5bd50@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d5f0d2ad-065e-e4bf-9eaf-1d8450aa4726@linaro.org>
Date: Wed, 9 Dec 2020 09:25:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1d2a6f44-1eab-2e92-01c2-703a2ee5bd50@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc44.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/20 3:17 AM, Philippe Mathieu-Daudé wrote:
> Hi Richard,
> 
> On 12/9/20 1:03 AM, Richard Henderson wrote:
> In a previous version I tried to directly pass from
> 
> static void gen_msa(DisasContext *ctx) ...
> 
> to:
> 
> static bool trans_MSA(DisasContext *ctx, arg_MSA *a) ...
> 
> without declaring the intermediate 'void gen_msa(DisasContext)'
> in "translate.h" (this patch). The result was less trivial to
> review, so I went back to using an intermediate patch for
> simplicity.
> 
> Is that what you were thinking about?

Yes, exactly that.


r~

