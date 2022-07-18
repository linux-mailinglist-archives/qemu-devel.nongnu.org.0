Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAE95781D1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 14:12:44 +0200 (CEST)
Received: from localhost ([::1]:55504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDPcB-0002J1-L2
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 08:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPZh-0006Uu-RD
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:10:09 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:33680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPZg-0000Ac-A1
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:10:09 -0400
Received: by mail-yb1-xb33.google.com with SMTP id 7so2789926ybw.0
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 05:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z81naWAvORfjz1Hb1/LHkdV8Cv8J/4Vsx6Y+8l5Hyfs=;
 b=ePC3vjPT7Ng83L6IEae6XGczf+erH9pyIR8VlHcT1vLqYuj0zS3mXtBH8lsNbGS5jq
 ILOv+VtqLqWHmkg6PfQZjPAdqyCfenCzqz8S/UQCTK3yRUrSpNjwMd55Gh03Rav/g1lp
 tzqNJPzxSq+418n6DsJQL3/Km4rtcq+CfZTGV7jwFAmxpyoerZ5Cuaz2XwrKQNP2DVjl
 udQqphPuC/VyhI8T0EBVsodTnD8CD49tII7Q1Q6/YSaHA6PR5T3qpnmicqB0KCgdcQ9v
 NXMDcXkRsdmJmQPIfAaG8C6NPvypg9AVC4oKefwlM9bwJTF+rncozMnYECqjgarqGqdT
 heQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z81naWAvORfjz1Hb1/LHkdV8Cv8J/4Vsx6Y+8l5Hyfs=;
 b=ynAjh8Errp72QORAVKQRnmHhA+lVdLtxOQ26ZJ5Mttx41LWLMqzw1sowNLBLS74UYK
 Y1h4pIN4xnNL8+yQvKT9uz3oR2C9AJs47awZHWk7SWIW/Um/U1MmFt8b0ioHWxsZyNHt
 r6iqeYYaSjLNbOi7rdjVdJMW1tgZRCyyUd0oNoH2q78xAkgO9MlP+gyO2BFHJX9g3Y1f
 4kv02jdkwxo7ZffI+SNbTEvS8BaN5qd8+QMsJuN+tEdyHIImUxHOn4FMtcuxQFbRrf3v
 5lu019DrQCltTThKB3KhVuL2QC/ukrE7xeQAjzUkRkT1j9VZjITfaooOmeYn+H/kRcRi
 fbKg==
X-Gm-Message-State: AJIora8lXjli3w6jR3YI1Jpa95Yfdg1gucNI/eraGfZaxtOGoM2SY8nm
 Fhcoep018EjNgGls4FkvJp6Y1XowSvDgU7Gj/glOwQ==
X-Google-Smtp-Source: AGRyM1vtOx8iS6UhYQbC9v01vB7f3+YhGi4GUG77t+gvudij79DNAOTg4mW7y+NvwA3ah98MS+eYG36gQNzGaXjNhCM=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr27011307ybr.39.1658146207215; Mon, 18
 Jul 2022 05:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-29-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 13:09:56 +0100
Message-ID: <CAFEAcA_K95y1SnX=eymzWBND6175qzA=4iFHimp+x6zTN5UhCg@mail.gmail.com>
Subject: Re: [RISU PATCH v4 28/29] aarch64: Add support for ZA storage
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 8 Jul 2022 at 18:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Require NVL == SVL on startup, to make it easier to manage reginfo.
> Most of the time PSTATE.SM would be active with PSTATE.ZA anyway,
> for any non-trivial SME testing.
>
> Extend saved storage only when PSTATE.ZA is active.
> Use a carefully reserved uint16_t for saving SVCR.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

