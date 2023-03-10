Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2356B4226
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 15:00:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1padH7-0002KU-Ly; Fri, 10 Mar 2023 08:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1padH5-0002Ii-36
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 08:59:11 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1padH2-0000Ht-ND
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 08:59:10 -0500
Received: by mail-ed1-x52a.google.com with SMTP id x3so20717345edb.10
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 05:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678456747;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r9BIXHg/0TVW2naTz0eBQTgpzZlTXxap+AGZvwJNhPA=;
 b=f961XeMMz/KcUr7apfQHu7AT8JyrdqHXjj0l904W+sJTmyRMfwoJ8MtLBgJ0AQ4b3g
 1peitDxbe6hLeBjb+dqYNI+DAaeeFh7SSM7ybgeliogBU//tGSkIw4k2FwL8yVmNSuVm
 swsmSWkgDs5OMAuys01aV3EN9QiSKfPJqwefM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678456747;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r9BIXHg/0TVW2naTz0eBQTgpzZlTXxap+AGZvwJNhPA=;
 b=I3BFkXuYp4+070Z8MvU5gdqhJ0aN98iq4z5KS5MdqomWODmSpfuxcppGC0zydrYSqG
 O2WNK09jHnmrBmC8vuNif69vj536MFDcaam26+Q3Z/vQldLBp0dVHb5J8AGHHLzP7rOt
 c/wvia/ca+nlBkwlEluinnQoh//cbVosNb5wi8mnhZMtIW6wMBsX3rxTeT/n9guSKwJ9
 LUPP8Xugkg4OO03S1BokiValUxq+C32z2RHYKGZ0cXPFNIieIIWO0Au4lP89f4Hqw7OZ
 iO5OJ7SxBucTcy26jXDx2IsxC0CFbc12cCSbeu1kudD3vf1kw7dCJHMgZ11UfJDr5oEO
 TnVg==
X-Gm-Message-State: AO0yUKUmjS6x31yNnG9Xsp+J7eE7wossnDry0fwbwVtsNyKRcR0OW6/D
 NBV9l+i9Hi5IcFXixKEk2EuorLnC0U/cxLqzaG7bQQ==
X-Google-Smtp-Source: AK7set8NvRaFB8LUZlnDH9qp4xhrZpnES4KaeadcfCCcAT01YuaZHwrlP2tNw91hVRU9dw6+yG1u+2ksWLuuCrH/D0E=
X-Received: by 2002:a50:9fcd:0:b0:4ad:7389:d298 with SMTP id
 c71-20020a509fcd000000b004ad7389d298mr14225923edf.4.1678456746729; Fri, 10
 Mar 2023 05:59:06 -0800 (PST)
MIME-Version: 1.0
References: <20230309115714.906369-1-kraxel@redhat.com>
 <20230309115714.906369-3-kraxel@redhat.com>
