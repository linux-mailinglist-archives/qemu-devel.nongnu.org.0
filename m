Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D000570682
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 17:01:43 +0200 (CEST)
Received: from localhost ([::1]:52110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuus-0002zK-8R
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 11:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAuIW-00043D-DE
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 10:22:04 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:47045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAuIU-00007k-Or
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 10:22:04 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id l11so8918298ybu.13
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p5YL+SvC+oLEcxW+RYbHykwtZyRjVghxkgLZhsWkbaU=;
 b=BzT0p86c8tU+mrnajHK/nD4dPtrYK3x4K4tdJLyhq8JBHuAk8ZO4wa++UJYGyQhQ38
 8Recmo/sgq2gAthNK1iu0kk9RxfAha6txSJBJYE/VJbfk1+/JaJDX3uHjGidOcMpfbNY
 E2A59BHh8QSHZksQgBp5JGR/AQFi+SO8D3gfj+EJuSD3HYsL+IUe3I3I2EEXvDNlmqQy
 vjHCMUrcM8kZ12pXqdRS+pHebhCePYHJ2LOJMTS7avUzJ0SBLfzKfv/QnQFqySP4gh2G
 u9SV9Pwl0oguWGAdLpeJmJut20XGtsOrVmPbVf+YBUHo885x33LlPRv4UHZSYqlMCvrF
 GLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p5YL+SvC+oLEcxW+RYbHykwtZyRjVghxkgLZhsWkbaU=;
 b=OufAIYnd6ySXgprw9QLbGzRSvDXWadxoj/myLUmZZjb59UH/dk01w+uaPxVcbu7nA0
 7s7T+7DuQmiTNnfw0F8RXlgCGmcpAJXmm/kzbsM2XDCdOSv3obfTNIneAccaRXWwjnIG
 5KWBsFvHk2vEZFm+fxlMadKAHF6evdY1/Os3gc7Icj67OGt7f60o22Tl4/MlDqO3+egk
 Ez/HCbJ0IIF9uYC7JwdN9S/ku1GO1uN/t09ADbrorL1ueseHPJ+4FG97GWvVQrpCI9fU
 o9SbNQCPH6ksYm3fgSfs18bGrpNWPI72RE87uFsdXpoXafDMjt8AdVBC/8ltOSMC0/O3
 qw7w==
X-Gm-Message-State: AJIora/IHeh7K6xEz6IfQ/5CMqzTi2Qx8VFIDIdhTFMnZnbjLyYkwF0g
 HTMOaV1iR4oNKP7rwJrNuHIuPnBNwA3Z4ei62DV1XA==
X-Google-Smtp-Source: AGRyM1tQMoG3cCT1v+hpmJ/cb/n9UkB12j/7P8e+/SH9lpCHZmrT1bQuHHg77Vs4k+j2Xz10CJN7FgGfZpuMOItcjxs=
X-Received: by 2002:a25:230b:0:b0:66e:e008:a76b with SMTP id
 j11-20020a25230b000000b0066ee008a76bmr15398635ybj.479.1657549321692; Mon, 11
 Jul 2022 07:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220707163720.1421716-1-berrange@redhat.com>
 <20220707163720.1421716-5-berrange@redhat.com>
In-Reply-To: <20220707163720.1421716-5-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jul 2022 15:21:23 +0100
Message-ID: <CAFEAcA_bsmQe_7o-z9u+Pv0wA7hdUtEFnF1SujS3V7PXWRJHng@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] misc: fix commonly doubled up words
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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

On Thu, 7 Jul 2022 at 17:38, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

