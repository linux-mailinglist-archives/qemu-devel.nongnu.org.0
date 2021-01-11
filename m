Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D282F1A61
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 17:04:11 +0100 (CET)
Received: from localhost ([::1]:44520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyzfu-00034U-Id
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 11:04:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jpewhacker@gmail.com>)
 id 1kyzdh-0001Wd-1l
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:01:55 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jpewhacker@gmail.com>)
 id 1kyzdZ-0001XL-Qy
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:01:52 -0500
Received: by mail-wm1-x334.google.com with SMTP id g185so349742wmf.3
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 08:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dOpMgjigaxeH0PxXMvQjpqzt3Cpt/dxeQ9GgMTxynlg=;
 b=kjy3GrLOZZuy2uTshY4JH10///GOEoEoz8+qwMx9UE907GZ+ykX0BcNHn5X7fMEEKZ
 HFOmkknfmHvNe/aZA28fM/D2rCRxyVFAhMQaOkfo5VYtBSYK/kX3FYa15Pk3gG71E/AQ
 b2mYa5VXGpDFVQpKOtwqnSuU7YRaeBVcDG3qxhCyqizrCylrW47dOym/zuGxVI5E3u5F
 0nv0bp0m4VyoZek5sa24wXmsdXDXeweCPn7/Hj5zRSkIemW+uV8TVPP+QAC1rOKv2YPT
 t5Fyy03oY3V4mB9G5X2l0ZxbP4gpBrlZSnJGoHgqh1DIhk1sRfhXQJ9pZWoMI64+NMu/
 PbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dOpMgjigaxeH0PxXMvQjpqzt3Cpt/dxeQ9GgMTxynlg=;
 b=I3XsdsT993mBkgqEei/nMVki/bhTUCC8TxrioDstLWzACsLKDNCf2F6FMRo1/n32Tt
 nVz6EFGQ/RImbAy1lnGAjE2nQ2uhUA5JkI+DHLufMjFwI6gQoUe+2k3Iz994q0coVriX
 k3cIT17O9v+ZJrqfvkqETApPDD84FUoLoTlu1QNJTH4cwzBcqaR9oHvR4hBzJ3qHyGsp
 Mk6ekVYknq3wxZ9TC/b/u5NihssL9rK9rZ+0xfeJY1KZM/x5S+qcTVMhYaEm7DCkp0MR
 CXrNU7euVEijfGlPfVutGREc+RjcMB4h5Ad30XUEfO0v4NfPFxGaTcQeNhD9rsGZpTIG
 xE/w==
X-Gm-Message-State: AOAM532lZaKoMqSgL3cBB5KAD5qSZQ1IRqOuEWH1KL+AVMnoxqIGQY+5
 vGCbSclDMe5FcsdLDmlvyqqz4CjkwgfSVmY1gPA=
X-Google-Smtp-Source: ABdhPJzR+7IDoMyb9hgHV7gZZmRAstGiCFmwXo4yVHDWc7r7HARQw3H9UFXuWf0mWSWm4JJW7c7TlJp04Jwn4txY3LY=
X-Received: by 2002:a7b:c7d3:: with SMTP id z19mr339935wmk.31.1610380899446;
 Mon, 11 Jan 2021 08:01:39 -0800 (PST)
MIME-Version: 1.0
References: <20210107213856.34170-1-JPEWhacker@gmail.com>
 <8ea87ea1-093d-81b0-13d6-60caa9fcdad4@redhat.com>
 <0e956e41-4862-f979-3247-40d03c5054e4@gmail.com>
 <e2885e2e-cf8a-51f7-6dd8-a28ac4871eef@redhat.com>
 <a0cbc0c3-7c5b-ed81-8cfa-2129dda6a268@weilnetz.de>
 <b7585238-25c7-d25f-dae1-d682dc084284@redhat.com>
