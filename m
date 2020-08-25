Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E322F252323
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 23:51:32 +0200 (CEST)
Received: from localhost ([::1]:47826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAgqp-0007MC-Vt
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 17:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAgpU-0005ys-F0
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:50:08 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:33195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAgpS-0007rU-03
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:50:08 -0400
Received: by mail-ed1-x544.google.com with SMTP id w14so12075797eds.0
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 14:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I1xwrPMsg142RGue5pXqwYurDytI9ZhGuht3Ro8JNic=;
 b=Pjc53d4Q1kn4aFpphQCiQ3zTmhrxB/WY2RRRf3dJUEar5cv8Kt1t1gBSPDNe0owWCr
 OGynUn++zgg4ATJMcmSellHitO5EC3wV3cqxPl6UxU4NIdvHB39NuxPfIgUWGvjWql52
 P2TZC4/J8ZRQX7XRaxuNJqq4IUQ8Y10oYq8O34Sz2f3GirMeCL6OTnXaCcrZMxtyUmn/
 +JhxwaISoz5tq+PHddF4OeJufUprotLV1iqhmbt1DHvtsYNuYks0BvwBYeXs09YYBf8l
 tTVVSNREFmJkum4yq0iKKAT24zP8NQ/wPbPIjC8DK9Z5QXbdW01mMRYd9wpcu3wLzs7D
 r+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I1xwrPMsg142RGue5pXqwYurDytI9ZhGuht3Ro8JNic=;
 b=ro/KuUj4hU4NZC08xqIOK90B09KLOsYaG/rbqLQqxO1L/ucWzBmO9UYtyx9+V6S7Wd
 SULIFMipkcP81ucmU2QJ5kz9uX9s4KdmFZK5ybgRw6CJWcdtnaG9OEU63+H1bUfIQACJ
 XfC1fGRmSECX5QnxeIOX551L1raQotEsOh8Qd8OkA80UltrAFAXOYwu1IlWR8sZ9VsYE
 QAhgDw7cTw3K05B+uTbYYoIQ7l7SigOOZuHcUcUpaVDRmidPrRuHJVcHokNxi64jvdR6
 h+3sr6/0gOWVYfr2OA9cdJ/8vMS7KDhAbOx3+JXtzxHeITjqej9i9gIzhGWh32tEZdbX
 yJ6A==
X-Gm-Message-State: AOAM530p3GnDM/+/pq14RAZgCMVMAw+1bq1OLlq6mcUGT8WygtWMIcWS
 gFnKfktQZ3Pq/O3X1YSFtwchN7dNvR2whr1CSNhHTg==
X-Google-Smtp-Source: ABdhPJykSj8s5CgcuWQ7g9w2n0RrQwQ/b/N53YxujyXKHA+aAewALdXi6Ng46QfwwVdHbTGUmYl+MKgm4CxGepiFHT4=
X-Received: by 2002:a05:6402:1218:: with SMTP id
 c24mr11960952edw.44.1598392204262; 
 Tue, 25 Aug 2020 14:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200825184836.1282371-1-alistair.francis@wdc.com>
 <CAFEAcA8=Mf=EPh__tNhJyGv8+ouD-HH+MuMb+HhtTFes+XqUSQ@mail.gmail.com>
 <CAKmqyKNxURXyNSEePPU1jY7FzcZjRThr2qAvwR393+nqUXBxJQ@mail.gmail.com>
In-Reply-To: <CAKmqyKNxURXyNSEePPU1jY7FzcZjRThr2qAvwR393+nqUXBxJQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Aug 2020 22:49:52 +0100
Message-ID: <CAFEAcA8x=ck1mmJ8Y8o-0NQXWhRgOg5Gp7GvHNkNnLb6rDxygg@mail.gmail.com>
Subject: Re: [PULL 00/18] riscv-to-apply queue
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Aug 2020 at 22:32, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Aug 25, 2020 at 2:24 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > The hypervisor related patches don't seem to have any
> > reviewed-by tags, which seems a shame for a fairly significant
> > chunk of work. Is there really nobody who can review them
> > for you ?
>
> Unfortunately not. They have been on the list since April and haven't
> received any feedback.
>
> There isn't a lot of people reviewing the RISC-V patches unfortunately.

:-(   I'd hoped it was a more active target than that.

-- PMM

