Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19C968DEEC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:30:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRnP-0006Sq-Nb; Tue, 07 Feb 2023 12:30:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRnI-0006SV-OL
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:30:12 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRnH-0002Ru-2o
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:30:12 -0500
Received: by mail-pg1-x52b.google.com with SMTP id h22so26445pgm.7
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 09:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WquTmxAVnuvX41o0Ycp5rSmjR5M3IAFpmP3dGVjqge0=;
 b=AeFYv3FDqn+xl/dpx8Kv6ADzcuWdRfmpgBLKbsno+EGsHJA5ZTPaA6J2QojzP7ZirW
 bW+t/kn2m0TRocXd9hcS4D77R5LlFXfbyJ5TQ5ivsJkgy3zXUR8ytDkzMktPxBmRfymX
 vc+li1FAk3KHqJyFk22IQnWEseTFXxJpmuz9e8RYfTNka2DYnoXLsgE6GU5+Rw0qadB4
 n2Uast6x3sVwgXOoL8j/+6ZkW0VMVtdl692IjRyMlyNOwbAdYNxj/4GTVByW7wFHeXCs
 ojDfVeAo/EjAiXIskWhXIm+vdnFcNlWEss4hfMly2/Y8nLt/59KzF47Cuy6VPC9niYLb
 iHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WquTmxAVnuvX41o0Ycp5rSmjR5M3IAFpmP3dGVjqge0=;
 b=Qf6m4s/+Hn/FeBqCEiROsyuE/fUvoG65O2JyVNFhh272k6vvdOx+vmshhokQSsi2g9
 MlpnBIiEklUMTL20Op5bg6h5HdCL0eCFdGUHj3J4hbTwSBycjJ9/Z2VkJDIFTI0jmn4q
 QqoS24ik/hziBLMPvwCczFDW4mJDwz15tRtvnoimQJ7QSpvNSRB2cIXCaQVfv6guVugT
 obhEPQeb9ASoB5pwztAdy1gYfk7XyNY/GMvnoOmjNiOnRQ9NXVsryEtTBuxvPU6LDXkT
 3lIyTE+RFaFYrknqmwSITiZ7MYOqezdl1+maVayx4q57glW4YkAk8eWIX1blOF4LIlHr
 Dlgg==
X-Gm-Message-State: AO0yUKX9sMeTTDsQ9g9WalEYWQ86fBdf09MU3GRzamtbQnRAJXKk7Cde
 rYM05FcUyAE8pTKu68UXm3arXYN5aoJHg1B54PlhAg==
X-Google-Smtp-Source: AK7set8optfw5Dpg0VBGl/mohUUoartjUmoOwmf5fDHmolgjdgVY5xdn1P7Z+yZQX7J4BOXe5k5lJvRnVjE4ZgfGaT4=
X-Received: by 2002:aa7:956c:0:b0:5a7:f2a6:5e1 with SMTP id
 x12-20020aa7956c000000b005a7f2a605e1mr458185pfq.23.1675791009499; Tue, 07 Feb
 2023 09:30:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675193329.git.balaton@eik.bme.hu>
 <42bcdf2e60211557ec44f11a45d6b465654693b4.1675193329.git.balaton@eik.bme.hu>
In-Reply-To: <42bcdf2e60211557ec44f11a45d6b465654693b4.1675193329.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 17:29:58 +0000
Message-ID: <CAFEAcA8k_pVA_81Xr0cFqT6cTYqL2x3K3+WDKNMk02DtQ0XDMw@mail.gmail.com>
Subject: Re: [PATCH 2/6] usb/ohci: Code style fix white space errors
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Howard Spoelstra <hsp.cat7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 31 Jan 2023 at 19:39, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/usb/hcd-ohci.c | 162 +++++++++++++++++++++++-----------------------
>  1 file changed, 80 insertions(+), 82 deletions(-)
>
> -    .subsections = (const VMStateDescription*[]) {
> +    .subsections = (const VMStateDescription * []) {

You might as well leave this one alone. (checkpatch does
not analyse this syntax correctly and mistakenly thinks
it needs spaces because it's a multiplication...)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

