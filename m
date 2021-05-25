Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE14038F915
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 05:57:52 +0200 (CEST)
Received: from localhost ([::1]:37218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llOCV-0007Qv-RL
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 23:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llOAc-00051O-78
 for qemu-devel@nongnu.org; Mon, 24 May 2021 23:55:54 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llOAa-0005vF-JG
 for qemu-devel@nongnu.org; Mon, 24 May 2021 23:55:53 -0400
Received: by mail-wr1-x431.google.com with SMTP id y14so28491813wrm.13
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 20:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T88GRO/WnkutLqqcTaq8IeG8muDfzTb2k9rTChgVbXQ=;
 b=R/AmcbdzRdNTgYl+QsqEVo+stuJJsDz7pJ+/67Q44iiZ57VdWAoBwIDfV2JSKAdp/5
 fT6Crz0GsOH4vHfJ+X25j76zQda2xJRDl3tTu+JzTyxBIKlrXJeg3Z9Ejso5Ys1Us1Bq
 /CIi/iKPrd1lprxAgtrg5dICMV0tf3+vrl3nkdHJtbnq4nCZ1oca39Jz/5der0ffipzB
 dGxoi8B+/W5CEekSeX5S5aSkrv1GwpQ83Ah2lW9qEwmB4z0NGWj+CyZqn6q6VhqA9DW9
 Er4mExeuIvCqrhmO12IWHl6zSZTZr+B8U975l3dfKeEbeyCTEhcdr8QbsZLRzA4uWhO5
 dm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T88GRO/WnkutLqqcTaq8IeG8muDfzTb2k9rTChgVbXQ=;
 b=YK73wmDoW9N75SEIsmHNBjmo/SDuaO94mMCNaociZYLrbmkgXptq551DQSglr5AH/i
 rB0B03+J1t8OiYENasW2PFBX0ZPNrKFEdh2IHiALfWIxxOEPUVQwVERucTn12sgxSkg2
 m5sFrQRxuWrZGNfU8sOCp8QMDuiIELxEwp5+2lAmOeX1SbENbfHR5h3Je18hUwcIQ9d0
 K7il43hF/RlQ+9YUlO2dzqWKNAA+wUNq/qZXBmBqq4iJ6G/usXbKpxz5V9diJ5RDof68
 Njxb4LhXH5tg3T+eOs7PZXeiI6LIl/uhen/DESaf0fqGmRO1T2VnuaS3pNLno1NC76c6
 Kwig==
X-Gm-Message-State: AOAM533iLr8wgjsvs3musAf1uZU8muEDe2ozK5BMSTKmU+O3CnmiSC29
 9I/pcjPlaaYQoAIbLI6cVDE=
X-Google-Smtp-Source: ABdhPJzk4s50dJw43Jr7MOZfPeZpAta2ya53VBB1TAAB7ljVHD0kOrop2n6WhVYjMEIGbqe0GFt1fA==
X-Received: by 2002:a5d:53c4:: with SMTP id a4mr25029012wrw.195.1621914951188; 
 Mon, 24 May 2021 20:55:51 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id a11sm14333230wrx.38.2021.05.24.20.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 20:55:50 -0700 (PDT)
Subject: Re: [PATCH v1 6/8] hmp-commands: expand type of icount to "l" in
 replay commands
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210520174303.12310-1-alex.bennee@linaro.org>
 <20210520174303.12310-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4524111e-ef5e-8e52-51fe-2b78df397c3e@amsat.org>
Date: Tue, 25 May 2021 05:55:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210520174303.12310-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: fam@euphon.net, berrange@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 7:43 PM, Alex Bennée wrote:
> This is not a 32 bit number, it can (and most likely will) be quite a
> big one.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  hmp-commands.hx | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

