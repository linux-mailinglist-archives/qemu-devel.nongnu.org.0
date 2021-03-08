Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F7A331A01
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 23:10:15 +0100 (CET)
Received: from localhost ([::1]:42870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJO4s-0006UR-IH
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 17:10:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJO3o-00064U-Ih
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 17:09:08 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:44951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJO3n-0002qu-2M
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 17:09:08 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so4738131wmi.3
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 14:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nLmWiSlQUJsgq9QeI/hne2aTLOGGDliDzyj97+ybhZQ=;
 b=Gs2cMZnZ6h0FHsK7/77xuqIc8D6Y5gZ5MfVmX6xvVmuxn5sATIj6SqLfP6a3sOGllo
 Mr5LVE1EWCe/zBG90BnfP21W3/jHQqVmYn6BqC9j5ZIPEWqY80D0W0PI01x1lOUY4P8j
 WxWc9sDa7FNt0mr2hRxi8io+xZDUJxUMPQFtp5UfkowDuUWCnEe97UYyvwnfh62D2MhV
 /uZvQj17JAMAhBFc1HOs8Tj0R3IjxrWB7pguDrCKNmCsFI2CGQwfNxBl8YgTKSSjje8k
 fRlhnAHHRbb2cTRhg2HKMeMpDfTKzNBXhkOlQCKXlhskpwjOq3FMrbrW0zS/1PrM7xqS
 Cztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nLmWiSlQUJsgq9QeI/hne2aTLOGGDliDzyj97+ybhZQ=;
 b=eXnDdetSMiyiPYLt8YCYu5ps8RGrSTOl9DH7Ez8vPj7HgpQ5YmpLYo0myIP+XK1T5m
 PD91AzrceG+N3J8Pci/GsrugSDZ1iBL806jrvjzWAMZF+xcMXGMyHDioYSHcpvFqizvp
 NecQJKqwNb+nascgLGXPBhjUTOjKJZf7XW+g476JgYezVwIYtPnYg0ktTctfzBS25N62
 6XCkRQSyUzLREOywvDvhmSn1vXHFnPK1iDeqgHYgwRu/As8TmsW8s2VKXwTZetsoPlho
 cvktYXMhjKjQ7h/fSpifPt5FYmAjiRTE4cXrK+7qkNYV1cysxBG7LTO8RCo1GMipCOuo
 G7Ng==
X-Gm-Message-State: AOAM530pHFiT/SJNFTlUmnrMo50fzFSK1T63dNSuQwrcQnIIMaQlfpQH
 ge6i+LwMUYJVoUs51i5d0qg=
X-Google-Smtp-Source: ABdhPJyCME+A6QLq5LFk3OYw45ebN9xn3gSCwJwZC4MW0C71EMD1mjuP1cyOdUIGmlXbdDAk5MRcqQ==
X-Received: by 2002:a05:600c:220d:: with SMTP id
 z13mr798487wml.1.1615241345271; 
 Mon, 08 Mar 2021 14:09:05 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c35sm870346wmp.3.2021.03.08.14.09.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 14:09:04 -0800 (PST)
Subject: Re: [PATCH v6 4/5] m68k: add a system controller
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210308212501.650740-1-laurent@vivier.eu>
 <20210308212501.650740-5-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9ceeb14d-7c18-e493-4511-fbe841dcb098@amsat.org>
Date: Mon, 8 Mar 2021 23:09:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308212501.650740-5-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 10:25 PM, Laurent Vivier wrote:
> Add a system controller for the m68k-virt machine.
> This controller allows the kernel to power off or reset the machine.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  docs/specs/virt-ctlr.txt    |  26 +++++++
>  include/hw/misc/virt_ctrl.h |  22 ++++++
>  hw/misc/virt_ctrl.c         | 151 ++++++++++++++++++++++++++++++++++++
>  hw/misc/Kconfig             |   3 +
>  hw/misc/meson.build         |   3 +
>  hw/misc/trace-events        |   7 ++
>  6 files changed, 212 insertions(+)
>  create mode 100644 docs/specs/virt-ctlr.txt
>  create mode 100644 include/hw/misc/virt_ctrl.h
>  create mode 100644 hw/misc/virt_ctrl.c

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

