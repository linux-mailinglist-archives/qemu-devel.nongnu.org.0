Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B30C3AB445
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:06:07 +0200 (CEST)
Received: from localhost ([::1]:34678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrig-0000s1-Cj
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltr6G-0003yL-B5
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:26:24 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:36485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltr6D-00031S-6v
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:26:23 -0400
Received: by mail-ej1-x62f.google.com with SMTP id nd37so9605622ejc.3
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pXLDh+yfw1z7IW9znBpg5l7mmmjf/oa4XnRzPYKl+Po=;
 b=Q9HTiKrO6PFspMiXNEHnIcxZlNBT8+gLSrp/o5qxjh8/U4v1rlYC3kOnivndQYBkTT
 jYVIyrFO4UnaMU9jWr6QoWoiuR0HkFWWI7Nh8Oe/apF4tbHocQ6KIKeX179/225/01UP
 hl3a4uz7txDONJrHSoHtyt5t3uUo5DswragOtcfPTYYurZNGN9+VrVLPVSGoS233m6SD
 gsitlSckrXrxN/gP15kfzHYeYFa1Nw5C8+PYFOwOwH1jM0j6nVYgeg5a8yK2teWNkla7
 /1mENTvKOWlNHSgwIvur35dXu5uo+7LeHvx+QZRaWTXbXRmClg2eUipmf1/6HmK+xJWU
 TnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pXLDh+yfw1z7IW9znBpg5l7mmmjf/oa4XnRzPYKl+Po=;
 b=BmZH3XUGm9OZy3UMtQRb1IChuagKIGbo9R8V962Gs30eCpM5rY9iyk+a+uDO+VeZ3u
 X72ru/vN9pJNCKtJLTjtMcuz6cU/MBxe3MljOn7GqayzmNDqtCzjdWnuiEA0o3F2ADlc
 1Qh3pNB5pqxoV7QQKpLDrLi0Ahj69mFJJc53LchUqdWPPEenJ4GgCyLc/mkT6nCLz+ZD
 2XRmnsy+ml1ZCDNsVZiHQGsHzpoD36kGO1ymIYssmCccfp2B464UcgnGlyEoJDgAkknb
 DerhAfvvL8yYuJwQdKVk6OTK9vKEFEzcw7o3EAtbuA/hXoTBUU/pHYz8zZz0hR7MxoDT
 HJMg==
X-Gm-Message-State: AOAM532or8kCb3+9uqKM9ofDfbPI/47SN7cIMipFYKoOryicLwIMHBDE
 BQ7bNwDDP0hCh9oY7zEULJSRPCL/zxGqz88nt0oeTw==
X-Google-Smtp-Source: ABdhPJzBfn1J5C+/6ZX0cmkOK/MPxA4DXe9N9rmQiNF9Kxl0+qEjkyKsu+Cu/TTdAtwnS40i5d9usk7RI+DM//93tmE=
X-Received: by 2002:a17:906:b294:: with SMTP id
 q20mr4854971ejz.382.1623932779290; 
 Thu, 17 Jun 2021 05:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210603171259.27962-1-peter.maydell@linaro.org>
 <20210603171259.27962-2-peter.maydell@linaro.org>
 <794108a2-fbaf-dfbc-ed8f-2d3d87ba2c07@linaro.org>
 <3e6b9e75-a0b7-eb65-a357-43d0cb3a3027@redhat.com>
In-Reply-To: <3e6b9e75-a0b7-eb65-a357-43d0cb3a3027@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Jun 2021 13:25:44 +0100
Message-ID: <CAFEAcA90c643JhudpB=g4Fpz8B+dQvd=9tYZVyss-kfa3DUbRw@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/acpi: Provide stub version of
 acpi_ghes_record_errors()
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Dongjiu Geng <gengdongjiu1@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Swetha <swjoshi@microsoft.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Jun 2021 at 11:28, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 03/06/21 20:52, Richard Henderson wrote:
> > On 6/3/21 10:12 AM, Peter Maydell wrote:
> >> +softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c',
> >> 'aml-build-stub.c', 'ghes-stub.c'))
> >>   softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
> >>   softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c',
> >> 'aml-build-stub.c',
> >> -                                                  'acpi-x86-stub.c',
> >> 'ipmi-stub.c'))
> >> +                                                  'acpi-x86-stub.c',
> >> 'ipmi-stub.c', 'ghes-stub.c'))
> >
> > Gosh that last line is confusing.  I see it's documented in
> > build-system.rst, but yeesh.
> >
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Yeah, it's vestigial of the makefiles and I should remove it.
>
> That said, here:
>
> > +acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false:('ghes-stub.c'))
>
> There's a missing "files" after if_false.

Thanks for finding this bug -- I have requeued the patches
to target-arm.next with the "files" added.

-- PMM

