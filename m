Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8636D38F931
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 06:05:26 +0200 (CEST)
Received: from localhost ([::1]:44692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llOJp-0004FC-Km
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 00:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llOIl-0003Za-UC
 for qemu-devel@nongnu.org; Tue, 25 May 2021 00:04:20 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llOIk-0003rf-Ez
 for qemu-devel@nongnu.org; Tue, 25 May 2021 00:04:19 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j14so28826820wrq.5
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 21:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TLuGh3JH5Rm9XM8EK+J0ZquAMh/NAL8EyIQPW2DxdmI=;
 b=kq3QxWnl3dKHQzMBVQhqXBhmechnr9JZKbMLKBWBzC/ogCrQkuEgOPVR7WbmjJBkoS
 V+F/06VVYTR/cQKnx9Qf1b7d79KoH6KjSJ2oiOfo1PLqH+7Rt2jqWyBU8el9SduNKink
 xqXEkpcpX3ooo1IUGokTw3eUTlRDOtyPb+uM2eGDBK2GP8qfucS/VY8sZOTQ0exIbLMI
 9ehFCmWg4ba8Gn4nqq/rM0W7BpIFUBUGVgZpPYQwDxff1zwMDueBzSyN0cw3ucu+9LYE
 c37spzW0ZvU0F6wSuAUdT/90HnqSIhGPvbYLzuyG0nLOPffDg6rF4c+W4Y91vLnzC28L
 Cqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TLuGh3JH5Rm9XM8EK+J0ZquAMh/NAL8EyIQPW2DxdmI=;
 b=ryAVNnAvedT9uH+/h+toq+cVAellJ6irS8GHIN4Um2POD/kRCPljq4AD4Wjm9aHtb4
 b6whIWkMs1EpIusPAoCzym2NBKiyTtFRJ/j3YXj/7c/JGFxzAnNfRUaSBOjZ2M4FM9/P
 H0tGVW6/leGEtDNBclYS6uGK6NmjgG8nBiQomjTAOndkbzjblBAcgUs87qXbk3Hmc2pV
 RwFH4f3PLOWZOFBd7oL/sLJl2SETyGSLDlF9mRcSnRVw/Gz+6NaStsw1eyK65ySN9jbL
 OAhPA0lN9qrSQJtsvSy+LXlytkwY7yEqrlgfLuoLek25w8LwZgjjD5hWdiC0lSdRZTC5
 GAuA==
X-Gm-Message-State: AOAM5305p9PIOid1NE1Of9YH7npxB0XZGUgkZIpd96z07zOFUIDkRwjB
 6pdUhbIJJVDfxfTkq3OgfC8=
X-Google-Smtp-Source: ABdhPJxFMpmHSeYLJmbrgkyIyGvKR/Isr8sad6cKCJlR20EB1P2Ci7Z0k/glSJkYF8B6wkJ5fcduZA==
X-Received: by 2002:adf:f142:: with SMTP id y2mr24492992wro.426.1621915456851; 
 Mon, 24 May 2021 21:04:16 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id i1sm14286876wrp.51.2021.05.24.21.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 21:04:16 -0700 (PDT)
Subject: Re: [PATCH v1 2/8] gitlab: explicitly reference the upstream registry
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210520174303.12310-1-alex.bennee@linaro.org>
 <20210520174303.12310-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3e1dc275-c320-5777-27aa-9bdd1baf4e78@amsat.org>
Date: Tue, 25 May 2021 06:04:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210520174303.12310-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 7:42 PM, Alex Bennée wrote:
> Since c8e6793903 ("containers.yml: build with docker.py tooling") we
> don't need to manually pull stuff from the upstream repository. Just
> set the -r field to explicitly use that rather than the current
> registry.

Yay!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/containers.yml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

