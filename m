Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5707329FDDF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 07:34:39 +0100 (CET)
Received: from localhost ([::1]:33164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYNzi-0002TN-DR
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 02:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kYNwb-0001Oy-3p; Fri, 30 Oct 2020 02:31:25 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kYNwX-0008Jk-Sy; Fri, 30 Oct 2020 02:31:24 -0400
Received: by mail-wm1-x344.google.com with SMTP id k18so1885243wmj.5;
 Thu, 29 Oct 2020 23:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d76qfocKGVsgP0PIUkx3+yF75XwShh6daiXMS86/AoI=;
 b=mIy7s8XdF3u4GX02sYB9UvTCSprvEz2QNKHmJU5J0I/sLXDrY3HEq76TDM5uOyLHdD
 tIRwQ8xd3N483Sjz+3MrfxJf/3LytomMIJEzy0jdZhxqPMlwcfLUe6DunOJMoDTdplsv
 b3xeDNibTlqcDjFxakvblCEPM3+Q6Qz8DyB6pd5AgJ18U2ajr8xReb6VrCryw/gYfVMn
 Mi7KLZv7M43X9yGi+P62ZAXTfqy9PfDkL7R1YG3wUBHK5HCg9sNVNUvQA0JUS08vGVvZ
 yd4De9ZkFGWfEC+Y+ryQBWUJbIC/5E7H81Xnf/x9yEECLAtzpfk4K45F1ExjAUXuW3z0
 ZGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d76qfocKGVsgP0PIUkx3+yF75XwShh6daiXMS86/AoI=;
 b=Mj3UUze/2TEXKAk9wPOHfDjyehfETWn4PF9OoaYIbdZjHI93l45gtHPIwSmGLHk0zD
 Tz2R/DHYYRx1rNGwLqBZC+SI0Oe7EYt2nysXbZ0YDQIwTIzofv4CzTKOVR3tUByLNRTP
 VCTZ+YoylQv5uJ93TEMapBse3Ga7oEqSavTWfqeBHa6EihU+lciXRSJ+YZf5w/fD3bRD
 SNaIgU9TK+IkIom5c2ilMvdYYgOOjXt6oA2U0s6pEFYd4J0NAkOWqQMrtrEBTcg2r3Ol
 ipHz0HjKll62YtT8MYbbWEUsEeXaYXLCNxNgwdkQRFk7Q+qukOrklum3YCgnCXY1ffKJ
 7yhQ==
X-Gm-Message-State: AOAM532+oNhza/It+Z3zCcK2iGK4JTlf/2FVe5O33+0bpACIPwaXNVhw
 9ZSiI/QRcxjW/GNEp/rdLEw=
X-Google-Smtp-Source: ABdhPJypBwRIrlhnQG/pL6e/I4V1YaY5SxOPVl4h116kjuaQhXTdEEb6FYcCcm0n5P0k3i3sFn3G0w==
X-Received: by 2002:a7b:cd87:: with SMTP id y7mr625992wmj.166.1604039478468;
 Thu, 29 Oct 2020 23:31:18 -0700 (PDT)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id l26sm3454542wmi.39.2020.10.29.23.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 23:31:17 -0700 (PDT)
Subject: Re: [PATCH v2 3/8] accel/tcg/user-exec: silence the compiler warnings
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201030004046.2191790-1-kuhn.chenqun@huawei.com>
 <20201030004046.2191790-4-kuhn.chenqun@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b53ecf77-11c7-f8a7-2b31-7295904bb621@amsat.org>
Date: Fri, 30 Oct 2020 07:31:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201030004046.2191790-4-kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.261,
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
Cc: Thomas Huth <thuth@redhat.com>, zhang.zhanghailiang@huawei.com,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/30/20 1:40 AM, Chen Qun wrote:
> When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
> ../accel/tcg/user-exec.c: In function ‘handle_cpu_signal’:
> ../accel/tcg/user-exec.c:169:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
>   169 |             cpu_exit_tb_from_sighandler(cpu, old_set);
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../accel/tcg/user-exec.c:172:9: note: here
>   172 |         default:
> 
> Mark the cpu_exit_tb_from_sighandler() function with QEMU_NORETURN to fix it.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> v1->v2: Add QEMU_NORETURN to cpu_exit_tb_from_sighandler() function
> to avoid the compiler warnings(Base on Thomas's and Richard's comments).

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


