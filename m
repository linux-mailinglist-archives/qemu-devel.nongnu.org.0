Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6903FB316
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 11:23:51 +0200 (CEST)
Received: from localhost ([::1]:46480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKdVq-0006R5-Ar
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 05:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKdUO-00055h-EN
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 05:22:00 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:42506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKdUM-0004IO-VT
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 05:22:00 -0400
Received: by mail-ej1-x62d.google.com with SMTP id mf2so29683631ejb.9
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 02:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qN+LdvBl/JfcO5FkgrNiRxHglp6yVoRRQ68UhbGdYg4=;
 b=TP6S+W1M9Ih5JbOwPTi012dE959N9GpUJq5pJajW6O/+nQkWNtiowc+kSCjVjVZ9ew
 YcAB72X3zqWVLqmioEFI+nc2AJQro4+bPNWzwazceb41L7c6J/fk+QaKdo8Aa8NUSrM6
 Olaqqe+iFKNmD0kX5K3HiE2INNOHBdDQrIxlqCQ9DGaYWqvXXY3kPiLZkEIrNwfteX7/
 AyolrVub/mDLVdPKYq1jsxGutgBrJHYmHXBUXxVje/ykLmYXy+rqf7vGzEfSzb1KbQeu
 BoKuI64yJ0h0Ja3jixmw3B1tgVVeuHd3/GkshD0rhnfNM3hweIRPuipZvUnNuqFLdMnW
 hxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qN+LdvBl/JfcO5FkgrNiRxHglp6yVoRRQ68UhbGdYg4=;
 b=BDAPUMVyIegHqlFg6qMr5bRAQnq2p+Nwzlc0hER4uNBmZzjkuuB5H3Vce908vLQo5G
 edMOhwjXujGIWq1NDFyIoh2J3Vs/n/EZb2NhsUpKEoUBn5pyiXK+UmMqpy6PE4CtJuak
 s57ilNTvb6xKjI13EhcPPuudI8YIDiK4+A/4rIRlHS71TDorHba5aNkhBw3wKhWs+KRa
 wbH54I1pzMW8t9hOh5vy+/e9aYIFYUQEOpsv25OltRp9isZl7Hmah7GjvzgNYNhEjkHI
 1hJeFUnDQhyxx8hj4PYj86CYcVaBNSjRi7KkWy/O82zVFxKz5636HeuXHbIYUqpYJTCG
 tYOQ==
X-Gm-Message-State: AOAM530gM2Hz2UIcMyOLCSyUbLXI41waNCDFMxmgk09nIKapZdgdZS31
 5RR/TC1CN4opre9RgCQH4cJL8+17NeZ5serhSAnVGA==
X-Google-Smtp-Source: ABdhPJxXKT35V9TDEIjrtlRZe+6ubBzDoyL0OA6uA/3TkpYkSrD5XYV9Ne6ALdxtXhWx5ED0eK9xOg91z+KZ19uR5q0=
X-Received: by 2002:a17:906:584:: with SMTP id 4mr24524412ejn.56.1630315317313; 
 Mon, 30 Aug 2021 02:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210829173210.39562-1-thuth@redhat.com>
 <CAMxuvawhwnwWRXAZOJj3SbtHXE8kC89=pHR+2-TD7ByLzoC_Pw@mail.gmail.com>
 <48ccdd11-5836-5886-f928-95c960fb810a@redhat.com>
 <0c4f5250-cb6e-a185-914c-f42c63d998e5@redhat.com>
In-Reply-To: <0c4f5250-cb6e-a185-914c-f42c63d998e5@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Aug 2021 10:21:09 +0100
Message-ID: <CAFEAcA-uiWBOfnhvNZSKmhbEp6h7qwP0tN4bcFz=Qjet8Fy7Yg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Use meson_options.txt in the configure script
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 30 Aug 2021 at 10:14, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> IIRC while Perl is perfect for parsing, the maintenance cost is too
> high. The git-forge / meson switch proved next-gen contributors are
> more at ease with Python.

That seems a bit strong to me. But I would say that for code where
most people touching it are non-language-experts who need to just
occasionally dip in to it to fix a problem, rather than spending
most of their time working on that code, Python is easier to
understand than Perl is. Plus we have more Python than Perl; so we
should probably prefer Python in new scripts for the project.

-- PMM

