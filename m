Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EA6411081
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 09:51:28 +0200 (CEST)
Received: from localhost ([::1]:54168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSE5H-0001Ge-GF
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 03:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSDwg-0005vQ-BL
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 03:42:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSDwa-00068r-Uy
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 03:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632123747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGlG6X5zcUZtapoVEQwyZKqVBM2S7spm5mEeLF3p9bw=;
 b=PLZinzAeN9RsQQnYwrwfOt4ucJMGJ1YDJp/6c9Msku4HDte+cTdqKwV/jdmp9SaWXJIyST
 G8CFKoMYAgJqrMcU1D3Ej6K25FLovLsS2eJ84SJtuH23WuqANmkTAEwGTzjYmUe3PKV8zQ
 lQrX5MoP0eSU0mHSEDT9IT8tS8+F3Hs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-LKFaFSimN2OT3AduqAExgA-1; Mon, 20 Sep 2021 03:42:26 -0400
X-MC-Unique: LKFaFSimN2OT3AduqAExgA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3168718414C4;
 Mon, 20 Sep 2021 07:42:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C00A5D9DC;
 Mon, 20 Sep 2021 07:42:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B4D3A113865F; Mon, 20 Sep 2021 09:42:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 01/53] docs/devel: rename file for writing monitor
 commands
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-2-berrange@redhat.com>
Date: Mon, 20 Sep 2021 09:42:02 +0200
In-Reply-To: <20210914142042.1655100-2-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Tue, 14 Sep 2021 15:19:50
 +0100")
Message-ID: <87a6k74rsl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.476, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> The file already covers writing new style HMP commands, in addition to
> the QMP commands, so it deserves a more general name.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  docs/devel/index.rst                                        | 2 +-
>  ...riting-qmp-commands.rst =3D> writing-monitor-commands.rst} | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename docs/devel/{writing-qmp-commands.rst =3D> writing-monitor-command=
s.rst} (99%)
>
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index f95df10b3e..7c25177c5d 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -44,4 +44,4 @@ modifying QEMU's source code.
>     ebpf_rss
>     vfio-migration
>     qapi-code-gen
> -   writing-qmp-commands
> +   writing-monitor-commands
> diff --git a/docs/devel/writing-qmp-commands.rst b/docs/devel/writing-mon=
itor-commands.rst
> similarity index 99%
> rename from docs/devel/writing-qmp-commands.rst
> rename to docs/devel/writing-monitor-commands.rst
> index 6a10a06c48..497c9ce0d5 100644
> --- a/docs/devel/writing-qmp-commands.rst
> +++ b/docs/devel/writing-monitor-commands.rst
> @@ -1,8 +1,8 @@
> -How to write QMP commands using the QAPI framework
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +How to write monitor commands
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> =20
>  This document is a step-by-step guide on how to write new QMP commands u=
sing
> -the QAPI framework. It also shows how to implement new style HMP command=
s.
> +the QAPI framework and new style HMP commands.

Recommend to drop "new style", here and in the commit message.

Back when this file was written, we did have several "styles" of HMP
commands:

    typedef struct mon_cmd_t {
        const char *name;
        const char *args_type;
        const char *params;
        const char *help;
        void (*user_print)(Monitor *mon, const QObject *data);
        union {
            void (*info)(Monitor *mon);
            void (*cmd)(Monitor *mon, const QDict *qdict);
            int  (*cmd_new)(Monitor *mon, const QDict *params, QObject **re=
t_data);
            int  (*cmd_async)(Monitor *mon, const QDict *params,
                              MonitorCompletion *cb, void *opaque);
        } mhandler;
        bool qapi;
        int flags;
    } mon_cmd_t;
    [...]
    static void handle_user_command(Monitor *mon, const char *cmdline)
    {
        QDict *qdict;
        const mon_cmd_t *cmd;

        qdict =3D qdict_new();

        cmd =3D monitor_parse_command(mon, cmdline, qdict);
        if (!cmd)
            goto out;

        if (handler_is_async(cmd)) {
            user_async_cmd_handler(mon, cmd, qdict);
        } else if (handler_is_qobject(cmd)) {
            QObject *data =3D NULL;

            /* XXX: ignores the error code */
            cmd->mhandler.cmd_new(mon, qdict, &data);
            assert(!monitor_has_error(mon));
            if (data) {
                cmd->user_print(mon, data);
                qobject_decref(data);
            }
        } else {
            cmd->mhandler.cmd(mon, qdict);
        }

    out:
        QDECREF(qdict);
    }

Async: add MONITOR_CMD_ASYNC to ->flags, use ->mhandler.async().

New: set ->user_print and ->mhandler.cmd_new.

Old: keep ->user_print() null, and set ->mhandler.cmd().

"Async" style never really worked, and was buried in commit 65207c59d9
"monitor: Drop broken, unused asynchronous command interface".

"New" style was buried in commit 8a4f501c09 "monitor: Drop unused "new"
HMP command interface".

Both burials got merged into master in June 2015.  "Old" style has been
the only style since then.

>  This document doesn't discuss QMP protocol level details, nor does it di=
ve
>  into the QAPI framework implementation.


