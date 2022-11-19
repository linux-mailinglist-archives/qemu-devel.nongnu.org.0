Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D9D630F2A
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 15:32:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owOrh-00029n-Ht; Sat, 19 Nov 2022 09:30:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1owOrL-00027R-71
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 09:30:19 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1owOrJ-0004wZ-Kh
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 09:30:18 -0500
Received: by mail-pg1-x533.google.com with SMTP id q71so7387426pgq.8
 for <qemu-devel@nongnu.org>; Sat, 19 Nov 2022 06:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wqbhPy13cQ8a7cHLkKTIA9KBPlnCMqoxUjOkWYDYDHk=;
 b=fc+C2AETpuADUze4rZkBX9wQYlYDSIXlcB1B4ZifcwPJJbE1gOSdwY5AOmz9je6/ui
 F8qrKJNERKbQAFHy4Bp6TIavjQRGy8QI5S7SUBcEHwDQFyHEYowOel+Gco5HVW/hsN+0
 5C7gPWmRQNwsm/09vtVtGJmX+H0zwby6kC4s1IgdajuW5LxkRsCMAwUsslFqzpgvGKkJ
 ya1zuC4B0bb9pmhOd2KDkIWRppeH7TD6hPrZLA8TLwll6S7FdfeGfGVXbsMIcY7REWwB
 JycBqwhCbTA80LHytfuO2n5i2Jw1HSqTROMJ18chTraBlfoDapnvyoZqd+BnsNupfAb1
 OddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wqbhPy13cQ8a7cHLkKTIA9KBPlnCMqoxUjOkWYDYDHk=;
 b=fu5NSN1cjX6Wk5oyfn6KrYuCw2YU8Z8cJREx3MjYCn6/bjRqt71OMCc0I0+GsB2mZK
 +WHd1cQyfy+DbGzewqFZ30MmqbVwahcgZoJrJV4e5YYOvtYexRBZqUkUL3SUAWClpFJi
 tIgAS5LApXNUNxF8oNJdGSDjnc9s3QDzuxdJmifQoxFM2WiFWcFit6gd1UXnEJoLRLxD
 uqAml9TlOYdByCYsZ/DZXYpUWeBaqCVvfqSUCPe8RF5vrPoOlca3itE5+8UlIo0CfXWQ
 xdC9BcwJgrwnow9g7nzBcavk17oUoAZ/XmAi+ZAdvVYkiNhxuVTPyovtHYfbyintVr5O
 dO/A==
X-Gm-Message-State: ANoB5pkRbq3aZXats+Fesi21G6Um57HceyKHm47T7B6AzU3rSWx/ynQ4
 0K/tgHh5O8QxclSbnncndmBSqu95KPEGqBiX3Y0+zw==
X-Google-Smtp-Source: AA0mqf7Y8l07SgZohjLc7wAVhslKgOZVPnKi3SqXEV24PbmLkLqosxO8s9Cac9T/zNoh5qZwmDgvypcQKTTcKrP7c7U=
X-Received: by 2002:a63:5fd0:0:b0:476:f69d:9f with SMTP id
 t199-20020a635fd0000000b00476f69d009fmr10649015pgb.105.1668868215582; 
 Sat, 19 Nov 2022 06:30:15 -0800 (PST)
MIME-Version: 1.0
References: <20221108162324.23010-1-cfontana@suse.de>
 <980e2701-5271-8977-c574-f5b64e80e02b@suse.com>
In-Reply-To: <980e2701-5271-8977-c574-f5b64e80e02b@suse.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 19 Nov 2022 14:30:03 +0000
Message-ID: <CAFEAcA8e0j2J6hKvma=kPKK06wOEZTPssV6n775wmt7-cOezKw@mail.gmail.com>
Subject: Re: [PATCH] gtk: disable GTK Clipboard with a new option
 'gtk_clipboard'
To: Jim Fehlig <jfehlig@suse.com>
Cc: Claudio Fontana <cfontana@suse.de>, Gerd Hoffmann <kraxel@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
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

On Fri, 18 Nov 2022 at 22:26, Jim Fehlig <jfehlig@suse.com> wrote:
>
> I should make myself useful around here on occasion when items are within my
> skill set. But I already struggle to find time for that in the libvirt community
> :-).
>
> On 11/8/22 09:23, Claudio Fontana wrote:
> > The GTK Clipboard implementation may cause guest hangs.
> >
> > Therefore implement a new configure switch --enable-gtk-clipboard,
> > disabled by default, as a meson option.
> >
> > Regenerate the meson build options to include it.
> >
> > The initialization of the clipboard is gtk.c, as well as the
> > compilation of gtk-clipboard.c are now conditional on this new option
> > to be set.

> > diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> > index 2cb0de5601..a542853bfd 100644
> > --- a/scripts/meson-buildoptions.sh
> > +++ b/scripts/meson-buildoptions.sh
> > @@ -93,6 +93,7 @@ meson_options_help() {
> >     printf "%s\n" '  glusterfs       Glusterfs block device driver'
> >     printf "%s\n" '  gnutls          GNUTLS cryptography support'
> >     printf "%s\n" '  gtk             GTK+ user interface'
> > +  printf "%s\n" '  gtk-clipboard   clipboard support for the gtk UI (EXPERIMENTAL, MAY HANG)'
>
> Same here. None of the other options have such warning. Cant this be treated
> like the others, just another option to be enabled or disabled? Whether or not
> the option works is another matter.

Well, none of the other features have known bugs that cause QEMU to hang...

-- PMM

