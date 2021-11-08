Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8522447D01
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:42:48 +0100 (CET)
Received: from localhost ([::1]:52182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk1At-0003ua-VG
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:42:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mk19j-000335-Ug
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:41:35 -0500
Received: from [2001:41c9:1:41f::167] (port=59872
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mk19g-0001L3-KN
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:41:35 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mk19S-0008zf-DJ; Mon, 08 Nov 2021 09:41:23 +0000
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20211105113043.4059361-1-kraxel@redhat.com>
 <9221f39f-32ca-094b-c526-82fdbf99a588@linaro.org>
 <c97aefa2-4686-b339-4d07-f801ac6e5de1@amsat.org>
 <1b641554-f983-a86f-3512-c109779f6d73@amsat.org>
 <cc48fcc7-4408-be45-7081-335b98c1ce6f@ilande.co.uk>
 <4733e0d7-a108-e444-e640-0d5dd7644943@amsat.org>
 <YYjsatU4ENpazt29@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <1fcacd90-2f67-4182-ff5a-2d24398b780f@ilande.co.uk>
Date: Mon, 8 Nov 2021 09:41:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYjsatU4ENpazt29@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PULL 0/6] Egl 20211105 patches
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.06,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/11/2021 09:22, Daniel P. Berrangé wrote:

> On Mon, Nov 08, 2021 at 09:17:19AM +0100, Philippe Mathieu-Daudé wrote:
>> +Thomas & Daniel for Travis-CI
>>
>> On 11/8/21 09:12, Mark Cave-Ayland wrote:
>>> On 05/11/2021 18:49, Philippe Mathieu-Daudé wrote:
>>>> On 11/5/21 19:26, Philippe Mathieu-Daudé wrote:
>>>>> On 11/5/21 18:13, Richard Henderson wrote:
>>>>>> On 11/5/21 7:30 AM, Gerd Hoffmann wrote:
>>>>>>> The following changes since commit
>>>>>>> b1fd92137e4d485adeec8e9f292f928ff335b76c:
>>>>>>>
>>>>>>>      Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream'
>>>>>>> into staging (2021-11-03 13:07:30 -0400)
>>>>>>>
>>>>>>> are available in the Git repository at:
>>>>>>>
>>>>>>>      git://git.kraxel.org/qemu tags/egl-20211105-pull-request
>>>>>>>
>>>>>>> for you to fetch changes up to
>>>>>>> 1350ff156b25be65c599ecca9957ce6726c6d383:
>>>>>>>
>>>>>>>      ui/gtk-egl: blitting partial guest fb to the proper scanout
>>>>>>> surface
>>>>>>> (2021-11-05 12:29:44 +0100)
>>>>>>>
>>>>>>> ----------------------------------------------------------------
>>>>>>> gtk: a collection of egl fixes.
>>>>>>>
>>>>>>> ----------------------------------------------------------------
>>>>>>>
>>>>>>> Dongwon Kim (6):
>>>>>>>      virtio-gpu: splitting one extended mode guest fb into n-scanouts
>>>>>>>      ui/gtk-egl: un-tab and re-tab should destroy egl surface and
>>>>>>> context
>>>>>>>      ui/gtk-egl: make sure the right context is set as the current
>>>>>>>      ui/gtk-egl: guest fb texture needs to be regenerated when
>>>>>>>        reinitializing egl
>>>>>>>      ui/gtk: gd_draw_event returns FALSE when no cairo surface is bound
>>>>>>>      ui/gtk-egl: blitting partial guest fb to the proper scanout
>>>>>>> surface
>>>>>>>
>>>>>>>     include/hw/virtio/virtio-gpu.h        |  5 +++--
>>>>>>>     include/ui/console.h                  |  4 ++++
>>>>>>>     hw/display/virtio-gpu-udmabuf-stubs.c |  3 ++-
>>>>>>>     hw/display/virtio-gpu-udmabuf.c       | 22 ++++++++++++++--------
>>>>>>>     hw/display/virtio-gpu.c               |  4 ++--
>>>>>>>     ui/egl-helpers.c                      | 25
>>>>>>> +++++++++++++++++++++----
>>>>>>>     ui/gtk-egl.c                          | 10 ++++++++++
>>>>>>>     ui/gtk.c                              | 23 +++++++++++++++++++++++
>>>>>>>     8 files changed, 79 insertions(+), 17 deletions(-)
>>>>>>
>>>>>> Applied, thanks.
>>>>>
>>>>> Ubuntu 18.04.4 LTS:
>>>>>
>>>>> ui/gtk-egl.c:159:13: error: implicit declaration of function
>>>>> 'egl_dmabuf_release_texture' is invalid in C99
>>>>> [-Werror,-Wimplicit-function-declaration]
>>>>>               egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
>>>>>               ^
>>>>> ui/gtk-egl.c:159:13: error: this function declaration is not a prototype
>>>>> [-Werror,-Wstrict-prototypes]
>>>>> 2 errors generated.
>>>>>
>>>>> https://app.travis-ci.com/gitlab/qemu-project/qemu/builds/241272737
>>>>>
>>>>
>>>> This seems to fix but I have no clue whether it is correct:
>>>>
>>>> -- >8 --
>>>> diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
>>>> index f2026e4b5c9..45cb67712df 100644
>>>> --- a/ui/gtk-egl.c
>>>> +++ b/ui/gtk-egl.c
>>>> @@ -156,8 +156,10 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
>>>>                surface_gl_create_texture(vc->gfx.gls, vc->gfx.ds);
>>>>            }
>>>> +#ifdef CONFIG_GBM
>>>>            if (vc->gfx.guest_fb.dmabuf) {
>>>>                egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
>>>>                gd_egl_scanout_dmabuf(dcl, vc->gfx.guest_fb.dmabuf);
>>>>            }
>>>> +#endif
>>>>        }
>>>>
>>>> ---
>>>
>>> I see the same error here trying to build QEMU git master on Debian
>>> Buster (oldstable). The fix looks reasonable to me in that it matches
>>> the CONFIG_GBM guards around other similar functions and the resulting
>>> binary appears to work, so:
>>>
>>> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>
>> Thank you, I'll post a formal patch then.
>>
>> I wonder why this got merged while this configuration is covered in
>> Travis-CI. Is it that we have a too high failure rate than we don't
>> use it anymore?
> 
> I've not looked at travis in ages what matters is GitLab CI, and there
> the problem is that we're building ubuntu 20.04 not 18.04 so didn't
> catch the older problem.
> 
> I don't know what Mark sees a problem on Debian Buster though, as we
> successfully built there AFAICT
> 
>     https://gitlab.com/qemu-project/qemu/-/jobs/1756202449

