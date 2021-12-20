Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4674047B1DA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:08:21 +0100 (CET)
Received: from localhost ([::1]:51306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzM96-0007Yx-Cq
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:08:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mzKnb-0007IF-AN
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:42:03 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:36503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mzKnZ-0000Bs-3Z
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:42:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Puejg25mMRGD9Oapdn2M+k/U3PZ3fvS5l5i98qDb/tA=; b=jTIWP12FXWuLtTjkd8tO7ajwvh
 4NBb4zPeWmqDIb8v53IgLUzHrKteS8V3Uxz2YtjB2360VOMWF2SgJl9dFHxeFbFA9I7UCC7M+LM4m
 Z3zx4OWd9ce3MXkWxWDnTOkuOopnBiu8F09uxpcrVstu3PKS3oAwZVjqCdheq3ySh2y3iXM7aumQR
 rWY0odf98BnYmyFy7ewzHnipVx6AqnDV8EAFjKjIi9N3LvBlfvfODRxnO1yXxp9YrzQqQcphmHela
 oPz+7YLCeb9D4q92rnmpkk0AgRgW4LWl99nSePGFRP5RBmbG1fywb53BUIjN8nB7geFaQ/j7SSf3g
 9fWgp94PncARWpHXVo1NgNhFiYWD9oF/8Hj4o+RoRRbYOvyMVgeRz4LwxNOvypAWA9QR+ySLGxq4g
 sZcrzX5BLmBMR2/PihfFzfCT4ABnQ3nl5MVRJ+2+wNJTBaUMHESKj9eYyEEoM8RrkpsVLJW4N0pk7
 EIHotJbS7JZqkwfI+sRYqCKEAjOYWgU/M0XVHs8fwvGJH7pq8weZgNwr0Ruu2KiEiTTHluBfpLyiB
 VWq9qySZmmdRzWTl5gvZNPxivSQ8YyplFkZxjHuONWlVP3KjH9XpqrC7LXW7gef7ly/N74nPwucvP
 Mckf4dStwH4imZ8t+tzUMC0hFi2obElQ77yLb/nBc=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Alexandre Ratchov <alex@caoua.org>,
 Brad <brad@comstyle.com>
Subject: Re: [PATCH v2] audio: Add sndio backend
Date: Mon, 20 Dec 2021 16:41:31 +0100
Message-ID: <2493750.jclyaLVk8g@silver>
In-Reply-To: <YbxamMLKHp3IbtlW@moule.localdomain>
References: <YbxamMLKHp3IbtlW@moule.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 17. Dezember 2021 10:38:32 CET Alexandre Ratchov wrote:
> sndio is the native API used by OpenBSD, although it has been ported to
> other *BSD's and Linux (packages for Ubuntu, Debian, Void, Arch, etc.).
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>
> Signed-off-by: Alexandre Ratchov <alex@caoua.org>
> ---
> 
> Thank you for the reviews and all the comments. Here's a second diff
> with all the suggested changes:
> 
> - Replace ISC license by SPDX-License-Identifier header
> - Fix units (milli- vs micro-) in comment about SNDIO_LATENCY_US
> - Drop outdated comment about the "size" argument of sndio_get_buffer_out()
> - Fix AUDIO_FORMAT_U32 handling (missing "break" statement)
> - Set {read,write] methods to audio_generic_{read,write} (fixes craches)
> - Check if backend is enabled in sndio_poll_event()
> - Use https://sndio.org in description
> - Mark options as available after 7.0 release (instead of 6.2)
> - Describe sndio-specific options (dev, latency) in qemu-options.hx
> - Add myself as reviewer to MAINTAINERS
> - Style fixes: no space after function names, use 4-space indent
> - Don't use "return foo()" if foo() returns void
> - Include backend to audio_drivers_priority[]
> 
> Tested on OpenBSD, works as expected!
> 
>  MAINTAINERS            |   5 +
>  audio/audio.c          |   1 +
>  audio/audio_template.h |   2 +
>  audio/meson.build      |   1 +
>  audio/sndioaudio.c     | 555 +++++++++++++++++++++++++++++++++++++++++
>  meson.build            |   9 +-
>  meson_options.txt      |   4 +-
>  qapi/audio.json        |  25 +-
>  qemu-options.hx        |  16 ++
>  tests/vm/freebsd       |   3 +
>  10 files changed, 618 insertions(+), 3 deletions(-)
>  create mode 100644 audio/sndioaudio.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7543eb4d59..76bdad064f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2307,6 +2307,7 @@ X: audio/jackaudio.c
>  X: audio/ossaudio.c
>  X: audio/paaudio.c
>  X: audio/sdlaudio.c
> +X: audio/sndio.c
>  X: audio/spiceaudio.c
>  F: qapi/audio.json
> 
> @@ -2349,6 +2350,10 @@ R: Thomas Huth <huth@tuxfamily.org>
>  S: Odd Fixes
>  F: audio/sdlaudio.c
> 
> +Sndio Audio backend
> +R: Alexandre Ratchov <alex@caoua.org>
> +F: audio/sndio.c
> +

Thanks Alexandre for volunteering as reviewer!

Gerd, would it be OK to set you as maintainer for now until new maintainer(s) 
adopt audio sections? Or should this start with "S: Orphan" instead?

Best regards,
Christian Schoenebeck



