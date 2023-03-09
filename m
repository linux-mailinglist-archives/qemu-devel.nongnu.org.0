Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ED66B2B34
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 17:52:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paJUo-0006pl-RQ; Thu, 09 Mar 2023 11:52:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paJUm-0006kv-Ek
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:52:00 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paJUk-0007bx-Ii
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:52:00 -0500
Received: by mail-pf1-x42e.google.com with SMTP id z11so1914602pfh.4
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 08:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678380717;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3AdBrpYUNb9YE9gSRgGj2dY9q0E0lre0B1jGk5Z3LAo=;
 b=DWySdkHUDLkjaT97/uTdYxl+cVdKe7t/aUJ/QT5niZPXVytg2hrmZDrmxHj5OtjO2t
 gSt22ir9Rucb8BHqgqoaeoxPxayVfI5+s6PQObaUVy/fb8JvyQxSSILWnyb0mM0m+mCv
 R01MI8SdEfr4UGdIYEHiUqOZQb3t62APtpo/yBcrrekfU8Tv9dygMJgTzp6kt7gyOaNM
 641pIPJWwuGAJ1yETdG2a/9HzIVHFc9pfN6BszCuXtAHHxYuLIDCIvQ/VBu+ADo0Jy39
 AieE8EYqYujvXowftOhETO0tlN/PaUYIaZwKw9TcRk5rEd3Qg10w7BfllyJ7wBV3ZNxg
 m7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678380717;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3AdBrpYUNb9YE9gSRgGj2dY9q0E0lre0B1jGk5Z3LAo=;
 b=n6TPrBQWahm9oANzVt25ZbrQEnse9MfXYYwioC4BavjJSgAAacvbQ62xBltTTe0+Sf
 l7zALCk5jKAHdWoGz+/weOWUY5u+jhNsyeUkBUINABuTmKrCU0qoA3+LN9DiZ00EfY8p
 IeDili/QvjPAuV59QVBl13UCBd2vi5+Rj3+7AauR/0XJHawRngK+iEmY/2Xslt6/iVN4
 L7lZSIbVjr395xsr5e2APpezL29aVtg1nz6GC8+D8JhobkFIHPzAu3Hewm4O9TBErZNG
 G3Pq5GxC7Cu0LpQqukqTePN1EYlSDxVZe7oNsgWdXwAkY7JfeoH/swsIwFy45uNnH0dt
 +TUw==
X-Gm-Message-State: AO0yUKVGI1c0nCenCC4XnlFbWyysQkrxaAX1m3b8VZ8H9hFBIx8L6M4w
 ye7SfC20pzKv5+PvWRZyrl8hvYE82FEpDWbBXfkPHA==
X-Google-Smtp-Source: AK7set+xXKLzwj6PgfK2g5P8FDELZffNEQ64+FIVZURGsYhFKB5k3Q2bqoJRzpx6HnTisxXGSnNpMH7QjKa1llolCS8=
X-Received: by 2002:a63:9c0a:0:b0:502:e4df:5f3f with SMTP id
 f10-20020a639c0a000000b00502e4df5f3fmr7353917pge.6.1678380717142; Thu, 09 Mar
 2023 08:51:57 -0800 (PST)
MIME-Version: 1.0
References: <167821508699.619792.1719671327865445814.stgit@omen>
In-Reply-To: <167821508699.619792.1719671327865445814.stgit@omen>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Mar 2023 16:51:45 +0000
Message-ID: <CAFEAcA-by=GZQWO2-rwfMzZAWobQXz6hDsnTsKcY5RdVBUW0_g@mail.gmail.com>
Subject: Re: [PULL 00/17] VFIO updates for 8.0
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, avihaih@nvidia.com, clg@redhat.com, 
 joao.m.martins@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
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

On Tue, 7 Mar 2023 at 18:52, Alex Williamson <alex.williamson@redhat.com> w=
rote:
>
> The following changes since commit c29a2f40cd5d1fdad4632b48343cd968db041a=
44:
>
>   Merge tag 'pull-target-arm-20230306' of https://git.linaro.org/people/p=
maydell/qemu-arm into staging (2023-03-07 09:58:43 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/alex.williamson/qemu.git tags/vfio-updates-20230307.=
1
>
> for you to fetch changes up to 969dae5448eaa2914be5b974f9e0311b3f95ee2c:
>
>   vfio: Fix vfio_get_dev_region() trace event (2023-03-07 11:19:07 -0700)
>
> ----------------------------------------------------------------
> VFIO updates for 8.0
>
>  * Device level dirty page tracking support for vfio migration, as well a=
s
>    various cleanups and consolidations. (Avihai Horon, Joao Martins)
>
>  * Trivial cleanup of migration entry points. (Alex Williamson)
>
>  * Fix trace event typo. (C=C3=A9dric Le Goater)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

