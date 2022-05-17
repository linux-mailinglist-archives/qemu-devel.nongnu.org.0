Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AA4529932
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 07:56:17 +0200 (CEST)
Received: from localhost ([::1]:43768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqqBo-0004Fd-2P
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 01:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqpyx-0006Ng-6v
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:43:08 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:55156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqpyv-0006vT-IB
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:42:54 -0400
Received: by mail-pj1-x102b.google.com with SMTP id ev18so5773541pjb.4
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 22:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=spyDrNwA1LrP19YURO+U4xuVHFRhBL7RkVsUSH+xlTc=;
 b=QEBAxOTAKUK3bHYNPVV8DLvXYdZLlIpg8d/JG+cV3UwBCRYH4GWkJ6WgiaeBwhQ7nn
 bBiAhM/6o7Zu4y1B08r45+HD9+CHfqQPYrwpsENhAAzE0c0hNQPeamSNUdxgUR56yF8A
 GwCJ4LP1onTtBSBnY69SBOAotNJ9tXi5WVXvqW42oUmyzNl/QvOX/WE1K9L1/i+1OKuO
 G+8gVqNGAp01GbgN2sfEkjvTtcfWL4wR7XzXooQE0Yt/DFS93MygwpsS6WXv8YkqmuWy
 q994cM09LHB/5HbIC4XNczeZuje2bQgqc2T+dnfNsUlCwfyc5Tyhv1QX0B1R8SQID4mR
 XBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=spyDrNwA1LrP19YURO+U4xuVHFRhBL7RkVsUSH+xlTc=;
 b=NqbB5fBAfRJJMstm15lYl0ri8VFuqq2BNi9v3Tr0UIBMHADdd1LsK5p+wThtBtJ0Nu
 IqX5G2y7vzQr4zqaMZKJ/Hhdqm84fJwgXBvv1+O5No7n0b1FkWeX8u1ENbOHpn+5z1IP
 E2Nu7jXl9OM6PMuFXfbe+aHwmAjCs1fK0U/O8iKL/7nGrOSpIc/jM0+OM85VqdOF/Zjd
 oYgtWbmVVNtxxcpcEBtPLbTeWJb1/vhsBuibC1zC6DbK2HDvdG1VfA3+Ek0mp8YcMltQ
 Hm1WAISxe7In9QAAQ34g3TmzVW5mWnnqKTrsMFLz51rtR2Mu3gF62dSBPTBUSkUWm+18
 tDBQ==
X-Gm-Message-State: AOAM532lxnMTfj9DjsSAXKGWqpxG1iLJP/v6GhX94pX+8vYxqbph8/0L
 Na1oq+hd4en0105/x+aYh/kRLg==
X-Google-Smtp-Source: ABdhPJysFgteaE6iqp9dNUHUEBFwJ3LoR0trGy4QOMcl4qxovO/g6NZFj6VnpFaomNL6Eos4UDWwXg==
X-Received: by 2002:a17:902:ea11:b0:15e:ae19:f36a with SMTP id
 s17-20020a170902ea1100b0015eae19f36amr20717796plg.52.1652766171820; 
 Mon, 16 May 2022 22:42:51 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a170902ed9200b0015eab1ad02esm7963992plj.215.2022.05.16.22.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 22:42:51 -0700 (PDT)
Message-ID: <b5d42de1-4313-3069-b552-e312fec74fbb@linaro.org>
Date: Mon, 16 May 2022 22:42:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/3] capstone: Remove the capstone submodule
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220516145823.148450-1-thuth@redhat.com>
 <20220516145823.148450-4-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220516145823.148450-4-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/16/22 07:58, Thomas Huth wrote:
> Now that we allow compiling with Capstone v3.05 again, all our supported
> build hosts should provide at least this version of the disassembler
> library, so we do not need to ship this as a submodule anymore.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   configure                     |  21 -------
>   meson.build                   | 113 ++--------------------------------
>   .gitlab-ci.d/buildtest.yml    |   4 +-
>   .gitlab-ci.d/windows.yml      |   5 +-
>   .gitmodules                   |   3 -
>   capstone                      |   1 -
>   meson_options.txt             |   3 +-
>   scripts/meson-buildoptions.sh |   5 +-
>   8 files changed, 11 insertions(+), 144 deletions(-)
>   delete mode 160000 capstone

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

