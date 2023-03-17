Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1C96BEFA2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 18:27:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdDqm-0001ok-S1; Fri, 17 Mar 2023 13:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdDql-0001nQ-Gd
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:26:43 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdDqj-0002ds-Vt
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:26:43 -0400
Received: by mail-pl1-x631.google.com with SMTP id k2so6024734pll.8
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 10:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679074000;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5pcs5rVYYWTe1wsOB9ATbEmtsmSIbU5zUtrKNqRUMnQ=;
 b=SrJWeBSPWydRGoa15c33zsI+mNdxjSBmmiHrWu3nZfAMzSP6dkKFdLvRGdz2mZE5tx
 igN1CR10p1nLPYZ3kGRJBWt195ZhIEv+Gi5KM9AMPF/5LEqPGriZNrqYrb7um/RDaBkR
 6rz/5IrToRLBxQfFfulTs29W+InF05+oGU7GyNY/KLQyDA8a6TWB/8+ESGCPg5veFcWP
 Cxc4VsjTANFeGY4BQ8mrXJVv6pgisrQ9got6wuuujmTvpXVKIwG47NETbd5lp1KdPSSZ
 kdXBxSWU9o5ACT6UrG5gQ/M895VKh/rbmXIX8YNmE5L37FZ4+Pa2fi0TG9oV7M6kYJnc
 KULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679074000;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5pcs5rVYYWTe1wsOB9ATbEmtsmSIbU5zUtrKNqRUMnQ=;
 b=SmqY+pQNMGkw+p/vEUS4tZE75KVKnZSP9eYnRcRzO6MQHO9dQaCPI8LEkyg7wbBc4M
 jH6nC23LccvFX//hfZ3OStD+/Wxt9ka2I8d7FseVa0xk+d8kq1GhkD2YIJm2uwc/GmOI
 kbZevxbYZThKwYLI4hyGUlKWP77EW0hysf3w/U8sTjGoL2Q/VMNIv4Oslryg/Hi7G7g8
 4fPZWq88i/5Y99b1koDce0OBbSCBONS8Qgca4zSWqoB3EeEYOZNyDQxYwI1C1wvqp5At
 chVmpjKxtXrZ2sR/yAzahlGi6zVAsKRJ3zxcNvTRO1fRgKC/2pOxH4uC8bdwoP1yAuZM
 eZPg==
X-Gm-Message-State: AO0yUKWMcIxqTe5k0a+XytjJ25fbn13o4FeIY7MkZo7H8xaUjhjfkQcA
 GqB+OX/O/+szvCJLN8Rk78b+2sYrsQRq0XEIeZDMXg==
X-Google-Smtp-Source: AK7set/FX6uHPZzkdm2rj6m+WnLJQrvP8NuuqcuC/2JWBLVt/kVuZ64qZhDLriL8YOzL8aANKLe2WkhUDBMtTk/qF3o=
X-Received: by 2002:a17:903:234e:b0:19a:5953:e85c with SMTP id
 c14-20020a170903234e00b0019a5953e85cmr1582123plh.1.1679074000396; Fri, 17 Mar
 2023 10:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230317165057.1522743-1-peter.maydell@linaro.org>
 <87ilez70mt.fsf@linaro.org>
In-Reply-To: <87ilez70mt.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Mar 2023 17:26:29 +0000
Message-ID: <CAFEAcA9qt9UToEjX7r2MWCLZ3i-zyPPgQHFvFUyLXCHF6QUKXg@mail.gmail.com>
Subject: Re: [PATCH for-8.0] target/arm: Don't advertise aarch64-pauth.xml to
 gdb
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Luis Machado <luis.machado@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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

On Fri, 17 Mar 2023 at 17:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > Unfortunately a bug in older versions of gdb means that they will
> > crash if QEMU sends them the aarch64-pauth.xml.  This bug is fixed in
> > gdb commit 1ba3a3222039eb25, and there are plans to backport that to
> > affected gdb release branches, but since the bug affects gdb 9
> > through 12 it is very widely deployed (for instance by distros).
> >
> > It is not currently clear what the best way to deal with this is; it
> > has been proposed to define a new XML feature name that old gdb will
> > ignore but newer gdb can handle.  Since QEMU's 8.0 release is
> > imminent and at least one of our CI runners is now falling over this,
> > disable the pauth XML for the moment.  We can follow up with a more
> > considered fix either in time for 8.0 or else for the 8.1 release.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Queued to pr/170323-for-8.0-1, thanks.

I'll take this via target-arm.next, so please unqueue this one.

-- PMM

