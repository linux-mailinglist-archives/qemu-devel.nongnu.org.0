Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A710F2B9F13
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 01:13:09 +0100 (CET)
Received: from localhost ([::1]:39228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfu32-0002Ta-Mk
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 19:13:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kftzs-0000Ha-PB
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 19:09:52 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:39589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kftzq-0007yL-Vi
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 19:09:52 -0500
Received: by mail-pf1-x442.google.com with SMTP id q5so6118523pfk.6
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 16:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0ikXEX+nN8UC/zRi3z2BATJW8sOiZDyUWP+kWAom7Ls=;
 b=yKuxjEMNlt08NHO2HuAPW3cbdS0Wi+0KHHuFhsSiw8xgfInBPbrbLgU1b7xMVWw8xB
 60u1fEP1bCayN1/XwpFoSSnF95GZT0YdiYj7DedeXgJlu0nDkcm+aKeINPSPHH0/mCS8
 +/tpONIV6/OepVxTW/uiMnC3UnovFBw39a7/DR3rG+ViOkZLGq2Xy5TRCz4ctwWRHlII
 7cTjNGFi0q12NwYl3R9uy+gNgDOgFB9+CGMAQ+weVCJ3/EnDBQWeDjt8voojh7XuGbXr
 30dB0s53Kmf9XEpILDelG78KBYLGlATgCyKzWgXBi8rVXIeJy9OK4WtOa7PEHytOZvSH
 OYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ikXEX+nN8UC/zRi3z2BATJW8sOiZDyUWP+kWAom7Ls=;
 b=CswF87RvNV4qALK8Tn0Orf2dAaL046IIXaeiBZFvbMqBQxPjSEuWmIqPJ6k1OzO9yD
 /ggAmWo/HuuBPJktR9aiQ2izPXkTLK4wBo1/gic8UzF/849vT7LEBFqoGuJeTifCVdxU
 djpVwa9WNIka4pLJB2cqPthuzQslvZtKArpfzdaEVVrBbxDpEi7qoOA/w3d8V6L+v75D
 DNbRdYH+LHQPejwpC9j1syzn3mBBXAxmdBLcXYMjeZxkmcFneVeipxYkRRsfw3+LrbAv
 Y8pYdFri+l0skP5xGcZ8k8ChTecehoLhbdJnaCS8qAYvO6A/frHzoq4EWgmSHU7TY/3P
 swIg==
X-Gm-Message-State: AOAM532yK6DH9FLSjdLniGItsji/nCn/TqxFksXyWSAY6lY1xeoUlDKi
 Ql/N4BjsEVEqCapkm0AzvXnn1g==
X-Google-Smtp-Source: ABdhPJxtboJa15Uvma4MFTRk9b9lAm0clTXbQPyiAHugKS4syREhS1CcRc8SuPK/vA57O5stndxy7w==
X-Received: by 2002:a17:90a:c695:: with SMTP id
 n21mr7263130pjt.86.1605830988670; 
 Thu, 19 Nov 2020 16:09:48 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 131sm1190212pfw.117.2020.11.19.16.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 16:09:47 -0800 (PST)
Subject: Re: [PATCH 3/6] configure / meson: Move check for drm.h to meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
 <20201118171052.308191-4-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1dd6d348-81dc-93ef-2f5a-394e5e0e97c0@linaro.org>
Date: Thu, 19 Nov 2020 16:09:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118171052.308191-4-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 9:10 AM, Thomas Huth wrote:
> This check can be done in a much shorter way in meson.build
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure   | 10 ----------
>  meson.build |  1 +
>  2 files changed, 1 insertion(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

