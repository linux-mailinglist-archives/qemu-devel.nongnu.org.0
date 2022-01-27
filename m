Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEC549E32B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 14:17:30 +0100 (CET)
Received: from localhost ([::1]:41818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD4eX-0002XL-9O
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 08:17:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nD3x2-0002FR-Dz
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 07:32:33 -0500
Received: from [2a00:1450:4864:20::22f] (port=40896
 helo=mail-lj1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nD3wy-0002jq-M1
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 07:32:32 -0500
Received: by mail-lj1-x22f.google.com with SMTP id q22so4084315ljh.7
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 04:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=HE8fyE8CbbZO2WBtjKFINZ2z/ngLNYV9xRLLSsmRpsE=;
 b=klgX388q48ZZ2c4LakX5jlC8tpNxj6iORLC/WTlFCqopJgmUVpmyj3X9lRtYhr+vHr
 BlhGZd/cmwH9k54NxdcqCjC55Cxd6KBSJSkLz1v/Ut3sHke9QJ7AFo3YxS19zv8xsj++
 mV6HEFLuK6pGRV6rCyjv6NcCNHvm+nhAbu1+hbpPc/UjcU1+J0xqg6e05XJtZuEXesVz
 3FH+RdXaUV6PpkmaSMz5MFCnxpPbFSi7Zp9Dz8T52eUyOB3V9QvK1bouE7zhC03H1r/k
 FYefyLpS0hhHOA8yd0AUjtXWqt5I7GJyzQT8LEyZpLd2GueUYjxe19yMEjt9sGZigzoR
 8QeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=HE8fyE8CbbZO2WBtjKFINZ2z/ngLNYV9xRLLSsmRpsE=;
 b=jd0/6e50PVWZIAfYw/GwfXjrnwnNa1X1R2UVx5uC6ADQVkV/meEcQFMhzyN84E7Fu1
 NAIpq+Dkvxv7btNCjj84/yc04o/ubMzlgDz51WYqgOKHv0tdx/DtBqQbjvQ6fkKOMe19
 ULKUxUNxCLE65z7Kfak+MqVj3d4bEqPSpJFwwwWgF6CKZ+I8ycfFEOBRG9Di+U5+c0Bi
 L1BKDGVVqgQEP4TxmClrl1TEsqJ/MZsnHuOlumqVW9oLiyrL3JNFdGmy24/3xP36ux71
 HjJNY92VP0ph/QqkLEP21m3ieYqcsdtSiUfB+goy10FGnmGiEP2OzVJbteIHmCI4ez2A
 hWBg==
X-Gm-Message-State: AOAM5328GMUh0XGE9z+WomwZCYEDw6g0mhFJuqts+A9k49HulqkMFZ/5
 mHRxQnDORL5xRTbmocgqkgDzbUe2M05hRhgW
X-Google-Smtp-Source: ABdhPJzxK30Do5Kc10eenllK/fuEmPvuhOkPiu6Qls9by6G4Xw2DLl0Yq7NRZQUb8uG+25kFpJH8RA==
X-Received: by 2002:a17:906:4fc5:: with SMTP id
 i5mr2843384ejw.630.1643286215032; 
 Thu, 27 Jan 2022 04:23:35 -0800 (PST)
Received: from smtpclient.apple ([188.25.251.197])
 by smtp.gmail.com with ESMTPSA id gh14sm8576498ejb.126.2022.01.27.04.23.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jan 2022 04:23:34 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH] Add --with-branding-prefix and QEMU_BRANDING_PREFIX
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <20220120113545.55820-1-ilg@livius.net>
Date: Thu, 27 Jan 2022 14:23:33 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <8A1E1B8F-ADA0-4966-A4E9-C0A08EB0A327@livius.net>
References: <20220120113545.55820-1-ilg@livius.net>
To: QEMU Developers <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22f
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::22f;
 envelope-from=ilg@livius.net; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Any chance for someone to take a look at this proposal?

Thank you,

Liviu


> On 20 Jan 2022, at 13:35, Liviu Ionescu <ilg@livius.net> wrote:
>=20
> It is usual for various distributions to identify themselves by
> prepending a string to the greeting message, for example
> 'xPack QEMU emulator version 6.2.0 (v6.2.0-2-xpack-arm)'.
>=20
> To achieve this, a new configuration option (--with-branding-prefix=3D)
> was added, which, if not empty, adds a string preprocessor macro
> (QEMU_BRANDING_PREFIX) to 'config-host.h'.
>=20
> If this macro is defined, in QEMU and various tools, the string
> is displayed before the existing greeting messages.
> ---
> bsd-user/main.c                      |  3 +++
> configure                            |  5 +++++
> linux-user/main.c                    |  3 +++
> meson.build                          |  5 +++++
> meson_options.txt                    |  3 +++
> qemu-img.c                           | 10 ++++++++--
> qemu-io.c                            |  3 +++
> qemu-nbd.c                           |  3 +++
> qga/main.c                           |  5 ++++-
> scsi/qemu-pr-helper.c                |  3 +++
> softmmu/vl.c                         |  3 +++
> storage-daemon/qemu-storage-daemon.c |  3 +++
> tools/virtiofsd/passthrough_ll.c     |  3 +++
> ui/cocoa.m                           |  5 +++++
> 14 files changed, 54 insertions(+), 3 deletions(-)
>=20
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index cb5ea40236..a4eab8feef 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -149,6 +149,9 @@ void cpu_loop(CPUArchState *env)
>=20
> static void usage(void)
> {
> +#if defined(QEMU_BRANDING_PREFIX)
> +    printf("%s ", QEMU_BRANDING_PREFIX);
> +#endif
>     printf("qemu-" TARGET_NAME " version " QEMU_FULL_VERSION
>            "\n" QEMU_COPYRIGHT "\n"
>            "usage: qemu-" TARGET_NAME " [options] program =
[arguments...]\n"
> diff --git a/configure b/configure
> index e1a31fb332..579a8cf55d 100755
> --- a/configure
> +++ b/configure
> @@ -356,6 +356,7 @@ ninja=3D""
> gio=3D"$default_feature"
> skip_meson=3Dno
> slirp_smbd=3D"$default_feature"
> +branding_prefix=3D""
>=20
> # The following Meson options are handled manually (still they
> # are included in the automatically generated help message)
> @@ -1179,6 +1180,8 @@ for opt do
>   # everything else has the same name in configure and meson
>   --enable-* | --disable-*) meson_option_parse "$opt" "$optarg"
>   ;;
> +  --with-branding-prefix=3D*) branding_prefix=3D"$optarg"
> +  ;;
>   *)
>       echo "ERROR: unknown option $opt"
>       echo "Try '$0 --help' for more information"
> @@ -1352,6 +1355,7 @@ Advanced options (experts only):
>   --firmwarepath=3DPATH      search PATH for firmware files
>   --efi-aarch64=3DPATH       PATH of efi file to use for aarch64 VMs.
>   --with-suffix=3DSUFFIX     suffix for QEMU data inside =
datadir/libdir/sysconfdir/docdir [$qemu_suffix]
> +  --with-branding-prefix=3DSTRING prepend string to greeting messages
>   --with-pkgversion=3DVERS   use specified string as sub-version of =
the package
>   --without-default-features default all --enable-* options to =
"disabled"
>   --without-default-devices  do not include any device that is not =
needed to
> @@ -3810,6 +3814,7 @@ if test "$skip_meson" =3D no; then
>         -Db_coverage=3D$(if test "$gcov" =3D yes; then echo true; else =
echo false; fi) \
>         -Db_lto=3D$lto -Dcfi=3D$cfi -Dtcg=3D$tcg -Dxen=3D$xen \
>         -Dcapstone=3D$capstone -Dfdt=3D$fdt -Dslirp=3D$slirp \
> +        -Dbranding_prefix=3D"$branding_prefix" \
>         $(test -n "${LIB_FUZZING_ENGINE+xxx}" && echo =
"-Dfuzzing_engine=3D$LIB_FUZZING_ENGINE") \
>         $(if test "$default_feature" =3D no; then echo =
"-Dauto_features=3Ddisabled"; fi) \
>         "$@" $cross_arg "$PWD" "$source_path"
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 16def5215d..19abd1436f 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -382,6 +382,9 @@ static void handle_arg_strace(const char *arg)
>=20
> static void handle_arg_version(const char *arg)
> {
> +#if defined(QEMU_BRANDING_PREFIX)
> +    printf("%s ", QEMU_BRANDING_PREFIX);
> +#endif
>     printf("qemu-" TARGET_NAME " version " QEMU_FULL_VERSION
>            "\n" QEMU_COPYRIGHT "\n");
>     exit(EXIT_SUCCESS);
> diff --git a/meson.build b/meson.build
> index 762d7cee85..80807a771d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1455,6 +1455,10 @@ =
config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', =
get_option('prefix') /
> config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') =
/ qemu_moddir)
> config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') =
/ get_option('sysconfdir'))
>=20
> +if get_option('branding_prefix') !=3D ''
> +  config_host_data.set_quoted('QEMU_BRANDING_PREFIX', =
get_option('branding_prefix'))
> +endif
> +
> config_host_data.set('HOST_' + host_arch.to_upper(), 1)
>=20
> config_host_data.set('CONFIG_ATTR', libattr.found())
> @@ -3320,6 +3324,7 @@ endif
> summary_info +=3D {'strip binaries':    get_option('strip')}
> summary_info +=3D {'sparse':            sparse}
> summary_info +=3D {'mingw32 support':   targetos =3D=3D 'windows'}
> +summary_info +=3D {'branding prefix':   =
get_option('branding_prefix')}
>=20
> # snarf the cross-compilation information for tests
> foreach target: target_dirs
> diff --git a/meson_options.txt b/meson_options.txt
> index 921967eddb..be044cc1e6 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -208,3 +208,6 @@ option('fdt', type: 'combo', value: 'auto',
>=20
> option('selinux', type: 'feature', value: 'auto',
>        description: 'SELinux support in qemu-nbd')
> +
> +option('branding_prefix', type: 'string', value: '',
> +       description: 'String to prepend to greeting messages')
> diff --git a/qemu-img.c b/qemu-img.c
> index 6fe2466032..c10c0066e5 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -52,8 +52,14 @@
> #include "qemu/throttle.h"
> #include "block/throttle-groups.h"
>=20
> +#if defined(QEMU_BRANDING_PREFIX)
> +#define QEMU_IMG_VERSION QEMU_BRANDING_PREFIX " qemu-img version " \
> +                         QEMU_FULL_VERSION \
> +                         "\n" QEMU_COPYRIGHT "\n"
> +#else
> #define QEMU_IMG_VERSION "qemu-img version " QEMU_FULL_VERSION \
> -                          "\n" QEMU_COPYRIGHT "\n"
> +                         "\n" QEMU_COPYRIGHT "\n"
> +#endif
>=20
> typedef struct img_cmd_t {
>     const char *name;
> @@ -235,7 +241,7 @@ static void QEMU_NORETURN help(void)
>  * an odd number of ',' (or else a separating ',' following it gets
>  * escaped), or be empty (or else a separating ',' preceding it can
>  * escape a separating ',' following it).
> - *=20
> + *
>  */
> static bool is_valid_option_list(const char *optarg)
> {
> diff --git a/qemu-io.c b/qemu-io.c
> index 3924639b92..ec880dc49e 100644
> --- a/qemu-io.c
> +++ b/qemu-io.c
> @@ -597,6 +597,9 @@ int main(int argc, char **argv)
>             trace_opt_parse(optarg);
>             break;
>         case 'V':
> +#if defined(QEMU_BRANDING_PREFIX)
> +            printf("%s ", QEMU_BRANDING_PREFIX);
> +#endif
>             printf("%s version " QEMU_FULL_VERSION "\n"
>                    QEMU_COPYRIGHT "\n", error_get_progname());
>             exit(0);
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index c6c20df68a..7b3667626c 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -157,6 +157,9 @@ QEMU_HELP_BOTTOM "\n"
>=20
> static void version(const char *name)
> {
> +#if defined(QEMU_BRANDING_PREFIX)
> +    printf("%s ", QEMU_BRANDING_PREFIX);
> +#endif
>     printf(
> "%s " QEMU_FULL_VERSION "\n"
> "Written by Anthony Liguori.\n"
> diff --git a/qga/main.c b/qga/main.c
> index 15fd3a4149..c66b87f72c 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -224,8 +224,11 @@ void reopen_fd_to_null(int fd)
>=20
> static void usage(const char *cmd)
> {
> +    printf("Usage: %s [-m <method> -p <path>] [<options>]\n");
> +#if defined(QEMU_BRANDING_PREFIX)
> +    printf("%s ", QEMU_BRANDING_PREFIX);
> +#endif
>     printf(
> -"Usage: %s [-m <method> -p <path>] [<options>]\n"
> "QEMU Guest Agent " QEMU_FULL_VERSION "\n"
> QEMU_COPYRIGHT "\n"
> "\n"
> diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
> index f281daeced..d7fcdb8216 100644
> --- a/scsi/qemu-pr-helper.c
> +++ b/scsi/qemu-pr-helper.c
> @@ -108,6 +108,9 @@ QEMU_HELP_BOTTOM "\n"
>=20
> static void version(const char *name)
> {
> +#if defined(QEMU_BRANDING_PREFIX)
> +    printf("%s ", QEMU_BRANDING_PREFIX);
> +#endif
>     printf(
> "%s " QEMU_FULL_VERSION "\n"
> "Written by Paolo Bonzini.\n"
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 5e1b35ba48..d83118d939 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -826,6 +826,9 @@ static MachineClass *find_default_machine(GSList =
*machines)
>=20
> static void version(void)
> {
> +#if defined(QEMU_BRANDING_PREFIX)
> +    printf("%s ", QEMU_BRANDING_PREFIX);
> +#endif
>     printf("QEMU emulator version " QEMU_FULL_VERSION "\n"
>            QEMU_COPYRIGHT "\n");
> }
> diff --git a/storage-daemon/qemu-storage-daemon.c =
b/storage-daemon/qemu-storage-daemon.c
> index 9d76d1114d..1a8de7c59d 100644
> --- a/storage-daemon/qemu-storage-daemon.c
> +++ b/storage-daemon/qemu-storage-daemon.c
> @@ -212,6 +212,9 @@ static void process_options(int argc, char =
*argv[])
>             trace_init_file();
>             break;
>         case 'V':
> +#if defined(QEMU_BRANDING_PREFIX)
> +            printf("%s ", QEMU_BRANDING_PREFIX);
> +#endif
>             printf("qemu-storage-daemon version "
>                    QEMU_FULL_VERSION "\n" QEMU_COPYRIGHT "\n");
>             exit(EXIT_SUCCESS);
> diff --git a/tools/virtiofsd/passthrough_ll.c =
b/tools/virtiofsd/passthrough_ll.c
> index 64b5b4fbb1..2179a502d6 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -3896,6 +3896,9 @@ static void fuse_lo_data_cleanup(struct lo_data =
*lo)
>=20
> static void qemu_version(void)
> {
> +#if defined(QEMU_BRANDING_PREFIX)
> +    printf("%s ", QEMU_BRANDING_PREFIX);
> +#endif
>     printf("virtiofsd version " QEMU_FULL_VERSION "\n" QEMU_COPYRIGHT =
"\n");
> }
>=20
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index ac18e14ce0..5a1e56ac46 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1524,8 +1524,13 @@ - (void)make_about_window
>=20
>     /* Create the version string*/
>     NSString *version_string;
> +#if defined(QEMU_BRANDING_PREFIX)
> +    version_string =3D [[NSString alloc] initWithFormat:
> +    @"%s QEMU emulator version %s", QEMU_BRANDING_PREFIX, =
QEMU_FULL_VERSION];
> +#else
>     version_string =3D [[NSString alloc] initWithFormat:
>     @"QEMU emulator version %s", QEMU_FULL_VERSION];
> +#endif
>     [version_label setStringValue: version_string];
>     [superView addSubview: version_label];
>=20
> --=20
> 2.32.0 (Apple Git-132)
>=20


