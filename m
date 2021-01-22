Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1223E301051
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 23:52:17 +0100 (CET)
Received: from localhost ([::1]:58666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l35Hr-0006L0-S2
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 17:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l35Fg-00053v-BZ
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 17:50:00 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:36979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l35Fd-0001Ut-1F
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 17:49:59 -0500
Received: by mail-ej1-x62b.google.com with SMTP id kg20so9442909ejc.4
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 14:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=85LZoCAz7VOE8LTdqObQP6vncvcJuy8ZX7oI/5jc3pc=;
 b=kdSFeBs3f9vklguor5jWwC6zG6RgcLI86FVYg+RE4TdtBd9ySCUFE0T6mkit6igzeX
 v1qg4Rhw7+JnAICtIpS9MqNqWXAuWUOyfvruIi1cAtvSdhIlBfZIz5MkRr2B/ZRklLYy
 R8+FtDpKHbD1ZSnys/ImcP4OInKgSiQm8V5GMRPHalNka/YjJP+vxOtui0AV4OhD09cg
 Hgnq9dJXoS/DH9aCklpeowqx0IBisFXRCLhglqqsOV2548jjgB9RICVAomup5ewVVxOV
 fukm+DUNaMYBdf4VbVCX2krm0dedHt8HGBj4ZbxUUPfmBz+x7qwHp9+I8SLAThF0knFR
 e4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=85LZoCAz7VOE8LTdqObQP6vncvcJuy8ZX7oI/5jc3pc=;
 b=sq2mRfzo0qOqE21+sfC25LPUl07yrCx3Xypo4K9nsZmMVem/tMGCQ65wbyc/mx19V9
 2bZKhquFWw0KpCFqTo99N5OyUFAKW8PFViArzmw/KdsOMC+/14FSCf/s9//v5Vwmubdl
 yLhf1H+BDhowt1JIHGv+mBO99girToGf6NgWH8CYd6dF7140ocWyZCdscM6x+Pw+CX6W
 OQ5tjlC+D1HEn8OFcyHzIH9VXJlr7yglnNZhzO3OsDhRO3MCJT2qTTfeLFPlW+EV6h0c
 SS4pGOb2j0J67HT4sjck24dbR1OggQXti03KwkcRuM8RyVEkADm/DfjyKlBeMOQrzg9C
 2NyA==
X-Gm-Message-State: AOAM5307IzrdYZNQE82Ew3Svn23SWJtN/gTOLc1/SxKQtwGmd3aWZTBs
 vIoumXrRWWzp/T6nXFy8m+6nAKhSEKHzm6aTY407KQ==
X-Google-Smtp-Source: ABdhPJyDxPraHiU7SGVkxJM49E7aBs5SmsavJVHOebXpwHpdCjCsGEFDBX1Vk5WfYay3vwANEcuatMNEl6cQHVNmohA=
X-Received: by 2002:a17:906:4bc2:: with SMTP id x2mr4347957ejv.4.1611355794060; 
 Fri, 22 Jan 2021 14:49:54 -0800 (PST)
MIME-Version: 1.0
References: <20210122201113.63788-1-j@getutm.app>
 <20210122201113.63788-5-j@getutm.app>
In-Reply-To: <20210122201113.63788-5-j@getutm.app>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 22:49:42 +0000
Message-ID: <CAFEAcA9PONBh2N9msXj=X86U40Y=BTwoGO0Vx5h5Vq72zSSkWQ@mail.gmail.com>
Subject: Re: [PATCH v7 04/11] slirp: feature detection for smbd
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Jan 2021 at 20:16, Joelle van Dyne <j@getutm.app> wrote:
>
> Replace Windows specific macro with a more generic feature detection
> macro. Allows slirp smb feature to be disabled manually as well.
>
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---


> +if test "$slirp_smbd" = "yes" ; then
> +  echo "CONFIG_SLIRP_SMBD=y" >> $config_host_mak
> +  echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
> +fi

This sets "CONFIG_SLIRP_SMBD" and "CONFIG_SMBD_COMMAND"...

>  if test "$vde" = "yes" ; then
>    echo "CONFIG_VDE=y" >> $config_host_mak
>    echo "VDE_LIBS=$vde_libs" >> $config_host_mak
> diff --git a/meson.build b/meson.build
> index 6c3ee7f8ca..9577138d7f 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2331,7 +2331,7 @@ summary_info += {'sphinx-build':      sphinx_build.found()}
>  summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
>  # TODO: add back version
>  summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
> -if slirp_opt != 'disabled'
> +if slirp_opt != 'disabled' and 'HAVE_HOST_SMBD' in config_host

...but this is looking for "HAVE_HOST_SMBD". Should it be something else?

>    summary_info += {'smbd':            config_host['CONFIG_SMBD_COMMAND']}
>  endif
>  summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}

thanks
-- PMM

