Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 250AD2D7A93
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:12:43 +0100 (CET)
Received: from localhost ([::1]:41724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knl2A-0003Pk-3e
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knkzE-0001gU-SF
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:09:40 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:43719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knkz3-0005cl-NE
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:09:40 -0500
Received: by mail-oi1-x241.google.com with SMTP id q25so10336369oij.10
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 08:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tGkQkh7uB9pGhQ2wxRSCb3rLd7oL56ZPft7z/PdyQ7A=;
 b=nT/4qUH9bsQ47QxK67gCeULZfKxAML4zxoyYFJnsw/rvbkA6/IEyVmE+IPacayAk3G
 H9jgfNwpIUUKpod92Erp4hnA0FEwUFqAXullBdClbAivHsA00Q9FfEujnvAdlBLUyHPu
 /Te3ZOaRucqg45l1mLofCs0tLVTwg/QCGu8j2Op3QLBLHW9tbsQbgmCA1IN9FYGxWr/w
 6VS1yaCAyI6EeFkwGcMgf7dVShYwfCPM6OHBVTwiFV70hD63nP5tL7skAFEZxkPXpM9n
 bPaQD3wUOX3iHQZPqZtsyTJ7uy0R2HB+VMUqFfhsXvmQuWUSRz6FuJQ4h21zPuVz6AEM
 9LXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tGkQkh7uB9pGhQ2wxRSCb3rLd7oL56ZPft7z/PdyQ7A=;
 b=MW4mmc0Qj4oA3D/r4XWzq+hMD48mQEF/pVbS3Ldi45cR3xiSfvOeZiVpvZBk27IEjB
 Yxu5roNM2E+FOd5WwcrXuwXZ/cTTc++SzuH/7YV/RWPpBflS1BVjF70YRNYntXsDcvsX
 nw3smoWw76lpc1TyjGyM1a2w5AOCUnn+r7Skl6c0BQumHSVNHXd9mfHaPF0GV8CDTf1A
 xl3xMz0OwRApLzgJfXZ7HADg/DYl2Oy6cshS2PTqXV1NMSYvRxm8PCJ4VnF+CXH2TZRd
 CI1mQB78FtNmGG7P4ixsAEi/bY7b6pExVGP5F5D6rxFNTgy2sXbY7vfzeKd9ao4TgI/m
 9JAA==
X-Gm-Message-State: AOAM533ogv3r7lIx39A/OKWppsgd4lm+96JbAIdMy44CT56tJUuu1dKH
 XFBvalGRyzvkj7+jKn7DJiv6Ng==
X-Google-Smtp-Source: ABdhPJyuh4IvdcKVc4hTRynmR4fgMmz7ebM4W6ZDzdES2saw6CyHp4T2zeIZGEKAFZUeZFil8zU+xw==
X-Received: by 2002:aca:474b:: with SMTP id u72mr10109746oia.114.1607702966713; 
 Fri, 11 Dec 2020 08:09:26 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id n16sm574708oop.9.2020.12.11.08.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 08:09:25 -0800 (PST)
Subject: Re: [PATCH v11 05/25] i386: move whpx accel files into whpx/
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-6-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <12625788-3428-1a29-4ac2-e20aa4e943bd@linaro.org>
Date: Fri, 11 Dec 2020 10:09:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-6-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
>  target/i386/{ => whpx}/whp-dispatch.h | 0
>  target/i386/{ => whpx}/whpx-cpus.h    | 0
>  target/i386/{ => whpx}/whpx-all.c     | 0
>  target/i386/{ => whpx}/whpx-cpus.c    | 0
>  MAINTAINERS                           | 5 +----
>  target/i386/meson.build               | 5 +----
>  target/i386/whpx/meson.build          | 4 ++++
>  7 files changed, 6 insertions(+), 8 deletions(-)
>  rename target/i386/{ => whpx}/whp-dispatch.h (100%)
>  rename target/i386/{ => whpx}/whpx-cpus.h (100%)
>  rename target/i386/{ => whpx}/whpx-all.c (100%)
>  rename target/i386/{ => whpx}/whpx-cpus.c (100%)
>  create mode 100644 target/i386/whpx/meson.build

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


