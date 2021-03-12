Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3544338FA3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:17:22 +0100 (CET)
Received: from localhost ([::1]:59196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKibR-0002xi-Km
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiEb-000557-H7
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:53:45 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:37628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiEY-0002tu-PX
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:53:45 -0500
Received: by mail-ed1-x52a.google.com with SMTP id x21so8051525eds.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TtbBjqrBF+oWOY9s4lbcp/qOT9jlVezhJoihPdEOHCQ=;
 b=FE3jRQQiBVXjoHeoyC/T02PXkar43tg3U0nAYYzP0bqNx9amgJGqnrV5vgRZw6UMTk
 /jBlyGLJWXHWBQGzm5iBTCDODIh7mIACIW8U5nHZ74kdeNzSGQ0UH7+Va/ND2TfsQ1Wo
 VGBZWuzfhQY0PbRTJPP23XYf752Eg7fOk8ItcOasyskJkxBw1dfbDVDdlXG6RRuaYE83
 h4BomT+YOFDxBQz2wld428xU9jA9R3w/sSXM1SSic4w4Ylq7i+Qwg0QwhyDblKrVJdEs
 DyZNzhmPMZhvoWjSKb2h6rQgV+yKtEm7hJE1HOKFagCyz4IDQYbiJ2khU+nHfQHYY0M7
 3vTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TtbBjqrBF+oWOY9s4lbcp/qOT9jlVezhJoihPdEOHCQ=;
 b=EFpRy/+9amyIrpsQM27xfh1dB2KI7dQHCEkYsHZygXSsFk9llV1Sb0ZR6VcFWuju4S
 +qA+PM3TOJWAcaTMW5dGZg5YPBcFBWql7ikCIDNGlaIs5ya2c98K/GVbM8+aXpoAOpHJ
 nkF2mMJIhQ08mYWp1ko6wochnWtLtTUtTbZP76i7BCEUrpnV3s0d+kL0hf4Oof21hVVY
 +KqWVA+XBFhMyySr30NCuDeOeFtZvvZzDJmzsiLpJGanXu4c52dv7DZOyHY/VhZ7iBti
 inAa4zwaTLIeG2nGbl7ElMvUV8cmknNhfwzJe5t2buPKaRui4SSv0Dh9iDn6FlFU1pfW
 /DwA==
X-Gm-Message-State: AOAM530uSmvMN1w+r465rP6No5TSDg0Q8H8u8gi/vPB17EJSfUBnz+41
 xf9KTgSh3ZsgZuVodJtdnuNdOuT1nxvAJVCOaCvXcw==
X-Google-Smtp-Source: ABdhPJzd2df3Pe5ifJ1ck5YKEl/IJOnfstqK4O4rE5lh/6ZCNdxUIG5poj1GoR9P6pFN7hGgTkhopJ9LZhP93UoQrS4=
X-Received: by 2002:aa7:d686:: with SMTP id d6mr14605660edr.146.1615557221232; 
 Fri, 12 Mar 2021 05:53:41 -0800 (PST)
MIME-Version: 1.0
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
In-Reply-To: <20210310041002.333813-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 13:53:22 +0000
Message-ID: <CAFEAcA-AN4YwsZdX16+a0yX8krMLq7tbL0v5vgLW+aDYO+O=ZA@mail.gmail.com>
Subject: Re: [PULL 00/20] ppc-for-6.0 queue 20210310
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Mar 2021 at 04:10, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit b2ae1009d7cca2701e17eae55ae2d44fd22c942a:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20210307' into staging (2021-03-09 13:50:35 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20210310
>
> for you to fetch changes up to eb7f80fd26d73e7e1af105431da58971b1dba517:
>
>   spapr.c: send QAPI event when memory hotunplug fails (2021-03-10 09:07:09 +1100)
>
> ----------------------------------------------------------------
> ppc patch queue for 2021-03-10
>
> Next batch of patches for the ppc target and machine types.  Includes:
>  * Several cleanups for sm501 from Peter Maydell
>  * An update to the SLOF guest firmware
>  * Improved handling of hotplug failures in spapr, associated cleanups
>    to the hotplug handling code
>  * Several etsec fixes and cleanups from Bin Meng
>  * Assorted other fixes and cleanups
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

