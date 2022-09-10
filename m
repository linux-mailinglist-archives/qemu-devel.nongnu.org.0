Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40645B436B
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 02:39:14 +0200 (CEST)
Received: from localhost ([::1]:46134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWoWf-0007TB-J6
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 20:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWoVL-00066a-2l
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 20:37:51 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:37750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWoVJ-0000k5-1t
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 20:37:50 -0400
Received: by mail-qv1-xf30.google.com with SMTP id y9so2513262qvo.4
 for <qemu-devel@nongnu.org>; Fri, 09 Sep 2022 17:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=S0dzynkCb17kWFV2h4Bc97d5h6dCiWyaQHqPEgBNMvA=;
 b=eOU/bWMHZ41IYmgAv6SzKLGb6mCcXFjN1tFzX6xGhawN01l7iiBf0Rf31HqzJ91GTQ
 rAlzkJqwDR+OXx1D0U/lvguLcvOlijUkd3QoWwozGCW3Nc87PwX2wkCDVmS1HfdMZhvl
 e62p9o7tqkSxY6qA8ZqHt/rSD5743eVEtnwYzEV/uvP58DynkMkGLL/v50QkM1tUYdYh
 x3I1BOtmiDwKEHVdLFLmxBV3R/+Dzr2sBYELMknSdLV8zOO5YDMXyOtUud65t/AiO51I
 7he0S3oYMzqAS3OYmbdftazID7c+SCmHVrmCMBha6qzxAEmlhE20Exx9cYMpsBhLughz
 K+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=S0dzynkCb17kWFV2h4Bc97d5h6dCiWyaQHqPEgBNMvA=;
 b=vJ8+CjGjgEw6k1MaxS7cecX9VaVLjUCJ8EQ8rbvl8A0FH620TX+oKtZTUrvGLaFMvb
 EjJIFPEYOmLInzIVGmDPdTteBmDueSFhR6e86uGSM6kE/T7BlZgKGyMCHTXGE1BZlTv+
 vD4/zCbXhq3wWHNzKXxfciowZT+4w4MKB9l+n75d4UOEh6w5OtV9LJ9QUJE6tL+LeNaR
 3aEDWbYo0Vcz30eKue18A1C/Yd3OZKh2e/t9J8msnJ/cdThzXiFaelGQa+E8eV2Fwl1m
 D8jvk32hAsMRj3P10joEVApYdJfGNPtzc9DBaf0F1Y1+S43xFy3ZyAtaX7WA2W5eovHi
 jfqQ==
X-Gm-Message-State: ACgBeo0RRvMY3oIC2VNdvdVYK8yGQXctxUyxdMOqUS5LxUNHl1YUyrKD
 Q+qhaW3C1pLZLnSnZk+uNRjwEoEGwaOMTRsYmhtdQElR
X-Google-Smtp-Source: AA6agR5n0tlT0tE2gsGvXX2wXpFEY5zytWWXpFf6Bv07nYi61hvl0td3EnHUpe6CYqZJtAz+6hH3Ni3ZDNMXmck8nVU=
X-Received: by 2002:a0c:810f:0:b0:47b:299a:56d7 with SMTP id
 15-20020a0c810f000000b0047b299a56d7mr14473742qvc.12.1662770267968; Fri, 09
 Sep 2022 17:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-4-bmeng.cn@gmail.com>
 <556496df-4362-6780-8379-e14bf4269e3f@ilande.co.uk>
In-Reply-To: <556496df-4362-6780-8379-e14bf4269e3f@ilande.co.uk>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 10 Sep 2022 08:37:36 +0800
Message-ID: <CAEUhbmVmKhJJk0pQcVJKryie+V4uZEznZCu0dzjftYCycBtD8w@mail.gmail.com>
Subject: Re: [PATCH 3/7] scripts/nsis.py: Automatically package required DLLs
 of QEMU executables
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, Sep 10, 2022 at 12:49 AM Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 08/09/2022 14:28, Bin Meng wrote:
>
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > At present packaging the required DLLs of QEMU executables is a
> > manual process, and error prone.
> >
> > Actually build/config-host.mak contains a GLIB_BINDIR variable
> > which is the directory where glib and other DLLs reside. This
> > works for both Windows native build and cross-build on Linux.
> > We can use it as the search directory for DLLs and automate
> > the whole DLL packaging process.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >   meson.build     |  1 +
> >   scripts/nsis.py | 46 ++++++++++++++++++++++++++++++++++++++++++----
> >   2 files changed, 43 insertions(+), 4 deletions(-)
> >
> > diff --git a/meson.build b/meson.build
> > index c2adb7caf4..4c03850f9f 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -3657,6 +3657,7 @@ if host_machine.system() == 'windows'
> >       '@OUTPUT@',
> >       get_option('prefix'),
> >       meson.current_source_dir(),
> > +    config_host['GLIB_BINDIR'],
> >       host_machine.cpu(),
> >       '--',
> >       '-DDISPLAYVERSION=' + meson.project_version(),
> > diff --git a/scripts/nsis.py b/scripts/nsis.py
> > index baa6ef9594..03ed7608a2 100644
> > --- a/scripts/nsis.py
> > +++ b/scripts/nsis.py
> > @@ -18,12 +18,36 @@ def signcode(path):
> >           return
> >       subprocess.run([cmd, path])
> >
> > +def find_deps(exe_or_dll, search_path, analyzed_deps):
> > +    deps = [exe_or_dll]
> > +    output = subprocess.check_output(["objdump", "-p", exe_or_dll], text=True)
> > +    output = output.split("\n")
> > +    for line in output:
> > +        if not line.startswith("\tDLL Name: "):
> > +            continue
> > +
> > +        dep = line.split("DLL Name: ")[1].strip()
> > +        if dep in analyzed_deps:
> > +            continue
> > +
> > +        dll = os.path.join(search_path, dep)
> > +        if not os.path.exists(dll):
> > +            # assume it's a Windows provided dll, skip it
> > +            continue
> > +
> > +        analyzed_deps.add(dep)
> > +        # locate the dll dependencies recursively
> > +        rdeps = find_deps(dll, search_path, analyzed_deps)
> > +        deps.extend(rdeps)
> > +
> > +    return deps
> >
> >   def main():
> >       parser = argparse.ArgumentParser(description="QEMU NSIS build helper.")
> >       parser.add_argument("outfile")
> >       parser.add_argument("prefix")
> >       parser.add_argument("srcdir")
> > +    parser.add_argument("dlldir")
> >       parser.add_argument("cpu")
> >       parser.add_argument("nsisargs", nargs="*")
> >       args = parser.parse_args()
> > @@ -63,9 +87,26 @@ def main():
> >                   !insertmacro MUI_DESCRIPTION_TEXT ${{Section_{0}}} "{1}"
> >                   """.format(arch, desc))
> >
> > +        search_path = args.dlldir
> > +        print("Searching '%s' for the dependent dlls ..." % search_path)
> > +        dlldir = os.path.join(destdir + prefix, "dll")
> > +        os.mkdir(dlldir)
> > +
> >           for exe in glob.glob(os.path.join(destdir + prefix, "*.exe")):
> >               signcode(exe)
> >
> > +            # find all dll dependencies
> > +            deps = set(find_deps(exe, search_path, set()))
> > +            deps.remove(exe)
> > +
> > +            # copy all dlls to the DLLDIR
> > +            for dep in deps:
> > +                dllfile = os.path.join(dlldir, os.path.basename(dep))
> > +                if (os.path.exists(dllfile)):
> > +                    continue
> > +                print("Copying '%s' to '%s'" % (dep, dllfile))
> > +                shutil.copy(dep, dllfile)
> > +
> >           makensis = [
> >               "makensis",
> >               "-V2",
> > @@ -73,12 +114,9 @@ def main():
> >               "-DSRCDIR=" + args.srcdir,
> >               "-DBINDIR=" + destdir + prefix,
> >           ]
> > -        dlldir = "w32"
> >           if args.cpu == "x86_64":
> > -            dlldir = "w64"
> >               makensis += ["-DW64"]
> > -        if os.path.exists(os.path.join(args.srcdir, "dll")):
> > -            makensis += ["-DDLLDIR={0}/dll/{1}".format(args.srcdir, dlldir)]
> > +        makensis += ["-DDLLDIR=" + dlldir]
> >
> >           makensis += ["-DOUTFILE=" + args.outfile] + args.nsisargs
> >           subprocess.run(makensis)
>
> FWIW I wrote a similar script a while back to help package a custom Windows build for
> a client, however I used ldd instead of objdump since it provided the full paths for
> DLLs installed in the msys2/mingw-w64 environment via pacman which were outside the
> QEMU build tree.
>

Yep, ldd also works, but only on Windows native build. objdump can
work on both Windows native and Linux cross builds.

> Once the complete list of DLLs was obtained, it was simple matter of filtering out
> those DLLs that started with the %WINDIR% prefix before copying them to the final
> distribution directory.
>

Regards,
Bin

