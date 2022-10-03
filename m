Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3614A5F2EB2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 12:17:58 +0200 (CEST)
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofIWL-0007AV-B9
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 06:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ofINA-0002Bp-Vm; Mon, 03 Oct 2022 06:08:32 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:33323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ofIN7-0006Ud-CV; Mon, 03 Oct 2022 06:08:28 -0400
Received: by mail-qk1-x72e.google.com with SMTP id h28so6261540qka.0;
 Mon, 03 Oct 2022 03:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=WbQyWeXVv/Uvf3u9MYTUnka9mu0yb8heu+71guWzDVM=;
 b=Y/0reL9j6CYsH6JPP4Dpbv17qULyRH8gHqfi9awOROb5xwV9b6lM/B1Ug45R1nuWlM
 a+KzJoGc5KyCteJxhr9x7/F6YmvzPISj/wOxgshyAz7+m/d+wWO5btDJ9ownEf27cv+N
 VAAQlPh7p5sb7NC4GSP4066m8vLTafXiCGy1bHlaAuFplCX6VAOl2+XmGwH6O26AUZ2/
 ulzGRBIKcivnRJNBnujqjAUMlala36olTclDxEth1Vqi4Oq+vhhWNaitzQ+9fSNLWK8I
 CagRbF6aGt/j2IE5twnCJwX2hPlgm1mB1kQmgqNnn24DhbYDDMp+750f/doLSkOdyVFS
 hOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WbQyWeXVv/Uvf3u9MYTUnka9mu0yb8heu+71guWzDVM=;
 b=i1205wBLeUIUCdgOgxfw2+rFAkrBoSsI2p0OsG935wqAEolSi079BVSiqJSPjjvjbi
 drG87JvoIz1kZ29lqsXHJPjlBdKrbWTJ3xqeoUVZL7gGfQWA/xgrIbr1sMEpO8zHXzfs
 qLfiqmaQ2gDJW040VLJ/74/sMf8LY0f+3vHlIEgpA0xmlrGfBcKX66P8qSj0WWKmTrCK
 jhyyK1dQU/xjL1ypF82PjSM9kubaYEA0EbDQcgv6zHcYdB2fBRVqozkf1xBdHYhCBYh6
 KWc2oHnF5K1XgkCgLRrwyxf19wPbkrYZWNLuSCidnknMZaBSVYSZLKZT/ftxQ1StkgrC
 brWA==
X-Gm-Message-State: ACrzQf1eUExsZLWETNDHhl/J3nWa2k/eFsUzFmJTy5ZKmDHhRTUhmWup
 0e7MpHD4VIGXyJitGtXv7Yr6AmdDsnWsE8Hja8g=
X-Google-Smtp-Source: AMsMyM6mOTLiRyFU5XZ8vrjHYhl5rtMjjVhWHSLHv79vy0/Kx60SB1boci2KZ4dLSyQx8yOKZiHcnvYpwWWPCqpSJdI=
X-Received: by 2002:a05:620a:1b8b:b0:6cf:4dbc:e0a9 with SMTP id
 dv11-20020a05620a1b8b00b006cf4dbce0a9mr12755498qkb.342.1664791700805; Mon, 03
 Oct 2022 03:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <CAJ+F1CJ3cTdNwZEQ5i+05mgYXXngyRAF6MoX6JFadsp9tKEgmg@mail.gmail.com>
In-Reply-To: <CAJ+F1CJ3cTdNwZEQ5i+05mgYXXngyRAF6MoX6JFadsp9tKEgmg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 3 Oct 2022 18:08:09 +0800
Message-ID: <CAEUhbmXXUcW0jb4VXBHeemjZoHD2fcnzMmfo=rX55BREN2KXHA@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tests/qtest: Enable running qtest on Windows
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alexander Bulekov <alxndr@bu.edu>, Andrew Jeffery <andrew@aj.id.au>,
 Ani Sinha <ani@anisinha.ca>, 
 Bandan Das <bsd@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Coiby Xu <Coiby.Xu@gmail.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Darren Kenny <darren.kenny@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Greg Kurz <groug@kaod.org>, Hanna Reitz <hreitz@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Joel Stanley <joel@jms.id.au>,
 John Snow <jsnow@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Willian Rampazzo <willianr@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc-Andr=C3=A9,

On Mon, Oct 3, 2022 at 5:26 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi Bin
>
> On Tue, Sep 27, 2022 at 3:18 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> In preparation to adding virtio-9p support on Windows, this series
>> enables running qtest on Windows, so that we can run the virtio-9p
>> tests on Windows to make sure it does not break accidently.
>>
>> Changes in v4:
>> - Do not use g_autofree and g_steal_pointer
>> - Update the error reporting by using the GError "error" argument
>>   of g_dir_make_tmp()
>> - Remove the const from tmpfs declaration
>> - Replace the whole block with a g_assert_no_error()
>> - Replace the error reporting with g_assert_no_error()
>> - Update error reporting
>> - Move the new text section after the "QTest" section instead
>> - Use plural in both cases: "on POSIX hosts as well as Windows hosts"
>> - Use "The following list shows some best practices"
>> - Fix typo of delimiter
>> - New patch: "tests/qtest: boot-serial-test: Close the serial file befor=
e starting QEMU"
>> - Drop patch: "chardev/char-file: Add FILE_SHARE_WRITE when openning the=
 file for win32"
>>
>
> Could you post a v5 rebased on the current master? thanks
>

Sure, will do.

> (I think most of the remaining patches are simple enough that I could tak=
e them in a misc PR if they are not picked by subsystem maintainers)

Thank you.

Regards,
Bin

