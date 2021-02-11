Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BB8318679
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:51:00 +0100 (CET)
Received: from localhost ([::1]:42650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7gi-0006Kb-2o
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lA7f9-0005ja-HU
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 03:49:23 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:37211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lA7f7-0003dx-4M
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 03:49:23 -0500
Received: by mail-ej1-x62b.google.com with SMTP id jj19so8833400ejc.4
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 00:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U9F9gTyGNt7psgTm+tD5KLS7tavwWya9NPv5R4HEWWs=;
 b=fxGocuPMea5apr0hi9qKCHXHMUvcDEz4s3jjEbOZogHIcD0govSuLo1Swe0SVxQ79R
 GqaPVUPuwHfJloblfYwvQwppXLwYjhVLDGA+/9pzTOTWAzLs9jv8kHjThdFKLKkrfrUK
 PplmYnuRf4jSwR/LMcWSa4fq4b5zbhCga5cjTeJAuu8q9CS2MwJrJgxNlvCB2uLqjSyv
 ZTT+wEQBV/dfJ9pA04B6Xdgmco4GA5pO9kTXi3Nx4Dg3KYTERC4fUMmd16ZEaKJ9q09u
 8DcVQ8gYQnzs904x1jTDdpeyghpXWjhni4wumcoUCXXBDmmw/S0tL06Qe9sjALJRPY9w
 S2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U9F9gTyGNt7psgTm+tD5KLS7tavwWya9NPv5R4HEWWs=;
 b=PYjAYupopRtT+h+/cimGbXWm/BlowwnypsBMhrut51oCD9NPXeL9uC+WNcz5BKyIce
 GS+7ufOGl7suLL+vjVAG4CBRrF2HHWcIi/f9tFqGhUtaQW8yb0fET0Sm/PNO64qyL5nb
 DaZQm5rkY/NPx3KLF2Io7d7puc8aqPQz86LtICM0OahaTFQt6/4y+0vtMVSFIlTDoYOp
 SAzsvgFJ9OLbvmAzaj3658+Z/483wOp6JJc7UPzuStoMQeRNAhEOdKEGv3ONyZonIXLj
 dhJP2QLAgNo0b4/+N9OpsJkio5sqRsJkoAOskv2lVapeXfBM4m7r/iMTlwI7lrPyLhsk
 OFSQ==
X-Gm-Message-State: AOAM531/9Cc7jezezw9Xp7pY8VdwqIToaAq2bdPXVqv8eGr3qBMl3UZF
 3nD/EsDnE6r36FTi5CDIhsI7a7YQEg6s3RO9eDs=
X-Google-Smtp-Source: ABdhPJyflLd8N22bS4wMv2rv7PAo8gOBy+H6d5HD43MjO9iROu9Rjmn4nJnJ6ctjll4l9E26FK6j4DiJOcTw+KEHex8=
X-Received: by 2002:a17:906:2bc2:: with SMTP id
 n2mr7184484ejg.381.1613033358301; 
 Thu, 11 Feb 2021 00:49:18 -0800 (PST)
MIME-Version: 1.0
References: <20210129085852.22224-1-lma@suse.com>
In-Reply-To: <20210129085852.22224-1-lma@suse.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 11 Feb 2021 12:49:05 +0400
Message-ID: <CAJ+F1C+n8-QfeU0UJ3Nc11TegVOmRYVzKjcrRwd5uYWJwjbvww@mail.gmail.com>
Subject: Re: [RESEND] [PATCH v5] qga: Correct loop count in
 qmp_guest_get_vcpus()
To: Lin Ma <lma@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Jan 29, 2021 at 1:00 PM lma--- via <qemu-devel@nongnu.org> wrote:
>
> The guest-get-vcpus returns incorrect vcpu info in case we hotunplug vcpu=
s(not
> the last one).
> e.g.:
> A VM has 4 VCPUs: cpu0 + 3 hotunpluggable online vcpus(cpu1, cpu2 and cpu=
3).
> Hotunplug cpu2,  Now only cpu0, cpu1 and cpu3 are present & online.
>
> ./qmp-shell /tmp/qmp-monitor.sock
> (QEMU) query-hotpluggable-cpus
> {"return": [
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 3}, "vcpus-count": =
1,
>  "qom-path": "/machine/peripheral/cpu3", "type": "host-x86_64-cpu"},
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 2}, "vcpus-count": =
1,
>  "qom-path": "/machine/peripheral/cpu2", "type": "host-x86_64-cpu"},
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 1}, "vcpus-count": =
1,
>  "qom-path": "/machine/peripheral/cpu1", "type": "host-x86_64-cpu"},
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, "vcpus-count": =
1,
>  "qom-path": "/machine/unattached/device[0]", "type": "host-x86_64-cpu"}
> ]}
>
> (QEMU) device_del id=3Dcpu2
> {"return": {}}
>
> (QEMU) query-hotpluggable-cpus
> {"return": [
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 3}, "vcpus-count": =
1,
>  "qom-path": "/machine/peripheral/cpu3", "type": "host-x86_64-cpu"},
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 2}, "vcpus-count": =
1,
>  "type": "host-x86_64-cpu"},
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 1}, "vcpus-count": =
1,
>  "qom-path": "/machine/peripheral/cpu1", "type": "host-x86_64-cpu"},
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, "vcpus-count": =
1,
>  "qom-path": "/machine/unattached/device[0]", "type": "host-x86_64-cpu"}
> ]}
>
> Before:
> ./qmp-shell -N /tmp/qmp-ga.sock
> Welcome to the QMP low-level shell!
> Connected
> (QEMU) guest-get-vcpus
> {"return": [
> {"online": true, "can-offline": false, "logical-id": 0},
> {"online": true, "can-offline": true, "logical-id": 1}]}
>
> After:
> ./qmp-shell -N /tmp/qmp-ga.sock
> Welcome to the QMP low-level shell!
> Connected
> (QEMU) guest-get-vcpus
> {"return": [
> {"online": true, "can-offline": false, "logical-id": 0},
> {"online": true, "can-offline": true, "logical-id": 1},
> {"online": true, "can-offline": true, "logical-id": 3}]}
>
> Signed-off-by: Lin Ma <lma@suse.com>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qga/commands-posix.c | 43 ++++++++++++++-----------------------------
>  1 file changed, 14 insertions(+), 29 deletions(-)
>

