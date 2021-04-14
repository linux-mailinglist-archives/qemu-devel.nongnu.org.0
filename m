Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FDB35F164
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 12:18:39 +0200 (CEST)
Received: from localhost ([::1]:59720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWcbW-0000Fn-5I
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 06:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWcZD-0006r2-FW
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:16:15 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:51927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWcZB-0005p3-N7
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:16:15 -0400
Received: by mail-wm1-x336.google.com with SMTP id p19so10315967wmq.1
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 03:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EZeaKiH+RbpOdTzhuUN+3R6GtinfBY0skStQKK99rXY=;
 b=XRUvH2oG8JLmFl+94DpCVyCCbr4dZOo6w73YIq4oCsxt4ok3NtYDaE0tnRDFdLvp9Y
 o+OYIT/epfLrVIpqkIpBkY5rxEkvJFF+nJyexSpl6XlIBqxPAx/u3Dta40ayS2VHFkut
 wloOmJootUfMRxb/fYEuPrj2b9jwaliRZppujM5Tds3CT0dqNs0mq66lSRJj86fpneKp
 VcQd+Dutbki0o3ydat63IGad/fQa4QI4/LV0nIXqGK9MaZED8Xd4Azmp3RxWJZivtwjf
 U02La4QGGvYc/aHoAdZ1Xak92UjxNkJeUCV1d19q4+VwRlz9s5e+jzSM5L/JsJK5PRMs
 +HzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EZeaKiH+RbpOdTzhuUN+3R6GtinfBY0skStQKK99rXY=;
 b=pEGSvgDCOSp1bZu5E2KXNkukXrtYyjql9QQ37CjNyA6BtK5/EBmgGrcDjylTqXQ+oq
 LkmWcinVTLJKNWyI6jiZezLbwN74/r+8cunMojAPbof24BBsumaKXYS1c0Jx0dA8zCxc
 vrvTGQDjmFQXHszwzUwMCQkg14vbLVRFE0NNgCUbBiGBmq3hIPSBSAbuzJvLeMZeELAu
 nL4TkpaYjAHTVgKG4Yoo1sVjWsznC5btKASfCxlO1HWyoPU+OrSVwaq2Mt6gYkodn/8y
 MRxN+BMTcL1pxXnqed6om2mrL/9NV1F6+TQ3k3gtj14DwNCdwjTKI4Q9U8/Zz2EuEwt4
 O9yw==
X-Gm-Message-State: AOAM533LJ2zCEZg9f3lde+8E9CeN/mwrZT3yHsOX7UKZf3dIzYiyuBe7
 7cJY6W3jn7oz2mWgbUg5hTo=
X-Google-Smtp-Source: ABdhPJxm698RvbYgX+1onS4W2QpQ2OxOd4x0iPgHqljlYg4DVGqLQGVgem5rfjPce8sI2YBNTGZiaA==
X-Received: by 2002:a1c:c246:: with SMTP id s67mr2220383wmf.86.1618395372393; 
 Wed, 14 Apr 2021 03:16:12 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id j23sm4758308wmo.33.2021.04.14.03.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 03:16:11 -0700 (PDT)
Subject: Re: [RFC PATCH 2/5] tests/docker/dockerfiles/ubuntu2004: Add missing
 symlink for cc
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210414081907.871437-1-thuth@redhat.com>
 <20210414081907.871437-3-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3689c506-5812-740c-70c8-287ec4caa549@amsat.org>
Date: Wed, 14 Apr 2021 12:16:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414081907.871437-3-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 10:19 AM, Thomas Huth wrote:
> For some reasons, the "cc" symlink is missing in Ubuntu 20.04.
> Add it manually.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/docker/dockerfiles/ubuntu2004.docker | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
> index 9750016e51..e1b309e313 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -74,3 +74,6 @@ ENV FEATURES clang tsan pyyaml sdl2
>  # Apply patch https://reviews.llvm.org/D75820
>  # This is required for TSan in clang-10 to compile with QEMU.
>  RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h
> +
> +# The symlink for cc is missing on Ubuntu

Maybe precise the version: "on Ubuntu 20.04" so we can remove
when upgrading to the next release?

> +RUN cd /usr/lib/ccache && ln -s ../../bin/ccache cc

No need to change current directory:

   RUN ln -s ../../bin/ccache /usr/lib/ccache/cc

Or use absolute (but if other use relative, better keep relative,
I haven't check):

   RUN ln -s /usr/bin/ccache /usr/lib/ccache/cc

