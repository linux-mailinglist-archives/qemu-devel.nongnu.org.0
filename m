Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013464AE279
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 21:06:42 +0100 (CET)
Received: from localhost ([::1]:51084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHWl7-0006LI-TT
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 15:06:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHWcz-0007Sh-J5
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 14:58:17 -0500
Received: from [2a00:1450:4864:20::330] (port=34740
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHWcw-0004Kg-W7
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 14:58:17 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so1341719wmb.1
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 11:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zfOWvkTibsbMoY6MviwswaTll/LS+O+nX3mbDBp2uLg=;
 b=NrMDqXkS/fSyD32/KgAQitqc5MIWZ6mp9xi/KtIEFceWVUitFtaHx/+LBCLj5Oa9Qo
 PQ6JGkpPKlJugHQ3mHi/FxSEmVgjn+ToOqKQsOBvCNIDsYt7tM6JALl+nc9tufUhp0PF
 WTtz9Kr2qDdE85IfC4lr4NDpVVPB32uC0hkSAjilwNw7Ya1yHxka1hF0SDgv+PZVGNPP
 w4H2uuKBbg/QdRR5tsHf0RUWFK5ZvWD/xa460PklZL58+o8cYQv7RfcmNmHCRETLbwV2
 xnfb0IXZqRR8Rv3MKBsVjkibu4DU5wK+lsvpF65uCLcfPlWFRlGShIr7wzrkN1VQYmnz
 zcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zfOWvkTibsbMoY6MviwswaTll/LS+O+nX3mbDBp2uLg=;
 b=yVEq5rTeQiR56ZO2+fOCSPMmGNHFm5lhWJ62Zr+ukBfTgSJSpjfroGfXeesdGZLrz4
 lxCoirKKb3yaiKYWbsMTzOG+Z+mnG9cHP3/wchrrlmkIyj3e3uGLoCtBCfjq+9fuuHBf
 mtMOuCNwWURlYlIaGGtvxyZX8nVhI1TjjEBKyylQ6XnzcBO81zrrZlqmqYrx8YoxGCR2
 /OTetVkrfl7AXC3aDBbTORC4iAnWcR0VdYL9p68hVfP63SvbFjoFkHaiBdlgPShqKgD0
 WFtpVpfEVxjkpURP1VpNwyjZRtp4gv3o6hyLMhtQW8xXB1c4bck9++jxOk0FYEHNEoxt
 +ihQ==
X-Gm-Message-State: AOAM533HaJN6GaC1x1hWHY6G29rb4f9vi0Ahn1vqu7QhAVzHkapTY8K0
 5nw9T4z4FAo0fqCHSXY/pI+wblAOH6SYVU3pobjTdw==
X-Google-Smtp-Source: ABdhPJxU1bjU3Neo71i95RSLXR1YuxA0jRFnFSQWGBjOhO+Q5ek8ODwF2gsWZcjvyUH6h64uVYG8R1JqCpqCfshj8yA=
X-Received: by 2002:a1c:544d:: with SMTP id p13mr2429384wmi.37.1644350293287; 
 Tue, 08 Feb 2022 11:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20220120113545.55820-1-ilg@livius.net>
 <8A1E1B8F-ADA0-4966-A4E9-C0A08EB0A327@livius.net>
 <D6833D18-344A-473E-AC4D-89A64F8AA0EC@livius.net>
In-Reply-To: <D6833D18-344A-473E-AC4D-89A64F8AA0EC@livius.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 19:58:02 +0000
Message-ID: <CAFEAcA91q2t9sVvaW6h3BwFMExgyCdVsb3TozH52EM70aPJt4w@mail.gmail.com>
Subject: Re: [PATCH] Add --with-branding-prefix and QEMU_BRANDING_PREFIX
To: Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 19:34, Liviu Ionescu <ilg@livius.net> wrote:
>
> The 4th attempt...
>
> Not that this would be a significant patch, but I would like to proceed with other improvements.

I've cc'd some people who might have an opinion on whether this
something we want to add upstream. (Patch/thread below for context.)

On the actual implementation, if you make the #define expand
out to either the empty string "" if the user specified no prefix
or "user-specified-prefix " with a trailing space if they did,
then you can avoid a lot of the need for ifdefs in the rest of
the patch. Or maybe we could have a QEMU_PROG_NAME(S) macro
that expands to S if no prefix specified or "prefix S" if there
is one. But don't respin the patch until we've decided if we
like the concept.

thanks
-- PMM

>
> > On 27 Jan 2022, at 14:23, Liviu Ionescu <ilg@livius.net> wrote:
> >
> > Any chance for someone to take a look at this proposal?
> >
> > Thank you,
> >
> > Liviu
> >
> >
> >> On 20 Jan 2022, at 13:35, Liviu Ionescu <ilg@livius.net> wrote:
> >>
> >> It is usual for various distributions to identify themselves by
> >> prepending a string to the greeting message, for example
> >> 'xPack QEMU emulator version 6.2.0 (v6.2.0-2-xpack-arm)'.
> >>
> >> To achieve this, a new configuration option (--with-branding-prefix=)
> >> was added, which, if not empty, adds a string preprocessor macro
> >> (QEMU_BRANDING_PREFIX) to 'config-host.h'.
> >>
> >> If this macro is defined, in QEMU and various tools, the string
> >> is displayed before the existing greeting messages.
> >> ---
> >> bsd-user/main.c                      |  3 +++
> >> configure                            |  5 +++++
> >> linux-user/main.c                    |  3 +++
> >> meson.build                          |  5 +++++
> >> meson_options.txt                    |  3 +++
> >> qemu-img.c                           | 10 ++++++++--
> >> qemu-io.c                            |  3 +++
> >> qemu-nbd.c                           |  3 +++
> >> qga/main.c                           |  5 ++++-
> >> scsi/qemu-pr-helper.c                |  3 +++
> >> softmmu/vl.c                         |  3 +++
> >> storage-daemon/qemu-storage-daemon.c |  3 +++
> >> tools/virtiofsd/passthrough_ll.c     |  3 +++
> >> ui/cocoa.m                           |  5 +++++
> >> 14 files changed, 54 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/bsd-user/main.c b/bsd-user/main.c
> >> index cb5ea40236..a4eab8feef 100644
> >> --- a/bsd-user/main.c
> >> +++ b/bsd-user/main.c
> >> @@ -149,6 +149,9 @@ void cpu_loop(CPUArchState *env)
> >>
> >> static void usage(void)
> >> {
> >> +#if defined(QEMU_BRANDING_PREFIX)
> >> +    printf("%s ", QEMU_BRANDING_PREFIX);
> >> +#endif
> >>    printf("qemu-" TARGET_NAME " version " QEMU_FULL_VERSION
> >>           "\n" QEMU_COPYRIGHT "\n"
> >>           "usage: qemu-" TARGET_NAME " [options] program [arguments...]\n"
> >> diff --git a/configure b/configure
> >> index e1a31fb332..579a8cf55d 100755
> >> --- a/configure
> >> +++ b/configure
> >> @@ -356,6 +356,7 @@ ninja=""
> >> gio="$default_feature"
> >> skip_meson=no
> >> slirp_smbd="$default_feature"
> >> +branding_prefix=""
> >>
> >> # The following Meson options are handled manually (still they
> >> # are included in the automatically generated help message)
> >> @@ -1179,6 +1180,8 @@ for opt do
> >>  # everything else has the same name in configure and meson
> >>  --enable-* | --disable-*) meson_option_parse "$opt" "$optarg"
> >>  ;;
> >> +  --with-branding-prefix=*) branding_prefix="$optarg"
> >> +  ;;
> >>  *)
> >>      echo "ERROR: unknown option $opt"
> >>      echo "Try '$0 --help' for more information"
> >> @@ -1352,6 +1355,7 @@ Advanced options (experts only):
> >>  --firmwarepath=PATH      search PATH for firmware files
> >>  --efi-aarch64=PATH       PATH of efi file to use for aarch64 VMs.
> >>  --with-suffix=SUFFIX     suffix for QEMU data inside datadir/libdir/sysconfdir/docdir [$qemu_suffix]
> >> +  --with-branding-prefix=STRING prepend string to greeting messages
> >>  --with-pkgversion=VERS   use specified string as sub-version of the package
> >>  --without-default-features default all --enable-* options to "disabled"
> >>  --without-default-devices  do not include any device that is not needed to
> >> @@ -3810,6 +3814,7 @@ if test "$skip_meson" = no; then
> >>        -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
> >>        -Db_lto=$lto -Dcfi=$cfi -Dtcg=$tcg -Dxen=$xen \
> >>        -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp \
> >> +        -Dbranding_prefix="$branding_prefix" \
> >>        $(test -n "${LIB_FUZZING_ENGINE+xxx}" && echo "-Dfuzzing_engine=$LIB_FUZZING_ENGINE") \
> >>        $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
> >>        "$@" $cross_arg "$PWD" "$source_path"
> >> diff --git a/linux-user/main.c b/linux-user/main.c
> >> index 16def5215d..19abd1436f 100644
> >> --- a/linux-user/main.c
> >> +++ b/linux-user/main.c
> >> @@ -382,6 +382,9 @@ static void handle_arg_strace(const char *arg)
> >>
> >> static void handle_arg_version(const char *arg)
> >> {
> >> +#if defined(QEMU_BRANDING_PREFIX)
> >> +    printf("%s ", QEMU_BRANDING_PREFIX);
> >> +#endif
> >>    printf("qemu-" TARGET_NAME " version " QEMU_FULL_VERSION
> >>           "\n" QEMU_COPYRIGHT "\n");
> >>    exit(EXIT_SUCCESS);
> >> diff --git a/meson.build b/meson.build
> >> index 762d7cee85..80807a771d 100644
> >> --- a/meson.build
> >> +++ b/meson.build
> >> @@ -1455,6 +1455,10 @@ config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('prefix') /
> >> config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') / qemu_moddir)
> >> config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') / get_option('sysconfdir'))
> >>
> >> +if get_option('branding_prefix') != ''
> >> +  config_host_data.set_quoted('QEMU_BRANDING_PREFIX', get_option('branding_prefix'))
> >> +endif
> >> +
> >> config_host_data.set('HOST_' + host_arch.to_upper(), 1)
> >>
> >> config_host_data.set('CONFIG_ATTR', libattr.found())
> >> @@ -3320,6 +3324,7 @@ endif
> >> summary_info += {'strip binaries':    get_option('strip')}
> >> summary_info += {'sparse':            sparse}
> >> summary_info += {'mingw32 support':   targetos == 'windows'}
> >> +summary_info += {'branding prefix':   get_option('branding_prefix')}
> >>
> >> # snarf the cross-compilation information for tests
> >> foreach target: target_dirs
> >> diff --git a/meson_options.txt b/meson_options.txt
> >> index 921967eddb..be044cc1e6 100644
> >> --- a/meson_options.txt
> >> +++ b/meson_options.txt
> >> @@ -208,3 +208,6 @@ option('fdt', type: 'combo', value: 'auto',
> >>
> >> option('selinux', type: 'feature', value: 'auto',
> >>       description: 'SELinux support in qemu-nbd')
> >> +
> >> +option('branding_prefix', type: 'string', value: '',
> >> +       description: 'String to prepend to greeting messages')
> >> diff --git a/qemu-img.c b/qemu-img.c
> >> index 6fe2466032..c10c0066e5 100644
> >> --- a/qemu-img.c
> >> +++ b/qemu-img.c
> >> @@ -52,8 +52,14 @@
> >> #include "qemu/throttle.h"
> >> #include "block/throttle-groups.h"
> >>
> >> +#if defined(QEMU_BRANDING_PREFIX)
> >> +#define QEMU_IMG_VERSION QEMU_BRANDING_PREFIX " qemu-img version " \
> >> +                         QEMU_FULL_VERSION \
> >> +                         "\n" QEMU_COPYRIGHT "\n"
> >> +#else
> >> #define QEMU_IMG_VERSION "qemu-img version " QEMU_FULL_VERSION \
> >> -                          "\n" QEMU_COPYRIGHT "\n"
> >> +                         "\n" QEMU_COPYRIGHT "\n"
> >> +#endif
> >>
> >> typedef struct img_cmd_t {
> >>    const char *name;
> >> @@ -235,7 +241,7 @@ static void QEMU_NORETURN help(void)
> >> * an odd number of ',' (or else a separating ',' following it gets
> >> * escaped), or be empty (or else a separating ',' preceding it can
> >> * escape a separating ',' following it).
> >> - *
> >> + *
> >> */
> >> static bool is_valid_option_list(const char *optarg)
> >> {
> >> diff --git a/qemu-io.c b/qemu-io.c
> >> index 3924639b92..ec880dc49e 100644
> >> --- a/qemu-io.c
> >> +++ b/qemu-io.c
> >> @@ -597,6 +597,9 @@ int main(int argc, char **argv)
> >>            trace_opt_parse(optarg);
> >>            break;
> >>        case 'V':
> >> +#if defined(QEMU_BRANDING_PREFIX)
> >> +            printf("%s ", QEMU_BRANDING_PREFIX);
> >> +#endif
> >>            printf("%s version " QEMU_FULL_VERSION "\n"
> >>                   QEMU_COPYRIGHT "\n", error_get_progname());
> >>            exit(0);
> >> diff --git a/qemu-nbd.c b/qemu-nbd.c
> >> index c6c20df68a..7b3667626c 100644
> >> --- a/qemu-nbd.c
> >> +++ b/qemu-nbd.c
> >> @@ -157,6 +157,9 @@ QEMU_HELP_BOTTOM "\n"
> >>
> >> static void version(const char *name)
> >> {
> >> +#if defined(QEMU_BRANDING_PREFIX)
> >> +    printf("%s ", QEMU_BRANDING_PREFIX);
> >> +#endif
> >>    printf(
> >> "%s " QEMU_FULL_VERSION "\n"
> >> "Written by Anthony Liguori.\n"
> >> diff --git a/qga/main.c b/qga/main.c
> >> index 15fd3a4149..c66b87f72c 100644
> >> --- a/qga/main.c
> >> +++ b/qga/main.c
> >> @@ -224,8 +224,11 @@ void reopen_fd_to_null(int fd)
> >>
> >> static void usage(const char *cmd)
> >> {
> >> +    printf("Usage: %s [-m <method> -p <path>] [<options>]\n");
> >> +#if defined(QEMU_BRANDING_PREFIX)
> >> +    printf("%s ", QEMU_BRANDING_PREFIX);
> >> +#endif
> >>    printf(
> >> -"Usage: %s [-m <method> -p <path>] [<options>]\n"
> >> "QEMU Guest Agent " QEMU_FULL_VERSION "\n"
> >> QEMU_COPYRIGHT "\n"
> >> "\n"
> >> diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
> >> index f281daeced..d7fcdb8216 100644
> >> --- a/scsi/qemu-pr-helper.c
> >> +++ b/scsi/qemu-pr-helper.c
> >> @@ -108,6 +108,9 @@ QEMU_HELP_BOTTOM "\n"
> >>
> >> static void version(const char *name)
> >> {
> >> +#if defined(QEMU_BRANDING_PREFIX)
> >> +    printf("%s ", QEMU_BRANDING_PREFIX);
> >> +#endif
> >>    printf(
> >> "%s " QEMU_FULL_VERSION "\n"
> >> "Written by Paolo Bonzini.\n"
> >> diff --git a/softmmu/vl.c b/softmmu/vl.c
> >> index 5e1b35ba48..d83118d939 100644
> >> --- a/softmmu/vl.c
> >> +++ b/softmmu/vl.c
> >> @@ -826,6 +826,9 @@ static MachineClass *find_default_machine(GSList *machines)
> >>
> >> static void version(void)
> >> {
> >> +#if defined(QEMU_BRANDING_PREFIX)
> >> +    printf("%s ", QEMU_BRANDING_PREFIX);
> >> +#endif
> >>    printf("QEMU emulator version " QEMU_FULL_VERSION "\n"
> >>           QEMU_COPYRIGHT "\n");
> >> }
> >> diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
> >> index 9d76d1114d..1a8de7c59d 100644
> >> --- a/storage-daemon/qemu-storage-daemon.c
> >> +++ b/storage-daemon/qemu-storage-daemon.c
> >> @@ -212,6 +212,9 @@ static void process_options(int argc, char *argv[])
> >>            trace_init_file();
> >>            break;
> >>        case 'V':
> >> +#if defined(QEMU_BRANDING_PREFIX)
> >> +            printf("%s ", QEMU_BRANDING_PREFIX);
> >> +#endif
> >>            printf("qemu-storage-daemon version "
> >>                   QEMU_FULL_VERSION "\n" QEMU_COPYRIGHT "\n");
> >>            exit(EXIT_SUCCESS);
> >> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> >> index 64b5b4fbb1..2179a502d6 100644
> >> --- a/tools/virtiofsd/passthrough_ll.c
> >> +++ b/tools/virtiofsd/passthrough_ll.c
> >> @@ -3896,6 +3896,9 @@ static void fuse_lo_data_cleanup(struct lo_data *lo)
> >>
> >> static void qemu_version(void)
> >> {
> >> +#if defined(QEMU_BRANDING_PREFIX)
> >> +    printf("%s ", QEMU_BRANDING_PREFIX);
> >> +#endif
> >>    printf("virtiofsd version " QEMU_FULL_VERSION "\n" QEMU_COPYRIGHT "\n");
> >> }
> >>
> >> diff --git a/ui/cocoa.m b/ui/cocoa.m
> >> index ac18e14ce0..5a1e56ac46 100644
> >> --- a/ui/cocoa.m
> >> +++ b/ui/cocoa.m
> >> @@ -1524,8 +1524,13 @@ - (void)make_about_window
> >>
> >>    /* Create the version string*/
> >>    NSString *version_string;
> >> +#if defined(QEMU_BRANDING_PREFIX)
> >> +    version_string = [[NSString alloc] initWithFormat:
> >> +    @"%s QEMU emulator version %s", QEMU_BRANDING_PREFIX, QEMU_FULL_VERSION];
> >> +#else
> >>    version_string = [[NSString alloc] initWithFormat:
> >>    @"QEMU emulator version %s", QEMU_FULL_VERSION];
> >> +#endif
> >>    [version_label setStringValue: version_string];
> >>    [superView addSubview: version_label];
> >>
> >> --
> >> 2.32.0 (Apple Git-132)
> >>
> >
>

