Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0143C63BAD4
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 08:40:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozvDD-0000v5-UY; Tue, 29 Nov 2022 02:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ozvCz-0000rX-Jx
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 02:39:15 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ozvCx-0001rI-VV
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 02:39:13 -0500
Received: by mail-lj1-x232.google.com with SMTP id bn5so15863879ljb.2
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 23:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CAtHT9GJwWPP4hPoRTz/ppZeTZaYr8zDv9jVpYt3T3Q=;
 b=ayhH7s6A7SH5MR2mXb5vj07WKcEulWSk4e4+YTTn33QkdZfXp7bI15juCMCJN4rpdn
 6ZZTDezjmObh4lYF1oFu/tI0qSznHSWE2t8QvDQaa50GpUhGHvboAibwbJAQq+sg1Aa/
 6IYVBMONpmG64TVA4cByAkAAOM5UmejOmJNWrOo142L7vK1aN9QC4n7VVu4JZ1CvXZHh
 IsxNPcohaW/HU9FSSv5l23ykXi8EU2VG4aBebkN40aEGehaETUN96jVW++B7KAP/72y8
 gdofswMKr/pHvhH5DWmg2jJl400kyKAgPqctXaQklm9SQ8i1v+gKNL1D27JxjQCZx0Ff
 SuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CAtHT9GJwWPP4hPoRTz/ppZeTZaYr8zDv9jVpYt3T3Q=;
 b=4dFJiRI6148DYe3Ai7JG1ca8J26/AyKxa5qZHxChbUxShEuhZb+eMM9CG+VgTqNajy
 H3c0NnekarBn1HL5+u/vvb0tDX8oF+9uI4dCPP+dZOKckeDIJ3v57KRSVM61C4VbKLkm
 ne9wEilGJ3RTWWcIwFWuIsXnL84NT+wyojVWKFEvdslwJmdnEYNC4L73WNnAQyShz7cf
 PrGG7/JXXNfV8jw8waVTw90LGVqEl4QMnRDdF6xJlIAUNhFVW3I1ftldbfPNBssOHaF6
 K5zjTCxmxz2RL2Z25fRhL9Avm/DNYHioDafocqtBgo3wgJ3eAvjDlH+rH+IasHydSkTl
 nOig==
X-Gm-Message-State: ANoB5pnafjBfgcw88N5WJC5QMd3FKTuJLr/EFIXCeWTHWheLW/xQnrgD
 DymFTWWUyRueQnbsPTc/EdmSzQv8dE+JEtO4WejC1Loh
X-Google-Smtp-Source: AA0mqf7sxZAVz+s74YCXyC4+/MvJW4wFfEZicp4vhnuMyApLF1JV+YMpVSGB2/QKCSD3dtkttKqup2A971x3sT9wp+A=
X-Received: by 2002:a2e:9797:0:b0:279:ab91:e4aa with SMTP id
 y23-20020a2e9797000000b00279ab91e4aamr1664255lji.267.1669707550173; Mon, 28
 Nov 2022 23:39:10 -0800 (PST)
MIME-Version: 1.0
References: <20221128185403.447817-1-andrey.drobyshev@virtuozzo.com>
 <20221128185403.447817-3-andrey.drobyshev@virtuozzo.com>
In-Reply-To: <20221128185403.447817-3-andrey.drobyshev@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 29 Nov 2022 11:38:58 +0400
Message-ID: <CAJ+F1CJqB=w6_H2s1u0W6uLPZRkEDa3KmOVoqnjd2fcGF=Lxdg@mail.gmail.com>
Subject: Re: [PATCH 2/2] qga: map GLib log levels to system levels
To: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, yur@openvz.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x232.google.com
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

On Tue, Nov 29, 2022 at 12:59 AM Andrey Drobyshev via
<qemu-devel@nongnu.org> wrote:
>
> This patch translates GLib-specific log levels to system ones, so that
> they may be used by both *nix syslog() (as a "priority" argument) and
> Windows ReportEvent() (as a "wType" argument).
>
> Currently the only codepath to write to "syslog" domain is slog()
> function.  However, this patch allows the interface to be extended.
>
> Note that since slog() is using G_LOG_LEVEL_INFO level, its behaviour
> doesn't change.
>
> Originally-by: Yuri Pudgorodskiy <yur@virtuozzo.com>
> Signed-off-by: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  qga/main.c | 36 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
>
> diff --git a/qga/main.c b/qga/main.c
> index 10314dfe5d..0467d5daf8 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -314,6 +314,38 @@ void ga_enable_logging(GAState *s)
>      s->logging_enabled =3D true;
>  }
>
> +static int glib_log_level_to_system(int level)
> +{
> +    switch (level) {
> +#ifndef _WIN32
> +        case G_LOG_LEVEL_ERROR:
> +            return LOG_ERR;
> +        case G_LOG_LEVEL_CRITICAL:
> +            return LOG_CRIT;
> +        case G_LOG_LEVEL_WARNING:
> +            return LOG_WARNING;
> +        case G_LOG_LEVEL_MESSAGE:
> +            return LOG_NOTICE;
> +        case G_LOG_LEVEL_DEBUG:
> +            return LOG_DEBUG;
> +        case G_LOG_LEVEL_INFO:
> +        default:
> +            return LOG_INFO;
> +#else
> +        case G_LOG_LEVEL_ERROR:
> +        case G_LOG_LEVEL_CRITICAL:
> +            return EVENTLOG_ERROR_TYPE;
> +        case G_LOG_LEVEL_WARNING:
> +            return EVENTLOG_WARNING_TYPE;
> +        case G_LOG_LEVEL_MESSAGE:
> +        case G_LOG_LEVEL_INFO:
> +        case G_LOG_LEVEL_DEBUG:
> +        default:
> +            return EVENTLOG_INFORMATION_TYPE;
> +#endif
> +    }
> +}
> +
>  static void ga_log(const gchar *domain, GLogLevelFlags level,
>                     const gchar *msg, gpointer opaque)
>  {
> @@ -327,9 +359,9 @@ static void ga_log(const gchar *domain, GLogLevelFlag=
s level,
>      level &=3D G_LOG_LEVEL_MASK;
>      if (g_strcmp0(domain, "syslog") =3D=3D 0) {
>  #ifndef _WIN32
> -        syslog(LOG_INFO, "%s: %s", level_str, msg);
> +        syslog(glib_log_level_to_system(level), "%s: %s", level_str, msg=
);
>  #else
> -        ReportEvent(s->event_log, EVENTLOG_INFORMATION_TYPE,
> +        ReportEvent(s->event_log, glib_log_level_to_system(level),
>                      0, 1, NULL, 1, 0, &msg, NULL);
>  #endif
>      } else if (level & s->log_level) {
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

