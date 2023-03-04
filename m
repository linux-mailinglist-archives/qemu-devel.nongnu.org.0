Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F8B6AAA58
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 15:12:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYSav-0001R1-K6; Sat, 04 Mar 2023 09:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYSap-0001QU-CY
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 09:10:37 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYSan-0003yK-AE
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 09:10:35 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so8863781pjg.4
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 06:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677939031;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8rbBDKVbFX5p4DPpsjS+sN1J3zemVKGH89kixqMsoJk=;
 b=UITaUBxbOupmnJa5G6IPEwQUkib23Grhw7UDOueeLBURQuv2XKXyBvWO71a1XvYtn7
 +dKBX91NK6ETiyTU4cyKKrkkPh20KOJ7Age7Hl/Fz2U8KG5VZ9FGW49nruK+aTBLuERH
 AHGVYmqhrMa/b5z+3ztAmmm0VwL+WHS4GwlQq7fJNNPqiRSszL6DsV4LxzY44zCcJIe7
 eOhdXHY5KanPLzkmQ2d+VD6JgfQd1p0jSX5YYnqDSwy1oW71fAp9/ebfECylAYjC+IuG
 EPRBpg6sNy7ieKuPsh3opYxLK2mA9z/FqSrtUFNiRRIax5ZxH8d2Zin4YEo3gRbghgAY
 q1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677939031;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8rbBDKVbFX5p4DPpsjS+sN1J3zemVKGH89kixqMsoJk=;
 b=XaB0VaCk3RY3t4BwutHvBKOQNF2MUWqNOaDEOMVEM3X744ZiyTON+7dbsWoxcnKjNY
 Q4Q39jvrHPZP9LxQvYtA6rpIYvzELj1bHC0aA9dOvrolfclaY8+n0Glwez6v061QYewa
 WVy2UPndIFSAaXthrBPLA6DU8RzFL8A/4xf+nSQfI2uTqSoej+yyhAr+o/7fZwbw7Y8J
 WtJtQZ+EpB/4ZxjlqESOmNHjsF7NUa5tOEmlgG9lCdwb3l91VQKiISYVMsfuVfhq2NNN
 DOkVJWzOAyQaCbiJHdlhbVYxMUeAeHYj+yOO9toX/iLUun+sCnrBHSbhaXjRusWw8H7g
 o/hA==
X-Gm-Message-State: AO0yUKU/NymdvFZdgax0sDWBIM10tKBg9wxyDKmxhcuQKncbt6OLgfgU
 C00mq5kpQcc5YepqLGbDQ54SeFST5XSxyY9I4AOXfg==
X-Google-Smtp-Source: AK7set9hLjgNwUsBsqfH8DnCkB1rIezTnhi0tJwLeXAVVzzDJP7KGm7JIJWmCdJ8qUL8Z9wz/hQRnBQ7MBN5eAM7+As=
X-Received: by 2002:a17:90b:f12:b0:237:5834:2808 with SMTP id
 br18-20020a17090b0f1200b0023758342808mr1912071pjb.0.1677939031480; Sat, 04
 Mar 2023 06:10:31 -0800 (PST)
MIME-Version: 1.0
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-6-farosas@suse.de>
 <CAFEAcA8p86BdbbO-thyov+A-dc98iygPx6nyCmnxinCRCuKviA@mail.gmail.com>
 <87pm9pwnym.fsf@suse.de>
In-Reply-To: <87pm9pwnym.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Mar 2023 14:10:20 +0000
Message-ID: <CAFEAcA_aw6mc_FM00MqOcOzqFP=xktpq6+Z-_uhhEHKbw-bKNA@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 5/9] tests/avocado: Pass parameters to migration
 test
To: Fabiano Rosas <farosas@suse.de>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 3 Mar 2023 at 20:59, Fabiano Rosas <farosas@suse.de> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 28 Feb 2023 at 19:28, Fabiano Rosas <farosas@suse.de> wrote:
> >>
> >> The migration tests are currently broken for an aarch64 host because
> >> the tests pass no 'machine' and 'cpu' options on the QEMU command
> >> line.
> >>
> >> Add a separate class to each architecture so that we can specify
> >> 'machine' and 'cpu' options instead of relying on defaults.
> >>
> >> Add a skip decorator to keep the current behavior of only running
> >> migration tests when the qemu target matches the host architecture.
> >
> > I still don't understand this patch. Don't we run the
> > migration-test on all hosts already? David ?
> >
>
> We run on all hosts but for each host we only take the QEMU binary that
> matches the host architecture. So if you want to test aarch64 migration,
> you need an aarch64 host.
>
> If you run on an x86_64 host (without this patch):
> $ ../configure #all targets
> $ make check-avocado AVOCADO_TESTS=../tests/avocado/migration.py
>
> You'll see:
>
>  (1/3) ... migration.py:Migration.test_migration_with_tcp_localhost: PASS (0.21 s)
>  (2/3) ... migration.py:Migration.test_migration_with_unix: PASS (0.18 s)
>  (3/3) ... migration.py:Migration.test_migration_with_exec: PASS (0.21 s)
>
> All three tests ran using qemu-system-x86_64.
>
> The issue I'm trying to solve is that when run on a aarch64 host, the
> test will fail because (being generic) it doesn't pass the '-machine
> virt' option and there is no architecture-specific information in it at
> all.

But my point is that we already CI on aarch64 hosts, so what is
happening there that means the test doesn't fail already ?

-- PMM

