Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9323F9A4A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 15:34:46 +0200 (CEST)
Received: from localhost ([::1]:53006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJc0L-0004O1-3T
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 09:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mJbya-0002TE-Lo
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 09:32:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mJbyU-0005EL-Kl
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 09:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630071169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IsP4LK7TFMFvzwQTfXoyqmz55SKCAms1G4WwM4ZlaSQ=;
 b=R66FM10If0Vae7pmQxfc5uoIjI4yLL/dk3h56yvxSIveboF4/DNfjT+XzYf8cFvw3ca2Ih
 Y87564dBBmQwu4uRdaLQSdqatk9DwIeh+ALyotumLczpcH2o9minJbTzmbrgYHsN6cjkQv
 v+sV03AmphoTcTyc92G/wy1jC24jlZ0=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-B7D9QUeiPHOuGcKJJgoVFQ-1; Fri, 27 Aug 2021 09:32:48 -0400
X-MC-Unique: B7D9QUeiPHOuGcKJJgoVFQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 11-20020a17090a198b00b001822e08fc1bso2712660pji.0
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 06:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IsP4LK7TFMFvzwQTfXoyqmz55SKCAms1G4WwM4ZlaSQ=;
 b=o7djGHYq47/O8bfPCYiL1gQLYuKavfttShXn9uXh7D8E9PPyAsejfNETtQ2X7oG4R7
 Bu5tcfJ2Z83ltdOZzLxXrMkyqF863EifO+nAVOfsUEnxhPxLC4oIJSj/G1z3/LOVwyLn
 A+9/Ag+xJ0sPL0d1o/TW08VCvoOJhgD3yWTdhbWYUErl0Wlx6kTacICJQ0avELy3Tjh/
 XW4dJnSsYMkWIn20dc9grcQGKhnUF6+xwIuxOzhBDBtuf2zWgVXmC+doTw146iiC2tXU
 ZFReMK10/sqpC8BYlOPhe+zQ1VpVj/mhG4APNgNwRmVjOZoPShW8fb1jgre134GgBOUi
 NC8A==
X-Gm-Message-State: AOAM531tjKUhe0e6dKdg9JYcuH638RMefEHZwibDmFL14LDjW50sx5xf
 15UIS6YLr5QlvhHFfUQgHHGKecpC1BUHp34CH90CiJdgkSlp9Jitcxlan2xiYjH+sHPgzk0TxvA
 REG8PMw+QGvTxkUkZTnSlwEvcBGSNI1c=
X-Received: by 2002:a17:90a:de16:: with SMTP id
 m22mr23169134pjv.38.1630071167376; 
 Fri, 27 Aug 2021 06:32:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqoXf01O87OCNX1DZEQpa+T9HTFpm+ti4Ln8xyv0Fpczr1/B7C4eOv/3zFQ7tEg9eXTpBwOTHWZMFV1WqmN44=
X-Received: by 2002:a17:90a:de16:: with SMTP id
 m22mr23169107pjv.38.1630071167114; 
 Fri, 27 Aug 2021 06:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210827060815.2384760-1-f4bug@amsat.org>
 <20210827060815.2384760-2-f4bug@amsat.org>
In-Reply-To: <20210827060815.2384760-2-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 27 Aug 2021 10:32:20 -0300
Message-ID: <CAKJDGDb23P3YDKcQVcHbtgBhsrT6BoWAFropTjuzmE-iwo+KMg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] tests: Remove uses of deprecated raspi2/raspi3
 machine names
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 libvir-list@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 27, 2021 at 3:14 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Commit 155e1c82ed0 deprecated the raspi2/raspi3 machine names.
> Use the recommended new names: raspi2b and raspi3b.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  docs/devel/qgraph.rst                   | 38 ++++++++++++-------------
>  tests/qtest/libqos/qgraph.h             |  6 ++--
>  tests/qtest/libqos/qgraph_internal.h    |  2 +-
>  tests/qtest/boot-serial-test.c          |  2 +-
>  tests/qtest/libqos/arm-raspi2-machine.c |  8 +++---
>  tests/unit/test-qgraph.c                |  2 +-
>  tests/acceptance/boot_linux_console.py  |  6 ++--
>  7 files changed, 32 insertions(+), 32 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


