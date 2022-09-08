Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC755B1A6D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:47:43 +0200 (CEST)
Received: from localhost ([::1]:60486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWF4R-0004Zz-6O
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oWF1M-0000ee-IY
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:44:32 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oWF17-0005X1-Pc
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:44:31 -0400
Received: by mail-pg1-x529.google.com with SMTP id r17so3896919pgr.7
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 03:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=adJDRS6AMKloAvz10NEIG932vsL+jMGhzDfJoNsC4Z0=;
 b=QuT3bmA4RvBeRsXhpSFAtGahPp0e7LiEjC5lxn3cWRNZj5ht83rZOix3GjxQw6whq1
 28YZug29Rd++JklEPc4Hhs/PAtEc+BCZRJhyrEUUWyirOV/fctwav28TGzf/VuuU0eKJ
 aOnZMXnUb30TlyHC9uOSs2YTFO7SogBIhqP3LubTtpaJNxeQ2wyBBjGfM+kcLMnhMwGd
 jcP88KRe8RxgHld2vbxpHzIp19B+bABVrrb9dWcZv1588W76K3ceaHYNlPfBELxj9qQf
 mjerGvtZPOP4DvkXUgC6WyA0gr6hat0Le2Snz8/Wk85SaQ3xcCk2qoTYZfFzwU/KPbSk
 NXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=adJDRS6AMKloAvz10NEIG932vsL+jMGhzDfJoNsC4Z0=;
 b=tZez9aCGK10jf0lbALnpHztjVCB9UhCed8YjMe0k5eJAP5T5PHvFBneEIuov90gIle
 6qGoXjxSV4bQ6jF9rAVjeYlO5eF9VVU0PgIlHii1I+U9L24ZsF66H9+Njhqr4wbgYkot
 ER5UbP4Jr56Zf6ycPpQoGazXChEqO+0OSA1dUin7zqxLDGfk8vbqhbBoh/CzqFLnCO6T
 ZJVce2WX4MNtIv0ocCfzYG0jzmAhL80Jl3hy6HVrcWsSe9rHVx6Og7NB43dhipHgyw6b
 BYcLIGC0BCGRzzRB0K/o2YwMn0x+xXy7xvAJqTdL3GsZbCMmLJiPrEVYmBb+HMFUp4r0
 ZRqg==
X-Gm-Message-State: ACgBeo0hOJmjhM+B2D+AF8u0cGu5Ac0MfN4fRLSbeQKlHq1F0jZruQXE
 VuyhUytEktoR2v6Q8Of1zzricQ==
X-Google-Smtp-Source: AA6agR4Aa8jBdL117JN/vqIGzVyPciNHu82oVxcUEsJJD/gK32+NRaLtQcWUKXyJkI6kbD9sX0q/Jw==
X-Received: by 2002:a63:1c2:0:b0:430:710d:4c85 with SMTP id
 185-20020a6301c2000000b00430710d4c85mr7316475pgb.12.1662633855385; 
 Thu, 08 Sep 2022 03:44:15 -0700 (PDT)
Received: from sunil-laptop ([49.206.11.92]) by smtp.gmail.com with ESMTPSA id
 17-20020a631751000000b00434e00227a7sm3585314pgx.4.2022.09.08.03.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 03:44:15 -0700 (PDT)
Date: Thu, 8 Sep 2022 16:14:06 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Pawel Polawski <ppolawsk@redhat.com>
Subject: Re: [PATCH V4 0/3] hw/riscv: virt: Enable booting S-mode firmware
 from pflash
Message-ID: <20220908104406.GA103508@sunil-laptop>
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
 <20220906104128.zlwzvbbswlzyplkc@sirius.home.kraxel.org>
 <20220906123200.GA237800@sunil-laptop>
 <20220907071037.tnnewqhi5v2xmiln@sirius.home.kraxel.org>
 <20220908102527.GB88864@sunil-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908102527.GB88864@sunil-laptop>
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Same thing can be adopted to arm also since both seem to follow the same
> logic. But I think that will be a separate patch than this series. I
> will run that as a separate RFC patch. Is that fine?

Just to be clear, I meant RISC-V fix as separate RFC patch. Not the ARM.

Thanks
Sunil

