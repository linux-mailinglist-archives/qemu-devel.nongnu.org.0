Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0F72C833A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 12:30:14 +0100 (CET)
Received: from localhost ([::1]:59132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjhNl-0006Ap-8T
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 06:30:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjhM1-0005Bo-VU
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 06:28:26 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:33041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjhLy-0008Ix-2u
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 06:28:25 -0500
Received: by mail-ej1-x641.google.com with SMTP id 7so21137852ejm.0
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 03:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LA07lPvo+WA+bfhhRpCjl4qpgJlTsvnDzOz8NeRR8UU=;
 b=LFLbOC89Jdn2DWdBR0yLnZn6/y/41QvcZS42ucIObnqVp89WhKLxNqhZIRMCk4e61P
 s2A+BV2PoE9CCVogwlBLG8i9BtbhXjWiUn4TQbhiVGPm/kiTDr7TtS9vlbey5ST77JKD
 kXeSZ0BxGTkuQzA2SrgKpFbnfhMYM2rcfLnMmY1q5SdblTg5Z9GLfil+4nPErbpRo5id
 l+H+umFeFAXDzit3s0E1y10fnc2cFonpSfaandTzlYSZcE8AQWObiUR4rzFBrMDI1eIb
 la382lZZDsrwcEgZngRg1zP0rHwMJu9Rt8c7QpMiRfdr7gRyvecXfJOgWiTPXl7g4OCb
 +e+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LA07lPvo+WA+bfhhRpCjl4qpgJlTsvnDzOz8NeRR8UU=;
 b=kYjS7Li3dGRyNYl4igJoEVWdjjuDNaq0vc+AX9Zm64AtyLLfQhfxnNwWXUQeWEYrTv
 E+Vyx0rRpmCc3dT/LN7lSX9/JnlOW4ZBmUlFaSFFf4rSkfzpbduvEYZCj7Ubyu7hrHCW
 t5TckOHqFBhKzOBqQGL3IYFyeDAA+hGpv/08UIJ0vZQkCkA3Ec7KKrSpHGC54mUBFN3w
 QMF8HpkswZN7n8enkkfbvUG4nKoM1cxvab/8cFjU8Xgvksgr8ghBsmj3Sz41BSHl9CVA
 a8GKL/2XctIieVgLBhxgEQ1E6A4/hltjJseSnzZS2NGOaDGt3w1HOi3HAKRCXxyw9AO0
 5vQQ==
X-Gm-Message-State: AOAM5319gG3DaFrM0v+ZWCi0yy4gZosOyvsO4vzuC3qAClKsN1dCDkCO
 iYaccMSuy2enzJhcvigjvd339pu3vRSwUGOvqUG4mg==
X-Google-Smtp-Source: ABdhPJwwS255NBysrGAQWAA6msvVhUdshK++Z5lKM3LCDORqoR9Ms0k+lBw4SoNBaXosGsrGPhQyMsl46Qz/rhtmBrw=
X-Received: by 2002:a17:906:b53:: with SMTP id
 v19mr20489511ejg.250.1606735700309; 
 Mon, 30 Nov 2020 03:28:20 -0800 (PST)
MIME-Version: 1.0
References: <20201117165312.118257-1-pbonzini@redhat.com>
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Nov 2020 11:28:08 +0000
Message-ID: <CAFEAcA-D0A=xvR7JZU55QiXDmMbhaBtxOA3PObMTcz6YtpF4sg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/29] kernel-doc: update from Linux 5.10
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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

On Tue, 17 Nov 2020 at 16:54, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> This series updates kernel-doc to Linux 5.10, which removes the need for
> all of our downstream patches (except for the syntax changes, of course).
> Sphinx 3 works, as do the QOM typedefs that needed QEMU-specific changes.
> All the patches apply cleanly.

This seems like a good way to update kernel-doc without the revision
history and/or the commits looking like a confusing mess. I note that
it will break bisection of the documentation builds for systems with
a Sphinx 3, though.

If we wanted to completely make the series bisection safe we could add
a patch at the start that simply comments out the five kernel-doc
directives in docs/devel/*.rst, and then have a final patch at the
end that reverts it. That seems like it would be simple enough and
it would avoid anybody doing a bisection run on a newer host having
to remember to put --disable-docs in their configure arguments.

>   scripts: kernel-doc: allow passing desired Sphinx C domain dialect

Your port of this kernel commit is missing the hunk which
must be applied to our docs/sphinx/kerneldoc.py:

--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -70,6 +70,11 @@ class KernelDocDirective(Directive):
         env = self.state.document.settings.env
         cmd = [env.config.kerneldoc_bin, '-rst', '-enable-lineno']

+       # Pass the version string to kernel-doc, as it needs to use a different
+       # dialect, depending what the C domain supports for each specific
+       # Sphinx versions
+        cmd += ['-sphinx-version', sphinx.__version__]
+
         filename = env.config.kerneldoc_srctree + '/' + self.arguments[0]
         export_file_patterns = []

Without that the docs do not build on Sphinx 3.2.

More generally it would probably be reasonable to sync also
kerneldoc.py -- we're only slightly adrift of the kernel version
and we don't need any of the changes the kernel has, but syncing
it at the same time we sync kernel-doc is probably less confusing.

I did a diff of the final kernel-doc against the kernel version.
Mostly the diff looks like changes we want (and it's pretty small,
which is great). This hunk, however:

@@ -1758,7 +1758,7 @@
     # If you mess with these regexps, it's a good idea to check that
     # the following functions' documentation still comes out right:
     # - parport_register_device (function pointer parameters)
-    # - atomic_set (macro)
+    # - qatomic_set (macro)
     # - pci_match_device, __copy_to_user (long return type)

is an unintentional change from QEMU commit d73415a31547, which
did a global search-and-replace of a function name.
We should probably add a patch to this series to
revert it, so we stay as close to the kernel's copy of the
script as possible.

I tested this patchset with builds using sphinx 1.6,
2.0, 2.4, 3.0 and 3.2; other than the kerneldoc.py change
mentioned above there were no problems.

thanks
-- PMM

