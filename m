Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A7B432645
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 20:22:45 +0200 (CEST)
Received: from localhost ([::1]:48986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcXHX-00041o-AN
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 14:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcX6P-0006YB-Um
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:11:13 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcX6G-0008An-9f
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:11:10 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so28989pjc.3
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 11:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LeJc7+ms3rhQrPG4/6AJq1uTKzu3IonUnA2knQOq0Jw=;
 b=ADKabkermd4zP+BPvu5kozvif+rDfzJiOQOVErUha7yhuId85QvlZIkoyNUOFM+9aB
 smF4ukbb1No9GiS5Dpepwc7uJHSYLkp42NMeLtYU56P8CFfEzUhppdvZeeX2GaYD2o6s
 msr5ClwiB+/aDruMef1asmHpNcuXjn7oTTFFMkMIitT6Ro1kd6CwXM/Rtzv0heWX05GJ
 IGi59AyZP6sesLn01ICUVNuhdp+jnNp2ZwhpGW6iwxxXpS/MXPtNFRHTOqQQIyH5my6h
 JoYpTo1svUSrxyD1MB8P7utAHrmewBjTYIRHBMXUCrvQRvdYXXatANNSPUg8Cw8RWpct
 vn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LeJc7+ms3rhQrPG4/6AJq1uTKzu3IonUnA2knQOq0Jw=;
 b=FT6rDHLve0y50PQIKcD6MDwJypTJcN7HAADc5YD75kdHssqYmVkpfQMFGquSTCgv7e
 MywXUVPGgqt7wmD2aZQgENeKrGDQr9HK7h9u/u6rzVkoxOBU0wHilulykjibjLSMfKlK
 h1SPINv3wYW/vx/oJwdxICDSVN3XD5sVcW7aUU6bbONOldVGO5AAgKzhlG8QY6KbrBzN
 RSVEXZTDQIx19Nt/KlLjHU/BoaqTHl1sH9BM7w62sXdGHGcrX/u8HKvfaTt4C9FMj1I/
 Fr5DUA1zSkgYJSlopTQF+5vHEPjUH2aUtA0kBKVtYPahotWioRBzNyc7WTwwI4qFDnwG
 N+FA==
X-Gm-Message-State: AOAM533ICjIJE88SZc1iHSJqGomM1qkysg1sj32P45lLBoYRNCkdw9dm
 FqAccD7fKlDn0kpDQKybgiGAWQ==
X-Google-Smtp-Source: ABdhPJwJcb3SlZiRG2Sxoe77BGrait8iyFr/2+VQD4QiWgSqtFoVB1iST3I8ky1MRDc4N+OoM8Hf2w==
X-Received: by 2002:a17:90b:fd0:: with SMTP id
 gd16mr447111pjb.157.1634580662042; 
 Mon, 18 Oct 2021 11:11:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm7772285pfc.69.2021.10.18.11.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 11:11:01 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] roms/edk2: Avoid cloning unused cmocka submodule
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211018105816.2663195-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c870452-03d2-6d1e-a49c-ca2201d04972@linaro.org>
Date: Mon, 18 Oct 2021 11:10:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018105816.2663195-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 3:58 AM, Philippe Mathieu-Daudé wrote:
> cmocka website SSL certificate expired, making CI pipelines
> fail [*]. However EDK2 images built to test QEMU don't need
> cmocka, nor oniguruma. Avoid cloning them.
> 
> Note: scripts/make-release is neither covered in MAINTAINERS
>        nor in our CI.
> 
> [*] https://gitlab.com/rth7680/qemu/-/jobs/1685387520
> fatal: unable to access 'https://git.cryptomilk.org/projects/cmocka.git/': server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile: none
> fatal: clone of 'https://git.cryptomilk.org/projects/cmocka.git' into submodule path 'UnitTestFrameworkPkg/Library/CmockaLib/cmocka' failed
> 
> Since v1:
> - Fixed typo (thuth)
> - Added missing '--' shell separator
> 
> Philippe Mathieu-Daudé (2):
>    roms/edk2: Only init brotli submodule to build BaseTools
>    roms/edk2: Only initialize required submodules

Thanks a lot.

Tested-by: Richard Henderson <richard.henderson@linaro.org>

I'll queue this to target-arm.next.


r~

