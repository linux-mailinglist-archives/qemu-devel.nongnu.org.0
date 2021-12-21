Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E8F47C86F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 21:52:07 +0100 (CET)
Received: from localhost ([::1]:48166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzm79-0000Jw-Na
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 15:52:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzm64-0007KN-Oi
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 15:50:56 -0500
Received: from [2607:f8b0:4864:20::102b] (port=47089
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzm63-0005Gn-7U
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 15:50:56 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so382673pjb.5
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 12:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=U+MJN4X3NhLKlMd8+n9mJpFpcD8SVmF+c+u53Ezfm0w=;
 b=N9WJ9V/YmSA49yNHDsXZbpoFqVOWX86LFcJkmRnD2+ejdkb9mp9pETdCY2qMXcFBba
 NyTG29rCXH5GUqOoN7XfHWbzD64iZkXrkK4BjeUtUa6QWI5vsMxwPgc6N/3mV0lDenSz
 wEd2pkvCslisvY1d5o7KFl/Qpk7MCWa5LXUFk5sIMqbPg2Ckf/JJ6dqYKjf2FFWTi0Mi
 rqLLgv2uNpT9HtFUoXbMlIDmWMweYD4pTJLRrsduZGFAVPEQQCj0eDFtgVszxn7tSmqj
 Y0JfSOXcRNl+XeM/VQkbIZcg069vhgI8eOeuysmAuGS/RXB2iPZkazUKmWNhbNhs6nMi
 MY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U+MJN4X3NhLKlMd8+n9mJpFpcD8SVmF+c+u53Ezfm0w=;
 b=H1HxtVhSuf7osgqEhHwaArZ+zbY1Aq5770mYZnZ7VVMW+xaz2jLVvXy/M2W+e/Spe8
 4oE7iVHeWMkES4HlnZ7V+eUSOB8k7GlcYlx117P+wbNtxDPztqUG0KeUt3Nl9+mTDAFS
 98wRv+vhs5Rgx2+/MISC2/udfBO2cWkuvv15Wr9rjmxucAT6L31wkmuZmzJtLjpP2Acs
 64+OWAHf5U6eUc2d+8d6tjbi3ZmoKtICmEEj1r4tksoJjip6HNKjLF/vumDzqSsiNHsl
 anY/soJv2WQdG2Twfzmgh3g+JFDleHp70GEc+ozT3+kQDJK+yPVOzLtFCemA5ZFLZUSw
 O8mA==
X-Gm-Message-State: AOAM5323FPNt8QcX1CBPRd+wKMYNezNjfVZoLYSBcxK7eG+Ov2CHVrbI
 uYCO/p5J7SK4BogENfvJrTj58ShuO8V0NQ==
X-Google-Smtp-Source: ABdhPJyvzYxC2YjPKqbhqgh15b2f3uSY7VNwhc5ZNCeyvWMVXAnyXfiDFT5LshSJ6C+LaoY09xm+eg==
X-Received: by 2002:a17:902:8645:b0:142:8c0d:3f4a with SMTP id
 y5-20020a170902864500b001428c0d3f4amr4897381plt.3.1640119853653; 
 Tue, 21 Dec 2021 12:50:53 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q22sm7968pfk.27.2021.12.21.12.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 12:50:53 -0800 (PST)
Subject: Re: [PATCH 1/8] configure: simplify creation of plugin symbol list
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211221110526.351709-1-pbonzini@redhat.com>
 <20211221110526.351709-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <60b52f21-5c91-543f-4e4f-f47178302bb3@linaro.org>
Date: Tue, 21 Dec 2021 12:50:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211221110526.351709-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/21/21 3:05 AM, Paolo Bonzini wrote:
> --dynamic-list is present on all supported ELF (not Windows or Darwin)
> platforms, since it dates back to 2006; -exported_symbols_list is
> likewise present on all supported versions of macOS.  Do not bother
> doing a functional test in configure.
> 
> Remove the file creation from configure as well: for Darwin, move the
> the creation of the Darwin-formatted symbols to meson; for ELF, use the
> file in the source path directly and switch from -Wl, to -Xlinker to
> not break weird paths that include a comma.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure           | 80 ---------------------------------------------
>   plugins/meson.build | 11 +++++--
>   2 files changed, 8 insertions(+), 83 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

