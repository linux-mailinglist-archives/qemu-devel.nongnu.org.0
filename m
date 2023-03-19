Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9676C0199
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Mar 2023 13:26:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pds5h-0008N2-G6; Sun, 19 Mar 2023 08:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pds5d-0008Mj-Hu
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 08:24:46 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pds5b-0005wm-Um
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 08:24:45 -0400
Received: by mail-ed1-x534.google.com with SMTP id ek18so36877291edb.6
 for <qemu-devel@nongnu.org>; Sun, 19 Mar 2023 05:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679228682;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iG/PMIBQ0NXTwH1yQwfOyKFBxeghmGkzBL2UsP4roNc=;
 b=hgvSjFByuhljy/+UvZJKiUT+BhS6a9DU8ehGeKTmc3E3S1gpJ7CLMevdbrXs0urCvb
 9DmXSk/CCGJwqiBqdqJfwVNMP3pmiMZzP3rUL7+n3TfdYdFXF3FcrLclRwfvq2J+nEI9
 vJpC2xjZCEGVGIJdVg0XkudCugHLCVQdMCziAlMj6SW7saEreMMyzXnwSCjd6usZxzJp
 ff1BN8TYk6RYJdwqi5nubvOm4JCKulu53vEbjmM5CtPdvwcyGPuM3O62b/su8vZl9BC0
 nxkQ1/fFCcDzjgWwUopt4L8+PNof4Ph9/KTAk6IMjG7U/H9UqSMM52MlCPhkLA2xPGDZ
 70XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679228682;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iG/PMIBQ0NXTwH1yQwfOyKFBxeghmGkzBL2UsP4roNc=;
 b=imoOeyXZZySuustwfcGp+Vi4WFdqKdf7rRPXipf7FmHNs9rBJ9Z4IZ5mTWS5gcpJbm
 i6ssixIanAmUdpSuNb/LvCEvys701XGSUpQluJHH4G22leEOGOB7SAdmP2ysi8FYCg2z
 +WsDhiM1OaM+BWhNqMYoNVo1OtuCv5Y0j/4SduF/F7nfx8O/J22TqT1TSPWL36kOyYbl
 RHg5XLUuVcLlAzrFKZ1eP723dCidH4ewkHTGuD9wv82iwBclg1D1eImdLRj3G7jWL6Bg
 mDRTxFm9XgBN4FylNzExEjmyLOm27TdrJcqfNGJfXh6eexXh8WiWQg+sVgpdcydKCM/e
 B1CA==
X-Gm-Message-State: AO0yUKUf6GXH96c3KFOTEeTkxamf5PIB8fkGX67ESPKTFRXFQUkjTt8R
 XWyIN4QFPJTJnNi7l/RiSNs=
X-Google-Smtp-Source: AK7set/OMySQdGR6HoInf51IpQqePvDXZpwt9F+FxStlhvh1EDldcbbJZRcJ/mLl6X8Juge248tSrg==
X-Received: by 2002:a05:6402:110c:b0:500:4062:99f7 with SMTP id
 u12-20020a056402110c00b00500406299f7mr8545274edv.32.1679228681948; 
 Sun, 19 Mar 2023 05:24:41 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-188-069-182.77.188.pool.telefonica.de.
 [77.188.69.182]) by smtp.gmail.com with ESMTPSA id
 i23-20020a508717000000b004af6c5f1805sm3450889edb.52.2023.03.19.05.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Mar 2023 05:24:41 -0700 (PDT)
Date: Sun, 19 Mar 2023 12:24:37 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@gmail.com>
CC: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_for-8=2E0=5D_Revert_=22ui=3A_set_cur?=
 =?US-ASCII?Q?sor_position_upon_listener_registration=22?=
In-Reply-To: <CAJ+F1CKFiP6_bv62t61zAuzOqbTo_vNagNHj8=QEYOnM4cT8bQ@mail.gmail.com>
References: <20230318173132.98068-1-shentey@gmail.com>
 <CAJ+F1CKFiP6_bv62t61zAuzOqbTo_vNagNHj8=QEYOnM4cT8bQ@mail.gmail.com>
Message-ID: <5827048B-E2F7-4FF8-9BC4-72EA494D3E22@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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



Am 19=2E M=C3=A4rz 2023 11:11:39 UTC schrieb "Marc-Andr=C3=A9 Lureau" <mar=
candre=2Elureau@gmail=2Ecom>:
>Hi
>
>On Sat, Mar 18, 2023 at 9:33=E2=80=AFPM Bernhard Beschow <shentey@gmail=
=2Ecom> wrote:
>>
>> Commit 6effaa16ac98 ("ui: set cursor position upon listener registratio=
n")
>> causes the mouse cursor to be placed into the lower left corner when QE=
MU
>> starts=2E This could be reproduced with just by running
>> `qemu-system-x86_64`=2E
>>
>> This reverts commit 6effaa16ac9846e7d6197ee54a0551fba61aecd7=2E
>
>What display do you test with, gtk on x11?
>thanks

Yes, gtk on x11=2E

BTW, the cursor is placed in the bottom left corner of the *screen*=2E

Best regards,
Bernhard
>
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>  ui/console=2Ec | 7 -------
>>  1 file changed, 7 deletions(-)
>>
>> diff --git a/ui/console=2Ec b/ui/console=2Ec
>> index f3783021e5=2E=2E35f8274aab 100644
>> --- a/ui/console=2Ec
>> +++ b/ui/console=2Ec
>> @@ -95,7 +95,6 @@ struct QemuConsole {
>>      QemuUIInfo ui_info;
>>      QEMUTimer *ui_timer;
>>      QEMUCursor *cursor;
>> -    int cursor_x, cursor_y, cursor_on;
>>      const GraphicHwOps *hw_ops;
>>      void *hw;
>>
>> @@ -1666,9 +1665,6 @@ void register_displaychangelistener(DisplayChange=
Listener *dcl)
>>      if (con && con->cursor && dcl->ops->dpy_cursor_define) {
>>          dcl->ops->dpy_cursor_define(dcl, con->cursor);
>>      }
>> -    if (con && dcl->ops->dpy_mouse_set) {
>> -        dcl->ops->dpy_mouse_set(dcl, con->cursor_x, con->cursor_y, con=
->cursor_on);
>> -    }
>>      text_console_update_cursor(NULL);
>>  }
>>
>> @@ -1913,9 +1909,6 @@ void dpy_mouse_set(QemuConsole *con, int x, int y=
, int on)
>>      DisplayState *s =3D con->ds;
>>      DisplayChangeListener *dcl;
>>
>> -    con->cursor_x =3D x;
>> -    con->cursor_y =3D y;
>> -    con->cursor_on =3D on;
>>      if (!qemu_console_is_visible(con)) {
>>          return;
>>      }
>> --
>> 2=2E40=2E0
>>
>>
>
>

