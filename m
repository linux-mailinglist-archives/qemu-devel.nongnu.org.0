Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9492C281C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 14:35:17 +0100 (CET)
Received: from localhost ([::1]:46298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khYTU-00014k-8I
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 08:35:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khYRO-0008Vj-GB
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:33:06 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khYRM-00024r-C6
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:33:06 -0500
Received: by mail-ed1-x535.google.com with SMTP id r22so12227183edw.6
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 05:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ea9Bx84tPZpqvF8jSvAhuGS8At7ayjJGLh3NxOADTh8=;
 b=AjjaD0X2O8wmEQ+Wx5FeLlUAE4c5PSi4Jugwr80goXaBtBDLRiOeWhCMd2fL4D9Vi8
 ZcvCtKezjQWYY+BLfyVZTjc+k+fo3Obl8orMhgEJZy9GJiEMzXmJzF7Dn5UfYIImRib/
 Pp74D9JdHYXt0U+CTdOccPVGEwfnfr5XB9iPZKcS05TyyMSQmxPYzxVzM3sx3q2PS2t9
 J29UzDbcyGg/8DwSPGVxXsWknYjm+yXNE2npNWvPNo+7I9Oyo+tHS84oxFG6tfb7fRva
 TwfowewFGQZ8qchyu0YxnmiqYjzBBH5OKus+OgbcWgTbrKmlTqWcdjFoi9RqP48/xbO+
 B89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ea9Bx84tPZpqvF8jSvAhuGS8At7ayjJGLh3NxOADTh8=;
 b=MfstuDIBIkpV9T+HtNTI1bQ01/6ZpoIMCMCrfZL8y0PZoHAFgx7ZsmO6xT3ooaqOXM
 HkkpXn2CtyQ5VI+9SHCAoLAy4IwuVs9osKoMjRQdt8rpp/s/FNgOF83QuKyQhe9CKFnH
 uAVjklinmREh+8HUWrAQbZ5r1du4pIJ9C02SSXgJ3BRrI/hDxgtZBTUj29tzAlvgiHMC
 yw/q4bq5dNlO6Cr9MNU0aVY5JsGF7D/u3ec7qTWlkVQClrDzpYI7hs3GXk1olhxPHNp2
 ngwLOrsbL5JMfTZJUUxDWxk95r+nDXOQmyrODA6dZmhia97pM5oXkCeCE+dvs3Fy02BY
 5SvQ==
X-Gm-Message-State: AOAM5330XhZrU01VjGlX2x3ORBJKDfClAm5ZvVA3cswoQj7EbdQCZJ6H
 0pL8L9p+mczSh4R9JcXTIRWvJIV5LkMFF8Km3R5hDQ==
X-Google-Smtp-Source: ABdhPJx6QMaAmkJ8mxwT9JA4EbSdWUYMXa81kDrigh2u6Jvn26XCngB8Z5WgbYq/X9aogbVYE5+4G8jNEbKflkl7pIk=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr4118569edb.100.1606224781647; 
 Tue, 24 Nov 2020 05:33:01 -0800 (PST)
MIME-Version: 1.0
References: <20201124125235.266884-1-marcandre.lureau@redhat.com>
In-Reply-To: <20201124125235.266884-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Nov 2020 13:32:50 +0000
Message-ID: <CAFEAcA8cUpnA9bdp_MBe65YZe+6=avrczSO1=_Gc-gT6d+YVfw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Remove GCC < 4.8 checks
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Nov 2020 at 12:52, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> Since commit efc6c07 ("configure: Add a test for the minimum compiler ver=
sion=3D
> "),
> QEMU explicitely depends on GCC >=3D 4.8.

You need to be a bit cautious about removing QEMU_GNUC_PREREQ()
checks, because clang advertises itself as GCC 4.2 via the
__GNUC__ and __GNUC_MINOR__ macros that QEMU_GNUC_PREREQ()
tests, and so unless the code has explicitly handled clang
via a different ifdef or feature test clang will be using
the fallback codepath in cases like this. So you also need
to find out whether all our supported versions of clang
are OK with the gcc-4.4-and-up version of the code before
removing any particular ifdef.

Compare this previous (not-applied) patchset from Philippe:
 https://patchew.org/QEMU/20200928125859.734287-1-philmd@redhat.com/
which dealt with two of these ifdefs, one of which is
"clearly OK" and the other of which is "needs more analysis".
The path forward I think is along those lines -- we need
one patch per ifdef we're trying to remove, and the commit
message can then include the information about why in
this case it is OK for clang too (or switch the ifdef
to check for something else, eg one of clang's feature-specific
test macros).

thanks
-- PMM

