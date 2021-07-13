Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A2C3C749A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:33:43 +0200 (CEST)
Received: from localhost ([::1]:32992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LLq-00026a-4s
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3LDp-0001Bs-Ji; Tue, 13 Jul 2021 12:25:25 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3LDo-0002A7-48; Tue, 13 Jul 2021 12:25:25 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso2036221wmh.4; 
 Tue, 13 Jul 2021 09:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FKcvy4P506OZELcLSPYwYcapLEA3QqyPpE/yLcD855U=;
 b=rpHoJcqExOQQ0yM47tZM1RcHVhrLpNgevEXnTNSMxAdbwAzQglBXHCfe9zZv41tpY8
 V+PLv+p5vX4lc9uhDTOBzksTSGPdaLqKvipey7OZcwJ3gd2bXAHU4hqjxf/baA0fFg+2
 QNVm/I1XZJSRQ4NnKXC78heW8daHE6xV6Oxh2yrgXIotGQD4zlxOwcbomJcQQEJskq4R
 jcOAd7CWaweASF17J66N1WK3TZEN0Ej+6ETmjNXD9hrvJkS6ReAbGJRIxeHKcpVtjvAJ
 N7qnJeMYoB4uPYlm4VKTUkGxGpMcFPmWQpdaO9w95AJNoJbSSsPERdRvWpBsKk50uUis
 o2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FKcvy4P506OZELcLSPYwYcapLEA3QqyPpE/yLcD855U=;
 b=psjMo8ugek/McCHP5Con0DKdq+RMST0/i+HK+hwjhezzfYk83pqVtvHVQMM0dxqDOS
 OSje9cycXlgf1a9QKKhgCe0O7nPVMbUPrVhcPx4HPjCBU6fEbkFez0s+k0oCIWJ4Lgah
 Rz94YmVe+8UQWlQbMAzOzSl+6tCH5ZYmq6Z8NB+fkUcZ7Nzbfd8XSgqj/ocubzSYX68n
 UCro6YFGjCo1TlshPU3yQwV5ahNodpmqVDpZ8ujXwCM/JHmUBNgSCwK8KkWrEN+bm5pI
 8wjY5UicQ1A1oehyQV+ELKt0MFjR2R+5aHgd40IGKFhoqcD0MFbFHBA8uzSCXzfwICSQ
 GMxQ==
X-Gm-Message-State: AOAM530F+LmWQUILWvK8ss04trLkgVSdhpjr2f+TZX4OJtxasSzpJKac
 Esp9LVuV1rGwtJqpuQBtOJI=
X-Google-Smtp-Source: ABdhPJyKTLCWk9miIyRQ4rqAxhSBhu+9dVVRZ7y5Jppf9RU2E7QQcxkhtPDnFFXgt4xBuvMfq01fWg==
X-Received: by 2002:a05:600c:1c0d:: with SMTP id
 j13mr6141816wms.34.1626193522318; 
 Tue, 13 Jul 2021 09:25:22 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id l14sm12644117wrs.22.2021.07.13.09.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 09:25:20 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] docs: Add skeletal documentation of cubieboard
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713142226.19155-1-peter.maydell@linaro.org>
 <20210713142226.19155-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <65ba54f9-7e22-f323-0488-185e8c990bb3@amsat.org>
Date: Tue, 13 Jul 2021 18:25:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713142226.19155-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.368,
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 4:22 PM, Peter Maydell wrote:
> Add skeletal documentation of the cubieboard machine.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/cubieboard.rst | 16 ++++++++++++++++
>  docs/system/target-arm.rst     |  1 +
>  MAINTAINERS                    |  1 +
>  3 files changed, 18 insertions(+)
>  create mode 100644 docs/system/arm/cubieboard.rst

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

