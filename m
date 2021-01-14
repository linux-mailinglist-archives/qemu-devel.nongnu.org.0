Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24D82F6BD2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 21:09:52 +0100 (CET)
Received: from localhost ([::1]:60882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08wJ-00062F-QT
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 15:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08qx-0001tN-9q
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 15:04:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08qv-000815-Og
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 15:04:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610654657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dn9l8R13qIazCfhJwH4mBzTnqFCHB/Ik+odk4slJ7a8=;
 b=Y8m/MjZB5PF41+aDrOBVDYGyLU8v0eieI6nOjocNo+tk9OutZ2fN68OGATMCHbFjowjVHU
 QDtzCHMdl8RRxq4OSaJII9wCg0t4E/2UlRubeBVaoRaVAKeimm71htATnkpgEW3W3B4arE
 uu6ee7A1cpHPHY+iuZh/xRnrJrz1h2g=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-TyDKkR8IPfmdXattrVfm-g-1; Thu, 14 Jan 2021 15:04:15 -0500
X-MC-Unique: TyDKkR8IPfmdXattrVfm-g-1
Received: by mail-ua1-f69.google.com with SMTP id c2so584617uak.12
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 12:04:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dn9l8R13qIazCfhJwH4mBzTnqFCHB/Ik+odk4slJ7a8=;
 b=WJyjkahrEhvlmJaHjQcItAspSkhSHESwUKRNqOtmsvXSeEvaY1srZUEGXDkY4ZxCUr
 iN67RwtLws6tv3gYR3ncfCG57syKp2k/oaEHx1nzRsbsbTmoFH/e3RaM6LEzblf67S8L
 QVkw1j46z882gHevHF/W4BU7hasWuLoMqXghfcYI0rhLLjbtoRDxehfxFUjqTsp8azko
 uuLaXpZrMCa+uwpwQdvbWH16AeVt38q6vj5rBfsDpKdv6Dln7MGWmalw9WoEfvqZyFl5
 otzHC/Pj3FotZ4aZm/J6UMUlXhZx7I//wKgzE/nADPNyz8DF/NCGCYUAntuEeTZLKR9u
 cyIg==
X-Gm-Message-State: AOAM531hN/kc1vDYIHbluKKzMgL9ADWyjQJKOLFCeCymi2PWcYLdwvGu
 yHQIW/Z8roRnj8nOlvkKUWG40gCB/Pbl+FzE9s17l6LtoRUj6byKeAneZ8bSmWfw/7rwmK49y9S
 pLWkPdFGS5I9m7tdEoQMh+l0dp/Lgg94=
X-Received: by 2002:ab0:6f97:: with SMTP id f23mr6945180uav.5.1610654655237;
 Thu, 14 Jan 2021 12:04:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJwp7sytIq9++zF98NCuE8+v8Y/urdEh3Mw+DYXLQ8xMPG6BP6oJTLZrSkro8nvYUOuFs3okpR3TlTQ4vCzDo=
X-Received: by 2002:ab0:6f97:: with SMTP id f23mr6945162uav.5.1610654655051;
 Thu, 14 Jan 2021 12:04:15 -0800 (PST)
MIME-Version: 1.0
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-2-alex.bennee@linaro.org>
In-Reply-To: <20210114165730.31607-2-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 14 Jan 2021 17:03:49 -0300
Message-ID: <CAKJDGDbgLo=nmuAPMJ_+ZNKpUkN3mMeAqvhx9VD=U+nPJH3XbQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] tests/docker: Remove Debian 9 remnant lines
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 2:33 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Debian 9 base container has been removed in commits
> e3755276d1f and c9d78b06c06. Remove the last remnants.
>
> Fixes: e3755276d1f ("tests/docker: Remove old Debian 9 containers")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <20210107072933.3828450-1-f4bug@amsat.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/docker/Makefile.include | 1 -
>  1 file changed, 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


