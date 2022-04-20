Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17347508DD7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:56:44 +0200 (CEST)
Received: from localhost ([::1]:33958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDdD-0001ZC-6i
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhD8e-0002I2-Q0
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:25:09 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:47092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhD8b-0000Yp-EU
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:25:08 -0400
Received: by mail-qk1-x730.google.com with SMTP id c1so1571007qkf.13
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 09:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MdcWbkG5nG2EqC7nWE4wOE1s3CPvDCZE3sELZ61GpaQ=;
 b=HRxL6iC2jXvZk1U/YSStApYGNa4ulYGCdGzt6DCCnvl+XJ4C/la1dmIx6at5eq4i02
 Gu1jxuriZu70ntJzwT33TiwVPXo0HHIyN2N60FeS2CbsZ8pEWuJqRRs8yKSC0xuwS/oH
 NoP41DCBlZsxYKpEudgrixHd4CNDMb9pJLuNe9tO3IA9nzl7hr7OmxUDMuDnpy2gYx3C
 a9TYs7KPtjEBLANuIuH0tlLflQ5GwHtkY5bXD4RcrmeKazrNn7eXp8IU8kjXZBsN0sVv
 qpsX6SRGwwxL92gf+ztIWUVOgzzwGsCZkEt7Aie8z5smrlbSzMvqbHfsCxlH/eJ9NJxt
 IdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MdcWbkG5nG2EqC7nWE4wOE1s3CPvDCZE3sELZ61GpaQ=;
 b=MZqixXzwQ/zh1QAuKdTqWgOkLjFXT1EQKG9S1leM8kmyi5+hyrf+jgKNdHwDFqVEDT
 fIsjq3bqkYbUpaHtxIyBhbEjUZ2E9/TqJzyq0IvePULHDM5+qK561ywvuBKLdmETr0Jz
 J6DT6xDLdsierS0lVGDPwK8Q2zxcHI3MkxKFiUzN9nFNBuHmp85O35vJTtTMqGf/fLGB
 8BgkbO6R0+KH7AQaJciHv13WhTByTlMs7Bov6NKSWIIbe7nkcEJeNopT1GfNA6Gf2MHR
 hc4kyWgEt1FSqiHzzzG0qQxUnlYSORJCMbq9Jc0zU/2KZ5RRudphL7gd8WZ+QkBtfhnL
 qBag==
X-Gm-Message-State: AOAM530ytaZTWhvPQ0B+vkeyVqJEGA+5Wxw3edyMloReQ5/S8LBjNISN
 4Y/x4HZ2QCNC3CDzjtB5ba0yJlcjxSEK16zFD6QGQEIBMQtgDA==
X-Google-Smtp-Source: ABdhPJyLjCFUv6NYb0ezAWdOQKwmjSvga5tEq/GbdRR9zNY+7pCfn7vHqFrhHw++Gh4RAt9S/ohAEBjWyCLo0TGHRw8=
X-Received: by 2002:ae9:ef4e:0:b0:69e:2403:eae8 with SMTP id
 d75-20020ae9ef4e000000b0069e2403eae8mr12729358qkg.397.1650471904325; Wed, 20
 Apr 2022 09:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-9-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-9-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 20:24:52 +0400
Message-ID: <CAJ+F1C+uEBQt2a8gJcZKBOrGqOXDAFGbpNPvJJcLroJdsqR5rQ@mail.gmail.com>
Subject: Re: [PATCH 08/34] meson, configure: move RDMA options to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000091b57705dd186f1b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000091b57705dd186f1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 7:55 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure                      | 115 ---------------------------------
>  contrib/rdmacm-mux/meson.build |   4 +-
>  meson.build                    |  56 ++++++++++++++--
>  meson_options.txt              |   4 ++
>  migration/meson.build          |   2 +-
>  scripts/meson-buildoptions.sh  |   6 ++
>  6 files changed, 62 insertions(+), 125 deletions(-)
>
> diff --git a/configure b/configure
> index c9be6eb04d..cfd15c3518 100755
> --- a/configure
> +++ b/configure
> @@ -301,8 +301,6 @@ vhost_vsock=3D"$default_feature"
>  vhost_user=3D"no"
>  vhost_user_fs=3D"$default_feature"
>  vhost_vdpa=3D"$default_feature"
> -rdma=3D"$default_feature"
> -pvrdma=3D"$default_feature"
>  debug_info=3D"yes"
>  debug_tcg=3D"no"
>  debug=3D"no"
> @@ -972,14 +970,6 @@ for opt do
>    ;;
>    --tls-priority=3D*) tls_priority=3D"$optarg"
>    ;;
> -  --enable-rdma) rdma=3D"yes"
> -  ;;
> -  --disable-rdma) rdma=3D"no"
> -  ;;
> -  --enable-pvrdma) pvrdma=3D"yes"
> -  ;;
> -  --disable-pvrdma) pvrdma=3D"no"
> -  ;;
>    --disable-vhost-user) vhost_user=3D"no"
>    ;;
>    --enable-vhost-user) vhost_user=3D"yes"
> @@ -1244,8 +1234,6 @@ cat << EOF
>    lto             Enable Link-Time Optimization.
>    safe-stack      SafeStack Stack Smash Protection. Depends on
>                    clang/llvm >=3D 3.7 and requires coroutine backend
> ucontext.
> -  rdma            Enable RDMA-based migration
> -  pvrdma          Enable PVRDMA support
>    vhost-net       vhost-net kernel acceleration support
>    vhost-vsock     virtio sockets device support
>    vhost-scsi      vhost-scsi kernel target support
> @@ -2037,100 +2025,6 @@ EOF
>    fi
>  fi
>
> -##########################################
> -# RDMA needs OpenFabrics libraries
> -if test "$rdma" !=3D "no" ; then
> -  cat > $TMPC <<EOF
> -#include <rdma/rdma_cma.h>
> -int main(void) { return 0; }
> -EOF
> -  rdma_libs=3D"-lrdmacm -libverbs -libumad"
> -  if compile_prog "" "$rdma_libs" ; then
> -    rdma=3D"yes"
> -  else
> -    if test "$rdma" =3D "yes" ; then
> -        error_exit \
> -            " OpenFabrics librdmacm/libibverbs/libibumad not present." \
> -            " Your options:" \
> -            "  (1) Fast: Install infiniband packages (devel) from your
> distro." \
> -            "  (2) Cleanest: Install libraries from www.openfabrics.org"
> \
> -            "  (3) Also: Install softiwarp if you don't have RDMA
> hardware"
> -    fi
> -    rdma=3D"no"
> -  fi
> -fi
> -
> -##########################################
> -# PVRDMA detection
> -
> -cat > $TMPC <<EOF &&
> -#include <sys/mman.h>
> -
> -int
> -main(void)
> -{
> -    char buf =3D 0;
> -    void *addr =3D &buf;
> -    addr =3D mremap(addr, 0, 1, MREMAP_MAYMOVE | MREMAP_FIXED);
> -
> -    return 0;
> -}
> -EOF
> -
> -if test "$rdma" =3D "yes" ; then
> -    case "$pvrdma" in
> -    "")
> -        if compile_prog "" ""; then
> -            pvrdma=3D"yes"
> -        else
> -            pvrdma=3D"no"
> -        fi
> -        ;;
> -    "yes")
> -        if ! compile_prog "" ""; then
> -            error_exit "PVRDMA is not supported since mremap is not
> implemented"
> -        fi
> -        pvrdma=3D"yes"
> -        ;;
> -    "no")
> -        pvrdma=3D"no"
> -        ;;
> -    esac
> -else
> -    if test "$pvrdma" =3D "yes" ; then
> -        error_exit "PVRDMA requires rdma suppport"
> -    fi
> -    pvrdma=3D"no"
> -fi
> -
> -# Let's see if enhanced reg_mr is supported
> -if test "$pvrdma" =3D "yes" ; then
> -
> -cat > $TMPC <<EOF &&
> -#include <infiniband/verbs.h>
> -
> -int
> -main(void)
> -{
> -    struct ibv_mr *mr;
> -    struct ibv_pd *pd =3D NULL;
> -    size_t length =3D 10;
> -    uint64_t iova =3D 0;
> -    int access =3D 0;
> -    void *addr =3D NULL;
> -
> -    mr =3D ibv_reg_mr_iova(pd, addr, length, iova, access);
> -
> -    ibv_dereg_mr(mr);
> -
> -    return 0;
> -}
> -EOF
> -    if ! compile_prog "" "-libverbs"; then
> -        QEMU_CFLAGS=3D"$QEMU_CFLAGS -DLEGACY_RDMA_REG_MR"
> -    fi
> -fi
> -
>  ##########################################
>  # glib support probe
>
> @@ -2855,15 +2749,6 @@ if test "$have_tsan" =3D "yes" && test
> "$have_tsan_iface_fiber" =3D "yes" ; then
>      echo "CONFIG_TSAN=3Dy" >> $config_host_mak
>  fi
>
> -if test "$rdma" =3D "yes" ; then
> -  echo "CONFIG_RDMA=3Dy" >> $config_host_mak
> -  echo "RDMA_LIBS=3D$rdma_libs" >> $config_host_mak
> -fi
> -
> -if test "$pvrdma" =3D "yes" ; then
> -  echo "CONFIG_PVRDMA=3Dy" >> $config_host_mak
> -fi
> -
>  if test "$plugins" =3D "yes" ; then
>      echo "CONFIG_PLUGIN=3Dy" >> $config_host_mak
>  fi
> diff --git a/contrib/rdmacm-mux/meson.build
> b/contrib/rdmacm-mux/meson.build
> index 7674f54cc5..36c9c89630 100644
> --- a/contrib/rdmacm-mux/meson.build
> +++ b/contrib/rdmacm-mux/meson.build
> @@ -1,7 +1,5 @@
> -if 'CONFIG_PVRDMA' in config_host
> -  # if not found, CONFIG_PVRDMA should not be set
> +if have_pvrdma
>    # FIXME: broken on big endian architectures
> -  libumad =3D cc.find_library('ibumad', required: true)
>    executable('rdmacm-mux', files('main.c'), genh,
>               dependencies: [glib, libumad],
>               build_by_default: false,
> diff --git a/meson.build b/meson.build
> index f53fd66716..bdee186702 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1217,9 +1217,22 @@ if numa.found() and not cc.links('''
>  endif
>
>  rdma =3D not_found
> -if 'CONFIG_RDMA' in config_host
> -  rdma =3D declare_dependency(link_args: config_host['RDMA_LIBS'].split(=
))
> +if not get_option('rdma').auto() or have_system
> +  libumad =3D cc.find_library('ibumad', required: get_option('rdma'))
> +  rdma_libs =3D [cc.find_library('rdmacm', has_headers: ['rdma/rdma_cma.=
h'],
> +                               required: get_option('rdma'),
> +                               kwargs: static_kwargs),
> +               cc.find_library('ibverbs', required: get_option('rdma'),
> +                               kwargs: static_kwargs),
> +               libumad]
> +  rdma =3D declare_dependency(dependencies: rdma_libs)
> +  foreach lib: rdma_libs
> +    if not lib.found()
> +      rdma =3D not_found
> +    endif
> +  endforeach
>  endif
> +
>  xen =3D not_found
>  if 'CONFIG_XEN_BACKEND' in config_host
>    xen =3D declare_dependency(compile_args:
> config_host['XEN_CFLAGS'].split(),
> @@ -1552,6 +1565,7 @@ config_host_data.set('CONFIG_NUMA', numa.found())
>  config_host_data.set('CONFIG_OPENGL', opengl.found())
>  config_host_data.set('CONFIG_PROFILER', get_option('profiler'))
>  config_host_data.set('CONFIG_RBD', rbd.found())
> +config_host_data.set('CONFIG_RDMA', rdma.found())
>  config_host_data.set('CONFIG_SDL', sdl.found())
>  config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
>  config_host_data.set('CONFIG_SECCOMP', seccomp.found())
> @@ -1650,7 +1664,7 @@ config_host_data.set('HAVE_SYSTEM_FUNCTION',
> cc.has_function('system', prefix: '
>  if rdma.found()
>    config_host_data.set('HAVE_IBV_ADVISE_MR',
>                         cc.has_function('ibv_advise_mr',
> -                                       args:
> config_host['RDMA_LIBS'].split(),
> +                                       dependencies: rdma,
>                                         prefix: '#include
> <infiniband/verbs.h>'))
>  endif
>
> @@ -1970,6 +1984,36 @@ config_host_data.set('CONFIG_AVX512F_OPT',
> get_option('avx512f') \
>      int main(int argc, char *argv[]) { return bar(argv[0]); }
>    '''), error_message: 'AVX512F not available').allowed())
>
> +have_pvrdma =3D get_option('pvrdma') \
> +  .require(rdma.found(), error_message: 'PVRDMA requires OpenFabrics
> libraries') \
> +  .require(cc.compiles('''
> +    int main(void)
> +    {
> +      char buf =3D 0;
> +      void *addr =3D &buf;
> +      addr =3D mremap(addr, 0, 1, MREMAP_MAYMOVE | MREMAP_FIXED);
> +
> +      return 0;
> +    }'''), error_message: 'PVRDMA requires mremap').allowed()
> +
> +if have_pvrdma
> +  config_host_data.set('LEGACY_RDMA_REG_MR', not cc.compiles('''
> +    #include <infiniband/verbs.h>
> +    int main(void)
> +    {
> +      struct ibv_mr *mr;
> +      struct ibv_pd *pd =3D NULL;
> +      size_t length =3D 10;
> +      uint64_t iova =3D 0;
> +      int access =3D 0;
> +      void *addr =3D NULL;
> +
> +      mr =3D ibv_reg_mr_iova(pd, addr, length, iova, access);
> +      ibv_dereg_mr(mr);
> +      return 0;
> +    }'''))
> +endif
> +
>  if get_option('membarrier').disabled()
>    have_membarrier =3D false
>  elif targetos =3D=3D 'windows'
> @@ -2092,7 +2136,7 @@ host_kconfig =3D \
>    ('CONFIG_VHOST_KERNEL' in config_host ? ['CONFIG_VHOST_KERNEL=3Dy'] : =
[])
> + \
>    (have_virtfs ? ['CONFIG_VIRTFS=3Dy'] : []) + \
>    ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=3Dy'] : []) + \
> -  ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=3Dy'] : []) + \
> +  (have_pvrdma ? ['CONFIG_PVRDMA=3Dy'] : []) + \
>    (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=3Dy'] : [])
>
>  ignored =3D [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
> @@ -3686,8 +3730,8 @@ summary_info +=3D {'l2tpv3 support':    have_l2tpv3=
}
>  summary_info +=3D {'Linux AIO support': libaio}
>  summary_info +=3D {'Linux io_uring support': linux_io_uring}
>  summary_info +=3D {'ATTR/XATTR support': libattr}
> -summary_info +=3D {'RDMA support':      config_host.has_key('CONFIG_RDMA=
')}
> -summary_info +=3D {'PVRDMA support':
> config_host.has_key('CONFIG_PVRDMA')}
> +summary_info +=3D {'RDMA support':      rdma}
> +summary_info +=3D {'PVRDMA support':    have_pvrdma}
>  summary_info +=3D {'fdt support':       fdt_opt =3D=3D 'disabled' ? fals=
e :
> fdt_opt}
>  summary_info +=3D {'libcap-ng support': libcap_ng}
>  summary_info +=3D {'bpf support':       libbpf}
> diff --git a/meson_options.txt b/meson_options.txt
> index bd8efe4fbf..c00e0866e9 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -151,6 +151,10 @@ option('rbd', type : 'feature', value : 'auto',
>         description: 'Ceph block device driver')
>  option('opengl', type : 'feature', value : 'auto',
>         description: 'OpenGL support')
> +option('rdma', type : 'feature', value : 'auto',
> +       description: 'Enable RDMA-based migration')
> +option('pvrdma', type : 'feature', value : 'auto',
> +       description: 'Enable PVRDMA support')
>  option('gtk', type : 'feature', value : 'auto',
>         description: 'GTK+ user interface')
>  option('sdl', type : 'feature', value : 'auto',
> diff --git a/migration/meson.build b/migration/meson.build
> index 8b5ca5c047..6880b61b10 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -27,7 +27,7 @@ softmmu_ss.add(files(
>    'tls.c',
>  ), gnutls)
>
> -softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
> +softmmu_ss.add(when: rdma, if_true: files('rdma.c'))
>  if get_option('live_block_migration').allowed()
>    softmmu_ss.add(files('block.c'))
>  endif
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index f91bd9231b..cd922614e8 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -95,10 +95,12 @@ meson_options_help() {
>    printf "%s\n" '  oss             OSS sound support'
>    printf "%s\n" '  pa              PulseAudio sound support'
>    printf "%s\n" '  parallels       parallels image format support'
> +  printf "%s\n" '  pvrdma          Enable PVRDMA support'
>    printf "%s\n" '  qcow1           qcow1 image format support'
>    printf "%s\n" '  qed             qed image format support'
>    printf "%s\n" '  qga-vss         build QGA VSS support (broken with
> MinGW)'
>    printf "%s\n" '  rbd             Ceph block device driver'
> +  printf "%s\n" '  rdma            Enable RDMA-based migration'
>    printf "%s\n" '  replication     replication support'
>    printf "%s\n" '  sdl             SDL user interface'
>    printf "%s\n" '  sdl-image       SDL Image support for icons'
> @@ -282,6 +284,8 @@ _meson_option_parse() {
>      --disable-parallels) printf "%s" -Dparallels=3Ddisabled ;;
>      --enable-profiler) printf "%s" -Dprofiler=3Dtrue ;;
>      --disable-profiler) printf "%s" -Dprofiler=3Dfalse ;;
> +    --enable-pvrdma) printf "%s" -Dpvrdma=3Denabled ;;
> +    --disable-pvrdma) printf "%s" -Dpvrdma=3Ddisabled ;;
>      --enable-qcow1) printf "%s" -Dqcow1=3Denabled ;;
>      --disable-qcow1) printf "%s" -Dqcow1=3Ddisabled ;;
>      --enable-qed) printf "%s" -Dqed=3Denabled ;;
> @@ -292,6 +296,8 @@ _meson_option_parse() {
>      --disable-qom-cast-debug) printf "%s" -Dqom_cast_debug=3Dfalse ;;
>      --enable-rbd) printf "%s" -Drbd=3Denabled ;;
>      --disable-rbd) printf "%s" -Drbd=3Ddisabled ;;
> +    --enable-rdma) printf "%s" -Drdma=3Denabled ;;
> +    --disable-rdma) printf "%s" -Drdma=3Ddisabled ;;
>      --enable-replication) printf "%s" -Dreplication=3Denabled ;;
>      --disable-replication) printf "%s" -Dreplication=3Ddisabled ;;
>      --enable-rng-none) printf "%s" -Drng_none=3Dtrue ;;
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000091b57705dd186f1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:55 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sign=
ed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><div=
>lgtm<br></div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D=
"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@red=
hat.com</a>&gt;</div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 115 ---------------------------------<br>
=C2=A0contrib/rdmacm-mux/meson.build |=C2=A0 =C2=A04 +-<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 56 ++++++++++++++--<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 ++<br>
=C2=A0migration/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0scripts/meson-buildoptions.sh=C2=A0 |=C2=A0 =C2=A06 ++<br>
=C2=A06 files changed, 62 insertions(+), 125 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index c9be6eb04d..cfd15c3518 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -301,8 +301,6 @@ vhost_vsock=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_user=3D&quot;no&quot;<br>
=C2=A0vhost_user_fs=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_vdpa=3D&quot;$default_feature&quot;<br>
-rdma=3D&quot;$default_feature&quot;<br>
-pvrdma=3D&quot;$default_feature&quot;<br>
=C2=A0debug_info=3D&quot;yes&quot;<br>
=C2=A0debug_tcg=3D&quot;no&quot;<br>
=C2=A0debug=3D&quot;no&quot;<br>
@@ -972,14 +970,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--tls-priority=3D*) tls_priority=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-rdma) rdma=3D&quot;yes&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-rdma) rdma=3D&quot;no&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-pvrdma) pvrdma=3D&quot;yes&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-pvrdma) pvrdma=3D&quot;no&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-vhost-user) vhost_user=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-vhost-user) vhost_user=3D&quot;yes&quot;<br>
@@ -1244,8 +1234,6 @@ cat &lt;&lt; EOF<br>
=C2=A0 =C2=A0lto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Enable Link=
-Time Optimization.<br>
=C2=A0 =C2=A0safe-stack=C2=A0 =C2=A0 =C2=A0 SafeStack Stack Smash Protectio=
n. Depends on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clang/=
llvm &gt;=3D 3.7 and requires coroutine backend ucontext.<br>
-=C2=A0 rdma=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Enable RDMA-based mig=
ration<br>
-=C2=A0 pvrdma=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Enable PVRDMA support<br>
=C2=A0 =C2=A0vhost-net=C2=A0 =C2=A0 =C2=A0 =C2=A0vhost-net kernel accelerat=
ion support<br>
=C2=A0 =C2=A0vhost-vsock=C2=A0 =C2=A0 =C2=A0virtio sockets device support<b=
r>
=C2=A0 =C2=A0vhost-scsi=C2=A0 =C2=A0 =C2=A0 vhost-scsi kernel target suppor=
t<br>
@@ -2037,100 +2025,6 @@ EOF<br>
=C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# RDMA needs OpenFabrics libraries<br>
-if test &quot;$rdma&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 cat &gt; $TMPC &lt;&lt;EOF<br>
-#include &lt;rdma/rdma_cma.h&gt;<br>
-int main(void) { return 0; }<br>
-EOF<br>
-=C2=A0 rdma_libs=3D&quot;-lrdmacm -libverbs -libumad&quot;<br>
-=C2=A0 if compile_prog &quot;&quot; &quot;$rdma_libs&quot; ; then<br>
-=C2=A0 =C2=A0 rdma=3D&quot;yes&quot;<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 if test &quot;$rdma&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_exit \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; OpenFabrics librdmacm/lib=
ibverbs/libibumad not present.&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; Your options:&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 (1) Fast: Install i=
nfiniband packages (devel) from your distro.&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 (2) Cleanest: Insta=
ll libraries from <a href=3D"http://www.openfabrics.org" rel=3D"noreferrer"=
 target=3D"_blank">www.openfabrics.org</a>&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 (3) Also: Install s=
oftiwarp if you don&#39;t have RDMA hardware&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 rdma=3D&quot;no&quot;<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
-##########################################<br>
-# PVRDMA detection<br>
-<br>
-cat &gt; $TMPC &lt;&lt;EOF &amp;&amp;<br>
-#include &lt;sys/mman.h&gt;<br>
-<br>
-int<br>
-main(void)<br>
-{<br>
-=C2=A0 =C2=A0 char buf =3D 0;<br>
-=C2=A0 =C2=A0 void *addr =3D &amp;buf;<br>
-=C2=A0 =C2=A0 addr =3D mremap(addr, 0, 1, MREMAP_MAYMOVE | MREMAP_FIXED);<=
br>
-<br>
-=C2=A0 =C2=A0 return 0;<br>
-}<br>
-EOF<br>
-<br>
-if test &quot;$rdma&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 case &quot;$pvrdma&quot; in<br>
-=C2=A0 =C2=A0 &quot;&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if compile_prog &quot;&quot; &quot;&quot;; the=
n<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pvrdma=3D&quot;yes&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pvrdma=3D&quot;no&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 &quot;yes&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! compile_prog &quot;&quot; &quot;&quot;; t=
hen<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_exit &quot;PVRDMA is not s=
upported since mremap is not implemented&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pvrdma=3D&quot;yes&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 &quot;no&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pvrdma=3D&quot;no&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 esac<br>
-else<br>
-=C2=A0 =C2=A0 if test &quot;$pvrdma&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_exit &quot;PVRDMA requires rdma suppport=
&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 pvrdma=3D&quot;no&quot;<br>
-fi<br>
-<br>
-# Let&#39;s see if enhanced reg_mr is supported<br>
-if test &quot;$pvrdma&quot; =3D &quot;yes&quot; ; then<br>
-<br>
-cat &gt; $TMPC &lt;&lt;EOF &amp;&amp;<br>
-#include &lt;infiniband/verbs.h&gt;<br>
-<br>
-int<br>
-main(void)<br>
-{<br>
-=C2=A0 =C2=A0 struct ibv_mr *mr;<br>
-=C2=A0 =C2=A0 struct ibv_pd *pd =3D NULL;<br>
-=C2=A0 =C2=A0 size_t length =3D 10;<br>
-=C2=A0 =C2=A0 uint64_t iova =3D 0;<br>
-=C2=A0 =C2=A0 int access =3D 0;<br>
-=C2=A0 =C2=A0 void *addr =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 mr =3D ibv_reg_mr_iova(pd, addr, length, iova, access);<br>
-<br>
-=C2=A0 =C2=A0 ibv_dereg_mr(mr);<br>
-<br>
-=C2=A0 =C2=A0 return 0;<br>
-}<br>
-EOF<br>
-=C2=A0 =C2=A0 if ! compile_prog &quot;&quot; &quot;-libverbs&quot;; then<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMU_CFLAGS=3D&quot;$QEMU_CFLAGS -DLEGACY_RDMA=
_REG_MR&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# glib support probe<br>
<br>
@@ -2855,15 +2749,6 @@ if test &quot;$have_tsan&quot; =3D &quot;yes&quot; &=
amp;&amp; test &quot;$have_tsan_iface_fiber&quot; =3D &quot;yes&quot; ; the=
n<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;CONFIG_TSAN=3Dy&quot; &gt;&gt; $config_host_=
mak<br>
=C2=A0fi<br>
<br>
-if test &quot;$rdma&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_RDMA=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;RDMA_LIBS=3D$rdma_libs&quot; &gt;&gt; $config_host_mak<b=
r>
-fi<br>
-<br>
-if test &quot;$pvrdma&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_PVRDMA=3Dy&quot; &gt;&gt; $config_host_mak<br>
-fi<br>
-<br>
=C2=A0if test &quot;$plugins&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;CONFIG_PLUGIN=3Dy&quot; &gt;&gt; $config_hos=
t_mak<br>
=C2=A0fi<br>
diff --git a/contrib/rdmacm-mux/meson.build b/contrib/rdmacm-mux/meson.buil=
d<br>
index 7674f54cc5..36c9c89630 100644<br>
--- a/contrib/rdmacm-mux/meson.build<br>
+++ b/contrib/rdmacm-mux/meson.build<br>
@@ -1,7 +1,5 @@<br>
-if &#39;CONFIG_PVRDMA&#39; in config_host<br>
-=C2=A0 # if not found, CONFIG_PVRDMA should not be set<br>
+if have_pvrdma<br>
=C2=A0 =C2=A0# FIXME: broken on big endian architectures<br>
-=C2=A0 libumad =3D cc.find_library(&#39;ibumad&#39;, required: true)<br>
=C2=A0 =C2=A0executable(&#39;rdmacm-mux&#39;, files(&#39;main.c&#39;), genh=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dependencies: [glib, libum=
ad],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_by_default: false,<b=
r>
diff --git a/meson.build b/meson.build<br>
index f53fd66716..bdee186702 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1217,9 +1217,22 @@ if numa.found() and not cc.links(&#39;&#39;&#39;<br>
=C2=A0endif<br>
<br>
=C2=A0rdma =3D not_found<br>
-if &#39;CONFIG_RDMA&#39; in config_host<br>
-=C2=A0 rdma =3D declare_dependency(link_args: config_host[&#39;RDMA_LIBS&#=
39;].split())<br>
+if not get_option(&#39;rdma&#39;).auto() or have_system<br>
+=C2=A0 libumad =3D cc.find_library(&#39;ibumad&#39;, required: get_option(=
&#39;rdma&#39;))<br>
+=C2=A0 rdma_libs =3D [cc.find_library(&#39;rdmacm&#39;, has_headers: [&#39=
;rdma/rdma_cma.h&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0required: get_option(&#39;rdma&#39;),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kwargs: static_kwargs),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc.find_library(&#3=
9;ibverbs&#39;, required: get_option(&#39;rdma&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kwargs: static_kwargs),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libumad]<br>
+=C2=A0 rdma =3D declare_dependency(dependencies: rdma_libs)<br>
+=C2=A0 foreach lib: rdma_libs<br>
+=C2=A0 =C2=A0 if not lib.found()<br>
+=C2=A0 =C2=A0 =C2=A0 rdma =3D not_found<br>
+=C2=A0 =C2=A0 endif<br>
+=C2=A0 endforeach<br>
=C2=A0endif<br>
+<br>
=C2=A0xen =3D not_found<br>
=C2=A0if &#39;CONFIG_XEN_BACKEND&#39; in config_host<br>
=C2=A0 =C2=A0xen =3D declare_dependency(compile_args: config_host[&#39;XEN_=
CFLAGS&#39;].split(),<br>
@@ -1552,6 +1565,7 @@ config_host_data.set(&#39;CONFIG_NUMA&#39;, numa.foun=
d())<br>
=C2=A0config_host_data.set(&#39;CONFIG_OPENGL&#39;, opengl.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_PROFILER&#39;, get_option(&#39;profi=
ler&#39;))<br>
=C2=A0config_host_data.set(&#39;CONFIG_RBD&#39;, rbd.found())<br>
+config_host_data.set(&#39;CONFIG_RDMA&#39;, rdma.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL&#39;, sdl.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL_IMAGE&#39;, sdl_image.found())<b=
r>
=C2=A0config_host_data.set(&#39;CONFIG_SECCOMP&#39;, seccomp.found())<br>
@@ -1650,7 +1664,7 @@ config_host_data.set(&#39;HAVE_SYSTEM_FUNCTION&#39;, =
cc.has_function(&#39;system&#39;, prefix: &#39;<br>
=C2=A0if rdma.found()<br>
=C2=A0 =C2=A0config_host_data.set(&#39;HAVE_IBV_ADVISE_MR&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cc.has_function(&#39;ibv_advise_mr&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args: con=
fig_host[&#39;RDMA_LIBS&#39;].split(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dependenc=
ies: rdma,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix: =
&#39;#include &lt;infiniband/verbs.h&gt;&#39;))<br>
=C2=A0endif<br>
<br>
@@ -1970,6 +1984,36 @@ config_host_data.set(&#39;CONFIG_AVX512F_OPT&#39;, g=
et_option(&#39;avx512f&#39;) \<br>
=C2=A0 =C2=A0 =C2=A0int main(int argc, char *argv[]) { return bar(argv[0]);=
 }<br>
=C2=A0 =C2=A0&#39;&#39;&#39;), error_message: &#39;AVX512F not available&#3=
9;).allowed())<br>
<br>
+have_pvrdma =3D get_option(&#39;pvrdma&#39;) \<br>
+=C2=A0 .require(rdma.found(), error_message: &#39;PVRDMA requires OpenFabr=
ics libraries&#39;) \<br>
+=C2=A0 .require(cc.compiles(&#39;&#39;&#39;<br>
+=C2=A0 =C2=A0 int main(void)<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 char buf =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 void *addr =3D &amp;buf;<br>
+=C2=A0 =C2=A0 =C2=A0 addr =3D mremap(addr, 0, 1, MREMAP_MAYMOVE | MREMAP_F=
IXED);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }&#39;&#39;&#39;), error_message: &#39;PVRDMA requires mrema=
p&#39;).allowed()<br>
+<br>
+if have_pvrdma<br>
+=C2=A0 config_host_data.set(&#39;LEGACY_RDMA_REG_MR&#39;, not cc.compiles(=
&#39;&#39;&#39;<br>
+=C2=A0 =C2=A0 #include &lt;infiniband/verbs.h&gt;<br>
+=C2=A0 =C2=A0 int main(void)<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 struct ibv_mr *mr;<br>
+=C2=A0 =C2=A0 =C2=A0 struct ibv_pd *pd =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 size_t length =3D 10;<br>
+=C2=A0 =C2=A0 =C2=A0 uint64_t iova =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 int access =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 void *addr =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 mr =3D ibv_reg_mr_iova(pd, addr, length, iova, access=
);<br>
+=C2=A0 =C2=A0 =C2=A0 ibv_dereg_mr(mr);<br>
+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }&#39;&#39;&#39;))<br>
+endif<br>
+<br>
=C2=A0if get_option(&#39;membarrier&#39;).disabled()<br>
=C2=A0 =C2=A0have_membarrier =3D false<br>
=C2=A0elif targetos =3D=3D &#39;windows&#39;<br>
@@ -2092,7 +2136,7 @@ host_kconfig =3D \<br>
=C2=A0 =C2=A0(&#39;CONFIG_VHOST_KERNEL&#39; in config_host ? [&#39;CONFIG_V=
HOST_KERNEL=3Dy&#39;] : []) + \<br>
=C2=A0 =C2=A0(have_virtfs ? [&#39;CONFIG_VIRTFS=3Dy&#39;] : []) + \<br>
=C2=A0 =C2=A0(&#39;CONFIG_LINUX&#39; in config_host ? [&#39;CONFIG_LINUX=3D=
y&#39;] : []) + \<br>
-=C2=A0 (&#39;CONFIG_PVRDMA&#39; in config_host ? [&#39;CONFIG_PVRDMA=3Dy&#=
39;] : []) + \<br>
+=C2=A0 (have_pvrdma ? [&#39;CONFIG_PVRDMA=3Dy&#39;] : []) + \<br>
=C2=A0 =C2=A0(multiprocess_allowed ? [&#39;CONFIG_MULTIPROCESS_ALLOWED=3Dy&=
#39;] : [])<br>
<br>
=C2=A0ignored =3D [ &#39;TARGET_XML_FILES&#39;, &#39;TARGET_ABI_DIR&#39;, &=
#39;TARGET_ARCH&#39; ]<br>
@@ -3686,8 +3730,8 @@ summary_info +=3D {&#39;l2tpv3 support&#39;:=C2=A0 =
=C2=A0 have_l2tpv3}<br>
=C2=A0summary_info +=3D {&#39;Linux AIO support&#39;: libaio}<br>
=C2=A0summary_info +=3D {&#39;Linux io_uring support&#39;: linux_io_uring}<=
br>
=C2=A0summary_info +=3D {&#39;ATTR/XATTR support&#39;: libattr}<br>
-summary_info +=3D {&#39;RDMA support&#39;:=C2=A0 =C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_RDMA&#39;)}<br>
-summary_info +=3D {&#39;PVRDMA support&#39;:=C2=A0 =C2=A0 config_host.has_=
key(&#39;CONFIG_PVRDMA&#39;)}<br>
+summary_info +=3D {&#39;RDMA support&#39;:=C2=A0 =C2=A0 =C2=A0 rdma}<br>
+summary_info +=3D {&#39;PVRDMA support&#39;:=C2=A0 =C2=A0 have_pvrdma}<br>
=C2=A0summary_info +=3D {&#39;fdt support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0f=
dt_opt =3D=3D &#39;disabled&#39; ? false : fdt_opt}<br>
=C2=A0summary_info +=3D {&#39;libcap-ng support&#39;: libcap_ng}<br>
=C2=A0summary_info +=3D {&#39;bpf support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0l=
ibbpf}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index bd8efe4fbf..c00e0866e9 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -151,6 +151,10 @@ option(&#39;rbd&#39;, type : &#39;feature&#39;, value =
: &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Ceph block device driver&#39;=
)<br>
=C2=A0option(&#39;opengl&#39;, type : &#39;feature&#39;, value : &#39;auto&=
#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;OpenGL support&#39;)<br>
+option(&#39;rdma&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Enable RDMA-based migration&#=
39;)<br>
+option(&#39;pvrdma&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Enable PVRDMA support&#39;)<b=
r>
=C2=A0option(&#39;gtk&#39;, type : &#39;feature&#39;, value : &#39;auto&#39=
;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;GTK+ user interface&#39;)<br>
=C2=A0option(&#39;sdl&#39;, type : &#39;feature&#39;, value : &#39;auto&#39=
;,<br>
diff --git a/migration/meson.build b/migration/meson.build<br>
index 8b5ca5c047..6880b61b10 100644<br>
--- a/migration/meson.build<br>
+++ b/migration/meson.build<br>
@@ -27,7 +27,7 @@ softmmu_ss.add(files(<br>
=C2=A0 =C2=A0&#39;tls.c&#39;,<br>
=C2=A0), gnutls)<br>
<br>
-softmmu_ss.add(when: [&#39;CONFIG_RDMA&#39;, rdma], if_true: files(&#39;rd=
ma.c&#39;))<br>
+softmmu_ss.add(when: rdma, if_true: files(&#39;rdma.c&#39;))<br>
=C2=A0if get_option(&#39;live_block_migration&#39;).allowed()<br>
=C2=A0 =C2=A0softmmu_ss.add(files(&#39;block.c&#39;))<br>
=C2=A0endif<br>
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh<=
br>
index f91bd9231b..cd922614e8 100644<br>
--- a/scripts/meson-buildoptions.sh<br>
+++ b/scripts/meson-buildoptions.sh<br>
@@ -95,10 +95,12 @@ meson_options_help() {<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 oss=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0OSS sound support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 pa=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 PulseAudio sound support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 parallels=C2=A0 =C2=A0 =C2=
=A0 =C2=A0parallels image format support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 pvrdma=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Enable PVRDMA support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 qcow1=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0qcow1 image format support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 qed=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0qed image format support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 qga-vss=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0build QGA VSS support (broken with MinGW)&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 rbd=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Ceph block device driver&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 rdma=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 Enable RDMA-based migration&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 replication=C2=A0 =C2=A0 =
=C2=A0replication support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 sdl=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0SDL user interface&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 sdl-image=C2=A0 =C2=A0 =C2=
=A0 =C2=A0SDL Image support for icons&#39;<br>
@@ -282,6 +284,8 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-parallels) printf &quot;%s&quot; -Dparallels=
=3Ddisabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-profiler) printf &quot;%s&quot; -Dprofiler=3Dt=
rue ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-profiler) printf &quot;%s&quot; -Dprofiler=3D=
false ;;<br>
+=C2=A0 =C2=A0 --enable-pvrdma) printf &quot;%s&quot; -Dpvrdma=3Denabled ;;=
<br>
+=C2=A0 =C2=A0 --disable-pvrdma) printf &quot;%s&quot; -Dpvrdma=3Ddisabled =
;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-qcow1) printf &quot;%s&quot; -Dqcow1=3Denabled=
 ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-qcow1) printf &quot;%s&quot; -Dqcow1=3Ddisabl=
ed ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-qed) printf &quot;%s&quot; -Dqed=3Denabled ;;<=
br>
@@ -292,6 +296,8 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-qom-cast-debug) printf &quot;%s&quot; -Dqom_c=
ast_debug=3Dfalse ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-rbd) printf &quot;%s&quot; -Drbd=3Denabled ;;<=
br>
=C2=A0 =C2=A0 =C2=A0--disable-rbd) printf &quot;%s&quot; -Drbd=3Ddisabled ;=
;<br>
+=C2=A0 =C2=A0 --enable-rdma) printf &quot;%s&quot; -Drdma=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-rdma) printf &quot;%s&quot; -Drdma=3Ddisabled ;;<b=
r>
=C2=A0 =C2=A0 =C2=A0--enable-replication) printf &quot;%s&quot; -Dreplicati=
on=3Denabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-replication) printf &quot;%s&quot; -Dreplicat=
ion=3Ddisabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-rng-none) printf &quot;%s&quot; -Drng_none=3Dt=
rue ;;<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000091b57705dd186f1b--

