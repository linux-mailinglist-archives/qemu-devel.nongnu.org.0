Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6073E2F7630
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 11:04:05 +0100 (CET)
Received: from localhost ([::1]:43350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Lxb-0002tz-UH
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 05:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0Lvz-0002OK-Vr
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:02:25 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:35400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0Lvu-0005vU-J8
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:02:23 -0500
Received: by mail-ej1-x629.google.com with SMTP id q22so12471012eja.2
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 02:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CegIyuc28gNG8rWzk2Oea8Of5d1nBVLk73I1gH7cBoM=;
 b=wbpiYy5Z9vzxiCptQ5QMV7ijMUq5kASaSGC/kGDda4RyC5byvXmB+8FWmPD21sGecZ
 e/cz9PlMqDHnrCv7lGEu6EMy78S6WfsAEiOHNxjeked+yH0m+SE/JtqRV9aLzl5A+spa
 RwRuLeWgbTeDk45cnD/Ek+bd0x12K+Qg3W84PfqwSWEkmNRp0DUmrMJabyuzzIDhSZX/
 8V6CTNeSC1PPBpQASGeo5TGDU1udib+fMWX0RxEO7lC7ysX0htRrLQfuTMkvpKBpumIu
 xFAHSo++OQ9XyvUT2WUx4AiuvhQLD/kSsa0eCfBZSfUGfifKRxV4q7sbkg7hszfZmJ24
 YbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CegIyuc28gNG8rWzk2Oea8Of5d1nBVLk73I1gH7cBoM=;
 b=AozQFQfsrZ3+XXImInOg88QXM/nHjgerx5XUlXCft3/Zoz7a01Jcj2RkrVOqxp1U+9
 oFLYm9+NRipiMNzPRSAXIRQTPND+FztqrAkCKI5SscauHFD2Rvi5YGYHmaCd6QoIeLMV
 mcJTZvm4DoGjS1uLw33ShojHVPs5+MiQKaWpD8TdwSm5AisngVMAjWFJ5iJDuoXE+01I
 qB65MUycrHzBD+ZYAGaEl0gZiZYDKyUSiGQL823U8kW61bK983GLViLgTPx5H7j405NG
 btuoc4oYstMVJnJG2/M28wACR1qN8YsdphGB3jJTjMvOLWB10jH9NRWOGthCarOKWvUd
 Ze2Q==
X-Gm-Message-State: AOAM530EzuIxKktkKJ5+OR9FTdRnt8vjlowBWhMdbbmnkjF/uoqdUtVV
 VUwslMFm3XyF7yZKYQTKCbr6l9+Uy2fkZnXaY/aZ2AQF8Ew=
X-Google-Smtp-Source: ABdhPJzPCblSQWiXyKsf/r/3kfXZml+IVGt8J4Cts3/eKL8xSSBaVbrk8raqW366tWCG9yFXk7OxODBttOUnVnJe3q8=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr8343483ejr.482.1610704936183; 
 Fri, 15 Jan 2021 02:02:16 -0800 (PST)
MIME-Version: 1.0
References: <20210114234612.795621-1-imammedo@redhat.com>
In-Reply-To: <20210114234612.795621-1-imammedo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2021 10:02:04 +0000
Message-ID: <CAFEAcA843rP6rvktc0FSZEjK8C9E8h_5_PbCBUXYM4XJRE7KHQ@mail.gmail.com>
Subject: Re: [PATCH v2] machine: add missing doc for memory-backend option
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Michal Privoznik <mprivozn@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jan 2021 at 23:48, Igor Mammedov <imammedo@redhat.com> wrote:
>
> Add documentation for '-machine memory-backend' CLI option and
> how to use it.
>
> And document that x-use-canonical-path-for-ramblock-id,
> is considered to be stable to make sure it won't go away by accident.

That's not what the x- prefix is supposed to mean.
If we have an internal constraint that we mustn't delete
the option in order to support some other must-be-stable
interface (eg migration of some machines) we can document
that in a comment, but that doesn't mean that we should
document to users that direct use of an x-prefix option
is supported as a stable interface.

Alternatively, if the option is really stable for direct
use by users then we should commit to making it so by
removing the x-.

thanks
-- PMM

