Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B9E69BF16
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Feb 2023 09:08:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTejq-0001L6-PM; Sun, 19 Feb 2023 03:08:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pTejm-0001Kh-GZ
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 03:07:58 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pTejk-0005h3-Se
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 03:07:58 -0500
Received: by mail-lj1-x22f.google.com with SMTP id y41so1081499ljq.5
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 00:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nRFxn/FqSV3e6y4Q4H8twyNjOfXMD5JQ6M/N66oVq3A=;
 b=Ikl+fyuZYEEz9fA5lY+sm+steLp5TiLOBxbWX7MlMeQ8P1WZCSTplPyoqrIaWtVADQ
 gYyhB8Gg+YUc10arbDtNCbs7xLY6bG1HnMIg8tzx7Rx+1R9PGXMFxBKskrXYISOM+FTU
 Q4NRRd4ufhAJmBYA7BxZmnNXpk27paOZ0nhz6PbzxW0CBkgYK/95PGt6oI5eLIakortA
 08sJzvWFUknoJ0cXRaY3bQLilvENN3f/Fyk/CzH7JQPwwr8NgqagIuAEowrW2hIIpCFm
 ldkqqQ7wLjx2m7bi9FK1mVxITeik5PljqUnckl0Of23eN6+g6eA0tL9Ol1j2vT0V8JQE
 S6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nRFxn/FqSV3e6y4Q4H8twyNjOfXMD5JQ6M/N66oVq3A=;
 b=fuwjNj8+YdJAjVhwaWQJ7FDMnjwh8BRbilICzNMK93gN47MKfb/YAKbUeQsQasI9m3
 WBbrjICaEaHZginRkeErEavV/qSAfMbbloH6we8wJQdRqPDVSROcSuGRx61U3z5cAv25
 B9P0ooBcX4bVBkb3x4mm3EjwTAYC3dlyOJOvd9rQui/ay6tHdcfRlhM1JgHv7vuFIxfK
 IFwspgAJRuWTr/pvWC1wOWLT/dbEFebqWD+PvleNbs70i/QcZet2bzdr3yzpZOks7d0s
 8sdfh51gFxenqMbc6zBCdfP4qpq5PTSJSOk5JHC+m0xscwIPi7OYrpkLfaaqj+Q0Kawj
 2+TA==
X-Gm-Message-State: AO0yUKX1knT/643op+/kylFYFlj70m7f7TwBRBK3kAFU6z8AoNx2OXgy
 P9ydD3/w7UBEG1YsSLFYmjUu5nnkUTYjz/0+mRM=
X-Google-Smtp-Source: AK7set/Oin/+8W0+Krdb7vtdHtsWKUgVbNMioNluOVXkOf4+floMKFsLt7CwO3M/71VLh8Xav4uViM8ayOHTVifZaFc=
X-Received: by 2002:a2e:b5ce:0:b0:293:531b:90ce with SMTP id
 g14-20020a2eb5ce000000b00293531b90cemr346623ljn.4.1676794074958; Sun, 19 Feb
 2023 00:07:54 -0800 (PST)
MIME-Version: 1.0
References: <20230218162216.46944-1-slp@redhat.com>
 <20230218162216.46944-4-slp@redhat.com>
In-Reply-To: <20230218162216.46944-4-slp@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sun, 19 Feb 2023 12:07:43 +0400
Message-ID: <CAJ+F1CK_0-6+W2wYSAjt-ES9ot6=Q3tj4ZBujPMCvCXnX5JeRQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] ui: add helpers for virtio-multitouch events
To: Sergio Lopez <slp@redhat.com>
Cc: qemu-devel@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22f.google.com
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

On Sat, Feb 18, 2023 at 8:23 PM Sergio Lopez <slp@redhat.com> wrote:
>
> Add helpers for generating Multi-touch events from the UI backends that
> can be sent to the guest through a virtio-multitouch device.
>
> Signed-off-by: Sergio Lopez <slp@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  include/ui/input.h |  5 +++++
>  ui/input.c         | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
>
> diff --git a/include/ui/input.h b/include/ui/input.h
> index 2a3dffd417..c37251e1e9 100644
> --- a/include/ui/input.h
> +++ b/include/ui/input.h
> @@ -64,6 +64,11 @@ int qemu_input_scale_axis(int value,
>  void qemu_input_queue_rel(QemuConsole *src, InputAxis axis, int value);
>  void qemu_input_queue_abs(QemuConsole *src, InputAxis axis, int value,
>                            int min_in, int max_in);
> +void qemu_input_queue_mtt(QemuConsole *src, InputMultitouchType type, in=
t slot,
> +                          int tracking_id);
> +void qemu_input_queue_mtt_abs(QemuConsole *src, InputAxis axis, int valu=
e,
> +                              int min_in, int max_in,
> +                              int slot, int tracking_id);
>
>  void qemu_input_check_mode_change(void);
>  void qemu_add_mouse_mode_change_notifier(Notifier *notify);
> diff --git a/ui/input.c b/ui/input.c
> index f788db20f7..34331b7b0b 100644
> --- a/ui/input.c
> +++ b/ui/input.c
> @@ -547,6 +547,42 @@ void qemu_input_queue_abs(QemuConsole *src, InputAxi=
s axis, int value,
>      qemu_input_event_send(src, &evt);
>  }
>
> +void qemu_input_queue_mtt(QemuConsole *src, InputMultitouchType type,
> +                          int slot, int tracking_id)
> +{
> +    InputMultitouchEvent mtt =3D {
> +        .type =3D type,
> +        .slot =3D slot,
> +        .tracking_id =3D tracking_id,
> +    };
> +    InputEvent evt =3D {
> +        .type =3D INPUT_EVENT_KIND_MTT,
> +        .u.mtt.data =3D &mtt,
> +    };
> +
> +    qemu_input_event_send(src, &evt);
> +}
> +
> +void qemu_input_queue_mtt_abs(QemuConsole *src, InputAxis axis, int valu=
e,
> +                              int min_in, int max_in, int slot, int trac=
king_id)
> +{
> +    InputMultitouchEvent mtt =3D {
> +        .type =3D INPUT_MULTITOUCH_TYPE_DATA,
> +        .slot =3D slot,
> +        .tracking_id =3D tracking_id,
> +        .axis =3D axis,
> +        .value =3D qemu_input_scale_axis(value, min_in, max_in,
> +                                       INPUT_EVENT_ABS_MIN,
> +                                       INPUT_EVENT_ABS_MAX),
> +    };
> +    InputEvent evt =3D {
> +        .type =3D INPUT_EVENT_KIND_MTT,
> +        .u.mtt.data =3D &mtt,
> +    };
> +
> +    qemu_input_event_send(src, &evt);
> +}
> +
>  void qemu_input_check_mode_change(void)
>  {
>      static int current_is_absolute;
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

