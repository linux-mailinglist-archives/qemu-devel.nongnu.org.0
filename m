Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283806E8D58
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 10:56:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQ42-0008VY-BM; Thu, 20 Apr 2023 04:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQ40-0008VC-HX
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:54:48 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQ3z-0006sO-2Z
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:54:48 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 n43-20020a05600c502b00b003f17466a9c1so2700227wmr.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 01:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681980884; x=1684572884;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JL+MWElERGl9W4XMn5Z9lqWwW2Y/kZDip+Vuu4nCnpw=;
 b=Emi91P19DgY4FnrezRPcM8eeaN3wY2hSOcvbtocNSIz1igPc+GVOpiMNYyRtCtf2ih
 jHG0rkgHR9SaNA0N/+hKvINBI3pezMi+2fyhoEwA45/JUsiynZxAQ6i40IfLYvpa9ZN0
 vidWP2hqKTSnpg5ZQ4swxVO63jvfst6t7J5lt3R1pJFSbVAK1D6cjA4gEpkTCSoomzEl
 B3REnDbiRpmXkBwl5MCotnmaMLNb5pJ7dgr9pKBMTBUrPTVZQCbyLVgaCdany+sgcMq+
 riW5bPdhImZQu7WK/6c6ExASqLDjEDiclxFP6M6AaX1quOA7aXmnaTUG1uqXkIWHex6b
 mhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681980884; x=1684572884;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JL+MWElERGl9W4XMn5Z9lqWwW2Y/kZDip+Vuu4nCnpw=;
 b=ivKWHf9dV0j2SPOw665kboaj1jnBnI0xBQEXspktZ0wnYQzMc2dNnyMO/YiQZqfbE3
 8ztev+zaFMHizZXmHQMQ51C3lZtTj8KlTMNfAVTXBrWPy41v8SY4qnYxj8AvzsdXPlI6
 jzkb5maMJDKO83R7NG1FfplqiPlC9is028xX94wrmdtVyf6dpCXT1824FLyEfsmky1d9
 kHFjfEpivM1e15Ia6Vj8x1/xBjAqA4hW8Mc7voh169Ihslqr0jU0pfj+mYwrui5D4Wz6
 oA98weFXTtDSsHPnjgxhTeREybdTHpKvokRATHPrrJfLo6RGcOoVK5jOawWwSaXg8GDj
 4vmg==
X-Gm-Message-State: AAQBX9c21JmaGLCPodqgwfVg07K/sN8WFMsoTWUmbtlRexS37oGLLFLz
 iiJYAxQbgNJY3gcGBzy1j/jOYw==
X-Google-Smtp-Source: AKy350YQQrINyIhv+xwaprUtvPZ/sFdZTA6g/gz9oc4cwFodXh57ol429S9InRYbcKl+UUv/fg6mNA==
X-Received: by 2002:a05:600c:253:b0:3f0:b1c5:8d30 with SMTP id
 19-20020a05600c025300b003f0b1c58d30mr699591wmj.6.1681980884521; 
 Thu, 20 Apr 2023 01:54:44 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o22-20020a1c7516000000b003f18372d540sm1363244wmc.14.2023.04.20.01.54.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 01:54:44 -0700 (PDT)
Message-ID: <38b2436e-3ad1-f770-c742-915a1d513539@linaro.org>
Date: Thu, 20 Apr 2023 10:54:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 02/10] softmmu: Don't use 'singlestep' global in QMP
 and HMP commands
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <20230417164041.684562-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230417164041.684562-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/4/23 18:40, Peter Maydell wrote:
> The HMP 'singlestep' command, the QMP 'query-status' command and the
> HMP 'info status' command (which is just wrapping the QMP command
> implementation) look at the 'singlestep' global variable. Make them
> access the new TCG accelerator 'one-insn-per-tb' property instead.
> 
> This leaves the HMP and QMP command/field names and output strings
> unchanged; we will clean that up later.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   softmmu/runstate-hmp-cmds.c | 18 ++++++++++++++++--
>   softmmu/runstate.c          | 10 +++++++++-
>   2 files changed, 25 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