That's interesting. Below is the configure output from my laptop which was generated 
with "./configure --target-list=m68k-softmmu --prefix=/home/build/rel-qemu-git":


The Meson build system
Version: 0.59.3
Source dir: /home/build/src/qemu/git/qemu
Build dir: /home/build/src/qemu/git/qemu/build
Build type: native build
Project name: qemu
Project version: 6.1.50
C compiler for the host machine: cc -m64 -mcx16 (gcc 8.3.0 "cc (Debian 8.3.0-6) 8.3.0")
C linker for the host machine: cc -m64 -mcx16 ld.bfd 2.31.1
Host machine cpu family: x86_64
Host machine cpu: x86_64
Program sh found: YES (/bin/sh)
Program python3 found: YES (/usr/bin/python3)
WARNING: Broken python installation detected. Python files installed by Meson might 
not be found by python interpreter.
C++ compiler for the host machine: c++ -m64 -mcx16 (gcc 8.3.0 "c++ (Debian 8.3.0-6) 
8.3.0")
C++ linker for the host machine: c++ -m64 -mcx16 ld.bfd 2.31.1
Program cgcc found: NO
Library m found: YES
Run-time dependency threads found: YES
Library util found: YES
Run-time dependency appleframeworks found: NO (tried framework)
Found pkg-config: /usr/bin/pkg-config (0.29)
Run-time dependency pixman-1 found: YES 0.36.0
Run-time dependency zlib found: YES 1.2.11
Has header "libaio.h" : YES
Library aio found: YES
Run-time dependency liburing found: NO (tried pkgconfig)
Run-time dependency libxml-2.0 found: NO (tried pkgconfig)
Run-time dependency libnfs found: YES 3.0.0
Run-time dependency appleframeworks found: NO (tried framework)
Run-time dependency libseccomp found: YES 2.3.3
Has header "cap-ng.h" : YES
Library cap-ng found: YES
Run-time dependency xkbcommon found: YES 0.8.2
Has header "libvdeplug.h" : YES
Library vdeplug found: YES
Run-time dependency libpulse found: YES 12.2
Run-time dependency alsa found: YES 1.1.8
Run-time dependency jack found: NO (tried pkgconfig)
Run-time dependency spice-protocol found: YES 0.12.14
Run-time dependency spice-server found: YES 0.14.0
Library rt found: YES
Library dl found: YES
Checking for function "dlopen" with dependency -ldl: YES
Run-time dependency libiscsi found: YES 1.18.0
Run-time dependency libzstd found: NO (tried pkgconfig)
Run-time dependency virglrenderer found: NO (tried pkgconfig)
Run-time dependency libcurl found: YES 7.64.0
Run-time dependency libudev found: YES 241
Library mpathpersist found: NO
Run-time dependency ncursesw found: YES 6.1.20181013
Has header "brlapi.h" : YES
Library brlapi found: YES
Run-time dependency sdl2 found: YES 2.0.9
Run-time dependency sdl2_image found: NO (tried pkgconfig)
Library rados found: YES
Has header "rbd/librbd.h" : YES
Library rbd found: YES
Run-time dependency glusterfs-api found: YES 7.5.5
Has header "bzlib.h" : NO
Has header "lzfse.h" : NO
Has header "sys/soundcard.h" : YES
Run-time dependency gbm found: NO (tried pkgconfig)
Dependency gnutls found: NO found 3.6.7 but need: '>=3.6.14'
Run-time dependency gnutls found: NO (tried pkgconfig)
Run-time dependency gnutls found: YES 3.6.7
libgcrypt-config found: YES (/usr/bin/libgcrypt-config) 1.8.4
Run-time dependency libgcrypt found: YES 1.8.4
Run-time dependency gtk+-3.0 found: YES 3.24.5
Run-time dependency gtk+-x11-3.0 found: YES 3.24.5
Run-time dependency vte-2.91 found: YES 0.54.2
Run-time dependency x11 found: YES 1.6.7
Run-time dependency libpng found: YES 1.6.36
Run-time dependency libjpeg found: YES 1.5.2
Has header "sasl/sasl.h" : YES
Library sasl2 found: YES
Has header "security/pam_appl.h" : NO
Has header "snappy-c.h" : NO
Has header "lzo/lzo1x.h" : NO
Run-time dependency libcacard found: YES 2.6.1
Run-time dependency u2f-emu found: NO (tried pkgconfig)
Run-time dependency libusbredirparser-0.5 found: YES 0.8.0
Run-time dependency libusb-1.0 found: YES 1.0.22
Run-time dependency libpmem found: NO (tried pkgconfig)
Run-time dependency libdaxctl found: NO (tried pkgconfig)
Run-time dependency libtasn1 found: YES 4.13
Run-time dependency libkeyutils found: NO (tried pkgconfig)
Checking for function "gettid" : NO
Run-time dependency fuse3 found: NO (tried pkgconfig)
Run-time dependency libbpf found: NO (tried pkgconfig)
Has header "sys/epoll.h" : YES
Has header "linux/magic.h" : YES
Has header "valgrind/valgrind.h" : YES
Has header "linux/btrfs.h" : YES
Has header "libdrm/drm.h" : YES
Has header "pty.h" : YES
Has header "sys/disk.h" : NO
Has header "sys/ioccom.h" : NO
Has header "sys/kcov.h" : NO
Checking for function "accept4" : YES
Checking for function "clock_adjtime" : YES
Checking for function "dup3" : YES
Checking for function "fallocate" : YES
Checking for function "posix_fallocate" : YES
Checking for function "posix_memalign" : YES
Checking for function "ppoll" : YES
Checking for function "preadv" : YES
Checking for function "sem_timedwait" with dependency threads: YES
Checking for function "sendfile" : YES
Checking for function "setns" : YES
Checking for function "unshare" : YES
Checking for function "syncfs" : YES
Checking for function "sync_file_range" : YES
Checking for function "timerfd_create" : YES
Checking for function "copy_file_range" : YES
Checking for function "openpty" with dependency -lutil: YES
Checking for function "strchrnul" : YES
Checking for function "system" : YES
Header <byteswap.h> has symbol "bswap_32" : YES
Header <sys/epoll.h> has symbol "epoll_create1" : YES
Header <unistd.h> has symbol "environ" : YES
Header <linux/falloc.h> has symbol "FALLOC_FL_PUNCH_HOLE" : YES
Header <linux/falloc.h> has symbol "FALLOC_FL_KEEP_SIZE" : YES
Header <linux/falloc.h> has symbol "FALLOC_FL_ZERO_RANGE" : YES
Has header "linux/fiemap.h" : YES
Header <linux/fs.h> has symbol "FS_IOC_FIEMAP" : YES
Checking for function "getrandom" : YES
Header <sys/random.h> has symbol "GRND_NONBLOCK" : YES
Header <sys/inotify.h> has symbol "inotify_init" : YES
Header <sys/inotify.h> has symbol "inotify_init1" : YES
Header <sys/uio.h> has symbol "struct iovec" : YES
Header <machine/bswap.h> has symbol "bswap32" : NO
Header <sys/prctl.h> has symbol "PR_SET_TIMERSLACK" : YES
Header <linux/rtnetlink.h> has symbol "IFLA_PROTO_DOWN" : YES
Header <sys/sysmacros.h> has symbol "makedev" : YES
Header <getopt.h> has symbol "optreset" : NO
Header <utmpx.h> has symbol "struct utmpx" : YES
Header <netinet/in.h> has symbol "IPPROTO_MPTCP" : NO
Checking whether type "struct sigevent" has member "sigev_notify_thread_id" : NO
Checking whether type "struct stat" has member "st_atim" : YES
Header <sys/socket.h> has symbol "struct mmsghdr" : YES
Has header "linux/ip.h" : YES
Program scripts/minikconf.py found: YES (/usr/bin/python3 
/home/build/src/qemu/git/qemu/scripts/minikconf.py)
Configuring m68k-softmmu-config-target.h using configuration
Configuring m68k-softmmu-config-devices.mak with command
Reading depfile: 
/home/build/src/qemu/git/qemu/build/meson-private/m68k-softmmu-config-devices.mak.d
Configuring m68k-softmmu-config-devices.h using configuration
Run-time dependency capstone found: NO (tried pkgconfig)
Configuring capstone-defs.h using configuration
Run-time dependency slirp found: NO (tried pkgconfig)
Configuring libslirp-version.h using configuration
Library fdt found: YES
Configuring config-host.h using configuration
Program scripts/hxtool found: YES (/home/build/src/qemu/git/qemu/scripts/hxtool)
Program scripts/shaderinclude.pl found: YES (/usr/bin/env perl 
/home/build/src/qemu/git/qemu/scripts/shaderinclude.pl)
Program scripts/qapi-gen.py found: YES (/usr/bin/python3 
/home/build/src/qemu/git/qemu/scripts/qapi-gen.py)
Program scripts/qemu-version.sh found: YES 
(/home/build/src/qemu/git/qemu/scripts/qemu-version.sh)

Executing subproject libvhost-user

libvhost-user| Project name: libvhost-user
libvhost-user| Project version: undefined
libvhost-user| C compiler for the host machine: cc -m64 -mcx16 (gcc 8.3.0 "cc (Debian 
8.3.0-6) 8.3.0")
libvhost-user| C linker for the host machine: cc -m64 -mcx16 ld.bfd 2.31.1
libvhost-user| Dependency threads found: YES unknown (cached)
libvhost-user| Dependency glib-2.0 found: YES 6.1.50 (overridden)
libvhost-user| Build targets in project: 11
libvhost-user| Subproject libvhost-user finished.

Program cat found: YES (/bin/cat)
Program scripts/decodetree.py found: YES (/usr/bin/python3 
/home/build/src/qemu/git/qemu/scripts/decodetree.py)
Program ../scripts/modules/module_block.py found: YES (/usr/bin/python3 
/home/build/src/qemu/git/qemu/block/../scripts/modules/module_block.py)
Program ../scripts/block-coroutine-wrapper.py found: YES (/usr/bin/python3 
/home/build/src/qemu/git/qemu/block/../scripts/block-coroutine-wrapper.py)
Program scripts/modinfo-collect.py found: YES 
(/home/build/src/qemu/git/qemu/scripts/modinfo-collect.py)
Program scripts/modinfo-generate.py found: YES 
(/home/build/src/qemu/git/qemu/scripts/modinfo-generate.py)
Program nm found: YES
Program scripts/undefsym.py found: YES (/usr/bin/python3 
/home/build/src/qemu/git/qemu/scripts/undefsym.py)
Program scripts/feature_to_c.sh found: YES (/bin/sh 
/home/build/src/qemu/git/qemu/scripts/feature_to_c.sh)
Configuring 50-qemu-virtiofsd.json using configuration
Program qemu-keymap found: NO
Program cp found: YES (/bin/cp)
Program sphinx-build-3 sphinx-build found: NO
Program python3 found: YES (/usr/bin/python3)
Program diff found: YES (/usr/bin/diff)
Program dbus-daemon found: YES (/usr/bin/dbus-daemon)
Program /usr/bin/gdbus-codegen found: YES (/usr/bin/gdbus-codegen)
Program initrd-stress.sh found: YES 
(/home/build/src/qemu/git/qemu/tests/migration/initrd-stress.sh)
Program xgettext found: YES (/usr/bin/xgettext)
Build targets in project: 423

qemu 6.1.50

   Directories
     Install prefix               : /home/build/rel-qemu-git
     BIOS directory               : share/qemu
     firmware path                : /home/build/rel-qemu-git/share/qemu-firmware
     binary directory             : bin
     library directory            : lib
     module directory             : lib/qemu
     libexec directory            : libexec
     include directory            : include
     config directory             : /home/build/rel-qemu-git/etc
     local state directory        : /home/build/rel-qemu-git/var
     Manual directory             : share/man
     Doc directory                : /home/build/rel-qemu-git/share/doc
     Build directory              : /home/build/src/qemu/git/qemu/build
     Source path                  : /home/build/src/qemu/git/qemu
     GIT submodules               : ui/keycodemapdb meson 
tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc capstone slirp

   Host binaries
     git                          : git
     make                         : make
     python                       : /usr/bin/python3 (version: 3.7)
     sphinx-build                 : NO
     genisoimage                  : /usr/bin/genisoimage
     smbd                         : "/usr/sbin/smbd"

   Configurable features
     Documentation                : NO
     system-mode emulation        : YES
     user-mode emulation          : NO
     block layer                  : YES
     Install blobs                : YES
     module support               : NO
     fuzzing support              : NO
     Audio drivers                : pa oss
     Trace backends               : log
     QOM debugging                : YES
     vhost-kernel support         : YES
     vhost-net support            : YES
     vhost-crypto support         : YES
     vhost-scsi support           : YES
     vhost-vsock support          : YES
     vhost-user support           : YES
     vhost-user-blk server support: YES
     vhost-user-fs support        : YES
     vhost-vdpa support           : YES
     build guest agent            : YES

   Compilation
     host CPU                     : x86_64
     host endianness              : little
     C compiler                   : cc -m64 -mcx16
     Host C compiler              : cc -m64 -mcx16
     C++ compiler                 : c++ -m64 -mcx16
     CFLAGS                       : -O2 -g
     CXXFLAGS                     : -O2 -g
     QEMU_CFLAGS                  : -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 
-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes 
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing 
-fno-common -fwrapv  -Wold-style-declaration -Wold-style-definition -Wtype-limits 
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body 
-Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 
-Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong
     QEMU_LDFLAGS                 : -Wl,--warn-common -Wl,-z,relro -Wl,-z,now 
-fstack-protector-strong
     profiler                     : NO
     link-time optimization (LTO) : NO
     PIE                          : YES
     static build                 : NO
     malloc trim support          : YES
     membarrier                   : NO
     debug stack usage            : NO
     mutex debugging              : NO
     memory allocator             : system
     avx2 optimization            : YES
     avx512f optimization         : NO
     gprof enabled                : NO
     gcov                         : NO
     thread sanitizer             : NO
     CFI support                  : NO
     strip binaries               : YES
     sparse                       : NO
     mingw32 support              : NO
     m68k tests                   : m68k-linux-gnu-gcc via debian-m68k-cross

   Targets and accelerators
     KVM support                  : NO
     HAX support                  : NO
     HVF support                  : NO
     WHPX support                 : NO
     NVMM support                 : NO
     Xen support                  : YES
     xen ctrl version             : 41100
     TCG support                  : YES
     TCG backend                  : native (x86_64)
     TCG plugins                  : YES
     TCG debug enabled            : NO
     target list                  : m68k-softmmu
     default devices              : YES
     out of process emulation     : YES

   Block layer support
     coroutine backend            : ucontext
     coroutine pool               : YES
     Block whitelist (rw)         :
     Block whitelist (ro)         :
     Use block whitelist in tools : NO
     VirtFS support               : YES
     build virtiofs daemon        : YES
     Live block migration         : YES
     replication support          : YES
     bochs support                : YES
     cloop support                : YES
     dmg support                  : YES
     qcow v1 support              : YES
     vdi support                  : YES
     vvfat support                : YES
     qed support                  : YES
     parallels support            : YES
     FUSE exports                 : NO

   Crypto
     TLS priority                 : "NORMAL"
     GNUTLS support               : YES 3.6.7
       GNUTLS crypto              : NO
     libgcrypt                    : YES 1.8.4
     nettle                       : NO
     crypto afalg                 : NO
     rng-none                     : NO
     Linux keyring                : YES

   Dependencies
     SDL support                  : YES
     SDL image support            : NO
     GTK support                  : YES
     pixman                       : YES 0.36.0
     VTE support                  : YES 0.54.2
     slirp support                : internal
     libtasn1                     : YES 4.13
     PAM                          : NO
     iconv support                : YES
     curses support               : YES
     virgl support                : NO
     curl support                 : YES 7.64.0
     Multipath support            : NO
     VNC support                  : YES
     VNC SASL support             : YES
     VNC JPEG support             : YES 1.5.2
     VNC PNG support              : YES 1.6.36
     OSS support                  : YES
     ALSA support                 : YES 1.1.8
     PulseAudio support           : YES 12.2
     JACK support                 : NO
     brlapi support               : YES
     vde support                  : YES
     netmap support               : NO
     l2tpv3 support               : YES
     Linux AIO support            : YES
     Linux io_uring support       : NO
     ATTR/XATTR support           : YES
     RDMA support                 : NO
     PVRDMA support               : NO
     fdt support                  : internal
     libcap-ng support            : YES
     bpf support                  : NO
     spice protocol support       : YES 0.12.14
       spice server support       : YES 0.14.0
     rbd support                  : YES
     xfsctl support               : YES
     smartcard support            : YES 2.6.1
     U2F support                  : NO
     libusb                       : YES 1.0.22
     usb net redir                : YES 0.8.0
     OpenGL support               : YES
     GBM                          : NO
     libiscsi support             : YES 1.18.0
     libnfs support               : YES 3.0.0
     seccomp support              : YES 2.3.3
     GlusterFS support            : YES 7.5.5
     TPM support                  : YES
     libssh support               : NO
     lzo support                  : NO
     snappy support               : NO
     bzip2 support                : NO
     lzfse support                : NO
     zstd support                 : NO
     NUMA host support            : YES
     libxml2                      : NO
     capstone                     : internal
     libpmem support              : NO
     libdaxctl support            : NO
     libudev                      : YES 241
     FUSE lseek                   : NO

   Subprojects
     libvhost-user                : YES

Found ninja-1.8.2 at /usr/bin/ninja


I tend to use GTK most of the time, so maybe related to SDL/virgl?


ATB,

Mark.

