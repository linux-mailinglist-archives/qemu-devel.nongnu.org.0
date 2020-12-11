Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8D52D7AA5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:16:38 +0100 (CET)
Received: from localhost ([::1]:53112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knl5x-0000De-Vh
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:16:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knkzr-0002MN-1X
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:10:20 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knkzn-0005qU-Le
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:10:18 -0500
Received: by mail-ot1-x341.google.com with SMTP id y24so8660937otk.3
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 08:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VgP1eFbssYNWRRTfYpJhhIHOlqCANnB9ZL8waR8thxo=;
 b=xfYARLaLGUMhr43DJAz1U6wPISZj3IUWurIvMmvEAhlHt7M0XzfshEiZIVzWuJWMGq
 T9vmCHZWX8Z6moqGqBszHpPh6moAdt3kakfsCvI1HeB3DcypavouI2dPcz7m22KcdTYi
 g8whk1a/qhZ2+PFHlr9V/k4VU+uIOAWNponkcIlChxpvuxVIQiLJ/UyITsV5W95y3HFs
 My5sJnsmVuKjryzkrQKwtOzFsGos3NbplxqJF1h9+KNI+KX/gXD1Kr6m1PbgOfHgYOdl
 Em1tR7rJRcJPNI4AIff6cI+FqVmZqNqoC05zF5nju/gX5cKemM44ROdFgLBe3nTUzXi0
 3QZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VgP1eFbssYNWRRTfYpJhhIHOlqCANnB9ZL8waR8thxo=;
 b=FMNJ5zm2kwaNZhzKL6Z3Kt2JpMEiD3ZrKIOuiD6UfEg5SrNxfO6tUhvrjD0VEacl3F
 1o5laXDofcjOV6GRtLYp/QdPEgO6dn5C00N/YBaVNXDtY9niIDVsuFzA5Ajc3AS7RBVK
 hEZx4cRtrbQ8TIz0ye9R2wtj6qTvudFvsRJgztdXf9M8xTlbwx6WF51ZofH5n8iHfBsm
 Ytoz/LVqyc99UOjVkEUVuPIZy95epaSrB7AaPlozFaktgy3y/sz9Zu4xQ70EqwWwjukk
 5dt4sr2xTgLIYfrcWc+DfwraEB6hqCRsGTfvJADzndkcCvdIWu68/kvSk4YD7Y0Aelsa
 A45Q==
X-Gm-Message-State: AOAM5311Gd+fJ/6NWbF39FTJGN8aWyKIzg7p/6yBATvzj6o/vGsIcol+
 x+GrutbFEI2y7DCGd41q6YLSQw==
X-Google-Smtp-Source: ABdhPJxTNK186b8q0CC39G3jan/p3l+KvfW3OcsRJH5iFLpl96UXfv9chhYLyS31TxbHxYHWq0+JuA==
X-Received: by 2002:a9d:37c4:: with SMTP id x62mr9387836otb.87.1607703012589; 
 Fri, 11 Dec 2020 08:10:12 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id r12sm1877091ooo.25.2020.12.11.08.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 08:10:11 -0800 (PST)
Subject: Re: [PATCH v11 06/25] i386: move hax accel files into hax/
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-7-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <101846d3-8998-94c8-b126-2217b367db1f@linaro.org>
Date: Fri, 11 Dec 2020 10:10:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-7-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:31 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/i386/{ => hax}/hax-cpus.h      | 0
>  target/i386/{ => hax}/hax-i386.h      | 6 +++---
>  target/i386/{ => hax}/hax-interface.h | 0
>  target/i386/{ => hax}/hax-posix.h     | 0
>  target/i386/{ => hax}/hax-windows.h   | 0
>  target/i386/{ => hax}/hax-all.c       | 0
>  target/i386/{ => hax}/hax-cpus.c      | 0
>  target/i386/{ => hax}/hax-mem.c       | 0
>  target/i386/{ => hax}/hax-posix.c     | 0
>  target/i386/{ => hax}/hax-windows.c   | 0
>  MAINTAINERS                           | 2 +-
>  target/i386/hax/meson.build           | 7 +++++++
>  target/i386/meson.build               | 8 +-------
>  13 files changed, 12 insertions(+), 11 deletions(-)
>  rename target/i386/{ => hax}/hax-cpus.h (100%)
>  rename target/i386/{ => hax}/hax-i386.h (95%)
>  rename target/i386/{ => hax}/hax-interface.h (100%)
>  rename target/i386/{ => hax}/hax-posix.h (100%)
>  rename target/i386/{ => hax}/hax-windows.h (100%)
>  rename target/i386/{ => hax}/hax-all.c (100%)
>  rename target/i386/{ => hax}/hax-cpus.c (100%)
>  rename target/i386/{ => hax}/hax-mem.c (100%)
>  rename target/i386/{ => hax}/hax-posix.c (100%)
>  rename target/i386/{ => hax}/hax-windows.c (100%)
>  create mode 100644 target/i386/hax/meson.build

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


