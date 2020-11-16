Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1AC2B44D3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:37:11 +0100 (CET)
Received: from localhost ([::1]:48480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keegw-00038B-Qp
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:37:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1keegB-0002an-IN
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:36:23 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1keeg8-0003LI-Qw
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:36:23 -0500
Received: by mail-wr1-x444.google.com with SMTP id o15so18716171wru.6
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 05:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=1ubJJlH9rfte8+pUGPT5fJGB+P3KWcyR5Xhz7Eq0wQo=;
 b=Qv/uxgQslJmb+ZD0djxrBv7NMeR7zBpwB4PiRJ0EsU4uezvQvoEUzEkTqgdHxPdSUh
 WOdNbDTegPp6bHxTto+eSsWmCEEH3cX1BgG3TKcqWOQnkAY2m9ZRElaBXZT68aTpcf7b
 YG+bfuPWracV54yEZFctS0I0jBwm4M3+wiRykqioSDvASsi4goGwFFG4yVdAEdVwcBJn
 cwLIr91sp/x+pGnzHnQmwrSJgZMaqVe+5+ZgfkqmuP3E1qMoUV1uRbo9p3ODQr0kZeHO
 /czwXPHetorwxXBMlNIzg+kd6I+igJhJ4v/qqHvaI+jrUnFfv5snW/ZO4D7kVAphJsIv
 /Edg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=1ubJJlH9rfte8+pUGPT5fJGB+P3KWcyR5Xhz7Eq0wQo=;
 b=ez7fa/wHiJYvZ/hBqW5vVmJjsiPHx6hSrQVkE7mStl9z3zsXKubI7yewBEyaZagUlD
 /Sv6zKYutosstRxo0U50aBEHeO+ikwZO4Q1TtsNPRhmY6Y+wMIjKIBnHsQWuJev6q8GP
 mqREw8D5X1zI83reV+QvVTjtRpM93tEaagyFY6ZrxbEQpBro/ygYX8LJe2Tf1Voc2oPC
 BETmDjQO8xOGfv4O/GqIe7/sdsn0Kis5qmgnXxLuiASspNcQW4Me8MzhaHfgR7SJijzv
 w3qc2sRGWsl5CggATfHKbLoVR5aTXCtqcuZkg3T/wfRqK31d512H8SJ85HguSYs/tC3g
 ceLg==
X-Gm-Message-State: AOAM532ERHF+q2K+w/2S3HlHJQmCZqF9OtIf4NIq5HCQLRohnd/AxQ8W
 mE/hhJewcV9m8bOws3mkoXk+Zg==
X-Google-Smtp-Source: ABdhPJxZIChO3DPXHVR9hOQmoAnN1LPQJR99VkoBh31qWTI0kcRylJRbQW3nCdq51Dl1EGx/wTx+Rg==
X-Received: by 2002:a05:6000:89:: with SMTP id
 m9mr19571523wrx.412.1605533779174; 
 Mon, 16 Nov 2020 05:36:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a131sm19683212wmh.30.2020.11.16.05.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 05:36:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9CB811FF7E;
 Mon, 16 Nov 2020 13:36:16 +0000 (GMT)
References: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
 <20201116024810.2415819-4-kuhn.chenqun@huawei.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Chen Qun <kuhn.chenqun@huawei.com>
Subject: Re: [PATCH v3 3/7] accel/tcg/user-exec: silence the compiler warnings
In-reply-to: <20201116024810.2415819-4-kuhn.chenqun@huawei.com>
Date: Mon, 16 Nov 2020 13:36:16 +0000
Message-ID: <87v9e5whin.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>, Richard
 Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Dau?= =?utf-8?Q?d=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Chen Qun <kuhn.chenqun@huawei.com> writes:

> When using -Wimplicit-fallthrough in our CFLAGS on GCC9, the compiler sho=
wed warning:
> ../accel/tcg/user-exec.c: In function =E2=80=98handle_cpu_signal=E2=80=99:
> ../accel/tcg/user-exec.c:169:13: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
>   169 |             cpu_exit_tb_from_sighandler(cpu, old_set);
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../accel/tcg/user-exec.c:172:9: note: here
>   172 |         default:
>
> Mark the cpu_exit_tb_from_sighandler() function with QEMU_NORETURN to fix=
 it.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

