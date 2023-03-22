Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0936C53DA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 19:38:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf3Lq-0005Yf-W5; Wed, 22 Mar 2023 14:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pf3Lo-0005YR-NT
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 14:38:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pf3Ll-0008RX-Gp
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 14:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679510286;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9UlywAaK70NcRp6esvqeX8soBIbmM4aEVOtY+Reqbq4=;
 b=B9GApnhJ8EIxXvE3EYzHRxTvzn4ZMa2vzLy5la929nlEfEirGAUNsXM0XuPAzPbj10FQz4
 EmBqrvASnxDhOxiUCoZmjRVWx6h4ZPTNSYQOzrCriGVI2dKY0YY2QXq+U4XvA+Z/W3SO/4
 xtLFbgYKYreF/RNAGj2rCkOifivaKmU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-RwDMmtaRNJ-qwU64AaSOBA-1; Wed, 22 Mar 2023 14:37:59 -0400
X-MC-Unique: RwDMmtaRNJ-qwU64AaSOBA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B5F6185A78F;
 Wed, 22 Mar 2023 18:37:58 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6DA72166B29;
 Wed, 22 Mar 2023 18:37:56 +0000 (UTC)
Date: Wed, 22 Mar 2023 18:37:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jintao Yin <nicememory@gmail.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v2 2/2] cirrus-ci: Remove MSYS2 jobs duplicated with
 gitlab-ci
Message-ID: <ZBtLAvQ/5kFofyEJ@redhat.com>
References: <20230322135721.61138-1-philmd@linaro.org>
 <20230322135721.61138-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230322135721.61138-3-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 22, 2023 at 02:57:21PM +0100, Philippe Mathieu-Daudé wrote:
> - Various developers are reluctant to git Cirrus-CI the permissions

                                      s/git/give/

>   requested to access their GitHub account.
> 
> - When we use the cirrus-run script to trigger Cirrus-CI job from
>   GitLab-CI, the GitLab-CI job is restricted to a 1h timeout
>   (often not enough).
> 
> - Although Cirrus-CI VMs are more powerful than GitLab-CI ones,
>   its free plan is limited in 2 concurrent jobs.

Right and these two points combine to create us problems. Pushes to
gitlab get automatically mirrored to github, and thus in turn trigger
CI jobs directly on Cirrus.

These jobs can prevent the next PULL on the staging branch from getting
enough execution time, and make it more likely they'll hit the 1h timeout.
This ultimately reduces the reliability of the Cirrus CI jobs for FreeBSD
and macOS that we do care about from GitLab CI.

> - The GitLab-CI MSYS2 jobs are a 1:1 mapping with the Cirrus-CI ones
>   (modulo the environment caching).
> 
> Reduce the maintenance burden by removing the Cirrus-CI config file,
> keeping the GitLab-CI jobs.
> 
> Update Yonggang Luo's maintenance file list to the new file, which
> use the same environment shell.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  MAINTAINERS |   3 +-
>  .cirrus.yml | 111 ----------------------------------------------------
>  2 files changed, 1 insertion(+), 113 deletions(-)
>  delete mode 100644 .cirrus.yml

> diff --git a/.cirrus.yml b/.cirrus.yml
> deleted file mode 100644
> index 5fb00da73d..0000000000
> --- a/.cirrus.yml
> +++ /dev/null

> -    MSYS2_PACKAGES: "
> -      diffutils git grep make pkg-config sed
> -      mingw-w64-x86_64-python
> -      mingw-w64-x86_64-python-sphinx

This isn't listed in the .gitlab-ci.d/windows.yml file

> -      mingw-w64-x86_64-toolchain

This also isn't listed

> -      mingw-w64-x86_64-SDL2
> -      mingw-w64-x86_64-SDL2_image
> -      mingw-w64-x86_64-gtk3
> -      mingw-w64-x86_64-glib2
> -      mingw-w64-x86_64-ninja
> -      mingw-w64-x86_64-jemalloc

This also isn't listed

> -      mingw-w64-x86_64-lzo2
> -      mingw-w64-x86_64-zstd
> -      mingw-w64-x86_64-libjpeg-turbo
> -      mingw-w64-x86_64-pixman
> -      mingw-w64-x86_64-libgcrypt
> -      mingw-w64-x86_64-libpng
> -      mingw-w64-x86_64-libssh
> -      mingw-w64-x86_64-snappy
> -      mingw-w64-x86_64-libusb
> -      mingw-w64-x86_64-usbredir
> -      mingw-w64-x86_64-libtasn1
> -      mingw-w64-x86_64-nettle
> -      mingw-w64-x86_64-cyrus-sasl
> -      mingw-w64-x86_64-curl
> -      mingw-w64-x86_64-gnutls
> -      mingw-w64-x86_64-libnfs

