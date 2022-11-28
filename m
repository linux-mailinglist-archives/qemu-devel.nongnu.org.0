Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A72D863B4E1
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 23:38:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozmkH-0005ex-OX; Mon, 28 Nov 2022 17:37:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1ozmkF-0005eX-1f
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 17:36:59 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1ozmkC-0007jc-Qs
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 17:36:58 -0500
Received: by mail-lj1-x22a.google.com with SMTP id y5so6114952lji.0
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 14:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRxs1oZKOXy2sEyNvjxJOFAT3d8JT6UHUDp67I6CVKg=;
 b=SyjbuJkhAiobUozfOe6n8QSNfgidHkcGJ1UuNjizYJ96mUU02XGCHJeXAmzMmkaReT
 qky5CmJIoJ93iOrTILuNcRyR6bjWllMjhb7Nb9wAFSupeUnchDX8lYKonb9Q7vyqoyHT
 izpYqpkNljGn/x+bg+/Rl1joy5Id2fdt0MzHDWHDoazs5XbxM8V5ypb/B7QItbuNYpcm
 KZ/qBMpDoo2LzyfQYN23eTXpWDYHoI5IgEsJuH8TgDcuGQIXoInkcoT7cMmFlAI6V3NT
 hcyn1JX5cIucm5/MAj4zZs+A5H5lyByOskPPq3KCKvYV5VIswmj7nIt/ORSjYRyuSpOJ
 tIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NRxs1oZKOXy2sEyNvjxJOFAT3d8JT6UHUDp67I6CVKg=;
 b=AiSYxyWixWo6stoGJ/Irip4Uh8/mQ3FgA11YeTEVP0eWyVRSMlTa4N93QxmgRjP7QP
 DI65VYZUivwgdFI6biXXoMPL/Xhkl1w2WOw5yTOQLa6n/DSn5lbfAuyqNv1oxY7YZkeJ
 /v8O26myniiit+ToTBVLO8D+lsi4L10gimTG6tgw7BbMBCA+ZBL11D1tmGAcYmIl8nme
 j+Z2NnaPiW4w2T2yE5lhKVeyxUktqlcd0xh+WIhLpDyqIBailNwABBrm9rIFM6A4HxB/
 BfhIydvik5/MPuq383jyEPEMFSfWxmpWd3kmgo0xDu1szEpR5FicgyfJyOI/1CGZf5uz
 WAtA==
X-Gm-Message-State: ANoB5pkFUmfh/WnkngKXMzOpMJ0oEWcO+hfTWug6fsdoIU2wU/I633pi
 lVR1MFaOyLoYZmrCmg3fIbw=
X-Google-Smtp-Source: AA0mqf5pQ85WP6sNv+WDNskgy7o4ERa3VoCnjJqc398JZFRZljZCJmKs739YGQ4Kd/65UpUj78lI+w==
X-Received: by 2002:a2e:9c4e:0:b0:26e:2bda:1821 with SMTP id
 t14-20020a2e9c4e000000b0026e2bda1821mr11865082ljj.241.1669675013699; 
 Mon, 28 Nov 2022 14:36:53 -0800 (PST)
Received: from smtpclient.apple ([82.148.6.12])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a0565123d9400b0049487818dd9sm1898227lfv.60.2022.11.28.14.36.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Nov 2022 14:36:53 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [PATCH 1/2] qga-win: add logging to Windows event log
From: M M <mike.maslenkin@gmail.com>
In-Reply-To: <20221128185403.447817-2-andrey.drobyshev@virtuozzo.com>
Date: Tue, 29 Nov 2022 01:36:49 +0300
Cc: qemu-devel@nongnu.org,
 den@virtuozzo.com,
 yur@openvz.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D3E30AAB-37BD-4EDA-B1A9-D3F0F349F878@gmail.com>
References: <20221128185403.447817-1-andrey.drobyshev@virtuozzo.com>
 <20221128185403.447817-2-andrey.drobyshev@virtuozzo.com>
To: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
X-Mailer: Apple Mail (2.3696.100.31)
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=mike.maslenkin@gmail.com; helo=mail-lj1-x22a.google.com
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



