Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 425C9459181
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 16:37:14 +0100 (CET)
Received: from localhost ([::1]:50960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpBNY-0005RD-Sd
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 10:37:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpBLz-0004Fx-No
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:35:36 -0500
Received: from [2a00:1450:4864:20::42c] (port=36663
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpBLy-0005VD-9z
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:35:35 -0500
Received: by mail-wr1-x42c.google.com with SMTP id s13so33529012wrb.3
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 07:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rIOJjATpEMHFPGOgLu8pe/TRItvjeVhlcoYx8wAMN84=;
 b=BIbwlq3vAenxbhzw/NdhMz+uiupbwrfUCy5etIWeRg/LSEbM+HEE1Ujr3XE4+aitrB
 YoL3hXAAdG2IaupPTE+s050ZqcgqLZnw1UeJkS7kiUXljCJBIhoW2aePOWPlhK7+JP6L
 t3HFXIrSl2+XkIjH2Ma3BApDt+C+lqQAJJtBq9fSTZiBbH75WbH3sfrs1C5U33a1ywb/
 r7WtTXeIru440nq+RXgnHTaJ703mQFFrIs5kbnW0l2VQoaHRd9vbwPTGDB4NlCU9MWgJ
 7WZiviY/OOwqJtLLCpnJDu3920irnt/gxlPbVHA+VbE+sW2jov9Y7O9matiteukkf2Xz
 DfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rIOJjATpEMHFPGOgLu8pe/TRItvjeVhlcoYx8wAMN84=;
 b=JLn6xF4VOBK7zhq9m54vSz5SIqhzJ1KuJOb5gAMXRQ4aQ71PrvWSsSDNojmpWw4tlC
 dLl9EVy7s0K0XjkOb+z6dh6uGWmZpkiRvOW5MPiOtY/iAwCe7V1kjXRXQ1dWyzXb62sI
 HKJA+tlQn1NBi8WP5JzhJaupyuZh/Ff7cHWi5FOqBL05Wb13mCyCxp/kvtErkKFnBTJx
 49k2zazYddyHS8HJvp1NDVwEn+TwAxrz7KX5rMdc6aw+BepyKZdL5hghs9JMqyAypsiN
 fCxxKUNMHY69sq/rUEvm8mYw40/fE9FZpVcrOT85tk0iaiz4DIN6YMROWq25zXfLWtQl
 mYaA==
X-Gm-Message-State: AOAM532KED0h5hf+4Msjy9MvxW1YQ6hR3AMbNi1URHY7hLUznwxJ94bp
 XTCLocA6GfaMDu/EmJEWryLptQ==
X-Google-Smtp-Source: ABdhPJzUDJwgr9sAyNSb0rrU48h2vRsS2N/oQkgIvAsxGkOSBuhOw29noPVZUGpwW9EVXHyFeJjd6A==
X-Received: by 2002:adf:ecce:: with SMTP id s14mr38654023wro.98.1637595332693; 
 Mon, 22 Nov 2021 07:35:32 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id b14sm11639803wrd.24.2021.11.22.07.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 07:35:32 -0800 (PST)
Subject: Re: [PULL 0/8] Fixes 20211122 patches
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20211122124015.909318-1-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9633afea-4224-cb56-a2e1-b57e84fedfa3@linaro.org>
Date: Mon, 22 Nov 2021 16:35:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211122124015.909318-1-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/22/21 1:40 PM, Gerd Hoffmann wrote:
> The following changes since commit c5fbdd60cf1fb52f01bdfe342b6fa65d5343e1b1:
> 
>    Merge tag 'qemu-sparc-20211121' of git://github.com/mcayland/qemu into staging (2021-11-21 14:12:25 +0100)
> 
> are available in the Git repository at:
> 
>    git://git.kraxel.org/qemu tags/fixes-20211122-pull-request
> 
> for you to fetch changes up to b9e5628ca5d42994cc6f82752d9bf0bc98f51f64:
> 
>    microvm: check g_file_set_contents() return value (2021-11-22 11:14:28 +0100)
> 
> ----------------------------------------------------------------
> fixes for 6.2: microvm, ui, modules.
> 
> ----------------------------------------------------------------
> 
> Alexander Orzechowski (2):
>    ui: fix incorrect scaling on highdpi with gtk/opengl
>    ui: fix incorrect pointer position on highdpi with gtk
> 
> Dongwon Kim (1):
>    ui/gtk: graphic_hw_gl_flushed after closing dmabuf->fence_fd
> 
> Gerd Hoffmann (2):
>    microvm: add missing g_free() call
>    microvm: check g_file_set_contents() return value
> 
> Laurent Vivier (1):
>    migration: fix dump-vmstate with modules
> 
> Philippe Mathieu-Daudé (1):
>    hw/i386/microvm: Reduce annoying debug message in dt_setup_microvm()
> 
> Vladimir Sementsov-Ogievskiy (1):
>    ui/vnc-clipboard: fix adding notifier twice
> 
>   hw/i386/microvm-dt.c | 11 +++++++++--
>   softmmu/vl.c         |  1 +
>   ui/gtk-gl-area.c     |  7 ++++---
>   ui/gtk.c             | 17 ++++++++++-------
>   ui/vnc-clipboard.c   | 10 ++++++----
>   5 files changed, 30 insertions(+), 16 deletions(-)

Applied, thanks.

r~


