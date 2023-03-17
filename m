Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5886BE27E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 09:04:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd53t-00085E-0s; Fri, 17 Mar 2023 04:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pd53q-00083U-E6
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:03:38 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pd53o-0001sC-C6
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:03:38 -0400
Received: by mail-lj1-x233.google.com with SMTP id y14so4200156ljq.4
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 01:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679040214;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P4JCzMe0/ffFe+YpUEYG7PF0uOql1LWDqtks99mS+yY=;
 b=Faxqt/URtuvxPGrQqcGnszAV2o7nvXpEAqs0Et2jEG+vedLp3eYKxjQNzl2//A0wNI
 j6mRwomRXTEiGh351NaHJ3uznvDXoNEPuERlR5Yr7s5PPeVBrbYkNqgTC9hCStRU/StY
 LG9Rh2mTDpFJhuC6QeYFvmeoys8VSrmZt0TfRI6auCVFm5kcWHW0ITQhNoBrmoP0VBoT
 s4Axp1T0WMV2/taBxwuWed7UDC/Nd2U5XKDONivzuP/uryv+YDPI8Wc3vHgMToGL9rsi
 L9q+DLTOzgZJEWCwWi6QSBPs43KRxitmXW/lxZIl/Pl+j6lJT9bx0sUXl+K6gqMWlxj/
 JXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679040214;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P4JCzMe0/ffFe+YpUEYG7PF0uOql1LWDqtks99mS+yY=;
 b=JzwT3h4+HNahdQP/x3a66bxgub3Er8vuiuHCc7ISOraBfTFN9HHOIt82tHt+8dbx6J
 SnFmmaYkTGox1x7TJqFhXp9YzxDlUa030euCcIz43FinaBtMrMiqtN6/VrMWvZATo7Uq
 sQ1/gCwHCAqFXNIrBOyc+kd672Z73prvEQKclxKFo2MtBO35s5jrISRj5c8uIk0CELS0
 dqJs/EdSu7jp4SsEV98S+0ntqfsxLTlVX8ogj1eiab6nh8GzTzWAwO1WT5Ko37OrIbbQ
 P9Px5gH+B1Y1/sQW0lY7wwNpcpo7CXlbigS5lB2SQ5XsHf1TEIs50RstGQXjD5SbeOgc
 US4A==
X-Gm-Message-State: AO0yUKWYwuIltLf8IJk+C5fTf12haGEwUUg8X84uFiU1QYbYdVdr+VT4
 Z6IhVSA5VlY7ROoTTcLvhLWlk/HYHsg43z32JwU=
X-Google-Smtp-Source: AK7set+87xM/SMIFZOkjZctWVEZEHOZ86Hy0WRUvzJJYUVc4G5geDyBfetjJKaarl+e6UUUhilr0O5rTKWFA1PDROLs=
X-Received: by 2002:a2e:9bca:0:b0:299:ac68:480b with SMTP id
 w10-20020a2e9bca000000b00299ac68480bmr1170720ljj.0.1679040214408; Fri, 17 Mar
 2023 01:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230316120624.46410-1-slp@redhat.com>
 <20230316120624.46410-3-slp@redhat.com>
In-Reply-To: <20230316120624.46410-3-slp@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 17 Mar 2023 12:03:22 +0400
Message-ID: <CAJ+F1CJ_L861E648w4KSYSs2tFeNpgTD9-FTcGsy=N6+U4z2zA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] ui: add the infrastructure to support MT events
To: Sergio Lopez <slp@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x233.google.com
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

