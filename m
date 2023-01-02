Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B16165B134
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 12:32:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCJ2m-00017s-4o; Mon, 02 Jan 2023 06:31:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pCJ2E-0000yx-Ap
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:31:18 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pCJ2C-0008Va-Lt
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:31:18 -0500
Received: by mail-lf1-x12e.google.com with SMTP id j17so31728076lfr.3
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 03:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DGhUnhbZdGeV7JogcWlTisfELbm4hMV2t8h/xtjNBMc=;
 b=UdHMiepUbvQANg9/S3aagxlCWTFc4xMF2Uy1NpEYx7CMhab5P5VIweftZIVWSVpAca
 0LTD5swLeKQw6dwxb8zwFmhlH4g771eAX0HGFVyp18I+jBQ81lpt8lt9uwHAOoBbeBQ6
 6Y/O4i5bdz/BgfyaU/1MqA1hg+JyNNm7jigpSLB7HXXAfVlVRHGAmeYgk4YFSMmlIPCO
 kvVhC8AMEL9hc+P+8EKwF4KQGCc8w2fAX0FVcd5ixZD6SclKDiG5duwLSRXB7XwwF7uL
 SNqWwQPC83O0HKEfbfWHg8cZp4cp15liZicXICiVdiZTtsZ/TAmlqZMpfD/eE54wsMSv
 L18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DGhUnhbZdGeV7JogcWlTisfELbm4hMV2t8h/xtjNBMc=;
 b=AOXXPcgrBETeNyrl/hUSV2oSl19BMy2WiJP3KWzZhfQXqhLqDxQ32U4cxfaZ2nvb4j
 3b6DEWIwO1bJLpGDSGn6R1qXxU7Szy9f8w78FZc8E7PPA5NxCoy3Loh0wUYbbqEsvLW7
 JkFwMBsfOkiBZgAbkwI1/O+/JG+ihqjCnQsv2qLE/nzmVPwVbBBW3XG3NMtB7Fbg/1gU
 uQEZV51ZnbTpuw0YCKX72iv4c3rMWo2CxkoxGCRKKvThOaEUtpCxqLf607LfNrOVmwCi
 397p65OEaUPsq+wMm/PeK48VIvR1+bZ4ZqS7IW/dgHePS0hfzlhG1/diCU6+REHXCWDH
 O3Pg==
X-Gm-Message-State: AFqh2koQbpDbB0uB6/kB7hGK2s5s9PBMDAT8Z+XaV055kINsdUhSvS/s
 MWMu7rt70iP+koJ69qAfEdmF63kxJkzUt5E4bSR/rqCfBUM=
X-Google-Smtp-Source: AMrXdXt/yGKxLy0LyutYrtw4XNFRnZRfU2NfpZzwv4b/fUQXi4qe/lIU9eJFv7Vo4wf8dbUgQ6/NCa7QHAhXcrVNi28=
X-Received: by 2002:a05:6512:36cf:b0:4cb:98e:8b9e with SMTP id
 e15-20020a05651236cf00b004cb098e8b9emr2506482lfs.167.1672659074669; Mon, 02
 Jan 2023 03:31:14 -0800 (PST)
MIME-Version: 1.0
References: <20221230092758.281805-1-dengpc12@chinatelecom.cn>
 <20221230092758.281805-3-dengpc12@chinatelecom.cn>
In-Reply-To: <20221230092758.281805-3-dengpc12@chinatelecom.cn>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 2 Jan 2023 15:31:03 +0400
Message-ID: <CAJ+F1C+cyuX6kuXJnWHbU9zO7Lm=2eve1UDa5CuZxZJMcTxyjA@mail.gmail.com>
Subject: Re: [PATCH RFC 2/4] vdagent: refactor vdagent_chr_recv_caps function
To: dengpc12@chinatelecom.cn
Cc: qemu-devel@nongnu.org, huangy81@chinatelecom.cn, liuym16@chinatelecom.cn, 
 kraxel@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12e.google.com
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

On Fri, Dec 30, 2022 at 6:49 PM <dengpc12@chinatelecom.cn> wrote:
>
> From: "dengpc12@chinatelecom.cn" <dengpc12@chinatelecom.cn>
>
> Abstract vdagent registry logic into
> vdagent_register_to_qemu_clipboard.
>
> Note that trace log of vdagent_recv_caps also be added.
>
> Signed-off-by: dengpc12@chinatelecom.cn <dengpc12@chinatelecom.cn>
> Signed-off-by: liuym16@chinatelecom.cn <liuym16@chinatelecom.cn>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  ui/trace-events |  1 +
>  ui/vdagent.c    | 20 +++++++++++++-------
>  2 files changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/ui/trace-events b/ui/trace-events
> index 977577fbba..5e50b60da5 100644
> --- a/ui/trace-events
> +++ b/ui/trace-events
> @@ -143,6 +143,7 @@ vdagent_cb_grab_selection(const char *name) "selectio=
n %s"
>  vdagent_cb_grab_discard(const char *name, int cur, int recv) "selection =
%s, cur:%d recv:%d"
>  vdagent_cb_grab_type(const char *name) "type %s"
>  vdagent_cb_serial_discard(uint32_t current, uint32_t received) "current=
=3D%u, received=3D%u"
> +vdagent_recv_caps(uint32_t caps) "received caps %u"
>
>  # dbus.c
>  dbus_registered_listener(const char *bus_name) "peer %s"
> diff --git a/ui/vdagent.c b/ui/vdagent.c
> index 645383b4ec..38061d5b38 100644
> --- a/ui/vdagent.c
> +++ b/ui/vdagent.c
> @@ -696,6 +696,16 @@ static void vdagent_chr_open(Chardev *chr,
>      *be_opened =3D true;
>  }
>
> +static void vdagent_register_to_qemu_clipboard(VDAgentChardev *vd)
> +{
> +    if (have_clipboard(vd) && vd->cbpeer.notifier.notify =3D=3D NULL) {
> +        vd->cbpeer.name =3D "vdagent";
> +        vd->cbpeer.notifier.notify =3D vdagent_clipboard_notify;
> +        vd->cbpeer.request =3D vdagent_clipboard_request;
> +        qemu_clipboard_peer_register(&vd->cbpeer);
> +    }
> +}
> +
>  static void vdagent_chr_recv_caps(VDAgentChardev *vd, VDAgentMessage *ms=
g)
>  {
>      VDAgentAnnounceCapabilities *caps =3D (void *)msg->data;
> @@ -720,14 +730,10 @@ static void vdagent_chr_recv_caps(VDAgentChardev *v=
d, VDAgentMessage *msg)
>          qemu_input_handler_activate(vd->mouse_hs);
>      }
>
> -    memset(vd->last_serial, 0, sizeof(vd->last_serial));
> +    trace_vdagent_recv_caps(vd->caps);
>
> -    if (have_clipboard(vd) && vd->cbpeer.notifier.notify =3D=3D NULL) {
> -        vd->cbpeer.name =3D "vdagent";
> -        vd->cbpeer.notifier.notify =3D vdagent_clipboard_notify;
> -        vd->cbpeer.request =3D vdagent_clipboard_request;
> -        qemu_clipboard_peer_register(&vd->cbpeer);
> -    }
> +    memset(vd->last_serial, 0, sizeof(vd->last_serial));
> +    vdagent_register_to_qemu_clipboard(vd);
>  }
>
>  static void vdagent_chr_recv_msg(VDAgentChardev *vd, VDAgentMessage *msg=
)
> --
> 2.27.0
>
>


--=20
Marc-Andr=C3=A9 Lureau

