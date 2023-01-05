Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED37665EA5D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:05:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDOyn-0002FF-0Q; Thu, 05 Jan 2023 07:04:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOyJ-00025o-I0
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:03:48 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOyH-0000mo-N3
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:03:47 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 fz16-20020a17090b025000b002269d6c2d83so3477601pjb.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 04:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T3hM20P+TGbaxG1KgvwEB+gTq2CyOhmMSVQK6ueAj+A=;
 b=MuPjNZr+JGgzgajYWR8KZxcnWDJDw1ygzKPjUk9ynMseIavFj6atZb+u5BFvnxslX7
 U/OKLj408AEvXgb7skHQl4TOTu8E6vDvtypRIyH7owiJOZT3ZE7o1CIGq4i2S7RR6wbP
 J1ztWYKk7RQU8uxyifTBqlFgm4bl0nGtYMdMyjcjrKKQNG1cMzf63vrijL6KqYL+z1Vf
 mKrgDu1J7F0tOL2kTr2trJ9yf79MbOMf1MI0wi4S7Yh6r814rM2yRPbwylMny4BlV31q
 v0FnYqwERjk+A4JeZ3qDDmkzKq2mGOs7duiAUgiwzPu8vbGrRJOOBPRv0hETuE5pyyRe
 AcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T3hM20P+TGbaxG1KgvwEB+gTq2CyOhmMSVQK6ueAj+A=;
 b=oLqG3jEVJ3weN7SC78TPGFXbxryLJnKbV5ZTPrr8P3j4/pkgWjQO+mXQgcBTl88dw4
 XiHK5wTEiP6JBiRNTqspRoGG7xox7IqkeMqDZNcKlzViLu9AnI1GnE8nDFxD++YN+8Ip
 1UWmAGEhmvazA3THEWy+OMxXGXXXClrE1H5Nq+CQdzLl1N+KmAf43R2N8sz/67sH//kR
 BKaex5EyV2lMqHNBOjsctk+ayliQi+QpbzlNwAr1924kLA5ZkxCiAoYbmH5C06Utowu2
 lft3YM8GNh2UwRqA0VH9ulFIWXHSt5Y9GSsDEvG++v82+vM6I80UQlYh0Nxk3ccxaLYV
 cUVg==
X-Gm-Message-State: AFqh2krRXTSjXI/mdneE1nw7cRff60eGiy+SZHC32pQrSdLg320HG0sC
 aXaC9Zscx1HlvwBVWG3Srd96qIzOpu6ZjVMhS2ZO0A==
X-Google-Smtp-Source: AMrXdXszJVJFDtswCGUL4XXLy8UeAYEdM0aVj4iutQf971gtkCQj1IGpBThS7+kk0tMOG1P9Wr8M0XoS/t+8oVq2ZN4=
X-Received: by 2002:a17:902:efcf:b0:192:ea33:5092 with SMTP id
 ja15-20020a170902efcf00b00192ea335092mr441064plb.19.1672920224149; Thu, 05
 Jan 2023 04:03:44 -0800 (PST)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-4@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-4@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:03:33 +0000
Message-ID: <CAFEAcA9w-q7JWObNCkkw_asm5-iU1-5JAqDCmw=CkENv4Us1mQ@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 4/8] hw/timer/imx_epit: update interrupt state
 on CR write access
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
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

On Thu, 1 Dec 2022 at 15:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> The interrupt state can change due to:
> - reset clears both SR.OCIF and CR.OCIE
> - write to CR.EN or CR.OCIE
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

