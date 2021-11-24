Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2729345B66A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 09:23:56 +0100 (CET)
Received: from localhost ([::1]:38454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpnZL-0006LG-A0
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 03:23:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mpnM6-0002th-35
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 03:10:14 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=46830
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mpnM3-0003K9-A2
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 03:10:13 -0500
Received: by mail-io1-xd2d.google.com with SMTP id x6so2046748iol.13
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 00:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EZ/Gp0/bIa3NAGp4bQXoifC3mX6gd6afy3LOJOsIqZc=;
 b=Xi2a1NtS0PYWhaWPPIY5CIsLVjSSRm/wEQ1G8247O71IyhwxaTGL4Sm80gVDC2Lo+Q
 J5tGordeJo9I+GzDcevQYG8/T+yr9JgZca1DlH65l0RfZN28/oqw0J9ZfTKGQOVzi4Gj
 Fj2OCYe31HL9lkchfizCdX8gzveFzX4Nk6MVTPce6Vquc8ZJJn65MR1zvqApWEzDY50w
 +yQgKEnc029ce4zbU7ZJSypc1nFoOrdjtXjBZiRitS2ZxmZ7n7ATFbdPazHFlLfBTqbW
 aJh1lL8sqDgNVICKJk/sAEys0bPD2nBtAezZxRw/L8AbNl4uNOJpy+BCbKDvvNXcNzUM
 7Cpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EZ/Gp0/bIa3NAGp4bQXoifC3mX6gd6afy3LOJOsIqZc=;
 b=F3Md1P7E+QmBm11G3xkLOZxi2qJcsNy6q3hm9K67DYG3k4it0Yss+RZ4oEK1q7+Qrw
 +HEC5AqiW9g9E7KuxkWBwAR8D/pJibiQJEnf5h9msjYoNuprs7V3dthO9omAcjLJ+n13
 12CDlvZUf8sa5/UkCROZLLE7wFvXzAspOoDgjMXEkoq6u0U5Bh3cvLVJ+C0WBVfvZu2j
 H2RIOwIVTvX1PzDYYkRGPkJCcHkBe+rOm7LrHS+fEDcsAR2lx/mqaO+MIrC5FbCvGDaA
 mEh3K07ksCbarCEhuvjRMr53hsvgIgTEG653DC1WZcR/pZBTccV+qwGkUDMpgdLeI3rE
 FCrw==
X-Gm-Message-State: AOAM533e1WQa1xEGr/3KGRUt8xHkCg1vl5bY/MWFvwIBQa81DhBLeEza
 Za/6on3gEVo6X3u3uMOBmy54yOdorkRElgWwsUY=
X-Google-Smtp-Source: ABdhPJxJMiCXi5NdYvr6cJBN7bM40uI1k50QZTmaKzkatH4nH15HhNM+2nKcB5qktxnNd8TOzoQclJ9difc0jrx3vrA=
X-Received: by 2002:a6b:ea0a:: with SMTP id m10mr11716915ioc.91.1637741406519; 
 Wed, 24 Nov 2021 00:10:06 -0800 (PST)
MIME-Version: 1.0
References: <20211124080519.440677-1-philmd@redhat.com>
In-Reply-To: <20211124080519.440677-1-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 24 Nov 2021 18:09:40 +1000
Message-ID: <CAKmqyKNfC5E8JgUUeY1ZgMpyyqYvBR825W9T8146MmPyfOWTOQ@mail.gmail.com>
Subject: Re: [qemu-web PATCH v3] Add Sponsors page
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Markey <admin@fosshost.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 6:05 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Add a page listing QEMU sponsors.
>
> For now, only mention Fosshost which requested to be listed:
> https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05381.html
>
> Cc: Thomas Markey <admin@fosshost.org>
> Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/2
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Since v2:
> - don't explicitly state /what/ we're using the resource for,
>   just that we've been granted it (danpb)
> - list Azure Cloud credits (Daniel)
> - list PLCT Lab (Paolo)
> - list Wow/CIP United again, since other are listed (Phil)
>   therefore do not include Stefan R-b tag.
> ---
>  _includes/footer.html |  3 +++
>  assets/css/style.css  |  6 +++++-
>  sponsors.md           | 21 +++++++++++++++++++++
>  3 files changed, 29 insertions(+), 1 deletion(-)
>  create mode 100644 sponsors.md
>
> diff --git a/_includes/footer.html b/_includes/footer.html
> index 1a0b960..b1f3f0c 100644
> --- a/_includes/footer.html
> +++ b/_includes/footer.html
> @@ -15,6 +15,9 @@
>         <div id=3D"conservancy">
>                 QEMU is a member of <a href=3D"{{ relative_root }}/conser=
vancy/">Software Freedom Conservancy</a>
>         </div>
> +       <div id=3D"sponsors">
> +               QEMU has <a href=3D"{{ relative_root }}/sponsors/">sponso=
rs</a>
> +       </div>
>         <div id=3D"licenses">
>                 <a href=3D"{{ relative_root }}/license.html">Website lice=
nses</a>
>         </div>
> diff --git a/assets/css/style.css b/assets/css/style.css
> index 88f7e85..aede79a 100644
> --- a/assets/css/style.css
> +++ b/assets/css/style.css
> @@ -533,7 +533,7 @@
>                 padding-left: 1em;
>         }
>
> -       #licenses, #conservancy, #edit-page {
> +       #licenses, #conservancy, #sponsors, #edit-page {
>                 padding: 0em;
>                 padding-left: 1em;
>                 padding-right: 1em;
> @@ -552,6 +552,10 @@
>                 float: left;
>         }
>
> +       #sponsors {
> +               float: left;
> +       }
> +
>         #edit-page a {
>                 overflow: hidden;
>                 background: url(../images/edit-page.png);
> diff --git a/sponsors.md b/sponsors.md
> new file mode 100644
> index 0000000..29ce66c
> --- /dev/null
> +++ b/sponsors.md
> @@ -0,0 +1,21 @@
> +---
> +title: QEMU sponsors
> +permalink: /sponsors/
> +---
> +
> +QEMU has sponsors!
> +
> +[Works on Arm](https://developer.arm.com/solutions/infrastructure/works-=
on-arm)
> +has provided QEMU access to a dedicated physical compute host.
> +
> +[Fosshost](https://fosshost.org/) has provided QEMU access to a dedicate=
d
> +physical compute host.
> +
> +[CIP United](https://www.cipunited.com/) has provided QEMU access to a
> +dedicated physical compute host.
> +
> +[PLCT Lab](https://github.com/plctlab) has provided QEMU access to RISC-=
V
> +boards.
> +
> +[Microsoft](https://microsoft.com) has provided QEMU credits for use on =
Azure
> +Cloud.
> --
> 2.33.1
>

