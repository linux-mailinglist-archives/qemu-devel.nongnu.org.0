Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22A54B6D17
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 14:12:13 +0100 (CET)
Received: from localhost ([::1]:54422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJxcq-0006U4-Ff
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 08:12:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJxXk-00037A-F8
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:06:56 -0500
Received: from [2607:f8b0:4864:20::32a] (port=47065
 helo=mail-ot1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJxXh-0002aq-AB
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:06:55 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 l12-20020a0568302b0c00b005a4856ff4ceso13692610otv.13
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 05:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ku4SConuvZ8KBIWk99q0CdgLYVMyNv/IwqaBkmgDalc=;
 b=Rx9aleDfUpMPhdyYcj+UsdtioD7abf7kqN6NRN/vWUsrWn8t9giwWFy9UybgbXkxBM
 mR0Zbi92gEwx3taeHAq0jwfmD2ggL+K0NVDrPr8VhRzPu1YRTNX8WtkC66KDpg+N5+pE
 I9oWLXMW4nYTJdq43SFje+i6WRQwQBsKCsGpwAzTPDFi0/bvSXInBASk2iSsSfHnIEGv
 MsUD13A+Z9vIxnZZFKu6EoxtJb0baTzFN+CQX0OAuqmvwmNw23dAU0DGb7FrE7XQqn8C
 0qPAsl/3un9Dv2ElRx18g7+/5vxkNDgobcMVSg7ButJt2Ppnt8jV7VCLDCKHgGVGi7Dc
 cy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ku4SConuvZ8KBIWk99q0CdgLYVMyNv/IwqaBkmgDalc=;
 b=R3QQzLiwT7b6q1jD39jeaodzDs9+HgFOEHeiIGpIdthqK1t4qWbNmhAAFcZ6e/FoLK
 ozv6P5fKJuSdZH+t6TCoN5OJCzpQteFSBvEtV/xNyC4ePpi9ZlLflDzhnvEHsxXHV2AG
 ISdPJHnkp5+Y7EmCHls8tB8GzSeAZH2jROvlbub0QjHSXMNkCuhyhOjn2tGcvTrifnFu
 lUkEEihQNRcVVVb4orwYGtLbmF+FW9ujXUy3hjEEaf6bjqHTNVSJI7uMDPYnBckwqzqd
 nE/p/lGDcrXS4S483kmVjpOC6fVLph6cMH3425Mc6RAA8QL9TQbtqdSMYpAs8UbPfE55
 MXWw==
X-Gm-Message-State: AOAM533kB+DiROrVQqIx7Ebj4oOn8t6rB08yD/fciH+BbBImYwq981NC
 UJxaVWupUbbln5A7qz1OkjcZSRCmLm5pa39uUdY9wTZM
X-Google-Smtp-Source: ABdhPJy8Donj2RXXrCPpBxHFBcPLatC+WoIZO3m5rKVx0CBCXabL5kvWhvQQXffJCqxmFkx5/e7jNqtYw+pp0K8Bo/0=
X-Received: by 2002:a9d:758c:: with SMTP id s12mr1263133otk.186.1644930411260; 
 Tue, 15 Feb 2022 05:06:51 -0800 (PST)
MIME-Version: 1.0
References: <20220215120625.64711-1-f4bug@amsat.org>
In-Reply-To: <20220215120625.64711-1-f4bug@amsat.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 15 Feb 2022 22:06:41 +0900
Message-ID: <CAMVc7JU3sd+h4A2R2-hScyLBJyo9Zb8SzLFapMsRdSwJ3KX_xw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] buildsys: More fixes to use GCC on macOS
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 9:06 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Few fixes to be able to use GCC extensions which are not
> available on Clang.
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   osdep: Avoid using Clang-specific __builtin_available()
>   osdep: Un-inline qemu_thread_jit_execute/write
>   audio: Rename coreaudio extension to use Objective-C compiler
>   ui/cocoa: Ignore 'initializer overrides' warnings
>
>  audio/{coreaudio.c =3D> coreaudio.m} |  0
>  audio/meson.build                  |  2 +-
>  include/qemu/osdep.h               | 21 ++-------------------
>  ui/cocoa.m                         |  5 +++++
>  util/osdep.c                       | 20 ++++++++++++++++++++
>  5 files changed, 28 insertions(+), 20 deletions(-)
>  rename audio/{coreaudio.c =3D> coreaudio.m} (100%)
>
> --
> 2.34.1
>

Compiler portability is always nice to have. Making QEMU on macOS
compatible with GCC is good, but I don't think that would justify
abandoning compatibility with Clang.

Regards,
Akihiko Odaki