The patch no longer applies cleanly. Can you rebase?

thanks

> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index edf785b2da..646d9cebb5 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2385,24 +2385,6 @@ error:
>      return NULL;
>  }
>
> -#define SYSCONF_EXACT(name, errp) sysconf_exact((name), #name, (errp))
> -
> -static long sysconf_exact(int name, const char *name_str, Error **errp)
> -{
> -    long ret;
> -
> -    errno =3D 0;
> -    ret =3D sysconf(name);
> -    if (ret =3D=3D -1) {
> -        if (errno =3D=3D 0) {
> -            error_setg(errp, "sysconf(%s): value indefinite", name_str);
> -        } else {
> -            error_setg_errno(errp, errno, "sysconf(%s)", name_str);
> -        }
> -    }
> -    return ret;
> -}
> -
>  /* Transfer online/offline status between @vcpu and the guest system.
>   *
>   * On input either @errp or *@errp must be NULL.
> @@ -2473,24 +2455,28 @@ static void transfer_vcpu(GuestLogicalProcessor *=
vcpu, bool sys2vcpu,
>
>  GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
>  {
> -    int64_t current;
>      GuestLogicalProcessorList *head, **link;
> -    long sc_max;
> +    const char *cpu_dir =3D "/sys/devices/system/cpu";
> +    const gchar *line;
> +    g_autoptr(GDir) cpu_gdir =3D NULL;
>      Error *local_err =3D NULL;
>
> -    current =3D 0;
>      head =3D NULL;
>      link =3D &head;
> -    sc_max =3D SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &local_err);
> +    cpu_gdir =3D g_dir_open(cpu_dir, 0, NULL);
> +
> +    if (cpu_gdir =3D=3D NULL) {
> +        error_setg_errno(errp, errno, "failed to list entries: %s", cpu_=
dir);
> +        return NULL;
> +    }
>
> -    while (local_err =3D=3D NULL && current < sc_max) {
> +    while (local_err =3D=3D NULL && (line =3D g_dir_read_name(cpu_gdir))=
 !=3D NULL) {
>          GuestLogicalProcessor *vcpu;
>          GuestLogicalProcessorList *entry;
> -        int64_t id =3D current++;
> -        char *path =3D g_strdup_printf("/sys/devices/system/cpu/cpu%" PR=
Id64 "/",
> -                                     id);
> -
> -        if (g_file_test(path, G_FILE_TEST_EXISTS)) {
> +        int64_t id;
> +        if (sscanf(line, "cpu%ld", &id)) {
> +            g_autofree char *path =3D g_strdup_printf("/sys/devices/syst=
em/cpu/"
> +                                                    "cpu%" PRId64 "/", i=
d);
>              vcpu =3D g_malloc0(sizeof *vcpu);
>              vcpu->logical_id =3D id;
>              vcpu->has_can_offline =3D true; /* lolspeak ftw */
> @@ -2500,7 +2486,6 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Erro=
r **errp)
>              *link =3D entry;
>              link =3D &entry->next;
>          }
> -        g_free(path);
>      }
>
>      if (local_err =3D=3D NULL) {
> --
> 2.26.2
>
>


--=20
Marc-Andr=C3=A9 Lureau

