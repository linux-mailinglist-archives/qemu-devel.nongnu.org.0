Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD986B4F5B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 18:48:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pagqU-0000f9-N8; Fri, 10 Mar 2023 12:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pagqS-0000eY-H3
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:47:56 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pagqP-0000u0-My
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:47:56 -0500
Received: by mail-pl1-x62d.google.com with SMTP id i5so6430993pla.2
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 09:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678470472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mHuLcW6CZXp2/G/8uZuBsbRnSfvMp9s/ev/CpMxHZxQ=;
 b=NQ5d4Eo76GkedUQMuZrll6ChJUhe8z6xVM7d/HFQV4PBgtu0aEL0jQNRgwFAsCehQy
 dKG5jtmzZcM3biU7DuCchIyeHoeGTwn70YpqUul5FPIN8yzucR/y1mKVLzbqortIr2dj
 MnGosMM0DlkrBqxKPO47RWFUq8IdFLWnFjJJrMwuffVM9kLXb2a2ARC5ychDq2FP+int
 izqOBEwJywho2ryHbhqf9QCOCLAbQZYZ9bxCCQ2KWltGsCOrJFhtBBc+H4D+8qGK1kC7
 260PzE1ds/SXHKVeABIxeuc5eoDb9MA+O45AsfT6LkrMB6WFwBJy5L00MPvTLcYxze/k
 v5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678470472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mHuLcW6CZXp2/G/8uZuBsbRnSfvMp9s/ev/CpMxHZxQ=;
 b=aKN1IJFKiZPhxUsBQZX65KXq8O7NrlFUBDYTzKErq02P5ErOY0MwbVk6gmpCqdJef3
 a6dkxAy4ERmp9LQ90G9VtRt5mcip376FYg8Tqwh6JO/gllWkwVdtRL7ne76oCaGht9eX
 aUnTysa2xccIFnsr3UUfkA24ruPSdQfD/aERFqrIidocaQdF4K1x664vrDMWl1+c5A9z
 VwvQYMi9GdkFZbU7m2uIjt6vmef0UtnDSfMVH/1d+hfG1lS7uPaCu+BUQ/EH0OnX7ukp
 aESTwi3EhM83k/QaNIxG4KN6Pql0ZR2VZWlOlJGoGeuIwp1X8LUlZnt2NDO9PzxSxVLt
 Zoww==
X-Gm-Message-State: AO0yUKWaos5MKsaIFWz5GQhGOFDoBMJXToq67zs1lJ9PdvNund71samc
 YKHXaMP08LdMjuKRMrQ1cX3orowoikNZ1WnvizrgmQ==
X-Google-Smtp-Source: AK7set/jslrXIKNTCbdQtVQtE4rxyAgOIAwvvA+PjcLOJG5yCaazrNa84XoIom/22PAtpr2keNE1KSAh/rey1vcmaK0=
X-Received: by 2002:a17:903:1243:b0:19a:b151:eb83 with SMTP id
 u3-20020a170903124300b0019ab151eb83mr9865747plh.13.1678470472141; Fri, 10 Mar
 2023 09:47:52 -0800 (PST)
MIME-Version: 1.0
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
In-Reply-To: <20230310103123.2118519-10-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Mar 2023 17:47:41 +0000
Message-ID: <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 10 Mar 2023 at 10:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> You need a very new gdb to be able to run with pauth support otherwise
> your likely to hit asserts and aborts. Disable pauth for now until we
> can properly probe support in gdb.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

If it makes gdb fall over, then shouldn't we be disabling
the pauth gdbstub stuff entirely ? Otherwise even if our
tests are fine our users will not be...

-- PMM