In-Reply-To: <20230309115714.906369-3-kraxel@redhat.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 10 Mar 2023 05:58:55 -0800
Message-ID: <CAPnjgZ3M4LCXJq6=V-zt3QiiP6PjcL5kUrBB-9OdZghC-sK12w@mail.gmail.com>
Subject: Re: [PULL 2/3] edk2: replace build scripts
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=sjg@google.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -92
X-Spam_score: -9.3
X-Spam_bar: ---------
X-Spam_report: (-9.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

Hi Gerd,

On Thu, 9 Mar 2023 at 03:58, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Remove Makefile.edk2 and the edk2*.sh scripts with a python script
> (which already handles fedora rpm builds) and a config file for it.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  roms/edk2-build.py     | 372 +++++++++++++++++++++++++++++++++++++++++
>  roms/Makefile          |  29 +---
>  roms/Makefile.edk2     | 178 --------------------
>  roms/edk2-build.config | 119 +++++++++++++
>  roms/edk2-build.sh     |  55 ------
>  roms/edk2-funcs.sh     | 273 ------------------------------
>  6 files changed, 498 insertions(+), 528 deletions(-)
>  create mode 100755 roms/edk2-build.py
>  delete mode 100644 roms/Makefile.edk2
>  create mode 100644 roms/edk2-build.config
>  delete mode 100755 roms/edk2-build.sh
>  delete mode 100644 roms/edk2-funcs.sh

I am very pleased to see this as I find building edk2 a bit of a pain.

The README should mention that you need to use

. edk2setup.sh

first. Also you need to be in the edk2 directory, I think. Also
mention that the builds appear as subdirs in the edk2/Build directory.
It would be good if the edk2-clone.sh script could deal with updating
an existing checkout so I don't need to remove the old ones each time.

When I tried to build platform.rpi I get this:

edk2-build.py -c ../edk2-build-config/kraxel/x64.platforms -j30 --silent

###
### building: BaseTools
###
['make', '-C', '/scratch/sglass/edk2/BaseTools']
### building in silent mode ...
### writing log to build.basetools.log ...
### OK

###
### building: Platform/RaspberryPi/RPi4/RPi4.dsc (AARCH64, DEBUG)
### description: EFI Firmware for Raspberry PI 4
###
['build', '-t', 'GCC5', '-p', 'Platform/RaspberryPi/RPi4/RPi4.dsc',
'-n', '30', '-a', 'AARCH64', '-b', 'DEBUG']
### building in silent mode ...
### writing log to build.platform.rpi4.DEBUG.log ...
### BUILD FAILURE
### output
Build environment: Linux-5.15.0-60-generic-x86_64-with-glibc2.35
Build start time: 06:46:28, Mar.10 2023



build.py...
 : error 000E: One Path in PACKAGES_PATH doesn't exist
/scratch/sglass/edk2/Platform/Intel

- Failed -
Build end time: 06:46:28, Mar.10 2023
Build total time: 00:00:00


### exit code: 14
ERROR: build exited with 14 while building Platform/RaspberryPi/RPi4/RPi4.dsc



Also the first time running it after cloning, I get errors:

edk2-build.py -c ../edk2-build-config/kraxel/x64.core -j30  -m
ovmf.qemu.ia32 --silent

###
### running BaseTools/BuildEnv
###
BaseTools/BuildEnv: 160: Bad substitution
Using Pip Basetools
BaseTools/BuildEnv: 184: Bad substitution
BaseTools/BuildEnv: 202: -c: not found

Do I need to make -C BaseTools first?

>
> diff --git a/roms/edk2-build.py b/roms/edk2-build.py
> new file mode 100755
> index 000000000000..5b34620271f7
> --- /dev/null
> +++ b/roms/edk2-build.py
> @@ -0,0 +1,372 @@
> +#!/usr/bin/python3
> +"""
> +build helper script for edk2, see
> +https://gitlab.com/kraxel/edk2-build-config
> +
> +"""
> +import os
> +import sys
> +import glob
> +import shutil
> +import optparse

I think this is obsolete and argparse should be used for new things.
The conversion is pretty easy.

> +import subprocess
> +import configparser
> +
> +rebase_prefix    = ""
> +version_override = None
> +release_date     = None

There are a lot of pylint warnings. Also functions / arguments /
return values lack comments.

Silent mode still produces output. Can you add a -s alias and also
make it fully silent?

If the config file is not found, it seems to say nothing, but just
does not work. It should give an error.

> +
> +def check_rebase():
> +    """ detect 'git rebase -x edk2-build.py master' testbuilds """
> +    global rebase_prefix
> +    global version_override
> +    gitdir = '.git'
> +
> +    if os.path.isfile(gitdir):
> +        with open(gitdir) as f:
> +            (unused, gitdir) = f.read().split()
> +
> +    if not os.path.exists(f'{gitdir}/rebase-merge/msgnum'):
> +        return ""
> +    with open(f'{gitdir}/rebase-merge/msgnum', 'r') as f:
> +        msgnum = int(f.read())
> +    with open(f'{gitdir}/rebase-merge/end', 'r') as f:
> +        end = int(f.read())
> +    with open(f'{gitdir}/rebase-merge/head-name', 'r') as f:
> +        head = f.read().strip().split('/')
> +
> +    rebase_prefix = f'[ {int(msgnum/2)} / {int(end/2)} - {head[-1]} ] '
> +    if msgnum != end and not version_override:
> +        # fixed version speeds up builds
> +        version_override = "test-build-patch-series"
> +
> +def get_coredir(cfg):
> +    if cfg.has_option('global', 'core'):
> +        return os.path.abspath(cfg['global']['core'])
> +    else:
> +        return os.getcwd()
> +
> +def get_version(cfg):
> +    coredir = get_coredir(cfg)
> +    if version_override:
> +        version = version_override
> +        print('')
> +        print(f'### version [override]: {version}')
> +        return version
> +    if os.environ.get('RPM_PACKAGE_NAME'):
> +        version = os.environ.get('RPM_PACKAGE_NAME');
> +        version += '-' + os.environ.get('RPM_PACKAGE_VERSION');
> +        version += '-' + os.environ.get('RPM_PACKAGE_RELEASE');
> +        print('')
> +        print(f'### version [rpmbuild]: {version}')
> +        return version
> +    if os.path.exists(coredir + '/.git'):
> +        cmdline = [ 'git', 'describe', '--tags', '--abbrev=8',
> +                    '--match=edk2-stable*' ]
> +        result = subprocess.run(cmdline, cwd = coredir,
> +                                stdout = subprocess.PIPE)
> +        version = result.stdout.decode().strip()
> +        print('')
> +        print(f'### version [git]: {version}')
> +        return version
> +    return None
> +
> +def pcd_string(name, value):
> +    return f'{name}=L{value}\\0'
> +
> +def pcd_version(cfg):
> +    version = get_version(cfg)
> +    if version is None:
> +        return []
> +    return [ '--pcd', pcd_string('PcdFirmwareVersionString', version) ]
> +
> +def pcd_release_date(cfg):
> +    if release_date is None:
> +        return []
> +    return [ '--pcd', pcd_string('PcdFirmwareReleaseDateString', release_date) ]
> +
> +def build_message(line, line2 = None):
> +    if os.environ.get('TERM') in [ 'xterm', 'xterm-256color' ]:
> +        # setxterm  title
> +        start  = '\x1b]2;'
> +        end    = '\x07'
> +        print(f'{start}{rebase_prefix}{line}{end}', end = '')
> +
> +    print('')
> +    print('###')
> +    print(f'### {rebase_prefix}{line}')
> +    if line2:
> +        print(f'### {line2}')
> +    print('###')
> +
> +def build_run(cmdline, name, section, silent = False):
> +    print(cmdline)
> +    if silent:
> +        print('### building in silent mode ...', flush = True)
> +        result = subprocess.run(cmdline,
> +                                stdout = subprocess.PIPE,
> +                                stderr = subprocess.STDOUT)
> +
> +        logfile = f'{section}.log'
> +        print(f'### writing log to {logfile} ...')
> +        with open(logfile, 'wb') as f:
> +            f.write(result.stdout)
> +
> +        if result.returncode:
> +            print('### BUILD FAILURE')
> +            print('### output')
> +            print(result.stdout.decode())
> +            print(f'### exit code: {result.returncode}')
> +        else:
> +            print('### OK')
> +    else:
> +        result = subprocess.run(cmdline)
> +    if result.returncode:
> +        print(f'ERROR: {cmdline[0]} exited with {result.returncode}'
> +              f' while building {name}')
> +        sys.exit(result.returncode)
> +
> +def build_copy(plat, tgt, dstdir, copy):
> +    srcdir = f'Build/{plat}/{tgt}_GCC5'
> +    names = copy.split()
> +    srcfile = names[0]
> +    if len(names) > 1:
> +        dstfile = names[1]
> +    else:
> +        dstfile = os.path.basename(srcfile)
> +    print(f'# copy: {srcdir} / {srcfile}  =>  {dstdir} / {dstfile}')
> +
> +    src = srcdir + '/' + srcfile
> +    dst = dstdir + '/' + dstfile
> +    os.makedirs(os.path.dirname(dst), exist_ok = True)
> +    shutil.copy(src, dst)
> +
> +def pad_file(dstdir, pad):
> +    args = pad.split()
> +    if len(args) < 2:
> +        raise RuntimeError(f'missing arg for pad ({args})')
> +    name = args[0]
> +    size = args[1]
> +    cmdline = [
> +        'truncate',
> +        '--size', size,
> +        dstdir + '/' + name,
> +    ]
> +    print(f'# padding: {dstdir} / {name}  =>  {size}')
> +    subprocess.run(cmdline)
> +
> +def build_one(cfg, build, jobs = None, silent = False):
> +    cmdline  = [ 'build' ]
> +    cmdline += [ '-t', 'GCC5' ]
> +    cmdline += [ '-p', cfg[build]['conf'] ]

Can you put cfg[build] in a local var to reduce the repetition /
verbosity in this function?

> +
> +    if (cfg[build]['conf'].startswith('OvmfPkg/') or
> +        cfg[build]['conf'].startswith('ArmVirtPkg/')):
> +        cmdline += pcd_version(cfg)
> +        cmdline += pcd_release_date(cfg)
> +
> +    if jobs:
> +        cmdline += [ '-n', jobs ]
> +    for arch in cfg[build]['arch'].split():
> +        cmdline += [ '-a', arch ]
> +    if 'opts' in cfg[build]:
> +        for name in cfg[build]['opts'].split():
> +            section = 'opts.' + name
> +            for opt in cfg[section]:
> +                cmdline += [ '-D', opt + '=' + cfg[section][opt] ]
> +    if 'pcds' in cfg[build]:
> +        for name in cfg[build]['pcds'].split():
> +            section = 'pcds.' + name
> +            for pcd in cfg[section]:
> +                cmdline += [ '--pcd', pcd + '=' + cfg[section][pcd] ]
> +    if 'tgts' in cfg[build]:
> +        tgts = cfg[build]['tgts'].split()
> +    else:
> +        tgts = [ 'DEBUG' ]
> +    for tgt in tgts:
> +        desc = None
> +        if 'desc' in cfg[build]:
> +            desc = cfg[build]['desc']
> +        build_message(f'building: {cfg[build]["conf"]} ({cfg[build]["arch"]}, {tgt})',
> +                      f'description: {desc}')
> +        build_run(cmdline + [ '-b', tgt ],
> +                  cfg[build]['conf'],
> +                  build + '.' + tgt,
> +                  silent)
> +
> +        if 'plat' in cfg[build]:
> +            # copy files
> +            for cpy in cfg[build]:
> +                if not cpy.startswith('cpy'):
> +                    continue
> +                build_copy(cfg[build]['plat'],
> +                           tgt,
> +                           cfg[build]['dest'],
> +                           cfg[build][cpy])
> +            # pad builds
> +            for pad in cfg[build]:
> +                if not pad.startswith('pad'):
> +                    continue
> +                pad_file(cfg[build]['dest'],
> +                         cfg[build][pad])
> +

[..]
Regards,
Simon

