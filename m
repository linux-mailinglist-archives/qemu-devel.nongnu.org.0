Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDA23DB4F2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 10:16:04 +0200 (CEST)
Received: from localhost ([::1]:39372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9NgY-0006Km-Qd
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 04:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9NfX-0005aa-71
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 04:14:59 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9NfV-0008SB-G9
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 04:14:58 -0400
Received: by mail-ej1-x62e.google.com with SMTP id gn26so15352878ejc.3
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 01:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KfCNjvtBw8btPxvotabci/DGjYkru4JvEtMXwYRWP3M=;
 b=eeR/QVChtYpAPM2zPcR9lAz87bBKIxj/Je+6VNFNyzvYArAWbYkadc62C7WzluZbSD
 bcZzHBGkZ83S+/YScfcRZhzmlLd8sHSk4FLZYWd7CeqqIRGmnmUzFTLsuIiAT1d+1MlK
 SqO+UDCK3A//bYaWx5luNYyW0lBjr5cmCMSZ9uFt635MfO0B6Zjqm90MlLRrmpdGetYr
 YKMam2zUmoxbKO4L0gbLEb5xYzhs86DmSktdb7L2pGqgEJ7Q66FG75t8IcxiBg+U57yU
 O/wlQFh2I/jv9JmDmdWE8hlc43AZt71taVrcXwV5mBCWekIFAzHeeBuu6BGxqp2JGCvx
 k59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KfCNjvtBw8btPxvotabci/DGjYkru4JvEtMXwYRWP3M=;
 b=iZBTTU5WdoQA3FkQEBlg2tmwnaNp/B6ypbecKDx4osWL8nlpouN1bsuRl/heSRffwx
 ejn9mgH8EAz/iALCTxKA3GuNhq2LdPojeYXfLoP3xG3YZIPf8UdQK6DWkti96k4XluqY
 RY8pTs/yiFumTMbbJkQAmsG8/XnOd3YK7JlHZB7P2cXI8RM2Tx2yVNOTbTI5E3g6RjLO
 PSOrchrUs5EWRGoRnkNVBH1GZSrRDBJV/IxJYE8+cvbRHn6tGxKztH4FSVb1pyTljkaS
 92x3DYajYWvSkygIT9iKd40yh7fImT+V0cL3IkQE87uR/uFd2APeejMQ2HL9167lK3HT
 EJZg==
X-Gm-Message-State: AOAM530iO+QHPM3Nq5F4lXMb93jDM8cOclhN0gKqZ6MWtcfYhWI+yTQX
 AaGSSWLzW8tOQHhg536POAJ598BHJyUj1/WACJEkaA==
X-Google-Smtp-Source: ABdhPJxBe43PElopJYBgH3WYkwsOWPiEhEeB4+mk5TRxHLVn/PjNUSDREuXuhuj0ukYl48lBman3t5XihvpnkVZQbOE=
X-Received: by 2002:a17:906:948f:: with SMTP id
 t15mr1452728ejx.85.1627632895158; 
 Fri, 30 Jul 2021 01:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210729125044.3531457-1-kraxel@redhat.com>
In-Reply-To: <20210729125044.3531457-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Jul 2021 09:14:12 +0100
Message-ID: <CAFEAcA-WyCRfBdoK2AvaJ-=ttZ22em5cHiJZkA6xSB=UAdiS9A@mail.gmail.com>
Subject: Re: [PULL 0/7] Usb 20210729 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Jul 2021 at 13:58, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit f2da205cb4142259d9bc6b9d4596ebbe2426fe49:
>
>   Update version for v6.1.0-rc1 release (2021-07-27 18:07:52 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/usb-20210729-pull-request
>
> for you to fetch changes up to 30a20f2c5a9cf8f01ffcc918a7a5751dfe956524:
>
>   docs: Fold usb2.txt passthrough information into usb.rst (2021-07-29 11:18:55 +0200)
>
> ----------------------------------------------------------------
> usb: fixes for 6.1: usbredir, usb-host for windows, docs.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

