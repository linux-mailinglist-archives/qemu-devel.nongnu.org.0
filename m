Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018E2407003
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 18:54:37 +0200 (CEST)
Received: from localhost ([::1]:55842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOjnP-00013D-IW
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 12:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOjme-0000MA-OB
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 12:53:48 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOjmd-0001Ew-2P
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 12:53:48 -0400
Received: by mail-wr1-x435.google.com with SMTP id t18so3602575wrb.0
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 09:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JdSonDgYOt9Rv2znvcWod4dSXnqEeaoocG3SDnzReq0=;
 b=Msm+c5gnXhgePbmmLh/yx8mTJluz27vDnYZwcljNAMz8htTuxLDRqupurvCqFJGodd
 RUfsiahGSDlRi8pXAklb9+rWw9M38KMYaILIo1oXmENZkyZUz/qnaf8g6ExU9n8wYV+B
 4/QGetZ1DMNazanmWZaE3DgbQWkwAXkdJacgAcf00tNj3xg0KgcycxalgXuuU3kO1VZa
 4BdEwMXJRbmn56qW+PC+4t8En6+f8l/b3XZCe/TfePbAMMC4MRTuj0pD33JloN/kS3QC
 BiupBoV5cXrFp4vyaPVp2HiayTmAeA9z/ihZ9PfNs2VEduYEIhH7n2Iy/m3fpmQ/PDtq
 9ngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JdSonDgYOt9Rv2znvcWod4dSXnqEeaoocG3SDnzReq0=;
 b=Gkb9qRo2JRMFR0ne74ofi7Bl1Xu5GyE5LKXX6vNbkJ8Hv+OSmA+fECcx+ttDA/BnZ6
 qzAAboQnB2fZaeQcXCRt9HfzsYWwy7uQEE3DDjklEOq2NduaUOe/G5vzmo6W5isADPZ5
 bJD6tVvzmZ3HS3/uroFDull0M6Fs5l4W/bKkmZx5KVpx7Lr0GaOa0rkr3oq6kC2PO+Ns
 03G1YABk7swqNzEV6087DxZLSlyvP2/AsQ7ezIGKeGLV59r8YKSLHzuT/nej1OPReh4b
 L5J9oRf+Qf1jhrBXs6d/7sv2dlkWpAq54BU7zYFFbq45p0xgMkxdD6JnZhUCxX+EBq6m
 TdWA==
X-Gm-Message-State: AOAM532dBhweWswyFRSf8bHE+7LTsct8a8E8CN0+Kro48zbk4t+d5FUO
 3v4h051KfQG9ocSUzPL02BeCP0//OssV0kQpAxzn/Q==
X-Google-Smtp-Source: ABdhPJxyLen1Ewvn3vXF8lUjlzTZR3C8Mf3cfs2nCu8q+RQitjI3PKCkexMUWpQQAHc0QcGnlAJhlVK8BSveNudjYT8=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr10499413wrr.376.1631292825381; 
 Fri, 10 Sep 2021 09:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210910131709.3681492-1-kraxel@redhat.com>
In-Reply-To: <20210910131709.3681492-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Sep 2021 17:52:55 +0100
Message-ID: <CAFEAcA_1SdGuiEgquVE2T5p-x6YkJXwAou==wdVoZvRqcZzJDg@mail.gmail.com>
Subject: Re: [PULL 0/6] Vga 20210910 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 10 Sept 2021 at 14:19, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit bd662023e683850c085e98c8ff8297142c2dd9f2:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20210908' into staging (2021-09-08 11:06:17 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/vga-20210910-pull-request
>
> for you to fetch changes up to 6335c0b56819a5d1219ea84a11a732d0861542db:
>
>   qxl: fix pre-save logic (2021-09-10 12:23:12 +0200)
>
> ----------------------------------------------------------------
> virtio-gpu + ui: fence syncronization.
> qxl: unbreak live migration.
>
> ----------------------------------------------------------------

Hi; this fails to build on the ppc64 system:

../../ui/egl-helpers.c:79:6: error: no previous prototype for
'egl_dmabuf_create_sync' [-Werror=missing-prototypes]
   79 | void egl_dmabuf_create_sync(QemuDmaBuf *dmabuf)
      |      ^~~~~~~~~~~~~~~~~~~~~~
../../ui/egl-helpers.c:95:6: error: no previous prototype for
'egl_dmabuf_create_fence' [-Werror=missing-prototypes]
   95 | void egl_dmabuf_create_fence(QemuDmaBuf *dmabuf)
      |      ^~~~~~~~~~~~~~~~~~~~~~~


The prototype is hidden behind CONFIG_GBM, but the definition is not.

Then the callsites fail:

../../ui/gtk-gl-area.c: In function 'gd_gl_area_draw':
../../ui/gtk-gl-area.c:77:9: error: implicit declaration of function
'egl_dmabuf_create_sync' [-Werror=implicit-function-declaration]
   77 |         egl_dmabuf_create_sync(dmabuf);
      |         ^~~~~~~~~~~~~~~~~~~~~~
../../ui/gtk-gl-area.c:77:9: error: nested extern declaration of
'egl_dmabuf_create_sync' [-Werror=nested-externs]
../../ui/gtk-gl-area.c:81:9: error: implicit declaration of function
'egl_dmabuf_create_fence' [-Werror=implicit-function-declaration]
   81 |         egl_dmabuf_create_fence(dmabuf);
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../../ui/gtk-gl-area.c:81:9: error: nested extern declaration of
'egl_dmabuf_create_fence' [-Werror=nested-externs]


../../ui/gtk-egl.c: In function 'gd_egl_draw':
../../ui/gtk-egl.c:100:9: error: implicit declaration of function
'egl_dmabuf_create_fence' [-Werror=implicit-function-declaration]
  100 |         egl_dmabuf_create_fence(dmabuf);
      |         ^~~~~~~~~~~~~~~~~~~~~~~
../../ui/gtk-egl.c:100:9: error: nested extern declaration of
'egl_dmabuf_create_fence' [-Werror=nested-externs]
../../ui/gtk-egl.c: In function 'gd_egl_scanout_flush':
../../ui/gtk-egl.c:301:9: error: implicit declaration of function
'egl_dmabuf_create_sync' [-Werror=implicit-function-declaration]
  301 |         egl_dmabuf_create_sync(vc->gfx.guest_fb.dmabuf);
      |         ^~~~~~~~~~~~~~~~~~~~~~
../../ui/gtk-egl.c:301:9: error: nested extern declaration of
'egl_dmabuf_create_sync' [-Werror=nested-externs]


You can probably repro this on any system which has the opengl
libraries installed but not libgbm.

-- PMM

