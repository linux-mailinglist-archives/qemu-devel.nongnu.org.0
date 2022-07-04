Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D1A565858
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:11:12 +0200 (CEST)
Received: from localhost ([::1]:41438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Mn9-0001MF-DW
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M2Y-0007OY-MC
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:23:02 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:33336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M2V-00034B-CF
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:23:02 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-31c89111f23so31792847b3.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ahtmvwQz/25Q3A+1wWSKkBPOCCQ0CC/WO5WGn91gpL4=;
 b=RHC8GGD1E4nF1lpaKeSK92zyEYOC904gLVaePRG0zlPXctn2Zmsc5Q9II6haQFR74R
 4L5kepU+Z3TghcTMl1fSbjZ1f63pBh3zp7soh79adI5kADD5FXq7fzvO7GZ8mftpCcBW
 bblSMIKeX6inVu6uT8+K7i1cI/TbiKk+RkOtXOBsO6WGlWngFMXIm2mGpDqIn4NHE7+v
 M5U4rmaZbeHf8HYVFwFyvGoS8EwGzQvfXP2K3mjsO5ESRtCqXKMI/PPtWM2pTD4FKNgU
 Hi6CIkf8VgM0GucARgV0rFitgSOTsyMRIn1HkFP4GDlmQblbwJhR6bujxw6pSs6yZ97Z
 DH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ahtmvwQz/25Q3A+1wWSKkBPOCCQ0CC/WO5WGn91gpL4=;
 b=Bio12Dp0ifKkLbes3IVyTXlVuk9RguDoxMxH+MqVBS35VodA36NVR0OwCEIQXGpb2u
 qMkv63Mv7LcNKmaEzoRi7uNk6N83t4ayF1osSuwd44EGw+tMDIZJvAwmbB9sGAlYPQ2U
 /vv66PoiazvN30DpgcwzQ7+mb0nAHjYj+2td3P2GTrWzD29y6In2GhNZKmnUVm782OTy
 gNj7CZpQmj0nmjyjNCHpo4PfJTjVdC3iDfPVYNOpngWR6/l7d5sMxY3nYVfbQy9Ry2RD
 tflZgIWaPrWmM9rx/eQQWzYE8ru8c/GE7MDNo48+sKAVkZ8mJDIggPHfKYE1QoAG0vzp
 nhjA==
X-Gm-Message-State: AJIora/bia1/5ZlRLrpYth/Fu0pIfVvZfyxzwD1N2ipShPNC5kXokfiB
 uLmfNYDOn59XcaarETsA/53WloXHhu/dqdkwLd5YPQ==
X-Google-Smtp-Source: AGRyM1s/A3J6XnPgfD4tLZA8PPilup7w0UyqrbYT50nre1ld9rJQT+fkL7FpbJRKosFlurElW6f5tqoZMMmvmUGLebI=
X-Received: by 2002:a0d:ca4b:0:b0:31b:7e6a:b77a with SMTP id
 m72-20020a0dca4b000000b0031b7e6ab77amr34129396ywd.347.1656940978329; Mon, 04
 Jul 2022 06:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-18-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-18-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:22:47 +0100
Message-ID: <CAFEAcA81LupX9QP0vH8P44r2AnRKLihfoq5s8hNNz6iU_fWByw@mail.gmail.com>
Subject: Re: [PATCH 17/40] lasips2: introduce new LASIPS2_KBD_PORT QOM type
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This will be soon be used to hold the underlying PS2_KBD_DEVICE object.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