> On 28. 11. 2022., at 21:54, Andrey Drobyshev via =
<qemu-devel@nongnu.org> wrote:
>=20
> This commit allows QGA to write to Windows event log using Win32 API's
> ReportEvent() [1], much like syslog() under *nix guests.
>=20
> In order to generate log message definitions we use a very basic =
message
> text file [2], so that every QGA's message gets ID 1.  The tools
> "windmc" and "windres" respectively are used to generate ".rc" file =
and
> COFF object file, and then the COFF file is linked into qemu-ga.exe.
>=20
> [1] =
https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-rep=
orteventa
> [2] =
https://learn.microsoft.com/en-us/windows/win32/eventlog/message-text-file=
s
>=20
> Originally-by: Yuri Pudgorodskiy <yur@virtuozzo.com>
> Signed-off-by: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
> ---
> configure                 |  3 +++
> qga/installer/qemu-ga.wxs |  5 +++++
> qga/main.c                | 15 ++++++++++++---
> qga/meson.build           | 19 ++++++++++++++++++-
> qga/messages-win32.mc     |  9 +++++++++
> 5 files changed, 47 insertions(+), 4 deletions(-)
> create mode 100644 qga/messages-win32.mc
>=20
> diff --git a/configure b/configure
> index 26c7bc5154..789a4f6cc9 100755
> --- a/configure
> +++ b/configure
> @@ -372,6 +372,7 @@ smbd=3D"$SMBD"
> strip=3D"${STRIP-${cross_prefix}strip}"
> widl=3D"${WIDL-${cross_prefix}widl}"
> windres=3D"${WINDRES-${cross_prefix}windres}"
> +windmc=3D"${WINDMC-${cross_prefix}windmc}"
> pkg_config_exe=3D"${PKG_CONFIG-${cross_prefix}pkg-config}"
> query_pkg_config() {
>     "${pkg_config_exe}" ${QEMU_PKG_CONFIG_FLAGS} "$@"
> @@ -2561,6 +2562,7 @@ if test "$skip_meson" =3D no; then
>   echo "strip =3D [$(meson_quote $strip)]" >> $cross
>   echo "widl =3D [$(meson_quote $widl)]" >> $cross
>   echo "windres =3D [$(meson_quote $windres)]" >> $cross
> +  echo "windmc =3D [$(meson_quote $windmc)]" >> $cross
>   if test "$cross_compile" =3D "yes"; then
>     cross_arg=3D"--cross-file config-meson.cross"
>     echo "[host_machine]" >> $cross
> @@ -2667,6 +2669,7 @@ preserve_env SMBD
> preserve_env STRIP
> preserve_env WIDL
> preserve_env WINDRES
> +preserve_env WINDMC
>=20
> printf "exec" >>config.status
> for i in "$0" "$@"; do
> diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
> index 73ce2c4965..d9567836f3 100644
> --- a/qga/installer/qemu-ga.wxs
> +++ b/qga/installer/qemu-ga.wxs
> @@ -110,6 +110,11 @@
>               <RegistryValue Type=3D"string" Name=3D"ProductID" =
Value=3D"fb0a0d66-c7fb-4e2e-a16b-c4a3bfe8d13b" />
>               <RegistryValue Type=3D"string" Name=3D"Version" =
Value=3D"$(var.QEMU_GA_VERSION)" />
>             </RegistryKey>
> +            <RegistryKey Root=3D"HKLM"
> +                         =
Key=3D"System\CurrentControlSet\Services\EventLog\Application\qemu-ga">
> +              <RegistryValue Type=3D"integer" Name=3D"TypesSupported" =
Value=3D"7" />
> +              <RegistryValue Type=3D"string" Name=3D"EventMessageFile" =
Value=3D"[qemu_ga_directory]qemu-ga.exe" />
> +            </RegistryKey>
>           </Component>
>         </Directory>
>       </Directory>
> diff --git a/qga/main.c b/qga/main.c
> index b3580508fa..10314dfe5d 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -82,6 +82,7 @@ struct GAState {
>     bool logging_enabled;
> #ifdef _WIN32
>     GAService service;
> +    HANDLE event_log;
Just for the sake of uniformity
shouldn't we close this handle at cleanup_agent() similar to =
wakeup_event ?

>     HANDLE wakeup_event;
> #endif
>     bool delimit_response;
> @@ -324,13 +325,14 @@ static void ga_log(const gchar *domain, =
GLogLevelFlags level,
>     }
>=20
>     level &=3D G_LOG_LEVEL_MASK;
> -#ifndef _WIN32
>     if (g_strcmp0(domain, "syslog") =3D=3D 0) {
> +#ifndef _WIN32
>         syslog(LOG_INFO, "%s: %s", level_str, msg);
> -    } else if (level & s->log_level) {
> #else
> -    if (level & s->log_level) {
> +        ReportEvent(s->event_log, EVENTLOG_INFORMATION_TYPE,
> +                    0, 1, NULL, 1, 0, &msg, NULL);
> #endif
> +    } else if (level & s->log_level) {
>         g_autoptr(GDateTime) now =3D g_date_time_new_now_utc();
>         g_autofree char *nowstr =3D g_date_time_format(now, "%s.%f");
>         fprintf(s->log_file, "%s: %s: %s\n", nowstr, level_str, msg);
> @@ -1286,6 +1288,13 @@ static GAState *initialize_agent(GAConfig =
*config, int socket_activation)
>     g_debug("Guest agent version %s started", QEMU_FULL_VERSION);
>=20
> #ifdef _WIN32
> +    s->event_log =3D RegisterEventSource(NULL, "qemu-ga");
> +    if (!s->event_log) {
> +        g_autofree gchar *errmsg =3D =
g_win32_error_message(GetLastError());
> +        g_critical("unable to register event source: %s", errmsg);
> +        return NULL;
> +    }
> +
>     /* On win32 the state directory is application specific (be it the =
default
>      * or a user override). We got past the command line parsing; =
let's create
>      * the directory (with any intermediate directories). If we run =
into an


