Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899D063CF74
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 08:00:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0H52-00052z-Rv; Wed, 30 Nov 2022 02:00:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p0H50-0004zd-6S
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 02:00:26 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p0H4y-0001p5-1K
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 02:00:25 -0500
Received: by mail-lj1-x22b.google.com with SMTP id r8so19845423ljn.8
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 23:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cO4NHxf5OH1yN7v1jpTtVcQeX6N1hvw3naQANjul9UE=;
 b=aW7Pl5tVrKsdCz+e7BCazTqPoTNnV7Qk7Q0eQLnVp/j1c5sdG++BhUGxa1oDU9D8Rv
 XmyU8VYkJ87Jbeg50uS3cEPZ3KFwwnhQRk+r1aw2uv3zu4PGhFd5X76HcC0L4QX3s45R
 LAZ2TmfU/C9yqzghKQlC/AWpnYXDNxhDb0hNJE/XZaC+0B0sjfoa1ki0fmkA9/v3OXVq
 73ObDix6Qxl8gUiloTz6WF3EnQduaJhWnkozj7HQqvEgKbPYPnwzc0wFd/LAtlGaDfRC
 rcqWYtt4pXFpW++GN+2mt72v7JKnUshkMG2l+V+sJxfZAxQ9CHa6QMQyDq+6RwMccHHa
 WiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cO4NHxf5OH1yN7v1jpTtVcQeX6N1hvw3naQANjul9UE=;
 b=2Xdu7KU78DVG5HQfCu6EXG1ACdLlcOw7b9/HPZNcsGAynncAoPvAyxtfyMkC2b3LN0
 3ucwWGHQoc7F6TYzEyxCK3QDQcUMKCTpK7skutXnfYWFMyOF4BKo4+4jq1CkwuCdcAbX
 SHu+2fnkYTVeV7Hykmn9eiwasUdMfn7jnxbCeNzNqydeLvo1qCNaBJujsNZmQ6KQ5OEx
 ndPDqQlfN1P2TNMooLTCvu0HMD5pFZW53JqCN5llkaE1GlpH4cLLSEeWSLNpGtiu46rv
 JkPVOMza28z7yR6jCMlkG3qe6yLvkgD5h1sADgK5ehe/c0qXpD6EU2tJj/xiK3gnaMr8
 CRFg==
X-Gm-Message-State: ANoB5pkpKuCN4YuJgHgOj2UG4cJS6qIuCINmtW8taqtYFlfKxYK+EKs1
 XGs1Gh2lY+k0yUxBrBUrHmjez3Sw7vTZ7FX2L5A=
X-Google-Smtp-Source: AA0mqf4SHmFdpn81xnQK8loZYnjUPig2lHiLSQF28FdYZF5CGqTsfkt6CO+cRWFs96E0Q2KLbboSQtZRGlSafkO6O70=
X-Received: by 2002:a2e:9d90:0:b0:279:83e4:b9b2 with SMTP id
 c16-20020a2e9d90000000b0027983e4b9b2mr9958455ljj.452.1669791621537; Tue, 29
 Nov 2022 23:00:21 -0800 (PST)
MIME-Version: 1.0
References: <20221129173809.544174-1-andrey.drobyshev@virtuozzo.com>
 <20221129173809.544174-2-andrey.drobyshev@virtuozzo.com>
In-Reply-To: <20221129173809.544174-2-andrey.drobyshev@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 30 Nov 2022 11:00:09 +0400
Message-ID: <CAJ+F1CJEtJPYDqYgPwt5MFKe4JUOivXRwcXOk8qQ4uTGY3c3ZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] qga-win: add logging to Windows event log
To: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, yur@openvz.org, 
 mike.maslenkin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Tue, Nov 29, 2022 at 9:37 PM Andrey Drobyshev
