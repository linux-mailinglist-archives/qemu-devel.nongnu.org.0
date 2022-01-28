Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498C649FEB1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 18:09:58 +0100 (CET)
Received: from localhost ([::1]:60062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUl2-0002Zz-9P
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 12:09:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTwb-0003Hz-7H
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:17:49 -0500
Received: from [2a00:1450:4864:20::32a] (port=42859
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTwZ-00053a-7k
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:17:48 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso4398026wmf.1
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 08:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+pbaXZespALfruxgF74f2LixIoGkhf4TRGHv/ipFTis=;
 b=we0zSj+/asmIcG70ChYDJV0neU5crNBx91FDBRTtTwRJCgwd5p/vlKKocpAz4WtoJS
 0pWnXBMXrkmHnLAZKgCcIIlGPrMTj0wQ3oWIEbzXkuVddVWBFy6ekpd7Qq6AmePhmUfe
 E7ZVD/D2klnf4LHfRcyBS6xpBtsFFGjrKDcx0lEDFtgupWlKogZiJo8gBYOoP5bYHPFp
 gkSObgIFYOGHfGODW7Z1+H/HQwepvhhrL5YUmQew9xx50Z+n1pj3tdgiDZhhInRHc99w
 w/5tq3GoILLr1kclL0iS+5yUSl3Zy9LUChncezXt+5C7kmC3uTjJQon1QOs3H2RLwTPA
 GeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+pbaXZespALfruxgF74f2LixIoGkhf4TRGHv/ipFTis=;
 b=LzH9N8M3eulvLcWId1pOmDFJeAXWoBoBDC4l/8uO9Us1MnWWQVoVvSIhQ3JQcFLsKU
 MmiI6mu9cMuCLJIbXTxcQU0bMfePh9RpNcs6Ww6RpiRUVanSQoBX9zmolleIlQyHs2Ps
 yNPLAVMO4MYP4mVZox7f5z/V6hpQtsoGsGotJU85PVwdHG6IcNKr8Vo89GLNwu3ILnaJ
 ej8+sg9qWkFcuIpWKWPvJgpsxF3zJ9BoIw6L8N9BM53qbJiYD/uPaoiZwufN/OobErfV
 f/k6sYZOBiSWi5RNpPgy5rPBarG6eQ/ZyAVB3ZpmIAQ4c+rjOwAdSUBmWJpMBvk4250C
 R+Sw==
X-Gm-Message-State: AOAM530CIGLCE6TF5DwCw0WkutL0gKO34keLFN5QVdn08z4nonPMWjeM
 WOqZzUOxZKNJyvfYnVo8+/pH4xfDZZfeqMZfPTvxKw==
X-Google-Smtp-Source: ABdhPJzE+ZasyOMnNfSGbGgM3EV5GC1YuPiQJ9NU9FdC9GKxJ47bWTl+ljWiDe1PtMMKEpHS8/HEqV5Lj3uo3bLx/YI=
X-Received: by 2002:a05:600c:3551:: with SMTP id
 i17mr16572860wmq.21.1643386663114; 
 Fri, 28 Jan 2022 08:17:43 -0800 (PST)
MIME-Version: 1.0
References: <20190215155709.15777-1-berrange@redhat.com>
 <20190215155709.15777-2-berrange@redhat.com>
In-Reply-To: <20190215155709.15777-2-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 16:17:32 +0000
Message-ID: <CAFEAcA-hKkN-f+85zNwXZwgXWtZ=mEX+P-Pm13rh-G=bCeHzcw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v8 01/11] util: add helper APIs for dealing
 with inotify in portable manner
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Feb 2019 at 16:06, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> The inotify userspace API for reading events is quite horrible, so it is
> useful to wrap it in a more friendly API to avoid duplicating code
> across many users in QEMU. Wrapping it also allows introduction of a
> platform portability layer, so that we can add impls for non-Linux based
> equivalents in future.

Hi; Coverity has suddenly decided to complain about this 3-year-old
code (in CID 1469132). It reports an "untrusted loop bound" because
in the 'loop over events in the buffer' we use the data we just read
from the filedescriptor (specifically ev->len) as part of the
calculation of our loop termination condition.

Is there actually anything to change here, or is this a false
positive because we actually trust the data we're getting on this fd?

(More generally there are a handful of "untrusted loop bound"
and "untrusted value as argument" issues outstanding in the Coverity UI,
so some opinions on whether they're valid or not would be useful.)

> +static void qemu_file_monitor_watch(void *arg)
> +{
> +    QFileMonitor *mon =3D arg;
> +    char buf[4096]
> +        __attribute__ ((aligned(__alignof__(struct inotify_event))));
> +    int used =3D 0;
> +    int len;
> +
> +    qemu_mutex_lock(&mon->lock);
> +
> +    if (mon->fd =3D=3D -1) {
> +        qemu_mutex_unlock(&mon->lock);
> +        return;
> +    }
> +
> +    len =3D read(mon->fd, buf, sizeof(buf));
> +
> +    if (len < 0) {
> +        if (errno !=3D EAGAIN) {
> +            error_report("Failure monitoring inotify FD '%s',"
> +                         "disabling events", strerror(errno));
> +            goto cleanup;
> +        }
> +
> +        /* no more events right now */
> +        goto cleanup;
> +    }
> +
> +    /* Loop over all events in the buffer */
> +    while (used < len) {
> +        struct inotify_event *ev =3D
> +            (struct inotify_event *)(buf + used);
> +        const char *name =3D ev->len ? ev->name : "";
> +        QFileMonitorDir *dir =3D g_hash_table_lookup(mon->idmap,
> +                                                   GINT_TO_POINTER(ev->w=
d));
> +        uint32_t iev =3D ev->mask &
> +            (IN_CREATE | IN_MODIFY | IN_DELETE | IN_IGNORED |
> +             IN_MOVED_TO | IN_MOVED_FROM | IN_ATTRIB);
> +        int qev;
> +        gsize i;
> +
> +        used +=3D sizeof(struct inotify_event) + ev->len;
> +
> +        if (!dir) {
> +            continue;
> +        }
> +
> +        /*
> +         * During a rename operation, the old name gets
> +         * IN_MOVED_FROM and the new name gets IN_MOVED_TO.
> +         * To simplify life for callers, we turn these into
> +         * DELETED and CREATED events
> +         */
> +        switch (iev) {
> +        case IN_CREATE:
> +        case IN_MOVED_TO:
> +            qev =3D QFILE_MONITOR_EVENT_CREATED;
> +            break;
> +        case IN_MODIFY:
> +            qev =3D QFILE_MONITOR_EVENT_MODIFIED;
> +            break;
> +        case IN_DELETE:
> +        case IN_MOVED_FROM:
> +            qev =3D QFILE_MONITOR_EVENT_DELETED;
> +            break;
> +        case IN_ATTRIB:
> +            qev =3D QFILE_MONITOR_EVENT_ATTRIBUTES;
> +            break;
> +        case IN_IGNORED:
> +            qev =3D QFILE_MONITOR_EVENT_IGNORED;
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +
> +        trace_qemu_file_monitor_event(mon, dir->path, name, ev->mask, di=
r->id);
> +        for (i =3D 0; i < dir->watches->len; i++) {
> +            QFileMonitorWatch *watch =3D &g_array_index(dir->watches,
> +                                                      QFileMonitorWatch,
> +                                                      i);
> +
> +            if (watch->filename =3D=3D NULL ||
> +                (name && g_str_equal(watch->filename, name))) {
> +                trace_qemu_file_monitor_dispatch(mon, dir->path, name,
> +                                                 qev, watch->cb,
> +                                                 watch->opaque, watch->i=
d);
> +                watch->cb(watch->id, qev, name, watch->opaque);
> +            }
> +        }
> +    }
> +
> + cleanup:
> +    qemu_mutex_unlock(&mon->lock);
> +}
> +

thanks
-- PMM

