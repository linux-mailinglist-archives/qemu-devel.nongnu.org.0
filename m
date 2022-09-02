Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A876B5AAA4D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 10:42:28 +0200 (CEST)
Received: from localhost ([::1]:55776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU2Fv-0004Np-P3
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 04:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU23K-0002RB-MT
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 04:29:26 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:36513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU23G-0005L6-ME
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 04:29:25 -0400
Received: by mail-qk1-x731.google.com with SMTP id s22so1196809qkj.3
 for <qemu-devel@nongnu.org>; Fri, 02 Sep 2022 01:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=YpzWdsy8JODLm/QovpwVNZ+yMcTCZrdS1aXUwXxt5Fs=;
 b=o9SAOy/T3LSpDXBBvbWMFS8bFzRWz3Moxn9yNqFGgHiHgrEJhJ4xSNl5DKR/4elRB4
 2HJcNNpYFQnQjJjw7bPxUZ5M1RuKxHoRrZcyvBa+Kl6iHDWEPusMDJAnha/AdV4sjsZ1
 Q3PVqWl2SSPwNBs34/L/q3/UAWSfeeBvWRuVTU29v7nqQCjk03kfMQaxH0lrmV7AGF4o
 8goAipEqkBrmfAiqEB18DnlFVJUWRE0AS7Mrl7RWfRRPck78RUnWdiOYEhSWl/ddroZj
 9kNKtTfuNUog1oIY/lBwtDt92S9lq5eqwHmNMFVY82fVb3HOKVa10XfkByJfsYQnkU2U
 JeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YpzWdsy8JODLm/QovpwVNZ+yMcTCZrdS1aXUwXxt5Fs=;
 b=hu7jdHl8IPkg3YK0zDM40ChalMtmo4HWUVeJtzXtJCyz8CjN72LwwufbX+dXf7QyNT
 hu9M97lRm+3Je8TRLotdX1opFVntNB0IpwjrtT5itdfyUrmWhgDRrZSBqE2tGlv+9lt/
 OBv73/k+/VPPOpKgD0o4X2eioH3BXv6ywtBl0TigYlvnigqJCxfxQ6hsNpk0HEHIedag
 fXTysNP+tGn4RBJtYPwPLhLcjPKdTUf/VBBRLwZHmthHBWYzNeXFlvjeqqoYqbHXXTbs
 bAaoaCtx7SV8spGLCurhGlEaiA2nSvrclAznQsak7lU0ttviqxjbaszp/58P7/adinJM
 M5dQ==
X-Gm-Message-State: ACgBeo38+49HS22x+7YieE3c1SSv0deCBBdUJYnoA9t9pR9J9ELIEL3P
 4Ybg1aLgVSHQlXbZAZXPVtBqye/K8uqYEGyqpWdN0zol
X-Google-Smtp-Source: AA6agR5++C1HDeKLIfxIz9ilBbnIgvh5ZnDKOBXSHJTrrSHOkcsONoU/inTJkbAbLhJkN2obxg2djqVf12GE5saN8+g=
X-Received: by 2002:ae9:df46:0:b0:6bb:7917:5c66 with SMTP id
 t67-20020ae9df46000000b006bb79175c66mr21552572qkf.342.1662107361639; Fri, 02
 Sep 2022 01:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-21-bmeng.cn@gmail.com>
 <CAJ+F1C+iDMHYA6WFsCSiY5XnAWF0dBhGjE-qPSCCrdoXaQZHog@mail.gmail.com>
In-Reply-To: <CAJ+F1C+iDMHYA6WFsCSiY5XnAWF0dBhGjE-qPSCCrdoXaQZHog@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 2 Sep 2022 16:29:10 +0800
Message-ID: <CAEUhbmVyt7-TVc7n3FbO4Zu582723_MfNQuvpyK1oPutLiJ56A@mail.gmail.com>
Subject: Re: [PATCH 20/51] tests/qtest: i440fx-test: Skip running
 request_{bios, pflash} for win32
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 31, 2022 at 9:40 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Wed, Aug 24, 2022 at 2:15 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> The request_{bios,pflash} test cases call mmap() which does not
>> exist on win32. Exclude them.
>>
>
> We can fairly easily rewrite the create_blob_file() function to be portab=
le though, something like:

Thanks for the suggestion!

Will spin a patch in v2.

>
> static char *create_blob_file(void)
> {
>     g_autofree uint8_t *buf =3D g_malloc(BLOB_SIZE);
>     GError *error =3D NULL;
>     char *pathname;
>     int fd;
>     size_t i;
>
>     fd =3D g_file_open_tmp("blob_XXXXXX", &pathname, &error);
>     g_assert_no_error(error);
>
>     for (i =3D 0; i < BLOB_SIZE; ++i) {
>         buf[i] =3D i;
>     }
>
>     g_file_set_contents(pathname, (char *)buf, BLOB_SIZE, &error);
>     g_assert_no_error(error);
>     close(fd);
>
>     return pathname;
> }
>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> ---
>>
>>  tests/qtest/i440fx-test.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>

Regards,
Bin

