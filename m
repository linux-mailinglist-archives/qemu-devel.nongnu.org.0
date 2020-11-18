Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBB12B83F1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:35:01 +0100 (CET)
Received: from localhost ([::1]:55870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfSIG-00027v-HI
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:35:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfRr8-0005jJ-CP
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:06:58 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:46187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfRr5-0000OR-JO
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:06:57 -0500
Received: by mail-ed1-x543.google.com with SMTP id t11so2948607edj.13
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 10:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vJkHfOYZOQJ/egzDTZxxJpR5JdzIGzTv3UwEtWSZ/4g=;
 b=r+Yt5A0KmzIrpNT2EWHRvGnC9y5CkXmhQxtZ/U0bogwnwxZBg3v38Bcy4fj6kKUSm6
 Pg1FWw1otgnCuvU7e6csE105gum9Ub1BhX7DZKx+2765DgS1jitTnQx80VliaHi97Vui
 8orF/y3j3NVYcvw05XcVp+1o4QoUu5P9GbHDtqj1idTl3lnND4ivwiP2B2L39uX41a5P
 tDUScUzElyil8HKQvUEDwfkulFG/cJqSB3bUxWUXnhmTprP61jVRf6jc0TKeHRZ9IuSi
 W5h1VxOmA+k3xXbla9uyFeVWhUHjdY4kNZcrSoPy/+0LjPauK+DJN8Z9DGK7qwmOpXGB
 NErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vJkHfOYZOQJ/egzDTZxxJpR5JdzIGzTv3UwEtWSZ/4g=;
 b=HrqyVEOBLSIu9oRblrVqioyK3AKj9Y98NRuiXD1DasIm5ifW/x6no7ZoEnLcWXAAqV
 SsgUuPrbqbYiv8hKsoCBoS9/IMm/HrpX5XRdf0QAiZZoQ29OhoafEl9Jsk2WQnQee9ae
 tiqL8LPT1XImL9Dwt4PZdRlVajizCU2a2akIRrtYk1j2p1mhdyL9uPf+CIMLJyImVZ/O
 tpWFoA6nKvy3oCarWumOemL71L1a5K1IUhpLvTkloONERIxB4U/p1Z1iXgy3Py/KURPl
 5Z/1lJqO3wP+vZoBK8u4apFqljapfZJD80Lyu+uu8bY6grqDdqynUrlBodyUGp3iGbQ4
 EeDA==
X-Gm-Message-State: AOAM533VoGtLbSVzLNKL8uTAgXshPL4KjJAahmcA1SZ3l8NUO7wfFlRT
 fHpMUr04ma/2LyS3wgU262GbKxsG6r7hL5/D2dlemw==
X-Google-Smtp-Source: ABdhPJyS2tZYOZHGcU5a1igmqxWqDjlDTg1h206W4s7JzXEQO6S1s73NiKAqyWFq/ePKIdXn6TANX3xkI7Ayp0UAt0c=
X-Received: by 2002:a50:fa92:: with SMTP id w18mr26227687edr.44.1605722812147; 
 Wed, 18 Nov 2020 10:06:52 -0800 (PST)
MIME-Version: 1.0
References: <20201118165340.166821-1-pbonzini@redhat.com>
In-Reply-To: <20201118165340.166821-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Nov 2020 18:06:40 +0000
Message-ID: <CAFEAcA8krPNZbYEum3cBHpSwCQnETCp8PQjaksW3Gpj-_sK4Ew@mail.gmail.com>
Subject: Re: [PATCH] build: add "make uninstall" target
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Wed, 18 Nov 2020 at 16:53, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Do not hide the ninja "uninstall" target, so that "make uninstall" forwards
> the request to "ninja uninstall".
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1371915
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Doesn't quite work, sadly:

[...]
Deleted: /tmp/qemu-inst/usr/local/share/doc/qemu/system/i386
Deleted: /tmp/qemu-inst/usr/local/share/doc/qemu/system
Deleted: /tmp/qemu-inst/usr/local/share/doc/qemu/specs/_static
Deleted: /tmp/qemu-inst/usr/local/share/doc/qemu/specs
Deleted: /tmp/qemu-inst/usr/local/share/doc/qemu/tools/_static
Deleted: /tmp/qemu-inst/usr/local/share/doc/qemu/tools
Deleted: /tmp/qemu-inst/usr/local/share/doc/qemu/interop/_static
Deleted: /tmp/qemu-inst/usr/local/share/doc/qemu/interop
Deleted: /tmp/qemu-inst/usr/local/share/doc/qemu
Deleted: /tmp/qemu-inst/usr/local/share/doc
Could not delete /tmp/qemu-inst/usr/local/share: [Errno 39] Directory
not empty: '/tmp/qemu-inst/usr/local/share'.
Deleted: /tmp/qemu-inst/usr/local/var/run
Deleted: /tmp/qemu-inst/usr/local/var
Could not delete /tmp/qemu-inst/usr/local: [Errno 39] Directory not
empty: '/tmp/qemu-inst/usr/local'.
Could not delete /tmp/qemu-inst/usr: [Errno 39] Directory not empty:
'/tmp/qemu-inst/usr'.
Could not delete /tmp/qemu-inst: [Errno 39] Directory not empty:
'/tmp/qemu-inst'.

Uninstall finished.

Deleted: 415
Failed: 4

Remember that files created by custom scripts have not been removed.

and these files are left in the install tree:

/tmp/qemu-inst/usr/local/share/locale/it/LC_MESSAGES/qemu.mo
/tmp/qemu-inst/usr/local/share/locale/de_DE/LC_MESSAGES/qemu.mo
/tmp/qemu-inst/usr/local/share/locale/bg/LC_MESSAGES/qemu.mo
/tmp/qemu-inst/usr/local/share/locale/hu/LC_MESSAGES/qemu.mo
/tmp/qemu-inst/usr/local/share/locale/fr_FR/LC_MESSAGES/qemu.mo
/tmp/qemu-inst/usr/local/share/locale/zh_CN/LC_MESSAGES/qemu.mo
/tmp/qemu-inst/usr/local/share/locale/tr/LC_MESSAGES/qemu.mo
/tmp/qemu-inst/usr/local/share/locale/sv/LC_MESSAGES/qemu.mo

AIUI these are installed by meson's i18n module, so it seems like
a meson bug that that module doesn't play nicely with meson's
uninstall functionality. Looks like this was reported to meson
upstream in 2017, still not fixed:
https://github.com/mesonbuild/meson/issues/1601

thanks
-- PMM

