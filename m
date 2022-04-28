Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F56513404
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 14:44:26 +0200 (CEST)
Received: from localhost ([::1]:52328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk3VQ-0002Tb-Tx
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 08:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3RC-0007g9-9B
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:40:03 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:39637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3RA-0007CM-LQ
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:40:02 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2f83983782fso51354737b3.6
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 05:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jKiJG9/P3+5Ek/VD/EAMdXBUP7thKn8Nzr7duu81UHs=;
 b=KDS7wNgV05EHSdkMWdnAZ0emY0W4F496nDZ+wmonC960+UBjJHnyAWCz59+69z+N1s
 V1cCycQMMXcsiV5SuNuHDd9nDOpsiWab4vGUvjuIyzM/YIv7QXxPS2p4dhjAVQSX8HAb
 3tHMYf/2QVJ9XmAlo0oBBhQ05OKubsZQX75hu8awPUKgQHXlkmYNivnAcM4qmpSNWBF5
 pFfLlA9yHUWC+jwwQX9/JabTMMm7oO/8TLyx3qbO+REAbf4IzjgYyAzL9VKUBTM19L9q
 IIhqgao8zjOmuiDj56Jyd87wewR+SCq2qZF6PzRHb3kJKb3EE9AgS9spwfsMfhWfnCtU
 gJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jKiJG9/P3+5Ek/VD/EAMdXBUP7thKn8Nzr7duu81UHs=;
 b=3oPHIzUNonv1NU8DdV6HgIfjLioFdLHo5u5Hn8sZ0/USO3YE5QHrSD+zkA73YK5L24
 n6lZBFJE6vf8y4TnWf8oxwx+lE1LiW0ZhuJN+tHRiIiZZqpXo9r66e9Ma6plonjRWDTW
 WPa3x7aUrzet54OcTcrqqpAVcGUDOvVMUqNIRPgom2uu0ENfOL4RFDJsAuKmCkIcrOeJ
 eSsLuFpqhubFDDXeumteT9/hUab+neEqoOGYxHvlleKjL4FmR7stiPDSQMNbshi3UzsD
 3CH3zvAU2ZLyN2C49xgKrNT99mRFssY8tWCbkjZUzRxb3DMk9kB623ZiJsk5epwOcfXe
 h8eA==
X-Gm-Message-State: AOAM532tmLmNexfMoI3mfkzGnOto6o1X2xybCslxQL0NFkqHk71h/Iax
 uqKkffMUSjTNEX7cORW7nthmtqkPTVlvnf4KbQTz2w==
X-Google-Smtp-Source: ABdhPJw4ejY5cXO+s85cR87564VG89VgnvoBJc6l9AOhjsJmvv8z9qrAQd+cEmAjO9yCTHtNofgS64fyyVCRuowK4qE=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr32740287ywf.347.1651149566058; Thu, 28
 Apr 2022 05:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220427090117.6954-1-damien.hedde@greensocs.com>
In-Reply-To: <20220427090117.6954-1-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 13:39:14 +0100
Message-ID: <CAFEAcA84F=WLfVdo1SvYmu_7p4-HZPL3boJcUu=XJDf7m_gxMA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Disable cryptographic instructions when
 neon is disabled
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Apr 2022 at 10:01, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> As of now, cryptographic instructions ISAR fields are never cleared so
> we can end up with a cpu with cryptographic instructions but no
> floating-point/neon instructions which is not a possible configuration
> according to ARM specifications.
>
> In QEMU, we have 3 kinds of cpus regarding cryptographic instructions:
> + no support
> + cortex-a57/a72: cryptographic extension is optional,
>   floating-point/neon is not.
> + cortex-a53: crytographic extension is optional as well as
>   floationg-point/neon. But cryptographic requires
>   floating-point/neon support.
>
> Therefore we can safely clear the ISAR fields when neon is disabled.
>
> Note that other arm cpus seem to follow this. For example cortex-a55 is
> like cortex-a53 and cortex-a76/cortex-a710 are like cortex-a57/a72.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---



Applied to target-arm.next, thanks.

-- PMM

