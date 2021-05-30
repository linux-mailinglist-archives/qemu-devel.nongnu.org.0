Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E76395318
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 23:48:53 +0200 (CEST)
Received: from localhost ([::1]:39302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnTIi-0001AY-Bh
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 17:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lnTGb-0008Ex-5Q
 for qemu-devel@nongnu.org; Sun, 30 May 2021 17:46:41 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lnTGY-0003Np-Ov
 for qemu-devel@nongnu.org; Sun, 30 May 2021 17:46:40 -0400
Received: by mail-ej1-x634.google.com with SMTP id t15so650285eju.3
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 14:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iqQhEUpQe46P0+eOMHxvBwqW4fOCROGkCfXiTlIbqms=;
 b=r1uIO/knRsALe5mKt9DdPXwuqbr8w1tlA1AUt5+YIbOj5wjCGQRk2PO3k/wttdeDjM
 B4PYo4fI28FVMDP2PG+kkpR+dhfiBQy70zxjfESD+d0b/U8HdB1Gv4xOqPwDBYA4g4Pm
 wELanV5ILrmmPkM73LUJ59IG1Zwn1roQTQH1CDo2h+uvNOOFJF0DX4cQkm1JR0scrJZn
 +eTLcsYuyuCMqRlnMBv74XdGGzuR5ZLM10mN6w5Qpuh1mGmGI9M3TgUCkhWLtlLGAH+j
 oBEoWMJigsCu9//AuknZAG6Uw18nPEMzMOGR9aEeSS0WA/8whqjX7UeD3Teu0w0E+RNj
 WyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iqQhEUpQe46P0+eOMHxvBwqW4fOCROGkCfXiTlIbqms=;
 b=q8sUrktL2FoFWOEtWY6ZkHBxJGWIEcOwNeHFpPZqLzQc0wTaH/jiZk9arG78S0utLy
 vcC3oQVFhtdiAEbdevBD8EY5YdMvCGeqBOooQaMzo+hsJbz5wQX55Dwq6XbO8mh0w82C
 4RzYlzq2IuUp+O8oUGHzTsH6f1BoXPXlIi2sXtoTQwusKp9jY0gcX7BFYiF/0IwR5gK4
 dtt9zT56O/PqI32TAQfNuDOxq3GOGWjj2M00vKpFRLmjCByyxFNy9ojn+9rjPwI7l4Up
 msLr50FYSSMMdsBqQWWRm1l5JfS5fsVXYny9QLO75hRAXZQx0DO8+HTE6SJkVaStfx+R
 wVDQ==
X-Gm-Message-State: AOAM531c0jpkCirvtrQ+AsdkqAZFjlt5+xYhnaT163DF1Lu6CfLN0PTA
 u/SiUnW2YaHSmcUd4lu9VngFQxV0yaEYhDsvdFWvXQ==
X-Google-Smtp-Source: ABdhPJxp7SvXNJ6jxCv6DRB0zpyD7IFFx1+nH1o2P929GnJ5hVht8RYl03AJvBTA/+Ql4rCPLK2c0f6n+hp+R9bSgLg=
X-Received: by 2002:a17:906:5299:: with SMTP id
 c25mr4020056ejm.85.1622411197214; 
 Sun, 30 May 2021 14:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210528142202.2154592-1-kraxel@redhat.com>
In-Reply-To: <20210528142202.2154592-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 30 May 2021 22:46:08 +0100
Message-ID: <CAFEAcA8L_PQ9kC+QrAu86jGsdL864V6mShLUeFZPgu2AOAZjbw@mail.gmail.com>
Subject: Re: [PULL 0/3] Usb 20210528 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 May 2021 at 15:24, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit c8616fc7670b884de5f74d2767aade224c1c5c3a:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/gitlab-ci-20210527' into staging (2021-05-27 16:32:57 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/usb-20210528-pull-request
>
> for you to fetch changes up to fc967aad408eb4777b099d17ada1f39be5f6fd2e:
>
>   hw/usb: hcd-xhci-pci: Fix spec violation of IP flag for MSI/MSI-X (2021-05-28 09:10:20 +0200)
>
> ----------------------------------------------------------------
> usb: bugfixes for hid and xhci.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

