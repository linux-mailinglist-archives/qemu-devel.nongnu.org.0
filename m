Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBC21D2DF1
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 13:13:01 +0200 (CEST)
Received: from localhost ([::1]:56660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZBnR-0002Hi-0E
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 07:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZBmT-0001S2-Vw
 for qemu-devel@nongnu.org; Thu, 14 May 2020 07:12:02 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZBmT-0002Qx-37
 for qemu-devel@nongnu.org; Thu, 14 May 2020 07:12:01 -0400
Received: by mail-ot1-x344.google.com with SMTP id 63so2006575oto.8
 for <qemu-devel@nongnu.org>; Thu, 14 May 2020 04:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kmgi+cXn2gA4xTq/eWQ2tj3BWMUlW5Uh0vA4ZY02OgQ=;
 b=yOD9BEP+L4vp0L0QbU0583eI/64Vtdb+Vt8GUEIqlZjLC8UQDZhgu8acs5q0pZmY3R
 o00lLwlujnB8dGEB7NYufCm/qVRyh3bBTKmFL6YAs6DfZWjM/RacaQTLetZ2d2iekcMh
 2wpjzSe+4GJ3LYuag1nA+wWtaJoJR07cfnIvUkpUs5BPpQInS7+j5u99dKm6/cj4rr4V
 86qn8/Ne8n7JS2qc9+6xJwquyiClpVEjianf1m5fU45slKhjr8pxYlZNUCNzD3rr7fIb
 b3UB20VZ1tVEnjBF6i/bND/paxzBEFewoe71UUmQ5NCH65A/Qdh4zsyyxBVxwVIFZoDq
 MYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kmgi+cXn2gA4xTq/eWQ2tj3BWMUlW5Uh0vA4ZY02OgQ=;
 b=SoMT5dtSFciV0rBNe5OZFSlUmyW4DO0BoldkTvyWnW/Wo8zy8cDC3NfX4IPd5mE3O0
 b/R9tOF/JqXalQKHzs0d/toa6VtoBSHouuHBjeK1JllvyQC/LRpM2sc2xxo0CwMsHJjA
 SStcYVfI58/ka4nfCetLDmJsBGSDSIWfWv22UfclFKw62/vPgfEspZKRhYoM31qhjo0v
 EkzMiddPdgcgMPwFIqCl5KSwWYzvk1vHFpcj//aPCOgYQoq/W+EpOn2txXi261ZLuf6E
 HUA7xi0VPvEI26VcY3pUN37wCxTeYd3s5w/qw0f1QP4LCCQXWQcOgb6N803uPtCFpNol
 dtxg==
X-Gm-Message-State: AOAM5322eV3bHo5Nx2dlSa+bsu6hxPPlDFXhFw+yD2a/oDNOOGQ6f7B/
 +WB8wJTBJtFP6seBt+Ick4PKpz8QZgnKLXPfbexQ+A==
X-Google-Smtp-Source: ABdhPJyIQwz7oPWt9b/QQJ2Z0yCWjuVRj+YVTalDvpNE9UmAW4Hm6eKvHRaDu2AANo9WPC8tNWM4a1x/NRCDr2QEFR8=
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr3006788otj.91.1589454719798; 
 Thu, 14 May 2020 04:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200512030609.19593-1-gengdongjiu@huawei.com>
 <20200512030609.19593-2-gengdongjiu@huawei.com>
In-Reply-To: <20200512030609.19593-2-gengdongjiu@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 May 2020 12:11:48 +0100
Message-ID: <CAFEAcA9RBWDM4gwputTLmePuL9FJ7Xv5x1uqyFHoru21S4GkeA@mail.gmail.com>
Subject: Re: [PATCH v27 01/10] acpi: nvdimm: change NVDIMM_UUID_LE to a common
 macro
To: Dongjiu Geng <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 kvm-devel <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Zheng Xiang <zhengxiang9@huawei.com>,
 qemu-arm <qemu-arm@nongnu.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 May 2020 at 04:03, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>
> The little end UUID is used in many places, so make
> NVDIMM_UUID_LE to a common macro to convert the UUID
> to a little end array.
>
> Reviewed-by: Xiang Zheng <zhengxiang9@huawei.com>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

