Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79B83010C5
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 00:15:34 +0100 (CET)
Received: from localhost ([::1]:46270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l35eP-0005hb-VH
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 18:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1l35bp-0004Ml-Nc
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 18:12:53 -0500
Received: from mail-io1-f53.google.com ([209.85.166.53]:42346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1l35bo-0000q0-4Q
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 18:12:53 -0500
Received: by mail-io1-f53.google.com with SMTP id z22so14588389ioh.9
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 15:12:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pw/SiTsbjyxSklHSrzrwfBDpRJi6LbmBB5n9d48G3cI=;
 b=ppu2vEgIk35+dHc55fxAB1JGcNZjr7UydxSKA0kPHK2cjf8CetEkRCT6ZjCADFrESJ
 7jvTDJ3G17xSz3HIdgVqs8TmxzT8F1kf7BSx4EHNF9ydlPR50swNuqFHMtBcd6Cxmnk0
 zqo1WdgRpNv4sU5Wb8LkAwGv+lye7/94fMmMG5dZksMgb8azX9xWrTSr0EHHY8GUUljr
 T4W4slumCXdEXxqOrGWan/ymMiYBYDu5NqpPZoyuEFZzlP5xyHvkf3fBFuWW28LyBUVP
 z6/SLDwQKY+85OR2WkWP6Dll6upqG3qJWjdKMgP+PP7zFZLIU2dPrxjNGQNKoqnvwnND
 mBGw==
X-Gm-Message-State: AOAM531WN4sJ4VHstC3BHXWFOca/XXZq2SeITuJzD5H1h1NpgqUBl4b5
 Hn+qU1LKdEA50oqw/DageB+zIPp4i4w=
X-Google-Smtp-Source: ABdhPJx9vx1LkN2go5lSYmmcdqdmH8WfqDbvUuXuOFYOrZBrM01pUBkvx/SoBB2Z3KxB0mR11odF6g==
X-Received: by 2002:a6b:f714:: with SMTP id k20mr2879989iog.70.1611357170392; 
 Fri, 22 Jan 2021 15:12:50 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com.
 [209.85.166.41])
 by smtp.gmail.com with ESMTPSA id n10sm7099186ila.69.2021.01.22.15.12.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 15:12:50 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id y19so14618361iov.2
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 15:12:49 -0800 (PST)
X-Received: by 2002:a05:6e02:1c2c:: with SMTP id
 m12mr3099649ilh.173.1611357169657; 
 Fri, 22 Jan 2021 15:12:49 -0800 (PST)
MIME-Version: 1.0
References: <20210122201113.63788-1-j@getutm.app>
 <20210122201113.63788-5-j@getutm.app>
 <CAFEAcA9PONBh2N9msXj=X86U40Y=BTwoGO0Vx5h5Vq72zSSkWQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9PONBh2N9msXj=X86U40Y=BTwoGO0Vx5h5Vq72zSSkWQ@mail.gmail.com>
From: Joelle van Dyne <j@getutm.app>
Date: Fri, 22 Jan 2021 15:12:38 -0800
X-Gmail-Original-Message-ID: <CA+E+eSBesbWhn82hXbZ6L0byL80jRUCx80_YvjRUwgNBxvDt+g@mail.gmail.com>
Message-ID: <CA+E+eSBesbWhn82hXbZ6L0byL80jRUCx80_YvjRUwgNBxvDt+g@mail.gmail.com>
Subject: Re: [PATCH v7 04/11] slirp: feature detection for smbd
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.53; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f53.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Jason Wang <jasowang@redhat.com>, Joelle van Dyne <j@getutm.app>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 22, 2021 at 2:49 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 22 Jan 2021 at 20:16, Joelle van Dyne <j@getutm.app> wrote:
> >
> > Replace Windows specific macro with a more generic feature detection
> > macro. Allows slirp smb feature to be disabled manually as well.
> >
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > ---
>
>
> > +if test "$slirp_smbd" = "yes" ; then
> > +  echo "CONFIG_SLIRP_SMBD=y" >> $config_host_mak
> > +  echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
> > +fi
>
> This sets "CONFIG_SLIRP_SMBD" and "CONFIG_SMBD_COMMAND"...
>
> >  if test "$vde" = "yes" ; then
> >    echo "CONFIG_VDE=y" >> $config_host_mak
> >    echo "VDE_LIBS=$vde_libs" >> $config_host_mak
> > diff --git a/meson.build b/meson.build
> > index 6c3ee7f8ca..9577138d7f 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -2331,7 +2331,7 @@ summary_info += {'sphinx-build':      sphinx_build.found()}
> >  summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
> >  # TODO: add back version
> >  summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
> > -if slirp_opt != 'disabled'
> > +if slirp_opt != 'disabled' and 'HAVE_HOST_SMBD' in config_host
>
> ...but this is looking for "HAVE_HOST_SMBD". Should it be something else?
Yes, it is a typo, will fix.

-j
>
> >    summary_info += {'smbd':            config_host['CONFIG_SMBD_COMMAND']}
> >  endif
> >  summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
>
> thanks
> -- PMM

