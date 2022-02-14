Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7F04B4FDA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 13:18:21 +0100 (CET)
Received: from localhost ([::1]:45400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJaJ9-0006bj-RG
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 07:18:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJa7z-0002ol-RA
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:06:48 -0500
Received: from [2a00:1450:4864:20::42d] (port=36857
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJa7x-00076X-K6
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:06:46 -0500
Received: by mail-wr1-x42d.google.com with SMTP id o24so23803142wro.3
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 04:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=azt2nmqs0lliqJO9yIuQVGbXdtbCvIn643r8kD/0Q6o=;
 b=o/IOTOTc4Qu6buxr+ykKtJ8mLbckkX5+6YPUORPZTZhRsYzo3ZUYPuTuMyfBWeFzfU
 y7xz2EIoMXa6KcCWAMXPWukz1e3SaspM+CT5DMe/BOpjS1JYvDuQxq99tOAwJgoyCE8W
 Sx6F70SxYpSC+FjnxDUJDUzPGaFV3hfA/zUagaUiRIgh5XUjuKU2M0OiphjsGgl1EWCk
 BNDyou8RssElSE17BU3rPrmeCoTF0o5udgEmASkSbnifJXebnMyH5thK2HEKMxtiOTmP
 mPst82Vwo5Kqeo/gVLS38oM2Y/sPzUnTvf8l3ZXXhjKPxNM52Zx0CMcE2ggNmUWV/Drx
 Axpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=azt2nmqs0lliqJO9yIuQVGbXdtbCvIn643r8kD/0Q6o=;
 b=vK4ktAunR2LClBT5Vt4tWqapAhqfzmktVOD+VyhC++xYAky26/I2pSl7Zyetr/Us+v
 eSwE1z6c39MHMigdTQhIwXpMMxGN5ptkHcf27Qfxy/q/uXxRTt9RvB/AbAfAE1n/oeo5
 ZUmIMTPfeVkSCgN532vdWjwRz6EKVS4D+16/w/j/kTUsUkx//TdmClBEVJTmAOoShNw3
 pDCt7LDAeKbBgx8+nS3XwxmidEoMoh88YyFSk5dBD/vBJtbS4wBeLI1FxVKhRsGUU3Bz
 rsk4C8w14kGLHJK74aBgDlb1EVtswYMJopMjDWu1Pp8qaMdVnVrJ/oKLse00U9P4w6iS
 KlQA==
X-Gm-Message-State: AOAM532CNSYB8dmokWV1GlAawSoEsmQbItXQCFEZq/IymhyMKcPIZPVG
 pYEbxP2QNNhz+9Otgjwz0dw0Sl5gHi0qOJdwUM3bmA==
X-Google-Smtp-Source: ABdhPJxfZqmMSldTB5Ueb4TQX/Ikjl8lNc1Jq49KEbuCR3zLfXmCkkc6FzSoV+Qsfkr9ZON+wXNkmhSY2bsy+ZBlcEk=
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr10765091wrs.295.1644840402837; 
 Mon, 14 Feb 2022 04:06:42 -0800 (PST)
MIME-Version: 1.0
References: <20220120113545.55820-1-ilg@livius.net>
 <8A1E1B8F-ADA0-4966-A4E9-C0A08EB0A327@livius.net>
 <D6833D18-344A-473E-AC4D-89A64F8AA0EC@livius.net>
 <CAFEAcA91q2t9sVvaW6h3BwFMExgyCdVsb3TozH52EM70aPJt4w@mail.gmail.com>
 <46F93823-E819-4B8B-ACD3-D8A80245BC9E@livius.net>
In-Reply-To: <46F93823-E819-4B8B-ACD3-D8A80245BC9E@livius.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Feb 2022 12:06:31 +0000
Message-ID: <CAFEAcA9YxQFug5vuHwi5koHUDZiBfMVHUr8yfby9r5D0b6hM=Q@mail.gmail.com>
Subject: Re: [PATCH] Add --with-branding-prefix and QEMU_BRANDING_PREFIX
To: Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.785, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 at 11:54, Liviu Ionescu <ilg@livius.net> wrote:
> Would you agree on a multi step approach, first a minimal patch that would solve my use case, then, if there will be others needing it, a more elaborate solution?
>
> For example I don't mind having to pass a preprocessor definition to my build; so how about something like:
>
>
> ```c
> static void version(void)
> {
> +#if defined(QEMU_BRANDING_PREFIX)
> +    printf("%s ", QEMU_BRANDING_PREFIX);
> +#endif
>     printf("QEMU emulator version " QEMU_FULL_VERSION "\n"
>            QEMU_COPYRIGHT "\n");
> }
> ```

Either we want the feature upstream, or we don't. If we do, then
we want the whole thing including the configure option. If we don't,
then we don't want any of it, and that includes not having this kind
of ifdef.

So far you haven't really described a use case that --with-pkgversion
wouldn't satisfy. You say:

> Seeing the branded greeting in a console log is a visual confirmation
> that the test script used the desired version, and not another version
> picked up by mistake when using an incorrect PATH.

but the "v6.2.0-1-xpack-arm" pkgversion suffix works for this
purpose too.

thanks
-- PMM

