Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9700B5AAD57
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 13:23:31 +0200 (CEST)
Received: from localhost ([::1]:57400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU4lj-0003kP-Ez
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 07:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU4RD-0008TJ-W7; Fri, 02 Sep 2022 07:02:16 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:42568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU4RB-00011I-Fa; Fri, 02 Sep 2022 07:02:15 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id q8so1112891qvr.9;
 Fri, 02 Sep 2022 04:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=rEpMiu0WC9/JIaXUb3OKpYVr8iLziJG7FJxq1i8bK7Q=;
 b=Xwp9+V+MdF2t+jFqU6mM7IFlbGioUyHprLSUqStD8cKarheq5Hj+cXjJPogmuF/IfV
 U8Vw40Xfsdu6azTPQXIZx2lGIknXYVjr2tzXBzKiP1xtkjSJAPfhoWJhWRCQcK1+nkJZ
 lnVUdvI4PWPaceob0fO/orSA8Kh/07HX1nPo+LDEiIvJJ5twJiMClAhPsKyStLBnXyQu
 YP4reYMz+TCSl2iUt6AxFwlHyowsgGRppuUz5f9s6WrK3ED0wDYUvTYEA3pXRB7Kfx1f
 e+8dnvJYOq5bfnO5cUwvp10hlamYk0kKc9FLn4A9HGz8Hr5H4vswzOmSobOTS9vd3cK0
 9GoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rEpMiu0WC9/JIaXUb3OKpYVr8iLziJG7FJxq1i8bK7Q=;
 b=cvkmiis+CVac6QhukrOIFDKePnPXwEuEkr0YywnOb4KQ9HBtc+DPSm87krDKD1Uah1
 r8WxxC2eghazeTkKqR/J0I3CZNCGUshaUSwOtBgCZsActpR46ljcVCrSHjCVHGjWLzDP
 bGRsjR2r63RA0sqio5bG/u109kJOVMsIuO2q5rD0Ei+yFeZ1uGPem7GuMZgAgIne5k3B
 +KWXckylcSHN1179vBKGhTw00lXbGIdWdbr3Uqxpo/hAA/S1hJYzGVy/cHwLV8r6VJ82
 TEXTRxh6I6s/eE7Fua1SgfIiToxN3uEWPBmpGXrESGU2R6pTWQT0CVXj9IpMViw+uYgT
 zafA==
X-Gm-Message-State: ACgBeo2gEouk1e6SM3ZUXOnYePtKy/RH9QWhd2QycCM3y+UBWMkIZjIv
 3VYJiCbg3MMNxFqxfXI+zJT7h2BHRYYw8eK4JnA=
X-Google-Smtp-Source: AA6agR7Nd3bfaCfLSOsI0jwVXKQOzV4BAwbFfb9oclerBB7YHWKvoF0cnaqAbIb+XQS73UvuGDjsUf8yeWq88pIxAGc=
X-Received: by 2002:a05:6214:ca1:b0:498:f96d:4a8c with SMTP id
 s1-20020a0562140ca100b00498f96d4a8cmr25037656qvs.51.1662116531463; Fri, 02
 Sep 2022 04:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-33-bmeng.cn@gmail.com>
 <CAJ+F1CKusZz5VS85zYD7gtaE0KhYSSPuam66CeVacbj863_5zg@mail.gmail.com>
In-Reply-To: <CAJ+F1CKusZz5VS85zYD7gtaE0KhYSSPuam66CeVacbj863_5zg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 2 Sep 2022 19:02:00 +0800
Message-ID: <CAEUhbmVXYhFk55v4TJN5oypZMznFVAOJSQMgr59ouQe4GK8AYA@mail.gmail.com>
Subject: Re: [PATCH 32/51] tests/qtest: Fix ERROR_SHARING_VIOLATION for win32
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2f.google.com
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

On Thu, Sep 1, 2022 at 4:42 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Wed, Aug 24, 2022 at 2:03 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> On Windows, the MinGW provided mkstemp() API opens the file with
>> exclusive access, denying other processes to read/write the file.
>> Such behavior prevents the QEMU executable from opening the file,
>> (e.g.: CreateFile returns ERROR_SHARING_VIOLATION).
>
>
> g_mkstemp() doesn't have this behaviour (after running a quick test). Use=
 it?
>

Thanks for the suggestion!

I've switched to using g_file_open_tmp() in patch #7 "tests: Avoid
using hardcoded /tmp in test cases", and testing shows that it does
not have such an issue.

I checked glib sources and see both g_mkstemp() and g_file_open_tmp()
call g_open() which allows shared read/write on Windows.

So this patch can be dropped.

Regards,
Bin