On Thu, Mar 16, 2023 at 4:07=E2=80=AFPM Sergio Lopez <slp@redhat.com> wrote=
:
>
> Add the required infrastructure to support generating multitouch events.
>
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  include/ui/input.h    |  3 +++
>  qapi/ui.json          | 45 ++++++++++++++++++++++++++++++++++++++++---
>  replay/replay-input.c | 18 +++++++++++++++++
>  ui/input.c            |  6 ++++++
>  ui/trace-events       |  1 +
>  5 files changed, 70 insertions(+), 3 deletions(-)
>
> diff --git a/include/ui/input.h b/include/ui/input.h
> index c86219a1c1..2a3dffd417 100644
> --- a/include/ui/input.h
> +++ b/include/ui/input.h
> @@ -8,9 +8,12 @@
>  #define INPUT_EVENT_MASK_BTN   (1<<INPUT_EVENT_KIND_BTN)
>  #define INPUT_EVENT_MASK_REL   (1<<INPUT_EVENT_KIND_REL)
>  #define INPUT_EVENT_MASK_ABS   (1<<INPUT_EVENT_KIND_ABS)
> +#define INPUT_EVENT_MASK_MTT   (1<<INPUT_EVENT_KIND_MTT)
>
>  #define INPUT_EVENT_ABS_MIN    0x0000
>  #define INPUT_EVENT_ABS_MAX    0x7FFF
> +#define INPUT_EVENT_SLOTS_MIN  0x0
> +#define INPUT_EVENT_SLOTS_MAX  0xa
>
>  typedef struct QemuInputHandler QemuInputHandler;
>  typedef struct QemuInputHandlerState QemuInputHandlerState;
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 98322342f7..dee9c2b5bb 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1014,7 +1014,7 @@
>  ##
>  { 'enum'  : 'InputButton',
>    'data'  : [ 'left', 'middle', 'right', 'wheel-up', 'wheel-down', 'side=
',
> -  'extra', 'wheel-left', 'wheel-right' ] }
> +  'extra', 'wheel-left', 'wheel-right', 'touch' ] }
>
>  ##
>  # @InputAxis:
> @@ -1026,6 +1026,17 @@
>  { 'enum'  : 'InputAxis',
>    'data'  : [ 'x', 'y' ] }
>
> +##
> +# @InputMultitouchType:
> +#
> +# Type of a multitouch event.
> +#
> +# Since: 8.1
> +##
> +{ 'enum'  : 'InputMultitouchType',
> +  'data'  : [ 'begin', 'update', 'end', 'cancel', 'data' ] }
> +
> +
>  ##
>  # @InputKeyEvent:
>  #
> @@ -1069,13 +1080,31 @@
>    'data'  : { 'axis'    : 'InputAxis',
>                'value'   : 'int' } }
>
> +##
> +# @InputMultitouchEvent:
> +#
> +# Multitouch input event.
> +#
> +# @axis: Which axis is referenced by @value.
> +# @value: Pointer position.  For absolute coordinates the
> +#         valid range is 0 -> 0x7ffff

What about documenting @slot and @tracking-id ?