In-Reply-To: <b7585238-25c7-d25f-dae1-d682dc084284@redhat.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 11 Jan 2021 10:01:28 -0600
Message-ID: <CAJdd5GZX=Kv04Vdm84WYAU9404wP_B5DDMb6E8DSX8aTv9PjmQ@mail.gmail.com>
Subject: Re: [PATCH] configure: Add flags for MinGW32 standalone build
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=jpewhacker@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 11, 2021 at 1:44 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 11/01/21 08:29, Stefan Weil wrote:
> > Am 11.01.21 um 08:04 schrieb Thomas Huth:
> >
> >> On 08/01/2021 19.30, Joshua Watt wrote:
> >>>
> >>> On 1/8/21 1:25 AM, Thomas Huth wrote:
> >>>> On 07/01/2021 22.38, Joshua Watt wrote:
> >>>>> There are two cases that need to be accounted for when compiling QEMU
> >>>>> for MinGW32:
> >>>>>   1) A standalone distribution, where QEMU is self contained and
> >>>>>      extracted by the user, such as a user would download from the
> >>>>> QEMU
> >>>>>      website. In this case, all of the QEMU files should be rooted in
> >>>>>      $prefix to ensure they can be easily packaged together for
> >>>>>      distribution
> >>>>>   2) QEMU integrated into a distribution image/sysroot/SDK and
> >>>>>      distributed with other programs. In this case, the provided
> >>>>>      arguments for bindir/datadir/etc. should be respected as they
> >>>>> for a
> >>>>>      Linux build.
> >>>>>
> >>>>> Add a configure time flags --enable-standalone-mingw and
> >>>>> --disable-standalone-mingw that allows the user to control this
> >>>>> behavior. The flag defaults to "enabled" if unspecified to retain the
> >>>>> existing build behavior
> >>>>>
> >>>>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> >>>>> ---
> >>>>>   configure | 8 +++++++-
> >>>>>   1 file changed, 7 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/configure b/configure
> >>>>> index 5860bdb77b..5c83edb502 100755
> >>>>> --- a/configure
> >>>>> +++ b/configure
> >>>>> @@ -358,6 +358,7 @@ strip_opt="yes"
> >>>>>   tcg_interpreter="no"
> >>>>>   bigendian="no"
> >>>>>   mingw32="no"
> >>>>> +mingw32_standalone="yes"
> >>>>>   gcov="no"
> >>>>>   EXESUF="$default_feature"
> >>>>>   HOST_DSOSUF=".so"
> >>>>> @@ -1558,6 +1559,10 @@ for opt do
> >>>>>     ;;
> >>>>>     --disable-fuse-lseek) fuse_lseek="disabled"
> >>>>>     ;;
> >>>>> +  --enable-standalone-mingw) mingw32_standalone="yes"
> >>>>> +  ;;
> >>>>> +  --disable-standalone-mingw) mingw32_standalone="no"
> >>>>> +  ;;
> >>>>>     *)
> >>>>>         echo "ERROR: unknown option $opt"
> >>>>>         echo "Try '$0 --help' for more information"
> >>>>> @@ -1570,7 +1575,7 @@ libdir="${libdir:-$prefix/lib}"
> >>>>>   libexecdir="${libexecdir:-$prefix/libexec}"
> >>>>>   includedir="${includedir:-$prefix/include}"
> >>>>>   -if test "$mingw32" = "yes" ; then
> >>>>> +if test "$mingw32" = "yes" && test "$mingw32_standalone" = "yes";
> >>>>> then
> >>>>>       mandir="$prefix"
> >>>>>       datadir="$prefix"
> >>>>>       docdir="$prefix"
> >>>>> @@ -1897,6 +1902,7 @@ disabled with --disable-FEATURE, default is
> >>>>> enabled if available
> >>>>>     libdaxctl       libdaxctl support
> >>>>>     fuse            FUSE block device export
> >>>>>     fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
> >>>>> +  standalone-mingw  Build for standalone distribution on MinGW
> >>>>>     NOTE: The object files are built at the place where configure
> >>>>> is launched
> >>>>>   EOF
> >>>>
> >>>> I think this should maybe be done independently from MinGW, so that
> >>>> it could be used on other systems, too. Thus maybe rather name the
> >>>> switch "--enable-standalone-distribution" or
> >>>> "--enable-standalone-installation" or something like this? On MinGW,
> >>>> the value of the switch could then default to "yes" while on other
> >>>> systems it would be "no" by default.
> >>>
> >>> We could, but I'm curious how useful that is? Does that make the
> >>> option just a shorthand for "--mandir=$prefix --bindir=$prefix
> >>> --datadir=$prefix etc..." for all builds?
> >>
> >> Yes, that would basically be a shorthand for that. Could be useful for
> >> people who want to create standalone binaries on Linux etc., too.
> >>
> >>  Thomas
> >
> >
> > Aren't nearly all files already rooted in $prefix? The only exception I
> > know is /etc/qemu.
> >
> > Rooting in $prefix still allows hierarchical subdirectories. I'd prefer
> > them for MinGW, too.
>
> I agree, it was an issue before 5.2 but now we have relocatable
> installations.  So it would be better to remove all the special casing
> of mingw, except that (for backwards compatibility) on mingw bindir
> defaults to $prefix instead of $prefix/bin.  Then Joshua's usecase is
> covered simply by --bindir=/mingw/bin.

Right. Removing the special case for MinGW would solve my problem and
be fine with me; the thing I don't know is if we need to preserve the
backward compatibility of forcing a specific "flat" layout in $prefix
when building for MinGW. There are basically 2 options I can see:
 1) Add a flag to default MinGW to the "flat" layout, but allow it to
be overridden so that it can follow a normal layout (e.g. --bindir,
etc. are respected). This what my patch adds
 2) Remove the special casing for MinGW entirely. A "flat" layout
would still be possible by doing e.g. "--bindir=$prefix
--datadir=$prefix ..." manually but it would no longer be the default.

I'm fine with either option, but I'm not familiar enough with the
project to be able to know which is better.

>
> Paolo
>

