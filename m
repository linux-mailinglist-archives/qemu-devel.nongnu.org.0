Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2877E5B3D7F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 18:53:51 +0200 (CEST)
Received: from localhost ([::1]:60724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWhGI-0001Hw-03
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 12:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oWhCN-0005Vi-Di
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 12:49:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oWhCK-0000na-St
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 12:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SkttA0QV1HOR8wYAtMESFzo6Yf17gkEInMGViNQIGkc=; b=ylHXDcjMwUwdVuO/nrMqVeOaPO
 Nr5aYToYcixqFvKcygcjEZ6KiI0gjutZfdGOdY8y5OJbbkZj3wpdDBzArAkaewvel+JZxkxeHwrz7
 O0pt3gwOp8dxtBRm+Hq7u8BD2ljXJoXwRByBRtD8C8Cg0hKfjw8+xg7wSI7MXxohgHhkWQhQ86shd
 7xjZmN4JVCoWYcSxIsemswBY+sFyg14sETiy9XCxX3jBlaESl7O+H78ILfR1XByheulpwXC9maDiM
 b31b+eb0kwhlR4KkAuJBEZ6dGzrpwezip/999N2DM0Afz7orM+lWL8GXki9VZu5Kz1ta0asVTlxda
 56OeywWzHciYW14Ra3nIrEZpknlU9hUnF5smFTxh7tePbBE2+7N0pzP36odaCYck7hBVbIeu9DEuV
 f+6YxLwCnQaBorzq60SsHtMS90YCMat5tEW2eBqdLWiCHcJXS7RmoxpLFnPfQ9rdoAVPoYUHLJRaE
 lHaRxdVw7diYUGcaQa1XlwAj4sN5me6UeH4oUjyVIFhhE6AGLQZjGbhrOFbLw41sbaXPu0iVTT90O
 gKh+3eGtV3l175RyhZLU8a3pnG650FFKh32ekKmMgMme3AR83O/Nmn6wvyRFSYMBT0jXBQ9sEVEfS
 L0lVqt20zr+WEbvJPudpBsCessfqfxXQSj3ICsuyA=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oWhAd-00007S-6w; Fri, 09 Sep 2022 17:48:03 +0100
Message-ID: <556496df-4362-6780-8379-e14bf4269e3f@ilande.co.uk>
Date: Fri, 9 Sep 2022 17:49:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-4-bmeng.cn@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220908132817.1831008-4-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 3/7] scripts/nsis.py: Automatically package required DLLs
 of QEMU executables
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.079,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 08/09/2022 14:28, Bin Meng wrote:

> From: Bin Meng <bin.meng@windriver.com>
> 
> At present packaging the required DLLs of QEMU executables is a
> manual process, and error prone.
> 
> Actually build/config-host.mak contains a GLIB_BINDIR variable
> which is the directory where glib and other DLLs reside. This
> works for both Windows native build and cross-build on Linux.
> We can use it as the search directory for DLLs and automate
> the whole DLL packaging process.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   meson.build     |  1 +
>   scripts/nsis.py | 46 ++++++++++++++++++++++++++++++++++++++++++----
>   2 files changed, 43 insertions(+), 4 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index c2adb7caf4..4c03850f9f 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3657,6 +3657,7 @@ if host_machine.system() == 'windows'
>       '@OUTPUT@',
>       get_option('prefix'),
>       meson.current_source_dir(),
> +    config_host['GLIB_BINDIR'],
>       host_machine.cpu(),
>       '--',
>       '-DDISPLAYVERSION=' + meson.project_version(),
> diff --git a/scripts/nsis.py b/scripts/nsis.py
> index baa6ef9594..03ed7608a2 100644
> --- a/scripts/nsis.py
> +++ b/scripts/nsis.py
> @@ -18,12 +18,36 @@ def signcode(path):
>           return
>       subprocess.run([cmd, path])
>   
> +def find_deps(exe_or_dll, search_path, analyzed_deps):
> +    deps = [exe_or_dll]
> +    output = subprocess.check_output(["objdump", "-p", exe_or_dll], text=True)
> +    output = output.split("\n")
> +    for line in output:
> +        if not line.startswith("\tDLL Name: "):
> +            continue
> +
> +        dep = line.split("DLL Name: ")[1].strip()
> +        if dep in analyzed_deps:
> +            continue
> +
> +        dll = os.path.join(search_path, dep)
> +        if not os.path.exists(dll):
> +            # assume it's a Windows provided dll, skip it
> +            continue
> +
> +        analyzed_deps.add(dep)
> +        # locate the dll dependencies recursively
> +        rdeps = find_deps(dll, search_path, analyzed_deps)
> +        deps.extend(rdeps)
> +
> +    return deps
>   
>   def main():
>       parser = argparse.ArgumentParser(description="QEMU NSIS build helper.")
>       parser.add_argument("outfile")
>       parser.add_argument("prefix")
>       parser.add_argument("srcdir")
> +    parser.add_argument("dlldir")
>       parser.add_argument("cpu")
>       parser.add_argument("nsisargs", nargs="*")
>       args = parser.parse_args()
> @@ -63,9 +87,26 @@ def main():
>                   !insertmacro MUI_DESCRIPTION_TEXT ${{Section_{0}}} "{1}"
>                   """.format(arch, desc))
>   
> +        search_path = args.dlldir
> +        print("Searching '%s' for the dependent dlls ..." % search_path)
> +        dlldir = os.path.join(destdir + prefix, "dll")
> +        os.mkdir(dlldir)
> +
>           for exe in glob.glob(os.path.join(destdir + prefix, "*.exe")):
>               signcode(exe)
>   
> +            # find all dll dependencies
> +            deps = set(find_deps(exe, search_path, set()))
> +            deps.remove(exe)
> +
> +            # copy all dlls to the DLLDIR
> +            for dep in deps:
> +                dllfile = os.path.join(dlldir, os.path.basename(dep))
> +                if (os.path.exists(dllfile)):
> +                    continue
> +                print("Copying '%s' to '%s'" % (dep, dllfile))
> +                shutil.copy(dep, dllfile)
> +
>           makensis = [
>               "makensis",
>               "-V2",
> @@ -73,12 +114,9 @@ def main():
>               "-DSRCDIR=" + args.srcdir,
>               "-DBINDIR=" + destdir + prefix,
>           ]
> -        dlldir = "w32"
>           if args.cpu == "x86_64":
> -            dlldir = "w64"
>               makensis += ["-DW64"]
> -        if os.path.exists(os.path.join(args.srcdir, "dll")):
> -            makensis += ["-DDLLDIR={0}/dll/{1}".format(args.srcdir, dlldir)]
> +        makensis += ["-DDLLDIR=" + dlldir]
>   
>           makensis += ["-DOUTFILE=" + args.outfile] + args.nsisargs
>           subprocess.run(makensis)

FWIW I wrote a similar script a while back to help package a custom Windows build for 
a client, however I used ldd instead of objdump since it provided the full paths for 
DLLs installed in the msys2/mingw-w64 environment via pacman which were outside the 
QEMU build tree.

Once the complete list of DLLs was obtained, it was simple matter of filtering out 
those DLLs that started with the %WINDIR% prefix before copying them to the final 
distribution directory.


ATB,

Mark.

