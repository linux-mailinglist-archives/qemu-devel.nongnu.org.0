Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B249D405A27
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 17:24:55 +0200 (CEST)
Received: from localhost ([::1]:34432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOLv4-0004OA-PL
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 11:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mOLtA-0002RP-FZ
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:22:56 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mOLt6-0003F1-7z
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:22:56 -0400
Received: by mail-wr1-x432.google.com with SMTP id q11so3102427wrr.9
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 08:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=81OxiH8DgXfn+TWBC45Snc4Y1v5DHjlnlzDZq5peYDY=;
 b=FgPTb7tFBOZZrzIB3aa5aQO1RmqkU0ORdCnenKFN//0vjh/WkhBUcbVWc13rXdCfrv
 tJd2j1agTPpwgcyl12XnlYgC7uRyKGujEfFsexOMfYrFtwcM3h/nbNaaCwuuGKCvQPZr
 BGyfUv3m1CrTJh2aEBOBnGvqqX03wabElnVMfn+NgAERJZhHnp+GmgB9/j9Nwhj5+OwD
 59hVfbKqOruZXM+i8DbS61vIQkf6jjxQ1dAQlsghgn1n2m/C4FfBPl5doyG7QqfGlLTn
 rmvaIvSEOJ0oo9gpMlIVp68PgMOatPxYEmIEWBYktvcYlfnfDhMlo0R1qb4LQEO6dbMM
 xGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=81OxiH8DgXfn+TWBC45Snc4Y1v5DHjlnlzDZq5peYDY=;
 b=qeZKUtlq5XOoeLnyEAOwnLPhzh1kk70cl8LjE5GV279+67HeP9MEurwVeWjqzOmAE5
 +JGEA79r1iowGMQCS6keK6FOBrogRftmQhllF3I2A4dcigbURZ14tr2Qxw0L1JM+YQIr
 JEm4tT83T+2dBEKrugq1KZFqv0mG5OhegfvKisyLmfLUV9TQy+JF4H7x6Z+c/tClJNqZ
 6o/hs1F2Srm5jvOJQUeadr+8ikP7Uk9RWFV0/ZeCFstKOicGG/fWxE8n+MlTgfmeXHA7
 KiVWMuFlpgwu6AU6+2slIcaoCzu/VSzM23gH7HqM0pmJufKLNWIR2H8U+j/8yRA8mNhm
 /awQ==
X-Gm-Message-State: AOAM531Tu8arMMlh9XCzC3ncH6m5k9bWakM5EyjeddNR1AzoKvphOXd4
 pUHIHOrlnGXC6+GPADj1YhMFgr6AkDLX1fOixWE=
X-Google-Smtp-Source: ABdhPJxJ/uxsjYMj1V7x4NJ3czJwqkliUN53RZL/y9FFrmHVVaWsJgO63Q+opQF0kdJHpYrdHwG8ILd1K+EnGZdEfI8=
X-Received: by 2002:adf:e606:: with SMTP id p6mr4306875wrm.231.1631200970698; 
 Thu, 09 Sep 2021 08:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <871r5zurqm.fsf@dusky.pond.sub.org>
 <CAJ+F1CKDieE9jb0eMYErV5HzM_XDURqr5V90PZHH3Amo97u6hA@mail.gmail.com>
 <87ee9ykplh.fsf@dusky.pond.sub.org>
In-Reply-To: <87ee9ykplh.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 9 Sep 2021 19:22:38 +0400
Message-ID: <CAJ+F1C+CV8jCL_bvEhUv88um5rWh38LfJRFeRHczcSQ4XgNTQw@mail.gmail.com>
Subject: Re: [RFC v3 00/32] Rust binding for QAPI and qemu-ga QMP handler
 examples
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006a733505cb919255"
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006a733505cb919255
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Sep 9, 2021 at 2:31 PM Markus Armbruster <armbru@redhat.com> wrote:

> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>
> > Hi
> >
> > On Wed, Sep 8, 2021 at 5:23 PM Markus Armbruster <armbru@redhat.com>
> wrote:
> >
> >> Build fails for me:
> >>
> >> make: Entering directory '/work/armbru/qemu/bld'
> >> config-host.mak is out-of-date, running configure
> >>   GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
> >> tests/fp/berkeley-softfloat-3 dtc capstone slirp
> >> fatal: remote error: upload-pack: not our ref
> >> 7077bbbd11a67d60062a9483f996113a349a4ca1
> >>
> >
> > Looks like I didn't update the repository on github. done
> >
> > I will update .gitmodule to use the repo on gitlab instead (gitlab.com:
> > marcandre.lureau/qemu-rust-vendored.git)
>
> Next error:
>
> make -k -C ~/work/qemu/bld-x86
> make: Entering directory '/work/armbru/qemu/bld-x86'
>   GIT     ui/keycodemapdb rust/vendored tests/fp/berkeley-testfloat-3
> tests/fp/berkeley-softfloat-3 dtc capstone slirp
> [1/71] Generating qemu-version.h with a custom command (wrapped by meson
> to capture output)
> [2/55] Generating cargo-qga with a custom command
> FAILED: qga/libqga.args qga/libqga.a
> /usr/bin/python3 /work/armbru/qemu/scripts/cargo_wrapper.py --configh
> /work/armbru/qemu/bld-x86/config-host.h /work/armbru/qemu/bld-x86/qga
> /work/armbru/qemu/qga /work/armbru/qemu/bld-x86 debug '' build-lib
> Environment: MESON_CURRENT_BUILD_DIR=3D/work/armbru/qemu/bld-x86/qga
> MESON_BUILD_ROOT=3D/work/armbru/qemu/bld-x86 WINAPI_NO_BUNDLED_LIBRARIES=
=3D1
> Command: cargo rustc --target-dir /work/armbru/qemu/bld-x86/qga/rs-target
> --manifest-path /work/armbru/qemu/qga/Cargo.toml --offline --lib -- --cfg
> CONFIG_ACCEPT4 --cfg CONFIG_AF_VSOCK --cfg CONFIG_ATOMIC64 --cfg
> CONFIG_ATTR --cfg CONFIG_AUDIO_OSS --cfg CONFIG_AUDIO_PA --cfg
> CONFIG_AVX2_OPT --cfg CONFIG_BDRV_RO_WHITELIST --cfg
> CONFIG_BDRV_RW_WHITELIST --cfg CONFIG_BOCHS --cfg CONFIG_BRLAPI --cfg
> CONFIG_BYTESWAP_H --cfg CONFIG_CAPSTONE --cfg CONFIG_CLOCK_ADJTIME --cfg
> CONFIG_CLOOP --cfg CONFIG_CMPXCHG128 --cfg CONFIG_COROUTINE_POOL --cfg
> CONFIG_CPUID_H --cfg CONFIG_CURL --cfg CONFIG_CURSES --cfg
> CONFIG_DEBUG_MUTEX --cfg CONFIG_DEBUG_TCG --cfg CONFIG_DMG --cfg
> CONFIG_DUP3 --cfg CONFIG_EBPF --cfg CONFIG_EPOLL --cfg CONFIG_EPOLL_CREAT=
E1
> --cfg CONFIG_EVENTFD --cfg CONFIG_FALLOCATE --cfg
> CONFIG_FALLOCATE_PUNCH_HOLE --cfg CONFIG_FALLOCATE_ZERO_RANGE --cfg
> CONFIG_FDATASYNC --cfg CONFIG_FDT --cfg CONFIG_FIEMAP --cfg CONFIG_GBM
> --cfg CONFIG_GETAUXVAL --cfg CONFIG_GETRANDOM --cfg CONFIG_GETTID --cfg
> CONFIG_GIO --cfg CONFIG_GLUSTERFS --cfg CONFIG_GLUSTERFS_DISCARD --cfg
> CONFIG_GLUSTERFS_FALLOCATE --cfg CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT --cf=
g
> CONFIG_GLUSTERFS_IOCB_HAS_STAT --cfg CONFIG_GLUSTERFS_XLATOR_OPT --cfg
> CONFIG_GLUSTERFS_ZEROFILL --cfg CONFIG_GNUTLS --cfg CONFIG_GNUTLS_CRYPTO
> --cfg CONFIG_GTK --cfg CONFIG_GUEST_AGENT --cfg CONFIG_HAS_ENVIRON --cfg
> CONFIG_INOTIFY --cfg CONFIG_INOTIFY1 --cfg CONFIG_INT128 --cfg CONFIG_IOV=
EC
> --cfg CONFIG_L2TPV3 --cfg CONFIG_LIBCAP_NG --cfg CONFIG_LIBISCSI --cfg
> CONFIG_LIBNFS --cfg CONFIG_LIBPMEM --cfg CONFIG_LIBPULSE --cfg
> CONFIG_LIBSSH --cfg CONFIG_LIBUDEV --cfg CONFIG_LINUX --cfg
> CONFIG_LINUX_AIO --cfg CONFIG_LINUX_MAGIC_H --cfg
> CONFIG_LIVE_BLOCK_MIGRATION --cfg CONFIG_LZO --cfg CONFIG_MADVISE --cfg
> CONFIG_MALLOC_TRIM --cfg CONFIG_MEMFD --cfg CONFIG_MPATH --cfg
> CONFIG_MPATH_NEW_API --cfg CONFIG_NUMA --cfg CONFIG_OPENGL --cfg
> CONFIG_OPEN_BY_HANDLE --cfg CONFIG_PARALLELS --cfg CONFIG_PIPE2 --cfg
> CONFIG_PLUGIN --cfg CONFIG_POSIX --cfg CONFIG_POSIX_FALLOCATE --cfg
> CONFIG_POSIX_MADVISE --cfg CONFIG_POSIX_MEMALIGN --cfg CONFIG_PPOLL --cfg
> CONFIG_PRCTL_PR_SET_TIMERSLACK --cfg CONFIG_PREADV --cfg
> CONFIG_PTHREAD_SETNAME_NP_W_TID --cfg CONFIG_PVRDMA --cfg CONFIG_QCOW1
> --cfg CONFIG_QED --cfg CONFIG_QOM_CAST_DEBUG --cfg CONFIG_RBD --cfg
> CONFIG_RDMA --cfg CONFIG_REPLICATION --cfg CONFIG_RTNETLINK --cfg
> CONFIG_SDL --cfg CONFIG_SDL_IMAGE --cfg CONFIG_SECCOMP --cfg
> CONFIG_SECRET_KEYRING --cfg CONFIG_SEM_TIMEDWAIT --cfg CONFIG_SENDFILE
> --cfg CONFIG_SETNS --cfg CONFIG_SIGNALFD --cfg CONFIG_SLIRP --cfg
> CONFIG_SLIRP_SMBD --cfg CONFIG_SNAPPY --cfg CONFIG_SPICE --cfg
> CONFIG_SPICE_PROTOCOL --cfg CONFIG_SPLICE --cfg CONFIG_STATX --cfg
> CONFIG_SYNCFS --cfg CONFIG_SYNC_FILE_RANGE --cfg CONFIG_SYSMACROS --cfg
> CONFIG_TCG --cfg CONFIG_THREAD_SETNAME_BYTHREAD --cfg CONFIG_TIMERFD --cf=
g
> CONFIG_TOOLS --cfg CONFIG_TPM --cfg CONFIG_TRACE_LOG --cfg CONFIG_USBFS
> --cfg CONFIG_USB_LIBUSB --cfg CONFIG_VALGRIND_H --cfg CONFIG_VDI --cfg
> CONFIG_VHOST_CRYPTO --cfg CONFIG_VHOST_KERNEL --cfg CONFIG_VHOST_NET --cf=
g
> CONFIG_VHOST_NET_USER --cfg CONFIG_VHOST_NET_VDPA --cfg CONFIG_VHOST_SCSI
> --cfg CONFIG_VHOST_USER --cfg CONFIG_VHOST_USER_BLK_SERVER --cfg
> CONFIG_VHOST_USER_FS --cfg CONFIG_VHOST_USER_VSOCK --cfg CONFIG_VHOST_VDP=
A
> --cfg CONFIG_VHOST_VSOCK --cfg CONFIG_VIRTFS --cfg CONFIG_VNC --cfg
> CONFIG_VNC_JPEG --cfg CONFIG_VNC_PNG --cfg CONFIG_VNC_SASL --cfg
> CONFIG_VVFAT --cfg CONFIG_WITH_RUST --cfg CONFIG_X11 --cfg
> CONFIG_XEN_BACKEND --cfg CONFIG_XFS --cfg CONFIG_XKBCOMMON --cfg
> CONFIG_ZSTD --cfg HAVE_BTRFS_H --cfg HAVE_COPY_FILE_RANGE --cfg HAVE_DRM_=
H
> --cfg HAVE_FSXATTR --cfg HAVE_HOST_BLOCK_DEVICE --cfg HAVE_IPPROTO_MPTCP
> --cfg HAVE_MLOCKALL --cfg HAVE_OPENPTY --cfg HAVE_PTY_H --cfg
> HAVE_STRCHRNUL --cfg HAVE_STRUCT_STAT_ST_ATIM --cfg HAVE_SYSTEM_FUNCTION
> --cfg HAVE_UTMPX --print native-static-libs
> error: failed to select a version for the requirement `cc =3D "=3D1.0.70"=
`
> candidate versions found which didn't match: 1.0.69
> location searched: directory source `/work/armbru/qemu/rust/vendored`
> (which is replacing registry `
> https://github.com/rust-lang/crates.io-index`
> <https://github.com/rust-lang/crates.io-index>)
> required by package `nix v0.20.1`
>     ... which is depended on by `qga v0.1.0 (/work/armbru/qemu/qga)`
> perhaps a crate was updated and forgotten to be re-vendored?
> As a reminder, you're using offline mode (--offline) which can sometimes
> cause surprising resolution failures, if this error is too confusing you
> may wish to retry without the offline flag.
>
>
Yes, my bad. See discussion in "[RFC v3 13/32] rust: use vendored-sources".
If you reset rust/vendored to origin/master (and commit that to avoid sync
back), it should work.


> [3/55] Generating qga-qapi-cabi-rs with a custom command
> FAILED: qga/qapi-cabi-rs
> /usr/bin/python3 /work/armbru/qemu/scripts/cargo_wrapper.py --configh
> /work/armbru/qemu/bld-x86/config-host.h /work/armbru/qemu/bld-x86/qga
> /work/armbru/qemu/qga /work/armbru/qemu/bld-x86 debug '' build-bin
> qapi-cabi-rs -- --cfg QAPI_CABI
> error: the option `Z` is only accepted on the nightly compiler
>
> Environment: MESON_CURRENT_BUILD_DIR=3D/work/armbru/qemu/bld-x86/qga
> MESON_BUILD_ROOT=3D/work/armbru/qemu/bld-x86 WINAPI_NO_BUNDLED_LIBRARIES=
=3D1
> Command: cargo rustc --target-dir /work/armbru/qemu/bld-x86/qga/rs-target
> --manifest-path /work/armbru/qemu/qga/Cargo.toml --offline --bin
> qapi-cabi-rs -- --cfg CONFIG_ACCEPT4 --cfg CONFIG_AF_VSOCK --cfg
> CONFIG_ATOMIC64 --cfg CONFIG_ATTR --cfg CONFIG_AUDIO_OSS --cfg
> CONFIG_AUDIO_PA --cfg CONFIG_AVX2_OPT --cfg CONFIG_BDRV_RO_WHITELIST --cf=
g
> CONFIG_BDRV_RW_WHITELIST --cfg CONFIG_BOCHS --cfg CONFIG_BRLAPI --cfg
> CONFIG_BYTESWAP_H --cfg CONFIG_CAPSTONE --cfg CONFIG_CLOCK_ADJTIME --cfg
> CONFIG_CLOOP --cfg CONFIG_CMPXCHG128 --cfg CONFIG_COROUTINE_POOL --cfg
> CONFIG_CPUID_H --cfg CONFIG_CURL --cfg CONFIG_CURSES --cfg
> CONFIG_DEBUG_MUTEX --cfg CONFIG_DEBUG_TCG --cfg CONFIG_DMG --cfg
> CONFIG_DUP3 --cfg CONFIG_EBPF --cfg CONFIG_EPOLL --cfg CONFIG_EPOLL_CREAT=
E1
> --cfg CONFIG_EVENTFD --cfg CONFIG_FALLOCATE --cfg
> CONFIG_FALLOCATE_PUNCH_HOLE --cfg CONFIG_FALLOCATE_ZERO_RANGE --cfg
> CONFIG_FDATASYNC --cfg CONFIG_FDT --cfg CONFIG_FIEMAP --cfg CONFIG_GBM
> --cfg CONFIG_GETAUXVAL --cfg CONFIG_GETRANDOM --cfg CONFIG_GETTID --cfg
> CONFIG_GIO --cfg CONFIG_GLUSTERFS --cfg CONFIG_GLUSTERFS_DISCARD --cfg
> CONFIG_GLUSTERFS_FALLOCATE --cfg CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT --cf=
g
> CONFIG_GLUSTERFS_IOCB_HAS_STAT --cfg CONFIG_GLUSTERFS_XLATOR_OPT --cfg
> CONFIG_GLUSTERFS_ZEROFILL --cfg CONFIG_GNUTLS --cfg CONFIG_GNUTLS_CRYPTO
> --cfg CONFIG_GTK --cfg CONFIG_GUEST_AGENT --cfg CONFIG_HAS_ENVIRON --cfg
> CONFIG_INOTIFY --cfg CONFIG_INOTIFY1 --cfg CONFIG_INT128 --cfg CONFIG_IOV=
EC
> --cfg CONFIG_L2TPV3 --cfg CONFIG_LIBCAP_NG --cfg CONFIG_LIBISCSI --cfg
> CONFIG_LIBNFS --cfg CONFIG_LIBPMEM --cfg CONFIG_LIBPULSE --cfg
> CONFIG_LIBSSH --cfg CONFIG_LIBUDEV --cfg CONFIG_LINUX --cfg
> CONFIG_LINUX_AIO --cfg CONFIG_LINUX_MAGIC_H --cfg
> CONFIG_LIVE_BLOCK_MIGRATION --cfg CONFIG_LZO --cfg CONFIG_MADVISE --cfg
> CONFIG_MALLOC_TRIM --cfg CONFIG_MEMFD --cfg CONFIG_MPATH --cfg
> CONFIG_MPATH_NEW_API --cfg CONFIG_NUMA --cfg CONFIG_OPENGL --cfg
> CONFIG_OPEN_BY_HANDLE --cfg CONFIG_PARALLELS --cfg CONFIG_PIPE2 --cfg
> CONFIG_PLUGIN --cfg CONFIG_POSIX --cfg CONFIG_POSIX_FALLOCATE --cfg
> CONFIG_POSIX_MADVISE --cfg CONFIG_POSIX_MEMALIGN --cfg CONFIG_PPOLL --cfg
> CONFIG_PRCTL_PR_SET_TIMERSLACK --cfg CONFIG_PREADV --cfg
> CONFIG_PTHREAD_SETNAME_NP_W_TID --cfg CONFIG_PVRDMA --cfg CONFIG_QCOW1
> --cfg CONFIG_QED --cfg CONFIG_QOM_CAST_DEBUG --cfg CONFIG_RBD --cfg
> CONFIG_RDMA --cfg CONFIG_REPLICATION --cfg CONFIG_RTNETLINK --cfg
> CONFIG_SDL --cfg CONFIG_SDL_IMAGE --cfg CONFIG_SECCOMP --cfg
> CONFIG_SECRET_KEYRING --cfg CONFIG_SEM_TIMEDWAIT --cfg CONFIG_SENDFILE
> --cfg CONFIG_SETNS --cfg CONFIG_SIGNALFD --cfg CONFIG_SLIRP --cfg
> CONFIG_SLIRP_SMBD --cfg CONFIG_SNAPPY --cfg CONFIG_SPICE --cfg
> CONFIG_SPICE_PROTOCOL --cfg CONFIG_SPLICE --cfg CONFIG_STATX --cfg
> CONFIG_SYNCFS --cfg CONFIG_SYNC_FILE_RANGE --cfg CONFIG_SYSMACROS --cfg
> CONFIG_TCG --cfg CONFIG_THREAD_SETNAME_BYTHREAD --cfg CONFIG_TIMERFD --cf=
g
> CONFIG_TOOLS --cfg CONFIG_TPM --cfg CONFIG_TRACE_LOG --cfg CONFIG_USBFS
> --cfg CONFIG_USB_LIBUSB --cfg CONFIG_VALGRIND_H --cfg CONFIG_VDI --cfg
> CONFIG_VHOST_CRYPTO --cfg CONFIG_VHOST_KERNEL --cfg CONFIG_VHOST_NET --cf=
g
> CONFIG_VHOST_NET_USER --cfg CONFIG_VHOST_NET_VDPA --cfg CONFIG_VHOST_SCSI
> --cfg CONFIG_VHOST_USER --cfg CONFIG_VHOST_USER_BLK_SERVER --cfg
> CONFIG_VHOST_USER_FS --cfg CONFIG_VHOST_USER_VSOCK --cfg CONFIG_VHOST_VDP=
A
> --cfg CONFIG_VHOST_VSOCK --cfg CONFIG_VIRTFS --cfg CONFIG_VNC --cfg
> CONFIG_VNC_JPEG --cfg CONFIG_VNC_PNG --cfg CONFIG_VNC_SASL --cfg
> CONFIG_VVFAT --cfg CONFIG_WITH_RUST --cfg CONFIG_X11 --cfg
> CONFIG_XEN_BACKEND --cfg CONFIG_XFS --cfg CONFIG_XKBCOMMON --cfg
> CONFIG_ZSTD --cfg HAVE_BTRFS_H --cfg HAVE_COPY_FILE_RANGE --cfg HAVE_DRM_=
H
> --cfg HAVE_FSXATTR --cfg HAVE_HOST_BLOCK_DEVICE --cfg HAVE_IPPROTO_MPTCP
> --cfg HAVE_MLOCKALL --cfg HAVE_OPENPTY --cfg HAVE_PTY_H --cfg
> HAVE_STRCHRNUL --cfg HAVE_STRUCT_STAT_ST_ATIM --cfg HAVE_SYSTEM_FUNCTION
> --cfg HAVE_UTMPX --cfg QAPI_CABI
> error: failed to select a version for the requirement `cc =3D "=3D1.0.70"=
`
> candidate versions found which didn't match: 1.0.69
> location searched: directory source `/work/armbru/qemu/rust/vendored`
> (which is replacing registry `
> https://github.com/rust-lang/crates.io-index`
> <https://github.com/rust-lang/crates.io-index>)
> required by package `nix v0.20.1`
>     ... which is depended on by `qga v0.1.0 (/work/armbru/qemu/qga)`
> perhaps a crate was updated and forgotten to be re-vendored?
> As a reminder, you're using offline mode (--offline) which can sometimes
> cause surprising resolution failures, if this error is too confusing you
> may wish to retry without the offline flag.
>
> [4/55] Generating Test Rust library with a custom command
> FAILED: tests/libqemu_tests.args tests/libqemu_tests.a
> /usr/bin/python3 /work/armbru/qemu/scripts/cargo_wrapper.py --configh
> /work/armbru/qemu/bld-x86/config-host.h /work/armbru/qemu/bld-x86/tests
> /work/armbru/qemu/tests /work/armbru/qemu/bld-x86 debug '' build-lib
> Environment: MESON_CURRENT_BUILD_DIR=3D/work/armbru/qemu/bld-x86/tests
> MESON_BUILD_ROOT=3D/work/armbru/qemu/bld-x86 WINAPI_NO_BUNDLED_LIBRARIES=
=3D1
> Command: cargo rustc --target-dir
> /work/armbru/qemu/bld-x86/tests/rs-target --manifest-path
> /work/armbru/qemu/tests/Cargo.toml --offline --lib -- --cfg CONFIG_ACCEPT=
4
> --cfg CONFIG_AF_VSOCK --cfg CONFIG_ATOMIC64 --cfg CONFIG_ATTR --cfg
> CONFIG_AUDIO_OSS --cfg CONFIG_AUDIO_PA --cfg CONFIG_AVX2_OPT --cfg
> CONFIG_BDRV_RO_WHITELIST --cfg CONFIG_BDRV_RW_WHITELIST --cfg CONFIG_BOCH=
S
> --cfg CONFIG_BRLAPI --cfg CONFIG_BYTESWAP_H --cfg CONFIG_CAPSTONE --cfg
> CONFIG_CLOCK_ADJTIME --cfg CONFIG_CLOOP --cfg CONFIG_CMPXCHG128 --cfg
> CONFIG_COROUTINE_POOL --cfg CONFIG_CPUID_H --cfg CONFIG_CURL --cfg
> CONFIG_CURSES --cfg CONFIG_DEBUG_MUTEX --cfg CONFIG_DEBUG_TCG --cfg
> CONFIG_DMG --cfg CONFIG_DUP3 --cfg CONFIG_EBPF --cfg CONFIG_EPOLL --cfg
> CONFIG_EPOLL_CREATE1 --cfg CONFIG_EVENTFD --cfg CONFIG_FALLOCATE --cfg
> CONFIG_FALLOCATE_PUNCH_HOLE --cfg CONFIG_FALLOCATE_ZERO_RANGE --cfg
> CONFIG_FDATASYNC --cfg CONFIG_FDT --cfg CONFIG_FIEMAP --cfg CONFIG_GBM
> --cfg CONFIG_GETAUXVAL --cfg CONFIG_GETRANDOM --cfg CONFIG_GETTID --cfg
> CONFIG_GIO --cfg CONFIG_GLUSTERFS --cfg CONFIG_GLUSTERFS_DISCARD --cfg
> CONFIG_GLUSTERFS_FALLOCATE --cfg CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT --cf=
g
> CONFIG_GLUSTERFS_IOCB_HAS_STAT --cfg CONFIG_GLUSTERFS_XLATOR_OPT --cfg
> CONFIG_GLUSTERFS_ZEROFILL --cfg CONFIG_GNUTLS --cfg CONFIG_GNUTLS_CRYPTO
> --cfg CONFIG_GTK --cfg CONFIG_GUEST_AGENT --cfg CONFIG_HAS_ENVIRON --cfg
> CONFIG_INOTIFY --cfg CONFIG_INOTIFY1 --cfg CONFIG_INT128 --cfg CONFIG_IOV=
EC
> --cfg CONFIG_L2TPV3 --cfg CONFIG_LIBCAP_NG --cfg CONFIG_LIBISCSI --cfg
> CONFIG_LIBNFS --cfg CONFIG_LIBPMEM --cfg CONFIG_LIBPULSE --cfg
> CONFIG_LIBSSH --cfg CONFIG_LIBUDEV --cfg CONFIG_LINUX --cfg
> CONFIG_LINUX_AIO --cfg CONFIG_LINUX_MAGIC_H --cfg
> CONFIG_LIVE_BLOCK_MIGRATION --cfg CONFIG_LZO --cfg CONFIG_MADVISE --cfg
> CONFIG_MALLOC_TRIM --cfg CONFIG_MEMFD --cfg CONFIG_MPATH --cfg
> CONFIG_MPATH_NEW_API --cfg CONFIG_NUMA --cfg CONFIG_OPENGL --cfg
> CONFIG_OPEN_BY_HANDLE --cfg CONFIG_PARALLELS --cfg CONFIG_PIPE2 --cfg
> CONFIG_PLUGIN --cfg CONFIG_POSIX --cfg CONFIG_POSIX_FALLOCATE --cfg
> CONFIG_POSIX_MADVISE --cfg CONFIG_POSIX_MEMALIGN --cfg CONFIG_PPOLL --cfg
> CONFIG_PRCTL_PR_SET_TIMERSLACK --cfg CONFIG_PREADV --cfg
> CONFIG_PTHREAD_SETNAME_NP_W_TID --cfg CONFIG_PVRDMA --cfg CONFIG_QCOW1
> --cfg CONFIG_QED --cfg CONFIG_QOM_CAST_DEBUG --cfg CONFIG_RBD --cfg
> CONFIG_RDMA --cfg CONFIG_REPLICATION --cfg CONFIG_RTNETLINK --cfg
> CONFIG_SDL --cfg CONFIG_SDL_IMAGE --cfg CONFIG_SECCOMP --cfg
> CONFIG_SECRET_KEYRING --cfg CONFIG_SEM_TIMEDWAIT --cfg CONFIG_SENDFILE
> --cfg CONFIG_SETNS --cfg CONFIG_SIGNALFD --cfg CONFIG_SLIRP --cfg
> CONFIG_SLIRP_SMBD --cfg CONFIG_SNAPPY --cfg CONFIG_SPICE --cfg
> CONFIG_SPICE_PROTOCOL --cfg CONFIG_SPLICE --cfg CONFIG_STATX --cfg
> CONFIG_SYNCFS --cfg CONFIG_SYNC_FILE_RANGE --cfg CONFIG_SYSMACROS --cfg
> CONFIG_TCG --cfg CONFIG_THREAD_SETNAME_BYTHREAD --cfg CONFIG_TIMERFD --cf=
g
> CONFIG_TOOLS --cfg CONFIG_TPM --cfg CONFIG_TRACE_LOG --cfg CONFIG_USBFS
> --cfg CONFIG_USB_LIBUSB --cfg CONFIG_VALGRIND_H --cfg CONFIG_VDI --cfg
> CONFIG_VHOST_CRYPTO --cfg CONFIG_VHOST_KERNEL --cfg CONFIG_VHOST_NET --cf=
g
> CONFIG_VHOST_NET_USER --cfg CONFIG_VHOST_NET_VDPA --cfg CONFIG_VHOST_SCSI
> --cfg CONFIG_VHOST_USER --cfg CONFIG_VHOST_USER_BLK_SERVER --cfg
> CONFIG_VHOST_USER_FS --cfg CONFIG_VHOST_USER_VSOCK --cfg CONFIG_VHOST_VDP=
A
> --cfg CONFIG_VHOST_VSOCK --cfg CONFIG_VIRTFS --cfg CONFIG_VNC --cfg
> CONFIG_VNC_JPEG --cfg CONFIG_VNC_PNG --cfg CONFIG_VNC_SASL --cfg
> CONFIG_VVFAT --cfg CONFIG_WITH_RUST --cfg CONFIG_X11 --cfg
> CONFIG_XEN_BACKEND --cfg CONFIG_XFS --cfg CONFIG_XKBCOMMON --cfg
> CONFIG_ZSTD --cfg HAVE_BTRFS_H --cfg HAVE_COPY_FILE_RANGE --cfg HAVE_DRM_=
H
> --cfg HAVE_FSXATTR --cfg HAVE_HOST_BLOCK_DEVICE --cfg HAVE_IPPROTO_MPTCP
> --cfg HAVE_MLOCKALL --cfg HAVE_OPENPTY --cfg HAVE_PTY_H --cfg
> HAVE_STRCHRNUL --cfg HAVE_STRUCT_STAT_ST_ATIM --cfg HAVE_SYSTEM_FUNCTION
> --cfg HAVE_UTMPX --print native-static-libs
> error: failed to select a version for the requirement `cc =3D "=3D1.0.70"=
`
> candidate versions found which didn't match: 1.0.69
> location searched: directory source `/work/armbru/qemu/rust/vendored`
> (which is replacing registry `
> https://github.com/rust-lang/crates.io-index`
> <https://github.com/rust-lang/crates.io-index>)
> required by package `nix v0.20.1`
>     ... which is depended on by `qga v0.1.0 (/work/armbru/qemu/qga)`
> perhaps a crate was updated and forgotten to be re-vendored?
> As a reminder, you're using offline mode (--offline) which can sometimes
> cause surprising resolution failures, if this error is too confusing you
> may wish to retry without the offline flag.
>
> [5/55] Generating QAPI test (include) with a custom command
> [6/20] Generating qapi-cabi-rs with a custom command
> FAILED: tests/qapi-cabi-rs
> /usr/bin/python3 /work/armbru/qemu/scripts/cargo_wrapper.py --configh
> /work/armbru/qemu/bld-x86/config-host.h /work/armbru/qemu/bld-x86/tests
> /work/armbru/qemu/tests /work/armbru/qemu/bld-x86 debug '' build-bin
> qapi-cabi-rs -- --cfg QAPI_CABI
> error: the option `Z` is only accepted on the nightly compiler
>
> Environment: MESON_CURRENT_BUILD_DIR=3D/work/armbru/qemu/bld-x86/tests
> MESON_BUILD_ROOT=3D/work/armbru/qemu/bld-x86 WINAPI_NO_BUNDLED_LIBRARIES=
=3D1
> Command: cargo rustc --target-dir
> /work/armbru/qemu/bld-x86/tests/rs-target --manifest-path
> /work/armbru/qemu/tests/Cargo.toml --offline --bin qapi-cabi-rs -- --cfg
> CONFIG_ACCEPT4 --cfg CONFIG_AF_VSOCK --cfg CONFIG_ATOMIC64 --cfg
> CONFIG_ATTR --cfg CONFIG_AUDIO_OSS --cfg CONFIG_AUDIO_PA --cfg
> CONFIG_AVX2_OPT --cfg CONFIG_BDRV_RO_WHITELIST --cfg
> CONFIG_BDRV_RW_WHITELIST --cfg CONFIG_BOCHS --cfg CONFIG_BRLAPI --cfg
> CONFIG_BYTESWAP_H --cfg CONFIG_CAPSTONE --cfg CONFIG_CLOCK_ADJTIME --cfg
> CONFIG_CLOOP --cfg CONFIG_CMPXCHG128 --cfg CONFIG_COROUTINE_POOL --cfg
> CONFIG_CPUID_H --cfg CONFIG_CURL --cfg CONFIG_CURSES --cfg
> CONFIG_DEBUG_MUTEX --cfg CONFIG_DEBUG_TCG --cfg CONFIG_DMG --cfg
> CONFIG_DUP3 --cfg CONFIG_EBPF --cfg CONFIG_EPOLL --cfg CONFIG_EPOLL_CREAT=
E1
> --cfg CONFIG_EVENTFD --cfg CONFIG_FALLOCATE --cfg
> CONFIG_FALLOCATE_PUNCH_HOLE --cfg CONFIG_FALLOCATE_ZERO_RANGE --cfg
> CONFIG_FDATASYNC --cfg CONFIG_FDT --cfg CONFIG_FIEMAP --cfg CONFIG_GBM
> --cfg CONFIG_GETAUXVAL --cfg CONFIG_GETRANDOM --cfg CONFIG_GETTID --cfg
> CONFIG_GIO --cfg CONFIG_GLUSTERFS --cfg CONFIG_GLUSTERFS_DISCARD --cfg
> CONFIG_GLUSTERFS_FALLOCATE --cfg CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT --cf=
g
> CONFIG_GLUSTERFS_IOCB_HAS_STAT --cfg CONFIG_GLUSTERFS_XLATOR_OPT --cfg
> CONFIG_GLUSTERFS_ZEROFILL --cfg CONFIG_GNUTLS --cfg CONFIG_GNUTLS_CRYPTO
> --cfg CONFIG_GTK --cfg CONFIG_GUEST_AGENT --cfg CONFIG_HAS_ENVIRON --cfg
> CONFIG_INOTIFY --cfg CONFIG_INOTIFY1 --cfg CONFIG_INT128 --cfg CONFIG_IOV=
EC
> --cfg CONFIG_L2TPV3 --cfg CONFIG_LIBCAP_NG --cfg CONFIG_LIBISCSI --cfg
> CONFIG_LIBNFS --cfg CONFIG_LIBPMEM --cfg CONFIG_LIBPULSE --cfg
> CONFIG_LIBSSH --cfg CONFIG_LIBUDEV --cfg CONFIG_LINUX --cfg
> CONFIG_LINUX_AIO --cfg CONFIG_LINUX_MAGIC_H --cfg
> CONFIG_LIVE_BLOCK_MIGRATION --cfg CONFIG_LZO --cfg CONFIG_MADVISE --cfg
> CONFIG_MALLOC_TRIM --cfg CONFIG_MEMFD --cfg CONFIG_MPATH --cfg
> CONFIG_MPATH_NEW_API --cfg CONFIG_NUMA --cfg CONFIG_OPENGL --cfg
> CONFIG_OPEN_BY_HANDLE --cfg CONFIG_PARALLELS --cfg CONFIG_PIPE2 --cfg
> CONFIG_PLUGIN --cfg CONFIG_POSIX --cfg CONFIG_POSIX_FALLOCATE --cfg
> CONFIG_POSIX_MADVISE --cfg CONFIG_POSIX_MEMALIGN --cfg CONFIG_PPOLL --cfg
> CONFIG_PRCTL_PR_SET_TIMERSLACK --cfg CONFIG_PREADV --cfg
> CONFIG_PTHREAD_SETNAME_NP_W_TID --cfg CONFIG_PVRDMA --cfg CONFIG_QCOW1
> --cfg CONFIG_QED --cfg CONFIG_QOM_CAST_DEBUG --cfg CONFIG_RBD --cfg
> CONFIG_RDMA --cfg CONFIG_REPLICATION --cfg CONFIG_RTNETLINK --cfg
> CONFIG_SDL --cfg CONFIG_SDL_IMAGE --cfg CONFIG_SECCOMP --cfg
> CONFIG_SECRET_KEYRING --cfg CONFIG_SEM_TIMEDWAIT --cfg CONFIG_SENDFILE
> --cfg CONFIG_SETNS --cfg CONFIG_SIGNALFD --cfg CONFIG_SLIRP --cfg
> CONFIG_SLIRP_SMBD --cfg CONFIG_SNAPPY --cfg CONFIG_SPICE --cfg
> CONFIG_SPICE_PROTOCOL --cfg CONFIG_SPLICE --cfg CONFIG_STATX --cfg
> CONFIG_SYNCFS --cfg CONFIG_SYNC_FILE_RANGE --cfg CONFIG_SYSMACROS --cfg
> CONFIG_TCG --cfg CONFIG_THREAD_SETNAME_BYTHREAD --cfg CONFIG_TIMERFD --cf=
g
> CONFIG_TOOLS --cfg CONFIG_TPM --cfg CONFIG_TRACE_LOG --cfg CONFIG_USBFS
> --cfg CONFIG_USB_LIBUSB --cfg CONFIG_VALGRIND_H --cfg CONFIG_VDI --cfg
> CONFIG_VHOST_CRYPTO --cfg CONFIG_VHOST_KERNEL --cfg CONFIG_VHOST_NET --cf=
g
> CONFIG_VHOST_NET_USER --cfg CONFIG_VHOST_NET_VDPA --cfg CONFIG_VHOST_SCSI
> --cfg CONFIG_VHOST_USER --cfg CONFIG_VHOST_USER_BLK_SERVER --cfg
> CONFIG_VHOST_USER_FS --cfg CONFIG_VHOST_USER_VSOCK --cfg CONFIG_VHOST_VDP=
A
> --cfg CONFIG_VHOST_VSOCK --cfg CONFIG_VIRTFS --cfg CONFIG_VNC --cfg
> CONFIG_VNC_JPEG --cfg CONFIG_VNC_PNG --cfg CONFIG_VNC_SASL --cfg
> CONFIG_VVFAT --cfg CONFIG_WITH_RUST --cfg CONFIG_X11 --cfg
> CONFIG_XEN_BACKEND --cfg CONFIG_XFS --cfg CONFIG_XKBCOMMON --cfg
> CONFIG_ZSTD --cfg HAVE_BTRFS_H --cfg HAVE_COPY_FILE_RANGE --cfg HAVE_DRM_=
H
> --cfg HAVE_FSXATTR --cfg HAVE_HOST_BLOCK_DEVICE --cfg HAVE_IPPROTO_MPTCP
> --cfg HAVE_MLOCKALL --cfg HAVE_OPENPTY --cfg HAVE_PTY_H --cfg
> HAVE_STRCHRNUL --cfg HAVE_STRUCT_STAT_ST_ATIM --cfg HAVE_SYSTEM_FUNCTION
> --cfg HAVE_UTMPX --cfg QAPI_CABI
> error: failed to select a version for the requirement `cc =3D "=3D1.0.70"=
`
> candidate versions found which didn't match: 1.0.69
> location searched: directory source `/work/armbru/qemu/rust/vendored`
> (which is replacing registry `
> https://github.com/rust-lang/crates.io-index`
> <https://github.com/rust-lang/crates.io-index>)
> required by package `nix v0.20.1`
>     ... which is depended on by `qga v0.1.0 (/work/armbru/qemu/qga)`
> perhaps a crate was updated and forgotten to be re-vendored?
> As a reminder, you're using offline mode (--offline) which can sometimes
> cause surprising resolution failures, if this error is too confusing you
> may wish to retry without the offline flag.
>
> ninja: build stopped: cannot make progress due to previous errors.
> make: *** [Makefile:156: run-ninja] Error 1
> make: Target 'all' not remade because of errors.
> make: Leaving directory '/work/armbru/qemu/bld-x86'
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000006a733505cb919255
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Sep 9, 2021 at 2:31 PM Markus Armbrus=
ter &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Marc-Andr=C3=
=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_bla=
nk">marcandre.lureau@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hi<br>
&gt;<br>
&gt; On Wed, Sep 8, 2021 at 5:23 PM Markus Armbruster &lt;<a href=3D"mailto=
:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; Build fails for me:<br>
&gt;&gt;<br>
&gt;&gt; make: Entering directory &#39;/work/armbru/qemu/bld&#39;<br>
&gt;&gt; config-host.mak is out-of-date, running configure<br>
&gt;&gt;=C2=A0 =C2=A0GIT=C2=A0 =C2=A0 =C2=A0ui/keycodemapdb meson tests/fp/=
berkeley-testfloat-3<br>
&gt;&gt; tests/fp/berkeley-softfloat-3 dtc capstone slirp<br>
&gt;&gt; fatal: remote error: upload-pack: not our ref<br>
&gt;&gt; 7077bbbd11a67d60062a9483f996113a349a4ca1<br>
&gt;&gt;<br>
&gt;<br>
&gt; Looks like I didn&#39;t update the repository on github. done<br>
&gt;<br>
&gt; I will update .gitmodule to use the repo on gitlab instead (<a href=3D=
"http://gitlab.com" rel=3D"noreferrer" target=3D"_blank">gitlab.com</a>:<br=
>
&gt; marcandre.lureau/qemu-rust-vendored.git)<br>
<br>
Next error:<br>
<br>
make -k -C ~/work/qemu/bld-x86 <br>
make: Entering directory &#39;/work/armbru/qemu/bld-x86&#39;<br>
=C2=A0 GIT=C2=A0 =C2=A0 =C2=A0ui/keycodemapdb rust/vendored tests/fp/berkel=
ey-testfloat-3 tests/fp/berkeley-softfloat-3 dtc capstone slirp<br>
[1/71] Generating qemu-version.h with a custom command (wrapped by meson to=
 capture output)<br>
[2/55] Generating cargo-qga with a custom command<br>
FAILED: qga/libqga.args qga/libqga.a <br>
/usr/bin/python3 /work/armbru/qemu/scripts/cargo_wrapper.py --configh /work=
/armbru/qemu/bld-x86/config-host.h /work/armbru/qemu/bld-x86/qga /work/armb=
ru/qemu/qga /work/armbru/qemu/bld-x86 debug &#39;&#39; build-lib<br>
Environment: MESON_CURRENT_BUILD_DIR=3D/work/armbru/qemu/bld-x86/qga MESON_=
BUILD_ROOT=3D/work/armbru/qemu/bld-x86 WINAPI_NO_BUNDLED_LIBRARIES=3D1<br>
Command: cargo rustc --target-dir /work/armbru/qemu/bld-x86/qga/rs-target -=
-manifest-path /work/armbru/qemu/qga/Cargo.toml --offline --lib -- --cfg CO=
NFIG_ACCEPT4 --cfg CONFIG_AF_VSOCK --cfg CONFIG_ATOMIC64 --cfg CONFIG_ATTR =
--cfg CONFIG_AUDIO_OSS --cfg CONFIG_AUDIO_PA --cfg CONFIG_AVX2_OPT --cfg CO=
NFIG_BDRV_RO_WHITELIST --cfg CONFIG_BDRV_RW_WHITELIST --cfg CONFIG_BOCHS --=
cfg CONFIG_BRLAPI --cfg CONFIG_BYTESWAP_H --cfg CONFIG_CAPSTONE --cfg CONFI=
G_CLOCK_ADJTIME --cfg CONFIG_CLOOP --cfg CONFIG_CMPXCHG128 --cfg CONFIG_COR=
OUTINE_POOL --cfg CONFIG_CPUID_H --cfg CONFIG_CURL --cfg CONFIG_CURSES --cf=
g CONFIG_DEBUG_MUTEX --cfg CONFIG_DEBUG_TCG --cfg CONFIG_DMG --cfg CONFIG_D=
UP3 --cfg CONFIG_EBPF --cfg CONFIG_EPOLL --cfg CONFIG_EPOLL_CREATE1 --cfg C=
ONFIG_EVENTFD --cfg CONFIG_FALLOCATE --cfg CONFIG_FALLOCATE_PUNCH_HOLE --cf=
g CONFIG_FALLOCATE_ZERO_RANGE --cfg CONFIG_FDATASYNC --cfg CONFIG_FDT --cfg=
 CONFIG_FIEMAP --cfg CONFIG_GBM --cfg CONFIG_GETAUXVAL --cfg CONFIG_GETRAND=
OM --cfg CONFIG_GETTID --cfg CONFIG_GIO --cfg CONFIG_GLUSTERFS --cfg CONFIG=
_GLUSTERFS_DISCARD --cfg CONFIG_GLUSTERFS_FALLOCATE --cfg CONFIG_GLUSTERFS_=
FTRUNCATE_HAS_STAT --cfg CONFIG_GLUSTERFS_IOCB_HAS_STAT --cfg CONFIG_GLUSTE=
RFS_XLATOR_OPT --cfg CONFIG_GLUSTERFS_ZEROFILL --cfg CONFIG_GNUTLS --cfg CO=
NFIG_GNUTLS_CRYPTO --cfg CONFIG_GTK --cfg CONFIG_GUEST_AGENT --cfg CONFIG_H=
AS_ENVIRON --cfg CONFIG_INOTIFY --cfg CONFIG_INOTIFY1 --cfg CONFIG_INT128 -=
-cfg CONFIG_IOVEC --cfg CONFIG_L2TPV3 --cfg CONFIG_LIBCAP_NG --cfg CONFIG_L=
IBISCSI --cfg CONFIG_LIBNFS --cfg CONFIG_LIBPMEM --cfg CONFIG_LIBPULSE --cf=
g CONFIG_LIBSSH --cfg CONFIG_LIBUDEV --cfg CONFIG_LINUX --cfg CONFIG_LINUX_=
AIO --cfg CONFIG_LINUX_MAGIC_H --cfg CONFIG_LIVE_BLOCK_MIGRATION --cfg CONF=
IG_LZO --cfg CONFIG_MADVISE --cfg CONFIG_MALLOC_TRIM --cfg CONFIG_MEMFD --c=
fg CONFIG_MPATH --cfg CONFIG_MPATH_NEW_API --cfg CONFIG_NUMA --cfg CONFIG_O=
PENGL --cfg CONFIG_OPEN_BY_HANDLE --cfg CONFIG_PARALLELS --cfg CONFIG_PIPE2=
 --cfg CONFIG_PLUGIN --cfg CONFIG_POSIX --cfg CONFIG_POSIX_FALLOCATE --cfg =
CONFIG_POSIX_MADVISE --cfg CONFIG_POSIX_MEMALIGN --cfg CONFIG_PPOLL --cfg C=
ONFIG_PRCTL_PR_SET_TIMERSLACK --cfg CONFIG_PREADV --cfg CONFIG_PTHREAD_SETN=
AME_NP_W_TID --cfg CONFIG_PVRDMA --cfg CONFIG_QCOW1 --cfg CONFIG_QED --cfg =
CONFIG_QOM_CAST_DEBUG --cfg CONFIG_RBD --cfg CONFIG_RDMA --cfg CONFIG_REPLI=
CATION --cfg CONFIG_RTNETLINK --cfg CONFIG_SDL --cfg CONFIG_SDL_IMAGE --cfg=
 CONFIG_SECCOMP --cfg CONFIG_SECRET_KEYRING --cfg CONFIG_SEM_TIMEDWAIT --cf=
g CONFIG_SENDFILE --cfg CONFIG_SETNS --cfg CONFIG_SIGNALFD --cfg CONFIG_SLI=
RP --cfg CONFIG_SLIRP_SMBD --cfg CONFIG_SNAPPY --cfg CONFIG_SPICE --cfg CON=
FIG_SPICE_PROTOCOL --cfg CONFIG_SPLICE --cfg CONFIG_STATX --cfg CONFIG_SYNC=
FS --cfg CONFIG_SYNC_FILE_RANGE --cfg CONFIG_SYSMACROS --cfg CONFIG_TCG --c=
fg CONFIG_THREAD_SETNAME_BYTHREAD --cfg CONFIG_TIMERFD --cfg CONFIG_TOOLS -=
-cfg CONFIG_TPM --cfg CONFIG_TRACE_LOG --cfg CONFIG_USBFS --cfg CONFIG_USB_=
LIBUSB --cfg CONFIG_VALGRIND_H --cfg CONFIG_VDI --cfg CONFIG_VHOST_CRYPTO -=
-cfg CONFIG_VHOST_KERNEL --cfg CONFIG_VHOST_NET --cfg CONFIG_VHOST_NET_USER=
 --cfg CONFIG_VHOST_NET_VDPA --cfg CONFIG_VHOST_SCSI --cfg CONFIG_VHOST_USE=
R --cfg CONFIG_VHOST_USER_BLK_SERVER --cfg CONFIG_VHOST_USER_FS --cfg CONFI=
G_VHOST_USER_VSOCK --cfg CONFIG_VHOST_VDPA --cfg CONFIG_VHOST_VSOCK --cfg C=
ONFIG_VIRTFS --cfg CONFIG_VNC --cfg CONFIG_VNC_JPEG --cfg CONFIG_VNC_PNG --=
cfg CONFIG_VNC_SASL --cfg CONFIG_VVFAT --cfg CONFIG_WITH_RUST --cfg CONFIG_=
X11 --cfg CONFIG_XEN_BACKEND --cfg CONFIG_XFS --cfg CONFIG_XKBCOMMON --cfg =
CONFIG_ZSTD --cfg HAVE_BTRFS_H --cfg HAVE_COPY_FILE_RANGE --cfg HAVE_DRM_H =
--cfg HAVE_FSXATTR --cfg HAVE_HOST_BLOCK_DEVICE --cfg HAVE_IPPROTO_MPTCP --=
cfg HAVE_MLOCKALL --cfg HAVE_OPENPTY --cfg HAVE_PTY_H --cfg HAVE_STRCHRNUL =
--cfg HAVE_STRUCT_STAT_ST_ATIM --cfg HAVE_SYSTEM_FUNCTION --cfg HAVE_UTMPX =
--print native-static-libs<br>
error: failed to select a version for the requirement `cc =3D &quot;=3D1.0.=
70&quot;`<br>
candidate versions found which didn&#39;t match: 1.0.69<br>
location searched: directory source `/work/armbru/qemu/rust/vendored` (whic=
h is replacing registry `<a href=3D"https://github.com/rust-lang/crates.io-=
index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/cr=
ates.io-index`</a>)<br>
required by package `nix v0.20.1`<br>
=C2=A0 =C2=A0 ... which is depended on by `qga v0.1.0 (/work/armbru/qemu/qg=
a)`<br>
perhaps a crate was updated and forgotten to be re-vendored?<br>
As a reminder, you&#39;re using offline mode (--offline) which can sometime=
s cause surprising resolution failures, if this error is too confusing you =
may wish to retry without the offline flag.<br>
<br></blockquote><div><br></div><div>Yes, my bad. See discussion in &quot;[=
RFC v3 13/32] rust: use vendored-sources&quot;. If you reset rust/vendored =
to origin/master (and commit that to avoid sync back), it should work.<br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
[3/55] Generating qga-qapi-cabi-rs with a custom command<br>
FAILED: qga/qapi-cabi-rs <br>
/usr/bin/python3 /work/armbru/qemu/scripts/cargo_wrapper.py --configh /work=
/armbru/qemu/bld-x86/config-host.h /work/armbru/qemu/bld-x86/qga /work/armb=
ru/qemu/qga /work/armbru/qemu/bld-x86 debug &#39;&#39; build-bin qapi-cabi-=
rs -- --cfg QAPI_CABI<br>
error: the option `Z` is only accepted on the nightly compiler<br>
<br>
Environment: MESON_CURRENT_BUILD_DIR=3D/work/armbru/qemu/bld-x86/qga MESON_=
BUILD_ROOT=3D/work/armbru/qemu/bld-x86 WINAPI_NO_BUNDLED_LIBRARIES=3D1<br>
Command: cargo rustc --target-dir /work/armbru/qemu/bld-x86/qga/rs-target -=
-manifest-path /work/armbru/qemu/qga/Cargo.toml --offline --bin qapi-cabi-r=
s -- --cfg CONFIG_ACCEPT4 --cfg CONFIG_AF_VSOCK --cfg CONFIG_ATOMIC64 --cfg=
 CONFIG_ATTR --cfg CONFIG_AUDIO_OSS --cfg CONFIG_AUDIO_PA --cfg CONFIG_AVX2=
_OPT --cfg CONFIG_BDRV_RO_WHITELIST --cfg CONFIG_BDRV_RW_WHITELIST --cfg CO=
NFIG_BOCHS --cfg CONFIG_BRLAPI --cfg CONFIG_BYTESWAP_H --cfg CONFIG_CAPSTON=
E --cfg CONFIG_CLOCK_ADJTIME --cfg CONFIG_CLOOP --cfg CONFIG_CMPXCHG128 --c=
fg CONFIG_COROUTINE_POOL --cfg CONFIG_CPUID_H --cfg CONFIG_CURL --cfg CONFI=
G_CURSES --cfg CONFIG_DEBUG_MUTEX --cfg CONFIG_DEBUG_TCG --cfg CONFIG_DMG -=
-cfg CONFIG_DUP3 --cfg CONFIG_EBPF --cfg CONFIG_EPOLL --cfg CONFIG_EPOLL_CR=
EATE1 --cfg CONFIG_EVENTFD --cfg CONFIG_FALLOCATE --cfg CONFIG_FALLOCATE_PU=
NCH_HOLE --cfg CONFIG_FALLOCATE_ZERO_RANGE --cfg CONFIG_FDATASYNC --cfg CON=
FIG_FDT --cfg CONFIG_FIEMAP --cfg CONFIG_GBM --cfg CONFIG_GETAUXVAL --cfg C=
ONFIG_GETRANDOM --cfg CONFIG_GETTID --cfg CONFIG_GIO --cfg CONFIG_GLUSTERFS=
 --cfg CONFIG_GLUSTERFS_DISCARD --cfg CONFIG_GLUSTERFS_FALLOCATE --cfg CONF=
IG_GLUSTERFS_FTRUNCATE_HAS_STAT --cfg CONFIG_GLUSTERFS_IOCB_HAS_STAT --cfg =
CONFIG_GLUSTERFS_XLATOR_OPT --cfg CONFIG_GLUSTERFS_ZEROFILL --cfg CONFIG_GN=
UTLS --cfg CONFIG_GNUTLS_CRYPTO --cfg CONFIG_GTK --cfg CONFIG_GUEST_AGENT -=
-cfg CONFIG_HAS_ENVIRON --cfg CONFIG_INOTIFY --cfg CONFIG_INOTIFY1 --cfg CO=
NFIG_INT128 --cfg CONFIG_IOVEC --cfg CONFIG_L2TPV3 --cfg CONFIG_LIBCAP_NG -=
-cfg CONFIG_LIBISCSI --cfg CONFIG_LIBNFS --cfg CONFIG_LIBPMEM --cfg CONFIG_=
LIBPULSE --cfg CONFIG_LIBSSH --cfg CONFIG_LIBUDEV --cfg CONFIG_LINUX --cfg =
CONFIG_LINUX_AIO --cfg CONFIG_LINUX_MAGIC_H --cfg CONFIG_LIVE_BLOCK_MIGRATI=
ON --cfg CONFIG_LZO --cfg CONFIG_MADVISE --cfg CONFIG_MALLOC_TRIM --cfg CON=
FIG_MEMFD --cfg CONFIG_MPATH --cfg CONFIG_MPATH_NEW_API --cfg CONFIG_NUMA -=
-cfg CONFIG_OPENGL --cfg CONFIG_OPEN_BY_HANDLE --cfg CONFIG_PARALLELS --cfg=
 CONFIG_PIPE2 --cfg CONFIG_PLUGIN --cfg CONFIG_POSIX --cfg CONFIG_POSIX_FAL=
LOCATE --cfg CONFIG_POSIX_MADVISE --cfg CONFIG_POSIX_MEMALIGN --cfg CONFIG_=
PPOLL --cfg CONFIG_PRCTL_PR_SET_TIMERSLACK --cfg CONFIG_PREADV --cfg CONFIG=
_PTHREAD_SETNAME_NP_W_TID --cfg CONFIG_PVRDMA --cfg CONFIG_QCOW1 --cfg CONF=
IG_QED --cfg CONFIG_QOM_CAST_DEBUG --cfg CONFIG_RBD --cfg CONFIG_RDMA --cfg=
 CONFIG_REPLICATION --cfg CONFIG_RTNETLINK --cfg CONFIG_SDL --cfg CONFIG_SD=
L_IMAGE --cfg CONFIG_SECCOMP --cfg CONFIG_SECRET_KEYRING --cfg CONFIG_SEM_T=
IMEDWAIT --cfg CONFIG_SENDFILE --cfg CONFIG_SETNS --cfg CONFIG_SIGNALFD --c=
fg CONFIG_SLIRP --cfg CONFIG_SLIRP_SMBD --cfg CONFIG_SNAPPY --cfg CONFIG_SP=
ICE --cfg CONFIG_SPICE_PROTOCOL --cfg CONFIG_SPLICE --cfg CONFIG_STATX --cf=
g CONFIG_SYNCFS --cfg CONFIG_SYNC_FILE_RANGE --cfg CONFIG_SYSMACROS --cfg C=
ONFIG_TCG --cfg CONFIG_THREAD_SETNAME_BYTHREAD --cfg CONFIG_TIMERFD --cfg C=
ONFIG_TOOLS --cfg CONFIG_TPM --cfg CONFIG_TRACE_LOG --cfg CONFIG_USBFS --cf=
g CONFIG_USB_LIBUSB --cfg CONFIG_VALGRIND_H --cfg CONFIG_VDI --cfg CONFIG_V=
HOST_CRYPTO --cfg CONFIG_VHOST_KERNEL --cfg CONFIG_VHOST_NET --cfg CONFIG_V=
HOST_NET_USER --cfg CONFIG_VHOST_NET_VDPA --cfg CONFIG_VHOST_SCSI --cfg CON=
FIG_VHOST_USER --cfg CONFIG_VHOST_USER_BLK_SERVER --cfg CONFIG_VHOST_USER_F=
S --cfg CONFIG_VHOST_USER_VSOCK --cfg CONFIG_VHOST_VDPA --cfg CONFIG_VHOST_=
VSOCK --cfg CONFIG_VIRTFS --cfg CONFIG_VNC --cfg CONFIG_VNC_JPEG --cfg CONF=
IG_VNC_PNG --cfg CONFIG_VNC_SASL --cfg CONFIG_VVFAT --cfg CONFIG_WITH_RUST =
--cfg CONFIG_X11 --cfg CONFIG_XEN_BACKEND --cfg CONFIG_XFS --cfg CONFIG_XKB=
COMMON --cfg CONFIG_ZSTD --cfg HAVE_BTRFS_H --cfg HAVE_COPY_FILE_RANGE --cf=
g HAVE_DRM_H --cfg HAVE_FSXATTR --cfg HAVE_HOST_BLOCK_DEVICE --cfg HAVE_IPP=
ROTO_MPTCP --cfg HAVE_MLOCKALL --cfg HAVE_OPENPTY --cfg HAVE_PTY_H --cfg HA=
VE_STRCHRNUL --cfg HAVE_STRUCT_STAT_ST_ATIM --cfg HAVE_SYSTEM_FUNCTION --cf=
g HAVE_UTMPX --cfg QAPI_CABI<br>
error: failed to select a version for the requirement `cc =3D &quot;=3D1.0.=
70&quot;`<br>
candidate versions found which didn&#39;t match: 1.0.69<br>
location searched: directory source `/work/armbru/qemu/rust/vendored` (whic=
h is replacing registry `<a href=3D"https://github.com/rust-lang/crates.io-=
index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/cr=
ates.io-index`</a>)<br>
required by package `nix v0.20.1`<br>
=C2=A0 =C2=A0 ... which is depended on by `qga v0.1.0 (/work/armbru/qemu/qg=
a)`<br>
perhaps a crate was updated and forgotten to be re-vendored?<br>
As a reminder, you&#39;re using offline mode (--offline) which can sometime=
s cause surprising resolution failures, if this error is too confusing you =
may wish to retry without the offline flag.<br>
<br>
[4/55] Generating Test Rust library with a custom command<br>
FAILED: tests/libqemu_tests.args tests/libqemu_tests.a <br>
/usr/bin/python3 /work/armbru/qemu/scripts/cargo_wrapper.py --configh /work=
/armbru/qemu/bld-x86/config-host.h /work/armbru/qemu/bld-x86/tests /work/ar=
mbru/qemu/tests /work/armbru/qemu/bld-x86 debug &#39;&#39; build-lib<br>
Environment: MESON_CURRENT_BUILD_DIR=3D/work/armbru/qemu/bld-x86/tests MESO=
N_BUILD_ROOT=3D/work/armbru/qemu/bld-x86 WINAPI_NO_BUNDLED_LIBRARIES=3D1<br=
>
Command: cargo rustc --target-dir /work/armbru/qemu/bld-x86/tests/rs-target=
 --manifest-path /work/armbru/qemu/tests/Cargo.toml --offline --lib -- --cf=
g CONFIG_ACCEPT4 --cfg CONFIG_AF_VSOCK --cfg CONFIG_ATOMIC64 --cfg CONFIG_A=
TTR --cfg CONFIG_AUDIO_OSS --cfg CONFIG_AUDIO_PA --cfg CONFIG_AVX2_OPT --cf=
g CONFIG_BDRV_RO_WHITELIST --cfg CONFIG_BDRV_RW_WHITELIST --cfg CONFIG_BOCH=
S --cfg CONFIG_BRLAPI --cfg CONFIG_BYTESWAP_H --cfg CONFIG_CAPSTONE --cfg C=
ONFIG_CLOCK_ADJTIME --cfg CONFIG_CLOOP --cfg CONFIG_CMPXCHG128 --cfg CONFIG=
_COROUTINE_POOL --cfg CONFIG_CPUID_H --cfg CONFIG_CURL --cfg CONFIG_CURSES =
--cfg CONFIG_DEBUG_MUTEX --cfg CONFIG_DEBUG_TCG --cfg CONFIG_DMG --cfg CONF=
IG_DUP3 --cfg CONFIG_EBPF --cfg CONFIG_EPOLL --cfg CONFIG_EPOLL_CREATE1 --c=
fg CONFIG_EVENTFD --cfg CONFIG_FALLOCATE --cfg CONFIG_FALLOCATE_PUNCH_HOLE =
--cfg CONFIG_FALLOCATE_ZERO_RANGE --cfg CONFIG_FDATASYNC --cfg CONFIG_FDT -=
-cfg CONFIG_FIEMAP --cfg CONFIG_GBM --cfg CONFIG_GETAUXVAL --cfg CONFIG_GET=
RANDOM --cfg CONFIG_GETTID --cfg CONFIG_GIO --cfg CONFIG_GLUSTERFS --cfg CO=
NFIG_GLUSTERFS_DISCARD --cfg CONFIG_GLUSTERFS_FALLOCATE --cfg CONFIG_GLUSTE=
RFS_FTRUNCATE_HAS_STAT --cfg CONFIG_GLUSTERFS_IOCB_HAS_STAT --cfg CONFIG_GL=
USTERFS_XLATOR_OPT --cfg CONFIG_GLUSTERFS_ZEROFILL --cfg CONFIG_GNUTLS --cf=
g CONFIG_GNUTLS_CRYPTO --cfg CONFIG_GTK --cfg CONFIG_GUEST_AGENT --cfg CONF=
IG_HAS_ENVIRON --cfg CONFIG_INOTIFY --cfg CONFIG_INOTIFY1 --cfg CONFIG_INT1=
28 --cfg CONFIG_IOVEC --cfg CONFIG_L2TPV3 --cfg CONFIG_LIBCAP_NG --cfg CONF=
IG_LIBISCSI --cfg CONFIG_LIBNFS --cfg CONFIG_LIBPMEM --cfg CONFIG_LIBPULSE =
--cfg CONFIG_LIBSSH --cfg CONFIG_LIBUDEV --cfg CONFIG_LINUX --cfg CONFIG_LI=
NUX_AIO --cfg CONFIG_LINUX_MAGIC_H --cfg CONFIG_LIVE_BLOCK_MIGRATION --cfg =
CONFIG_LZO --cfg CONFIG_MADVISE --cfg CONFIG_MALLOC_TRIM --cfg CONFIG_MEMFD=
 --cfg CONFIG_MPATH --cfg CONFIG_MPATH_NEW_API --cfg CONFIG_NUMA --cfg CONF=
IG_OPENGL --cfg CONFIG_OPEN_BY_HANDLE --cfg CONFIG_PARALLELS --cfg CONFIG_P=
IPE2 --cfg CONFIG_PLUGIN --cfg CONFIG_POSIX --cfg CONFIG_POSIX_FALLOCATE --=
cfg CONFIG_POSIX_MADVISE --cfg CONFIG_POSIX_MEMALIGN --cfg CONFIG_PPOLL --c=
fg CONFIG_PRCTL_PR_SET_TIMERSLACK --cfg CONFIG_PREADV --cfg CONFIG_PTHREAD_=
SETNAME_NP_W_TID --cfg CONFIG_PVRDMA --cfg CONFIG_QCOW1 --cfg CONFIG_QED --=
cfg CONFIG_QOM_CAST_DEBUG --cfg CONFIG_RBD --cfg CONFIG_RDMA --cfg CONFIG_R=
EPLICATION --cfg CONFIG_RTNETLINK --cfg CONFIG_SDL --cfg CONFIG_SDL_IMAGE -=
-cfg CONFIG_SECCOMP --cfg CONFIG_SECRET_KEYRING --cfg CONFIG_SEM_TIMEDWAIT =
--cfg CONFIG_SENDFILE --cfg CONFIG_SETNS --cfg CONFIG_SIGNALFD --cfg CONFIG=
_SLIRP --cfg CONFIG_SLIRP_SMBD --cfg CONFIG_SNAPPY --cfg CONFIG_SPICE --cfg=
 CONFIG_SPICE_PROTOCOL --cfg CONFIG_SPLICE --cfg CONFIG_STATX --cfg CONFIG_=
SYNCFS --cfg CONFIG_SYNC_FILE_RANGE --cfg CONFIG_SYSMACROS --cfg CONFIG_TCG=
 --cfg CONFIG_THREAD_SETNAME_BYTHREAD --cfg CONFIG_TIMERFD --cfg CONFIG_TOO=
LS --cfg CONFIG_TPM --cfg CONFIG_TRACE_LOG --cfg CONFIG_USBFS --cfg CONFIG_=
USB_LIBUSB --cfg CONFIG_VALGRIND_H --cfg CONFIG_VDI --cfg CONFIG_VHOST_CRYP=
TO --cfg CONFIG_VHOST_KERNEL --cfg CONFIG_VHOST_NET --cfg CONFIG_VHOST_NET_=
USER --cfg CONFIG_VHOST_NET_VDPA --cfg CONFIG_VHOST_SCSI --cfg CONFIG_VHOST=
_USER --cfg CONFIG_VHOST_USER_BLK_SERVER --cfg CONFIG_VHOST_USER_FS --cfg C=
ONFIG_VHOST_USER_VSOCK --cfg CONFIG_VHOST_VDPA --cfg CONFIG_VHOST_VSOCK --c=
fg CONFIG_VIRTFS --cfg CONFIG_VNC --cfg CONFIG_VNC_JPEG --cfg CONFIG_VNC_PN=
G --cfg CONFIG_VNC_SASL --cfg CONFIG_VVFAT --cfg CONFIG_WITH_RUST --cfg CON=
FIG_X11 --cfg CONFIG_XEN_BACKEND --cfg CONFIG_XFS --cfg CONFIG_XKBCOMMON --=
cfg CONFIG_ZSTD --cfg HAVE_BTRFS_H --cfg HAVE_COPY_FILE_RANGE --cfg HAVE_DR=
M_H --cfg HAVE_FSXATTR --cfg HAVE_HOST_BLOCK_DEVICE --cfg HAVE_IPPROTO_MPTC=
P --cfg HAVE_MLOCKALL --cfg HAVE_OPENPTY --cfg HAVE_PTY_H --cfg HAVE_STRCHR=
NUL --cfg HAVE_STRUCT_STAT_ST_ATIM --cfg HAVE_SYSTEM_FUNCTION --cfg HAVE_UT=
MPX --print native-static-libs<br>
error: failed to select a version for the requirement `cc =3D &quot;=3D1.0.=
70&quot;`<br>
candidate versions found which didn&#39;t match: 1.0.69<br>
location searched: directory source `/work/armbru/qemu/rust/vendored` (whic=
h is replacing registry `<a href=3D"https://github.com/rust-lang/crates.io-=
index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/cr=
ates.io-index`</a>)<br>
required by package `nix v0.20.1`<br>
=C2=A0 =C2=A0 ... which is depended on by `qga v0.1.0 (/work/armbru/qemu/qg=
a)`<br>
perhaps a crate was updated and forgotten to be re-vendored?<br>
As a reminder, you&#39;re using offline mode (--offline) which can sometime=
s cause surprising resolution failures, if this error is too confusing you =
may wish to retry without the offline flag.<br>
<br>
[5/55] Generating QAPI test (include) with a custom command<br>
[6/20] Generating qapi-cabi-rs with a custom command<br>
FAILED: tests/qapi-cabi-rs <br>
/usr/bin/python3 /work/armbru/qemu/scripts/cargo_wrapper.py --configh /work=
/armbru/qemu/bld-x86/config-host.h /work/armbru/qemu/bld-x86/tests /work/ar=
mbru/qemu/tests /work/armbru/qemu/bld-x86 debug &#39;&#39; build-bin qapi-c=
abi-rs -- --cfg QAPI_CABI<br>
error: the option `Z` is only accepted on the nightly compiler<br>
<br>
Environment: MESON_CURRENT_BUILD_DIR=3D/work/armbru/qemu/bld-x86/tests MESO=
N_BUILD_ROOT=3D/work/armbru/qemu/bld-x86 WINAPI_NO_BUNDLED_LIBRARIES=3D1<br=
>
Command: cargo rustc --target-dir /work/armbru/qemu/bld-x86/tests/rs-target=
 --manifest-path /work/armbru/qemu/tests/Cargo.toml --offline --bin qapi-ca=
bi-rs -- --cfg CONFIG_ACCEPT4 --cfg CONFIG_AF_VSOCK --cfg CONFIG_ATOMIC64 -=
-cfg CONFIG_ATTR --cfg CONFIG_AUDIO_OSS --cfg CONFIG_AUDIO_PA --cfg CONFIG_=
AVX2_OPT --cfg CONFIG_BDRV_RO_WHITELIST --cfg CONFIG_BDRV_RW_WHITELIST --cf=
g CONFIG_BOCHS --cfg CONFIG_BRLAPI --cfg CONFIG_BYTESWAP_H --cfg CONFIG_CAP=
STONE --cfg CONFIG_CLOCK_ADJTIME --cfg CONFIG_CLOOP --cfg CONFIG_CMPXCHG128=
 --cfg CONFIG_COROUTINE_POOL --cfg CONFIG_CPUID_H --cfg CONFIG_CURL --cfg C=
ONFIG_CURSES --cfg CONFIG_DEBUG_MUTEX --cfg CONFIG_DEBUG_TCG --cfg CONFIG_D=
MG --cfg CONFIG_DUP3 --cfg CONFIG_EBPF --cfg CONFIG_EPOLL --cfg CONFIG_EPOL=
L_CREATE1 --cfg CONFIG_EVENTFD --cfg CONFIG_FALLOCATE --cfg CONFIG_FALLOCAT=
E_PUNCH_HOLE --cfg CONFIG_FALLOCATE_ZERO_RANGE --cfg CONFIG_FDATASYNC --cfg=
 CONFIG_FDT --cfg CONFIG_FIEMAP --cfg CONFIG_GBM --cfg CONFIG_GETAUXVAL --c=
fg CONFIG_GETRANDOM --cfg CONFIG_GETTID --cfg CONFIG_GIO --cfg CONFIG_GLUST=
ERFS --cfg CONFIG_GLUSTERFS_DISCARD --cfg CONFIG_GLUSTERFS_FALLOCATE --cfg =
CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT --cfg CONFIG_GLUSTERFS_IOCB_HAS_STAT --=
cfg CONFIG_GLUSTERFS_XLATOR_OPT --cfg CONFIG_GLUSTERFS_ZEROFILL --cfg CONFI=
G_GNUTLS --cfg CONFIG_GNUTLS_CRYPTO --cfg CONFIG_GTK --cfg CONFIG_GUEST_AGE=
NT --cfg CONFIG_HAS_ENVIRON --cfg CONFIG_INOTIFY --cfg CONFIG_INOTIFY1 --cf=
g CONFIG_INT128 --cfg CONFIG_IOVEC --cfg CONFIG_L2TPV3 --cfg CONFIG_LIBCAP_=
NG --cfg CONFIG_LIBISCSI --cfg CONFIG_LIBNFS --cfg CONFIG_LIBPMEM --cfg CON=
FIG_LIBPULSE --cfg CONFIG_LIBSSH --cfg CONFIG_LIBUDEV --cfg CONFIG_LINUX --=
cfg CONFIG_LINUX_AIO --cfg CONFIG_LINUX_MAGIC_H --cfg CONFIG_LIVE_BLOCK_MIG=
RATION --cfg CONFIG_LZO --cfg CONFIG_MADVISE --cfg CONFIG_MALLOC_TRIM --cfg=
 CONFIG_MEMFD --cfg CONFIG_MPATH --cfg CONFIG_MPATH_NEW_API --cfg CONFIG_NU=
MA --cfg CONFIG_OPENGL --cfg CONFIG_OPEN_BY_HANDLE --cfg CONFIG_PARALLELS -=
-cfg CONFIG_PIPE2 --cfg CONFIG_PLUGIN --cfg CONFIG_POSIX --cfg CONFIG_POSIX=
_FALLOCATE --cfg CONFIG_POSIX_MADVISE --cfg CONFIG_POSIX_MEMALIGN --cfg CON=
FIG_PPOLL --cfg CONFIG_PRCTL_PR_SET_TIMERSLACK --cfg CONFIG_PREADV --cfg CO=
NFIG_PTHREAD_SETNAME_NP_W_TID --cfg CONFIG_PVRDMA --cfg CONFIG_QCOW1 --cfg =
CONFIG_QED --cfg CONFIG_QOM_CAST_DEBUG --cfg CONFIG_RBD --cfg CONFIG_RDMA -=
-cfg CONFIG_REPLICATION --cfg CONFIG_RTNETLINK --cfg CONFIG_SDL --cfg CONFI=
G_SDL_IMAGE --cfg CONFIG_SECCOMP --cfg CONFIG_SECRET_KEYRING --cfg CONFIG_S=
EM_TIMEDWAIT --cfg CONFIG_SENDFILE --cfg CONFIG_SETNS --cfg CONFIG_SIGNALFD=
 --cfg CONFIG_SLIRP --cfg CONFIG_SLIRP_SMBD --cfg CONFIG_SNAPPY --cfg CONFI=
G_SPICE --cfg CONFIG_SPICE_PROTOCOL --cfg CONFIG_SPLICE --cfg CONFIG_STATX =
--cfg CONFIG_SYNCFS --cfg CONFIG_SYNC_FILE_RANGE --cfg CONFIG_SYSMACROS --c=
fg CONFIG_TCG --cfg CONFIG_THREAD_SETNAME_BYTHREAD --cfg CONFIG_TIMERFD --c=
fg CONFIG_TOOLS --cfg CONFIG_TPM --cfg CONFIG_TRACE_LOG --cfg CONFIG_USBFS =
--cfg CONFIG_USB_LIBUSB --cfg CONFIG_VALGRIND_H --cfg CONFIG_VDI --cfg CONF=
IG_VHOST_CRYPTO --cfg CONFIG_VHOST_KERNEL --cfg CONFIG_VHOST_NET --cfg CONF=
IG_VHOST_NET_USER --cfg CONFIG_VHOST_NET_VDPA --cfg CONFIG_VHOST_SCSI --cfg=
 CONFIG_VHOST_USER --cfg CONFIG_VHOST_USER_BLK_SERVER --cfg CONFIG_VHOST_US=
ER_FS --cfg CONFIG_VHOST_USER_VSOCK --cfg CONFIG_VHOST_VDPA --cfg CONFIG_VH=
OST_VSOCK --cfg CONFIG_VIRTFS --cfg CONFIG_VNC --cfg CONFIG_VNC_JPEG --cfg =
CONFIG_VNC_PNG --cfg CONFIG_VNC_SASL --cfg CONFIG_VVFAT --cfg CONFIG_WITH_R=
UST --cfg CONFIG_X11 --cfg CONFIG_XEN_BACKEND --cfg CONFIG_XFS --cfg CONFIG=
_XKBCOMMON --cfg CONFIG_ZSTD --cfg HAVE_BTRFS_H --cfg HAVE_COPY_FILE_RANGE =
--cfg HAVE_DRM_H --cfg HAVE_FSXATTR --cfg HAVE_HOST_BLOCK_DEVICE --cfg HAVE=
_IPPROTO_MPTCP --cfg HAVE_MLOCKALL --cfg HAVE_OPENPTY --cfg HAVE_PTY_H --cf=
g HAVE_STRCHRNUL --cfg HAVE_STRUCT_STAT_ST_ATIM --cfg HAVE_SYSTEM_FUNCTION =
--cfg HAVE_UTMPX --cfg QAPI_CABI<br>
error: failed to select a version for the requirement `cc =3D &quot;=3D1.0.=
70&quot;`<br>
candidate versions found which didn&#39;t match: 1.0.69<br>
location searched: directory source `/work/armbru/qemu/rust/vendored` (whic=
h is replacing registry `<a href=3D"https://github.com/rust-lang/crates.io-=
index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/cr=
ates.io-index`</a>)<br>
required by package `nix v0.20.1`<br>
=C2=A0 =C2=A0 ... which is depended on by `qga v0.1.0 (/work/armbru/qemu/qg=
a)`<br>
perhaps a crate was updated and forgotten to be re-vendored?<br>
As a reminder, you&#39;re using offline mode (--offline) which can sometime=
s cause surprising resolution failures, if this error is too confusing you =
may wish to retry without the offline flag.<br>
<br>
ninja: build stopped: cannot make progress due to previous errors.<br>
make: *** [Makefile:156: run-ninja] Error 1<br>
make: Target &#39;all&#39; not remade because of errors.<br>
make: Leaving directory &#39;/work/armbru/qemu/bld-x86&#39;<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000006a733505cb919255--