otherwise, lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> +#
> +# Since: 8.1
> +##
> +{ 'struct'  : 'InputMultitouchEvent',
> +  'data'  : { 'type'       : 'InputMultitouchType',
> +              'slot'       : 'int',
> +              'tracking-id': 'int',
> +              'axis'       : 'InputAxis',
> +              'value'      : 'int' } }
> +
>  ##
>  # @InputEventKind:
>  #
>  # Since: 2.0
>  ##
>  { 'enum': 'InputEventKind',
> -  'data': [ 'key', 'btn', 'rel', 'abs' ] }
> +  'data': [ 'key', 'btn', 'rel', 'abs', 'mtt' ] }
>
>  ##
>  # @InputKeyEventWrapper:
> @@ -1101,6 +1130,14 @@
>  { 'struct': 'InputMoveEventWrapper',
>    'data': { 'data': 'InputMoveEvent' } }
>
> +##
> +# @InputMultitouchEventWrapper:
> +#
> +# Since: 8.1
> +##
> +{ 'struct': 'InputMultitouchEventWrapper',
> +  'data': { 'data': 'InputMultitouchEvent' } }
> +
>  ##
>  # @InputEvent:
>  #
> @@ -1112,6 +1149,7 @@
>  #        - 'btn': Input event of pointer buttons
>  #        - 'rel': Input event of relative pointer motion
>  #        - 'abs': Input event of absolute pointer motion
> +#        - 'mtt': Input event of Multitouch
>  #
>  # Since: 2.0
>  ##
> @@ -1121,7 +1159,8 @@
>    'data'  : { 'key'     : 'InputKeyEventWrapper',
>                'btn'     : 'InputBtnEventWrapper',
>                'rel'     : 'InputMoveEventWrapper',
> -              'abs'     : 'InputMoveEventWrapper' } }
> +              'abs'     : 'InputMoveEventWrapper',
> +              'mtt'     : 'InputMultitouchEventWrapper' } }
>
>  ##
>  # @input-send-event:
> diff --git a/replay/replay-input.c b/replay/replay-input.c
> index 1147e3d34e..092f6b5ee9 100644
> --- a/replay/replay-input.c
> +++ b/replay/replay-input.c
> @@ -22,6 +22,7 @@ void replay_save_input_event(InputEvent *evt)
>      InputKeyEvent *key;
>      InputBtnEvent *btn;
>      InputMoveEvent *move;
> +    InputMultitouchEvent *mtt;
>      replay_put_dword(evt->type);
>
>      switch (evt->type) {
> @@ -58,6 +59,14 @@ void replay_save_input_event(InputEvent *evt)
>          replay_put_dword(move->axis);
>          replay_put_qword(move->value);
>          break;
> +    case INPUT_EVENT_KIND_MTT:
> +        mtt =3D evt->u.mtt.data;
> +        replay_put_dword(mtt->type);
> +        replay_put_qword(mtt->slot);
> +        replay_put_qword(mtt->tracking_id);
> +        replay_put_dword(mtt->axis);
> +        replay_put_qword(mtt->value);
> +        break;
>      case INPUT_EVENT_KIND__MAX:
>          /* keep gcc happy */
>          break;
> @@ -73,6 +82,7 @@ InputEvent *replay_read_input_event(void)
>      InputBtnEvent btn;
>      InputMoveEvent rel;
>      InputMoveEvent abs;
> +    InputMultitouchEvent mtt;
>
>      evt.type =3D replay_get_dword();
>      switch (evt.type) {
> @@ -109,6 +119,14 @@ InputEvent *replay_read_input_event(void)
>          evt.u.abs.data->axis =3D (InputAxis)replay_get_dword();
>          evt.u.abs.data->value =3D replay_get_qword();
>          break;
> +    case INPUT_EVENT_KIND_MTT:
> +        evt.u.mtt.data =3D &mtt;
> +        evt.u.mtt.data->type =3D (InputMultitouchType)replay_get_dword()=
;
> +        evt.u.mtt.data->slot =3D replay_get_qword();
> +        evt.u.mtt.data->tracking_id =3D replay_get_qword();
> +        evt.u.mtt.data->axis =3D (InputAxis)replay_get_dword();
> +        evt.u.mtt.data->value =3D replay_get_qword();
> +        break;
>      case INPUT_EVENT_KIND__MAX:
>          /* keep gcc happy */
>          break;
> diff --git a/ui/input.c b/ui/input.c
> index f2d1e7a3a7..f788db20f7 100644
> --- a/ui/input.c
> +++ b/ui/input.c
> @@ -212,6 +212,7 @@ static void qemu_input_event_trace(QemuConsole *src, =
InputEvent *evt)
>      InputKeyEvent *key;
>      InputBtnEvent *btn;
>      InputMoveEvent *move;
> +    InputMultitouchEvent *mtt;
>
>      if (src) {
>          idx =3D qemu_console_get_index(src);
> @@ -250,6 +251,11 @@ static void qemu_input_event_trace(QemuConsole *src,=
 InputEvent *evt)
>          name =3D InputAxis_str(move->axis);
>          trace_input_event_abs(idx, name, move->value);
>          break;
> +    case INPUT_EVENT_KIND_MTT:
> +        mtt =3D evt->u.mtt.data;
> +        name =3D InputAxis_str(mtt->axis);
> +        trace_input_event_mtt(idx, name, mtt->value);
> +        break;
>      case INPUT_EVENT_KIND__MAX:
>          /* keep gcc happy */
>          break;
> diff --git a/ui/trace-events b/ui/trace-events
> index 977577fbba..6747361745 100644
> --- a/ui/trace-events
> +++ b/ui/trace-events
> @@ -90,6 +90,7 @@ input_event_key_qcode(int conidx, const char *qcode, bo=
ol down) "con %d, key qco
>  input_event_btn(int conidx, const char *btn, bool down) "con %d, button =
%s, down %d"
>  input_event_rel(int conidx, const char *axis, int value) "con %d, axis %=
s, value %d"
>  input_event_abs(int conidx, const char *axis, int value) "con %d, axis %=
s, value 0x%x"
> +input_event_mtt(int conidx, const char *axis, int value) "con %d, axis %=
s, value 0x%x"
>  input_event_sync(void) ""
>  input_mouse_mode(int absolute) "absolute %d"
>
> --
> 2.38.1
>
>


--
Marc-Andr=C3=A9 Lureau

