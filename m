Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF7066E38E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:28:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHonv-0003Im-46; Tue, 17 Jan 2023 11:27:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHont-0003I9-Lu
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:27:17 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHonr-00064H-Vi
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:27:17 -0500
Received: by mail-wr1-x430.google.com with SMTP id b7so5177030wrt.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QQJitedrxBjgj8+3X+4dMvB9EsIoL8cmqYpeTc+YvNI=;
 b=dGuMI0teO9SjtxrmqYNzwhyibhvcrSV355LhxLg3gRC7Pqvoxb6vrMsRF95xdvGmD8
 WiphmgWQO7RYqFVer7e+1VzReVnOVurLyly+RPjIhZCdVVFhz2hKuzbW1kY3AWDZgkxe
 oCeBxa0XS/5fP/uF5e2oD9IflNkj4BDPOE2X+cFL6fIwz3Bzt90nMmfl6etXipGmqSuf
 dAVOITLNROvZOICT0g0Sp4Ns8eMHzyiB/v5p5GjtfDuM49WUSXVLQav4N2TIBZsSEHkU
 /7FCiCjTkNJ7KkXJMaCGaRsJrJLKSMWC4o7FaCbhRwdbqdChklxyYaIY8K8m4XmhnMp7
 Sfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QQJitedrxBjgj8+3X+4dMvB9EsIoL8cmqYpeTc+YvNI=;
 b=RqUPCnpYhOiiEZ2qd5j4mb+Uj17QEG45Hi6yt4vGkocsXC21PM9sld0pGhUl1LF4H5
 eCXEDY11+FpJuswF4q81I9EyFDvUOePoT8nttPlY6OHM8oRtAIv7TpXmejU7zt+CJyzk
 P6Vmn6/In6EY1eoqssGvhRfIo02FA82ivSVb76R9s5PyHjRCMzKK2HUXufCzcHwOFe24
 NdiQZqiuXqs36gQJzgQy+NXOfqx55SoJY1ie9ZheYJ6fLvHK6MLp4eutxpHh4Kdm9+ya
 w1dK0gdY40zC7r2doZXXqWtD4F4WEd0mTYevMriAbSNX8NZpAeHnBynmEauRYbzcHuHt
 Fe7w==
X-Gm-Message-State: AFqh2kouC2FqjYznQUcfDsD9wfYK38X6wxw/7MnnLGPLJK4n3ndwaKu0
 ivAF8clpufjpjxpoOPQr0wyJfA==
X-Google-Smtp-Source: AMrXdXvE4M+3jOxN8x4zN9SkDxZlOUcNnx3nJsLUnp/YX5H5zyGFwHC1JVjkAK8NYh1zHpnxdPmfvw==
X-Received: by 2002:a5d:6e91:0:b0:2be:1ea0:f794 with SMTP id
 k17-20020a5d6e91000000b002be1ea0f794mr2760284wrz.52.1673972834178; 
 Tue, 17 Jan 2023 08:27:14 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b002bcaa47bf78sm19739439wrr.26.2023.01.17.08.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 08:27:13 -0800 (PST)
Message-ID: <0a3720ef-fbc4-2be8-14b6-2906117f9fe6@linaro.org>
Date: Tue, 17 Jan 2023 17:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 12/28] target/arm: Wrap arm_rebuild_hflags calls
 with tcg_enabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-13-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113140419.4013-13-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/1/23 15:04, Fabiano Rosas wrote:
> This is in preparation to moving the hflags code into its own file
> under the tcg/ directory.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
> I extracted these into a separate patch so we can discuss. If I move
> the tcg_enabled check to a header that would add overhead for all the
> calls where we know for sure that the code is running with TCG. And I
> don't think we want a new arm_rebuild_hflags_foo to be used for common
> code.
> ---
>   hw/arm/boot.c             |  6 +++++-
>   hw/intc/armv7m_nvic.c     | 20 +++++++++++++-------
>   target/arm/arm-powerctl.c |  7 +++++--
>   target/arm/cpregs.c       |  2 +-
>   target/arm/cpu.c          |  3 ++-
>   target/arm/helper.c       | 16 ++++++++++++----
>   target/arm/machine.c      |  5 ++++-
>   7 files changed, 42 insertions(+), 17 deletions(-)

Shouldn't we also restrict arm_rebuild_hflags() to CONFIG_TCG in
target/arm/cpu.h (to be sure future code using this helper stays
TCG-only)?

