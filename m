Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAED67B06C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 11:58:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKdTO-0002EL-4M; Wed, 25 Jan 2023 05:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <freddy77@gmail.com>)
 id 1pKdTL-0002Dl-79
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 05:57:43 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <freddy77@gmail.com>)
 id 1pKdTJ-0002w6-N0
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 05:57:42 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 d6-20020a056830138600b0068585c52f86so10901305otq.4
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 02:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tqrmqkUPb6O8PDW/TN9+fPgPsF3uhAmPTTJ3zBO9o4c=;
 b=ekOJtbzbNPhnQQisVl4/mhCP5ckMRRHz0NtKySKpauFpY402BMvvMThW/YTTdNNjP/
 SNu9RzTFDQdpbjGxFGUgH/cH8uqTNSACNPQ2AfIOThtzgu/lCmUM4Wdzpvhl9mAODEW/
 9hH+8bUZFRT8EhpemIHpCkqFO0yOh9Q+quGYuovb84bubkUZVhD96VrJTPNiYyylMnwc
 u5+lNCnM2D+QlIdai66wauFxupABZnlvdF0BJjMtVNzyFPaAG6mlQBkeesvQfaN1SIDZ
 mfFR0FCz2wbdQft6lXfYVXI6LBb5X6vTzEAKd/EgkzZLzsskMlMx/5E2Rwd55bi6ZRjR
 Yd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tqrmqkUPb6O8PDW/TN9+fPgPsF3uhAmPTTJ3zBO9o4c=;
 b=ZrFDP+WmCuuIM0EwL2yhamcPa4QBexRBRoJGXy3cDynGIKfrfDttgtcf7M3z/vYlHB
 /anZKtFTWC2lVd/diNe1u70tjEu3phz/sva3Cx7LW1ke3onfAu6uQ1zvC8TsqgS8CjaQ
 l+lYAXv5iBLURHNm7c504x4mAblLGYG0i4Cgc0GhvteLyQOnc1pHAVwxlVsOiplhZvxY
 bsVRz/FPcjVhOvBmDbyQUAKQJH/cmk+adr5hT+kWMEeTO4DXWmfTCyYV7NIWq2ied/2s
 FB86uQBVleLMyHicLypjtmtUVFncEQnrn6DEWS7TJQn4Njy4q9FEnIDwDBkkPLnhH6WG
 es2Q==
X-Gm-Message-State: AFqh2kps6llNEhfqowK8NOLQBmgACCbK7bJT8fNo7nxaxN6sq916ICfR
 WCUHzyZwrRmc77slconzSvs8HrhVbIo15s1dZzI=
X-Google-Smtp-Source: AMrXdXu9IS/IJnds0zf7p7DYt8vhyJL+CAC/en0NnMRAo3HQvc2XxUId+SwhhMa/T4AG+THwDb59tbBDg18mkJ3ssts=
X-Received: by 2002:a05:6830:1db7:b0:686:3b42:b7d with SMTP id
 z23-20020a0568301db700b006863b420b7dmr1629544oti.36.1674644259403; Wed, 25
 Jan 2023 02:57:39 -0800 (PST)
MIME-Version: 1.0
References: <20230123083755.1038286-1-vivek.kasireddy@intel.com>
 <20230123083755.1038286-2-vivek.kasireddy@intel.com>
In-Reply-To: <20230123083755.1038286-2-vivek.kasireddy@intel.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Wed, 25 Jan 2023 10:57:28 +0000
Message-ID: <CAHt6W4cSMsPnV+6p6Li+Tvt+qmqsU_coP+kj9-MYDq+-EJbA+A@mail.gmail.com>
Subject: Re: [RFC v2 1/2] spice: Add an option for users to provide a
 preferred codec
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Dongwon Kim <dongwon.kim@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=freddy77@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Il giorno lun 23 gen 2023 alle ore 08:37 Vivek Kasireddy
<vivek.kasireddy@intel.com> ha scritto:
>
> Giving users an option to choose a particular codec will enable
> them to make an appropriate decision based on their hardware and
> use-case.
>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  qemu-options.hx |  5 +++++
>  ui/spice-core.c | 14 ++++++++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 3aa3a2f5a3..aab8df0922 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2142,6 +2142,7 @@ DEF("spice", HAS_ARG, QEMU_OPTION_spice,
>      "       [,streaming-video=3D[off|all|filter]][,disable-copy-paste=3D=
on|off]\n"
>      "       [,disable-agent-file-xfer=3Don|off][,agent-mouse=3D[on|off]]=
\n"
>      "       [,playback-compression=3D[on|off]][,seamless-migration=3D[on=
|off]]\n"
> +    "       [,preferred-codec=3D<encoder>:<codec>\n"
>      "       [,gl=3D[on|off]][,rendernode=3D<file>]\n"
>      "   enable spice\n"
>      "   at least one of {port, tls-port} is mandatory\n",
> @@ -2237,6 +2238,10 @@ SRST
>      ``seamless-migration=3D[on|off]``
>          Enable/disable spice seamless migration. Default is off.
>
> +    ``preferred-codec=3D<encoder>:<codec>``
> +        Provide the preferred codec the Spice server should use.
> +        Default would be spice:mjpeg.
> +
>      ``gl=3D[on|off]``
>          Enable/disable OpenGL context. Default is off.
>
> diff --git a/ui/spice-core.c b/ui/spice-core.c
> index 72f8f1681c..6e00211e3a 100644
> --- a/ui/spice-core.c
> +++ b/ui/spice-core.c
> @@ -469,6 +469,9 @@ static QemuOptsList qemu_spice_opts =3D {
>          },{
>              .name =3D "streaming-video",
>              .type =3D QEMU_OPT_STRING,
> +        },{
> +            .name =3D "preferred-codec",
> +            .type =3D QEMU_OPT_STRING,
>          },{
>              .name =3D "agent-mouse",
>              .type =3D QEMU_OPT_BOOL,
> @@ -644,6 +647,7 @@ static void qemu_spice_init(void)
>      char *x509_key_file =3D NULL,
>          *x509_cert_file =3D NULL,
>          *x509_cacert_file =3D NULL;
> +    const char *preferred_codec =3D NULL;
>      int port, tls_port, addr_flags;
>      spice_image_compression_t compression;
>      spice_wan_compression_t wan_compr;
> @@ -795,6 +799,16 @@ static void qemu_spice_init(void)
>          spice_server_set_streaming_video(spice_server, SPICE_STREAM_VIDE=
O_OFF);
>      }
>
> +    preferred_codec =3D qemu_opt_get(opts, "preferred-codec");
> +    if (preferred_codec) {
> +        if (spice_server_set_video_codecs(spice_server, preferred_codec)=
) {
> +            error_report("Preferred codec name is not valid");
> +            exit(1);
> +        }
> +    } else {
> +        spice_server_set_video_codecs(spice_server, "spice:mjpeg");

Why overriding the compiled in Spice default?
Apart from that the commit seems good to me.

> +    }
> +
>      spice_server_set_agent_mouse
>          (spice_server, qemu_opt_get_bool(opts, "agent-mouse", 1));
>      spice_server_set_playback_compression

Frediano