The  .gitlab-ci.d/windows.yml file meanwhile adds 'dtc' 'gcc'
and 'pkgconf' which are not present here.

This inconsistency is another point in favour of removing this
redundant cirrus config.

> -    "
> -    CHERE_INVOKING: 1
> -  msys2_cache:
> -    folder: C:\tools\archive
> -    reupload_on_changes: false
> -    # These env variables are used to generate fingerprint to trigger the cache procedure
> -    # If wanna to force re-populate msys2, increase MSYS2_FINGERPRINT
> -    fingerprint_script:
> -      - |
> -        echo $env:CIRRUS_TASK_NAME
> -        echo $env:MSYS2_URL
> -        echo $env:MSYS2_FINGERPRINT
> -        echo $env:MSYS2_PACKAGES
> -    populate_script:
> -      - |
> -        md -Force C:\tools\archive\pkg
> -        $start_time = Get-Date
> -        bitsadmin /transfer msys_download /dynamic /download /priority FOREGROUND $env:MSYS2_URL C:\tools\archive\base.exe
> -        Write-Output "Download time taken: $((Get-Date).Subtract($start_time))"
> -        cd C:\tools
> -        C:\tools\archive\base.exe -y
> -        del -Force C:\tools\archive\base.exe
> -        Write-Output "Base install time taken: $((Get-Date).Subtract($start_time))"
> -        $start_time = Get-Date
> -
> -        ((Get-Content -path C:\tools\msys64\etc\\post-install\\07-pacman-key.post -Raw) -replace '--refresh-keys', '--version') | Set-Content -Path C:\tools\msys64\etc\\post-install\\07-pacman-key.post
> -        C:\tools\msys64\usr\bin\bash.exe -lc "sed -i 's/^CheckSpace/#CheckSpace/g' /etc/pacman.conf"
> -        C:\tools\msys64\usr\bin\bash.exe -lc "export"
> -        C:\tools\msys64\usr\bin\pacman.exe --noconfirm -Sy
> -        echo Y | C:\tools\msys64\usr\bin\pacman.exe --noconfirm -Suu --overwrite=*
> -        taskkill /F /FI "MODULES eq msys-2.0.dll"
> -        tasklist
> -        C:\tools\msys64\usr\bin\bash.exe -lc "mv -f /etc/pacman.conf.pacnew /etc/pacman.conf || true"
> -        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -Syuu --overwrite=*"
> -        Write-Output "Core install time taken: $((Get-Date).Subtract($start_time))"
> -        $start_time = Get-Date
> -
> -        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -S --needed $env:MSYS2_PACKAGES"
> -        Write-Output "Package install time taken: $((Get-Date).Subtract($start_time))"
> -        $start_time = Get-Date
> -
> -        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\etc\mtab
> -        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\fd
> -        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\stderr
> -        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\stdin
> -        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\stdout
> -        del -Force -Recurse -ErrorAction SilentlyContinue C:\tools\msys64\var\cache\pacman\pkg
> -        tar cf C:\tools\archive\msys64.tar -C C:\tools\ msys64
> -
> -        Write-Output "Package archive time taken: $((Get-Date).Subtract($start_time))"
> -        del -Force -Recurse -ErrorAction SilentlyContinue c:\tools\msys64 
> -  install_script:
> -    - |
> -      $start_time = Get-Date
> -      cd C:\tools
> -      ls C:\tools\archive\msys64.tar
> -      tar xf C:\tools\archive\msys64.tar
> -      Write-Output "Extract msys2 time taken: $((Get-Date).Subtract($start_time))"
> -  script:
> -    - mkdir build
> -    - cd build
> -    - C:\tools\msys64\usr\bin\bash.exe -lc "../configure --python=python3
> -        --target-list-exclude=i386-softmmu,ppc64-softmmu,aarch64-softmmu,mips64-softmmu,mipsel-softmmu,sh4-softmmu"

This excludes a few targets, but the .gitlab-ci.d/windows.yml file
merely allow-lists  x86_64-softmmu only, and also adds
--without-default-devices

IOW the remaining config has less coverage than this one. Of course
if no one ever looks at these results, the better coverage is not
doing anything for us.

> -    - C:\tools\msys64\usr\bin\bash.exe -lc "make -j8"

The .gitlab-ci.d/windows.yml file does not pass '-j8' so presumably
runs slower.

THe gitlab docs indicate the Windows VMs have 2 vCPUs so we ought to
have been using -j2 in the .gitlab-ci.d/windows.yml file IIUC

> -    - exit $LastExitCode
> -  test_script:

> -    - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make V=1 check"

The .gitlab-ci.d/windows.yml file passes '--no-suite qtest' so appears
to have less test coverage


Broadly I agree with this proposal, but it feels like we might want a
few tweak to the windows.yml file to address some of the inconsistencies



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


