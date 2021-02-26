Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BF83266F1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 19:34:04 +0100 (CET)
Received: from localhost ([::1]:40358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFhwA-0004YD-LG
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 13:34:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFhvO-00048B-Eq
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 13:33:14 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:33802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFhvM-0001mn-8q
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 13:33:14 -0500
Received: by mail-pf1-x42f.google.com with SMTP id m6so6832467pfk.1
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 10:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=txB4A7zSS+3S+gz2oyGa9/tU3QyCxieGixKq/xYXrNE=;
 b=nha6S7JLvqSm5KETj1wkOEpi+lYNm8lY0v2Bbwfo4bE6Bn4+2bXS+XYD2bvo6B5NES
 kZM5nYoKDZMpTH7vD+TW0z82AXlcn19LYAGzST9f46DT+olM/mtdwdWEFPHAog0ipukN
 r70+b9hMB9q1DNJhGbVP/fo5h+dTi62RibFc7UchusNYFXIizJtVrD9hqdyU1uIGeKhE
 iJU05gu+/Z3K0AHrMA0GWOkV1owEw0IuP99c0kxm+lUHh6qykdPF44oBwSivGAGxP8d/
 /OG+0cSh7QoVKw2V+Z8hV0QlPkdWeK8BwM+zVabfboSwOaDOhXDxn6uUye1d5zjlx4SZ
 HW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=txB4A7zSS+3S+gz2oyGa9/tU3QyCxieGixKq/xYXrNE=;
 b=LzdcZIYleMj/x1KJJpWOTW6Igm6fDHA8zFjhHBV3Ycs4cnPR0lRz8gl21tGPaxmUni
 GUJvMTFUMnTD/ch4xGVCeOG/XhOVtRXoADC+bilcAN+QeYltVwiY6moUx1CTgH+M832q
 02OV95KVy2k0hNDOgXvzF5fx+lCCgsuDFt8dLqc/vWbSkoaGAo2B5b2JVB3t2A4efCPb
 4nojF1yBKbQ8bcLZZSQyPK+iqjMYQZTAbastZUYiZmgMCmcC5nEnFsrdIyKQBc3WM8XG
 ogexX28eEG7Hd1wtLRXwUyE/Qsorwe5yOjFbkc8Z1CDZOag87KrqFOj6EhokzTNlH1LX
 bBkg==
X-Gm-Message-State: AOAM532/uT58147SgxF7ZGYFFIgAX9VHsyTOSoce0ngsEXpjVaTWXRsq
 I7o1del6xOTMSY4ASmPNMJ1KGERQo+jvTw==
X-Google-Smtp-Source: ABdhPJy4Dbk1XBz4X1U7pFbJ9KQMWK+B+CwDxdNk/mkwwgq58PBxVCJkbZTlEMAiLlIq5azwoZOxGg==
X-Received: by 2002:a62:8fca:0:b029:1a9:39bc:ed37 with SMTP id
 n193-20020a628fca0000b02901a939bced37mr4493605pfd.61.1614364390481; 
 Fri, 26 Feb 2021 10:33:10 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id p20sm5265294pgb.62.2021.02.26.10.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 10:33:10 -0800 (PST)
Subject: Re: [PATCH v25 13/20] i386: split misc helper user stubs and sysemu
 part
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210226175143.22388-1-cfontana@suse.de>
 <20210226175143.22388-14-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <900e39f8-30d0-584f-8118-f3d3ec3e692f@linaro.org>
Date: Fri, 26 Feb 2021 10:33:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210226175143.22388-14-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.349,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 9:51 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/i386/tcg/misc_helper.c        | 463 ---------------------------
>  target/i386/tcg/sysemu/misc_helper.c | 438 +++++++++++++++++++++++++
>  target/i386/tcg/user/misc_stubs.c    |  75 +++++
>  target/i386/tcg/sysemu/meson.build   |   1 +
>  target/i386/tcg/user/meson.build     |   1 +
>  5 files changed, 515 insertions(+), 463 deletions(-)
>  create mode 100644 target/i386/tcg/sysemu/misc_helper.c
>  create mode 100644 target/i386/tcg/user/misc_stubs.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

