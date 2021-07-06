Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D853BC77C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 09:52:41 +0200 (CEST)
Received: from localhost ([::1]:37862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0fsm-0008JH-7Q
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 03:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0frg-0007eH-3G
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:51:32 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:33369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0fre-0000l9-C5
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:51:31 -0400
Received: by mail-yb1-xb29.google.com with SMTP id r135so33044762ybc.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 00:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EiCuxx4t1SB71bsNdkTCc+wA7zxuwIav4KQe9TvuimI=;
 b=dELJUT7MYVQS25AaG2LL1I9PCNzveh+ZBoIS6HSME7DximcI3RrPhFlMfpUpeUzQAi
 3VKqbeDyX1Wb2mT8tPG9gPQRfkXRsbbDfNtVh8/aKG1lQ3fUciZIiRwX9dRn2KrnZxDv
 Obdn41Pb0yoL8VSzR0pQuZAtCntAdPZ+lkjPEKHUahJAUaHD2AMaPg4luVhnN/9In+V2
 O/835MD4jtf22UvoX6Ih4060NeRBg8G+2UZ3/crtVyj611shKP5fzi8MTtlYNwLUBCOb
 u/x8QTernrbQHeBKu0AV00XbVAZJQVBU2MHvmDz8OgzkBIr3LUub6c+YhVZCQN7HlDuy
 G8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EiCuxx4t1SB71bsNdkTCc+wA7zxuwIav4KQe9TvuimI=;
 b=NQx+bQnHcvUTdEArTwzlEGHfgTHZlcGF6/CDTG25DHQQJlNBpAzEE3uEZxfTpjO5e6
 Ia0N3oYnjA625/g9qbvDTDQooeil3Eefb8G0rDeRNGVygKpElAyppWQN/guGil/EPEWy
 J3bqFws/f1w9gq44JOe2qKInof/808MIE/iWuf9IpUE45OOlzc2cksv4x/+NwejXgqnF
 wZZXlsdD6/XmQsgEIP0YgY54W13EF9sbKEVlW1CiwDQEg6EojgvCq2sZAsfRMsxTkLUC
 Ia4YEAGWBt0+G+4Of2pC79gxNEGas8MJtB5wlppeNHv00Uh+zio5tbovAxPRuFmJKl4A
 Ty2A==
X-Gm-Message-State: AOAM533wn8x1ij+zJwNk7iX9DEeXWclVSfp2FgBqmfUkFOf3y3H2eJHt
 mOcvQxfp5Aoj3L+NioFyECrAU+UHGL+7yXhWML4=
X-Google-Smtp-Source: ABdhPJzlPPM41kzkE0ZK8V4qyW6z6SX7GmSoLhRB/7cHAv2RHyXrEE21yvuYWdlw3mQj32pbjlWR+d+6p7Th93C8FCE=
X-Received: by 2002:a25:b701:: with SMTP id t1mr21663550ybj.517.1625557888850; 
 Tue, 06 Jul 2021 00:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210706043124.1871866-1-bmeng.cn@gmail.com>
 <81f41bef-454f-928f-0f93-0deef3ab7716@redhat.com>
In-Reply-To: <81f41bef-454f-928f-0f93-0deef3ab7716@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 6 Jul 2021 15:51:17 +0800
Message-ID: <CAEUhbmWr-G-AuAHQ7RK1+WtY7r6-Uid00whvMm8EUGJCcXwuhQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] roms/u-boot: Bump ppce500 u-boot to v2021.07 to add
 eTSEC support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Tue, Jul 6, 2021 at 3:41 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Hi Bin,
>
> On 7/6/21 6:31 AM, Bin Meng wrote:
> > Update the QEMU shipped u-boot.e500 image built from U-Boot mainline
> > v2021.07 release, which added eTSEC support to the QEMU ppce500 target,
> > via the following U-Boot series:
> >
> >   http://patchwork.ozlabs.org/project/uboot/list/?series=3D233875&state=
=3D*
> >
> > The cross-compilation toolchain used to build the U-Boot image is:
> > https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/10=
.1.0/x86_64-gcc-10.1.0-nolibc-powerpc-linux.tar.xz
>
> Ideally the process to update a firmware blob is (*):
>
> - Add a CI job (as you did for .gitlab-ci.d/opensbi.yml)
> - Commit the submodule new hash including "git shortlog current..new"
>   in description
> - Run the CI, download the almost-reproducible blob
> - Test the blob locally
> - Amend to the previous commit the CI blob

Thanks for the guideline!

>
> Since soft freeze is in 1 week, you might won't have enough time
> to add a CI job, so this current patch is acceptable, but please
> include the "git shortlog current..new" output.

I did consider including the shotlogs here, just like what I did for
OpenSBI update. But I am afraid it is a toooo long list because unlike
OpenSBI U-Boot is a very active community. Hence I chose not to
mention it in the commit message.

>
> Regards,
>
> Phil.
>
> (*) Yes we should document this somewhere. Wiki or docs?

Either should be okay. If we put in the docs, we should probably
collect some other development processes (e.g.: submitting patches)
and put there, like what is done in the Linux kernel.

Regards,
Bin