<andrey.drobyshev@virtuozzo.com> wrote:
>
> This commit allows QGA to write to Windows event log using Win32 API's
> ReportEvent() [1], much like syslog() under *nix guests.
>
> In order to generate log message definitions we use a very basic message
> text file [2], so that every QGA's message gets ID 1.  The tools
> "windmc" and "windres" respectively are used to generate ".rc" file and
> COFF object file, and then the COFF file is linked into qemu-ga.exe.
>
> [1] https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbas=
e-reporteventa
> [2] https://learn.microsoft.com/en-us/windows/win32/eventlog/message-text=
-files
>
> Originally-by: Yuri Pudgorodskiy <yur@virtuozzo.com>
> Signed-off-by: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  configure                 |  3 +++
>  qga/installer/qemu-ga.wxs |  5 +++++
>  qga/main.c                | 16 +++++++++++++---
>  qga/meson.build           | 19 ++++++++++++++++++-
>  qga/messages-win32.mc     |  9 +++++++++
>  5 files changed, 48 insertions(+), 4 deletions(-)
>  create mode 100644 qga/messages-win32.mc
>
> diff --git a/configure b/configure
> index 26c7bc5154..789a4f6cc9 100755
> --- a/configure
> +++ b/configure
> @@ -372,6 +372,7 @@ smbd=3D"$SMBD"
>  strip=3D"${STRIP-${cross_prefix}strip}"
>  widl=3D"${WIDL-${cross_prefix}widl}"
>  windres=3D"${WINDRES-${cross_prefix}windres}"
> +windmc=3D"${WINDMC-${cross_prefix}windmc}"
>  pkg_config_exe=3D"${PKG_CONFIG-${cross_prefix}pkg-config}"
>  query_pkg_config() {
>      "${pkg_config_exe}" ${QEMU_PKG_CONFIG_FLAGS} "$@"
> @@ -2561,6 +2562,7 @@ if test "$skip_meson" =3D no; then
>    echo "strip =3D [$(meson_quote $strip)]" >> $cross
>    echo "widl =3D [$(meson_quote $widl)]" >> $cross
>    echo "windres =3D [$(meson_quote $windres)]" >> $cross
> +  echo "windmc =3D [$(meson_quote $windmc)]" >> $cross
>    if test "$cross_compile" =3D "yes"; then
>      cross_arg=3D"--cross-file config-meson.cross"
>      echo "[host_machine]" >> $cross
> @@ -2667,6 +2669,7 @@ preserve_env SMBD
>  preserve_env STRIP
>  preserve_env WIDL
>  preserve_env WINDRES
> +preserve_env WINDMC
>
>  printf "exec" >>config.status
>  for i in "$0" "$@"; do
> diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
> index 73ce2c4965..d9567836f3 100644
> --- a/qga/installer/qemu-ga.wxs
> +++ b/qga/installer/qemu-ga.wxs
> @@ -110,6 +110,11 @@
>                <RegistryValue Type=3D"string" Name=3D"ProductID" Value=3D=
"fb0a0d66-c7fb-4e2e-a16b-c4a3bfe8d13b" />
>                <RegistryValue Type=3D"string" Name=3D"Version" Value=3D"$=
(var.QEMU_GA_VERSION)" />
>              </RegistryKey>
> +            <RegistryKey Root=3D"HKLM"
> +                         Key=3D"System\CurrentControlSet\Services\EventL=
og\Application\qemu-ga">
> +              <RegistryValue Type=3D"integer" Name=3D"TypesSupported" Va=
lue=3D"7" />
> +              <RegistryValue Type=3D"string" Name=3D"EventMessageFile" V=
alue=3D"[qemu_ga_directory]qemu-ga.exe" />
> +            </RegistryKey>
>            </Component>
>          </Directory>
>        </Directory>
> diff --git a/qga/main.c b/qga/main.c
> index b3580508fa..e9f4f44cbb 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -83,6 +83,7 @@ struct GAState {
>  #ifdef _WIN32
>      GAService service;
>      HANDLE wakeup_event;
> +    HANDLE event_log;
>  #endif
>      bool delimit_response;
>      bool frozen;
> @@ -324,13 +325,14 @@ static void ga_log(const gchar *domain, GLogLevelFl=
ags level,
>      }
>
>      level &=3D G_LOG_LEVEL_MASK;
> -#ifndef _WIN32
>      if (g_strcmp0(domain, "syslog") =3D=3D 0) {
> +#ifndef _WIN32
>          syslog(LOG_INFO, "%s: %s", level_str, msg);
> -    } else if (level & s->log_level) {
>  #else
> -    if (level & s->log_level) {
> +        ReportEvent(s->event_log, EVENTLOG_INFORMATION_TYPE,
> +                    0, 1, NULL, 1, 0, &msg, NULL);
>  #endif
> +    } else if (level & s->log_level) {
>          g_autoptr(GDateTime) now =3D g_date_time_new_now_utc();
>          g_autofree char *nowstr =3D g_date_time_format(now, "%s.%f");
>          fprintf(s->log_file, "%s: %s: %s\n", nowstr, level_str, msg);
> @@ -1286,6 +1288,13 @@ static GAState *initialize_agent(GAConfig *config,=
 int socket_activation)
>      g_debug("Guest agent version %s started", QEMU_FULL_VERSION);
>
>  #ifdef _WIN32
> +    s->event_log =3D RegisterEventSource(NULL, "qemu-ga");
> +    if (!s->event_log) {
> +        g_autofree gchar *errmsg =3D g_win32_error_message(GetLastError(=
));
> +        g_critical("unable to register event source: %s", errmsg);
> +        return NULL;
> +    }
> +
>      /* On win32 the state directory is application specific (be it the d=
efault
>       * or a user override). We got past the command line parsing; let's =
create
>       * the directory (with any intermediate directories). If we run into=
 an
> @@ -1377,6 +1386,7 @@ static void cleanup_agent(GAState *s)
>  {
>  #ifdef _WIN32
>      CloseHandle(s->wakeup_event);
> +    CloseHandle(s->event_log);
>  #endif
>      if (s->command_state) {
>          ga_command_state_cleanup_all(s->command_state);
> diff --git a/qga/meson.build b/qga/meson.build
> index 3cfb9166e5..1ff159edc1 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -98,7 +98,24 @@ if targetos =3D=3D 'windows'
>    endif
>  endif
>
> -qga =3D executable('qemu-ga', qga_ss.sources(),
> +qga_objs =3D []
> +if targetos =3D=3D 'windows'
> +  windmc =3D find_program('windmc', required: true)
> +  windres =3D find_program('windres', required: true)
> +
> +  msgrc =3D custom_target('messages-win32.rc',
> +                        input: 'messages-win32.mc',
> +                        output: ['messages-win32.rc', 'MSG00409.bin', 'm=
essages-win32.h'],
> +                        command: [windmc, '-h', '@OUTDIR@', '-r', '@OUTD=
IR@', '@INPUT@'])
> +  msgobj =3D custom_target('messages-win32.o',
> +                         input: msgrc[0],
> +                         output: 'messages-win32.o',
> +                         command: [windres, '-I', '@OUTDIR@', '-o', '@OU=
TPUT@', '@INPUT@'])
> +
> +  qga_objs =3D [msgobj]
> +endif
> +
> +qga =3D executable('qemu-ga', qga_ss.sources() + qga_objs,
>                   link_args: qga_libs,
>                   dependencies: [qemuutil, libudev],
>                   install: true)
> diff --git a/qga/messages-win32.mc b/qga/messages-win32.mc
> new file mode 100644
> index 0000000000..e21019cebe
> --- /dev/null
> +++ b/qga/messages-win32.mc
> @@ -0,0 +1,9 @@
> +LanguageNames=3D(
> +    English=3D0x409:MSG00409
> +)
> +
> +MessageId=3D1
> +SymbolicName=3DQEMU_GA_EVENTLOG_GENERAL
> +Language=3DEnglish
> +%1
> +.
> --
> 2.38.1
>


--=20
Marc-Andr=C3=A9 Lureau

