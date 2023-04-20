Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19DE6E8D70
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:03:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQC1-0004DG-Ea; Thu, 20 Apr 2023 05:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQBz-0004AV-O2
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:03:03 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQBy-0001EY-4H
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:03:03 -0400
Received: by mail-wm1-x331.google.com with SMTP id v10so866349wmn.5
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681981380; x=1684573380;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aExb1FLqCLALw5bDORM5md6n30OXaviv71tmZpkNaX8=;
 b=m8Of3LiqLT/NJeaGsTvL68sZpB+vvJgWBZkRUJJZMqn++OtjRPFqlNluy8IVkEqYEf
 cxrH86sIpQCXo2Yj7V/V+9TAqmtr/iHcqPElbIM3yI8dTCcjkUktq6zUFGWRbAPwDzZg
 z35MKdJD/x3xbYE43knOoL+IneJ5PcNvpL8QugkacL79+msQKSeLpIKKvGeYr2i60qAX
 fZUKNxFzrJRsUs1A5/JAHw5h3zpy62Gy6RMsvRCEWMhFNw4SOPDgEQOBZA6gJ7lA8ggZ
 C9pfdObhPvemjjt2kIwPHEPVeQMWj/IAAfenswcOoYzp2IN1adjTnadHIO5I+ehyg9sL
 WeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681981380; x=1684573380;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aExb1FLqCLALw5bDORM5md6n30OXaviv71tmZpkNaX8=;
 b=ZXf5XppAeY96jrkV15/LLnEI4OH9tUXrKz3cYQI6cFIMSCrXNbyOC3Hv3zyNVBRcMy
 Rf/x46FcwiUJWDfNQkEQuf+QRKa0sVH7lB7UU4ZMh24ylqMiXavJgDCvDXs7sZ07FHWT
 xQldeILpACF1cgbBzdN7o5FSwFTTiKrHq9uat5UxCX2p3OvfWkFNA0eBhG/D5k7uDc/d
 xdu9nVanjT5JWnsXQZIJq4mX7UjWoVrSIiB+LiFfy80PlEjbwOh84luRcUXOBb5RNmhr
 RomlpyBGLMj+5en4IuA7hOd7ukzkVDjA/nflzQ4voDcLMV7LW+dI2rPJiOSK60qbTlaA
 W89Q==
X-Gm-Message-State: AAQBX9e5T7boV4AYnTPc/E3HD+eteFLoi7zOLCR5KLtNQM0+CrR6Hhfm
 5f7mo2NAmeDexol9OW3DeosR/w==
X-Google-Smtp-Source: AKy350bXpMO0/W8kpkL2EZJ1CRwDbdVG3jELmWpD8RIzXcqkqluyL1JvJaZgOuONYFKQYSowePYgbw==
X-Received: by 2002:a05:600c:2257:b0:3ef:561d:255d with SMTP id
 a23-20020a05600c225700b003ef561d255dmr616786wmm.41.1681981380289; 
 Thu, 20 Apr 2023 02:03:00 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ay37-20020a05600c1e2500b003f18b52c73asm1138594wmb.24.2023.04.20.02.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 02:02:59 -0700 (PDT)
Message-ID: <46d64a04-53ab-b10f-e8e8-ec0f46c8886d@linaro.org>
Date: Thu, 20 Apr 2023 11:02:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 07/10] accel/tcg: Report one-insn-per-tb in 'info jit', 
 not 'info status'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Fabiano Rosas <farosas@suse.de>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <20230417164041.684562-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230417164041.684562-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
> Currently we report whether the TCG accelerator is in
> 'one-insn-per-tb' mode in the 'info status' output.  This is a pretty
> minor piece of TCG specific information, and we want to deprecate the
> 'singlestep' field of the associated QMP command.  Move the
> 'one-insn-per-tb' reporting to 'info jit'.
> 
> We don't need a deprecate-and-drop period for this because the
> HMP interface has no stability guarantees.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The new 'accelerator settings' subsection of the output
> currently only has one item, but it would be a place to put
> other stuff, eg if we wanted to mention whether split-wx is
> enabled.

Ideally we should have a AccelClass::qmp_query_info() handler
optionally implemented by accelerators, and a single HMP 'info accel'
which convert the QMP handler result to human text.

This is a start :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> ---
>   accel/tcg/monitor.c         | 14 ++++++++++++++
>   softmmu/runstate-hmp-cmds.c |  5 ++---
>   2 files changed, 16 insertions(+), 3 deletions(-)

