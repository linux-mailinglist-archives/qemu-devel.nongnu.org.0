Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E622866DB10
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 11:29:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHjDC-0005Py-18; Tue, 17 Jan 2023 05:29:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHjDA-0005Pj-AV
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:29:00 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHjD7-0007Bz-U4
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:28:59 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 a14-20020a17090a70ce00b00229a2f73c56so1590793pjm.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 02:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j0sjaXYymy/iFSyarSlSMqgcs4oRuwRD/LeY/JNZ8IY=;
 b=UgyA/TyyscZm3DN0vstVKIBOZlhjFiskGRxbNvwI3Z7KX+djIj+sPqcEehF2eU2TxA
 eE3TSbNZqT5K/Azzk+kMqgFuRC9ELvzN+LwtXaWLknpi6QU2cAXshPT+cyVz+s9B+K4P
 zlVm4VKIZxxnBDoxsACIWiRcwipcXpnkONeVdSYzbEiGH+PE8WCLi5fJL6btl6+hXUWl
 UsxO//CihgnKSUr0AepPXmf0HyedlG8tizdYp4rovAOgMJTdSLcRvyft4B7uRNGS91Oh
 gzN+EyCDHOGuS+IvIiyu09lZvVeBr8NjaPxsi44nW9To012Jrha7DrF7PH1vn7eXrFWH
 wFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j0sjaXYymy/iFSyarSlSMqgcs4oRuwRD/LeY/JNZ8IY=;
 b=TZnTEHuavKtbS57GbfsFAnC2mSgtfAexmzaf/fq28LVYhucX2Jc4t7Lw25jaiEnMf5
 gKE3uWpXxRBwGWAKEWA/Zfd2+9gmOAINH0UByMEn+j6TISbCeOaMNhC6srPxrhS45qYf
 CgFK7DZ+SKHYuC/ywt4goKuAvtQLhh2CKUaKGJlftN07UZkGfDZ1ilVnItUJbjR/M6uM
 IgklCr/nmW2AbwQaDRTZ1PfrkBttWJZJ0ErThZxbiOk6YxIUWLTzGKui7+jIeNXDCPf0
 Efyj+F5RjwgLix7ExwL7N5+qgtdjlMD403QrtWmS9gUJGd5HpKWeGZ+o33IphHBTG/D6
 1DJA==
X-Gm-Message-State: AFqh2kpYmhakTUj2C6P7eztSrDz8m1L/66bHLmrjfswza8Dw5/erQyq9
 qDeE9GAhGJllduxLFZsMSD8Joru3CLmyGu4sKL85BA==
X-Google-Smtp-Source: AMrXdXutacrXaBKRG5SqaA3rLGgRc8Xh7FK5PHJEIGDTJawNdHQ8jc/xLlPhm7EnTxa/oRbvoCIYLPFzPll4pT0rfrA=
X-Received: by 2002:a17:90a:ea92:b0:229:189b:6fee with SMTP id
 h18-20020a17090aea9200b00229189b6feemr225365pjz.221.1673951336291; Tue, 17
 Jan 2023 02:28:56 -0800 (PST)
MIME-Version: 1.0
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
 <4db4ccba-1985-f1b2-6c5a-615b865ba749@linaro.org>
In-Reply-To: <4db4ccba-1985-f1b2-6c5a-615b865ba749@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 10:28:45 +0000
Message-ID: <CAFEAcA-4dUF8MySqFxFdrHFF+Jjw+wZo9mp6uNuHqumssKX_Aw@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: Look up ARMCPRegInfo at runtime
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 16 Jan 2023 at 20:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Ping.

What did you think of my suggestion in the other thread of hashing
the info we need to determine the cpreg set (ID regs, feature flags,
etc) and using that to look up whether we've already created a
cpreg hashtable for this config? If we did that, we could refcount
the cpreg hashtable and only free it when all CPUs are done with
it, which would mean we don't need this indirection.

thanks
-- PMM

