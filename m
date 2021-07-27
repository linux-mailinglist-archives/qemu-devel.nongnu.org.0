Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAA13D70B7
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 10:00:01 +0200 (CEST)
Received: from localhost ([::1]:45092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8I0O-0007YV-43
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 04:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8HzE-00068w-R1; Tue, 27 Jul 2021 03:58:48 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8HzD-0004xj-0i; Tue, 27 Jul 2021 03:58:48 -0400
Received: by mail-wr1-x434.google.com with SMTP id n12so10496353wrr.2;
 Tue, 27 Jul 2021 00:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pcGQcsOuZ63wQGlY1T+3O6zZX9xUXUec1/ZkOP1Cc4c=;
 b=LEodrKNeQ6Yk0mzvcG15Q+V3/7IWtsPD8WlB+zetHkdoBtySND3jDQCFEW9F+JZ6Cn
 niY29b8i+V+xsDqEArEkCYt6QJZXo5A+94s8Uvwhcl72B/CXtzyqGWlMzlgLJWZ9+z1G
 8HayqVEQ8o6D9K8EBa1ErzTZ+sPra1CJAIhu1VgO7QGm/Gy75nhXBmEZdsp2FRzLzMVw
 ewjpedWzcqxJ+7G8VQiJUsmKEu8h9SXpkJqQJGqaKyQF9ukOO5G7oQ7HOj+1K6jBtS++
 QfVEjgQYfGFlIceGvse+1xRjxSJwT04sSbHMsmUhSQTGa1I50lFwiTFtg3bG/jzGwidv
 cxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pcGQcsOuZ63wQGlY1T+3O6zZX9xUXUec1/ZkOP1Cc4c=;
 b=LJa2SFRVwnUYHFMwblDBEcuIl08ii9eQkEWqCbUWom/GvzjwzoUARYSHbT+ECvLH/P
 BAWK3w3BC8VwPLNXl7Cm/ar9Pr+/zVBahzRWANtCjjLX1eOD3kkVryTNtMi9cn1VMX5b
 P4TC4VllwTZqDR9Vty3V1ZebpeGeT7vM8DazONbyAnN62RKWkj09mAUkPy03jZuevSYx
 KXT35RfjyLj+fyXwAPNAm4MWyoju+4qlQs6McRnNpOzo7SrjPwZBSVFR+QXsfIYUaNfP
 bju1doCwKSXYpUwWJu/CUWY4sBRUstQcM5SezOujtIww4eNtH+8ucWvS9AY1s0nViFY1
 JCdw==
X-Gm-Message-State: AOAM531BTidQf3GABSx7K/AwfdErGMbwa+qErfEtVK6IltyZ3KR1G06y
 /3OjUpQVsKom/bi3+BUx0k4=
X-Google-Smtp-Source: ABdhPJzCQ/F4KEmatXxXBCKDLqauR6ZJAUQEub2Q7i5jwoP1xJuW/zpx+CKZrPBXrDISfNWgE8xmpw==
X-Received: by 2002:adf:ce06:: with SMTP id p6mr3533206wrn.171.1627372724757; 
 Tue, 27 Jul 2021 00:58:44 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id s14sm2113717wmc.25.2021.07.27.00.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 00:58:44 -0700 (PDT)
Subject: Re: [PATCH for-6.1] hw/arm/boot: Report error if there is no fw_cfg
 device in the machine
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210726163351.32086-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cec3d7be-88ba-e3fd-5554-9369afdbc60f@amsat.org>
Date: Tue, 27 Jul 2021 09:58:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726163351.32086-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.438,
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
Cc: Leif Lindholm <leif@nuviainc.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/21 6:33 PM, Peter Maydell wrote:
> If the user provides both a BIOS/firmware image and also a guest
> kernel filename, arm_setup_firmware_boot() will pass the
> kernel image to the firmware via the fw_cfg device. However we
> weren't checking whether there really was a fw_cfg device present,
> and if there wasn't we would crash.
> 
> This crash can be provoked with a command line such as
>  qemu-system-aarch64 -M raspi3 -kernel /dev/null -bios /dev/null -display none
> 
> It is currently only possible on the raspi3 machine, because unless
> the machine sets info->firmware_loaded we won't call
> arm_setup_firmware_boot(), and the only machines which set that are:
>  * virt (has a fw-cfg device)
>  * sbsa-ref (checks itself for kernel_filename && firmware_loaded)
>  * raspi3 (crashes)
> 
> But this is an unfortunate beartrap to leave for future machine
> model implementors, so we should handle this situation in boot.c.
> 
> Check in arm_setup_firmware_boot() whether the fw-cfg device exists
> before trying to load files into it, and if it doesn't exist then
> exit with a hopefully helpful error message.
> 
> Because we now handle this check in a machine-agnostic way, we
> can remove the check from sbsa-ref.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/503
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I didn't reuse exactly the same wording sbsa-ref used to have,
> because the bit about loading an OS from hard disk might not
> apply to all machine types.
> ---
>  hw/arm/boot.c     | 9 +++++++++
>  hw/arm/sbsa-ref.c | 7 -------
>  2 files changed, 9 insertions(+), 7 deletions(-)

Thanks for fixing this.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

