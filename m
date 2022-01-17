Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4CE490C46
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 17:13:44 +0100 (CET)
Received: from localhost ([::1]:46292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Uda-0000HP-27
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 11:13:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n9UXg-0006Km-FY
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 11:07:37 -0500
Received: from [2a00:1450:4864:20::535] (port=45770
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n9UXe-0005oW-Rj
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 11:07:36 -0500
Received: by mail-ed1-x535.google.com with SMTP id z22so67655550edd.12
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 08:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=dDsylYSYZOSLxDRoA0N8sJqQb8ERfXcJtm4+YyEt1Ik=;
 b=mstqM8VtId++MVnpYodU0k5dtlrWP+DXK//0rA2KGRCa+DqCu/hujxhHZV1lGcNd0B
 saBlra5GzksY1DpvpX8obASYEAJr0ITou38zfdZVYmIB4YIkfPq0ctNxvLE+dldNiy6u
 eMzGz0XHhWW3QMrh5t132tRT8QjVWA8vOFfjJlRVNadeqeSZs27ltTOvuAEpYT+CuQDU
 7NP1fi3A4hXaxPevjbJYPoXR5yceNnvXg8kJlxakqiU9lTJibKlnkftUFtW+3kEKJ+XQ
 mBI3BB/8OkSE4CUicJQXGVWpNylq4CzvJc5R+7n+8GzuNMvCeMN4INvh5Kp72UjamFj3
 GUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=dDsylYSYZOSLxDRoA0N8sJqQb8ERfXcJtm4+YyEt1Ik=;
 b=DZR2LNhfaOYfMH+IHmDnJ/cQ0tFriaQ5JkP+Ka5IkpPzgv+OfLzlw12vTS0sb46IcC
 0swc2qF7C3ez6f0mmUjHANyNRSjdgGbsM19nFPkFghGl2hVFn1jBeKIfIcz1Miq4XOET
 AmRJJBNg70cNZ6b3otBTHpKwFkIKaO/x3K6fO/zM4ZutUQQ/s2Rlg9+XpdRNfSEtwnsX
 yn3vr+3Uwyo3WjdyvVR+TOOES0z/jJ+bsB2jEAvofWFp6eN55Wnd+BE0tsUjTjmogDM9
 +poPXOLdQYlhXbU14it+EPBT/D9d/Egj/TeO5CUDc8Tjjs9X0W6+et1AkI1YzYC18xII
 jnSQ==
X-Gm-Message-State: AOAM5337DZtWuEKhR5bh7MFa0aYSWrKh6iU+odn7+G9Zc8EHE8j10mDd
 D6AjUbZykAtlY+uPl9Jo8M4Cdw==
X-Google-Smtp-Source: ABdhPJz1JCNuNLqZKTws09SNPIQ/zG/kb4q1YUeYlwAFUcyrrzCaVwr6PZJnRzaWUBOgg3B3EuwShg==
X-Received: by 2002:a17:907:e86:: with SMTP id
 ho6mr8593028ejc.296.1642435653337; 
 Mon, 17 Jan 2022 08:07:33 -0800 (PST)
Received: from smtpclient.apple ([79.115.178.1])
 by smtp.gmail.com with ESMTPSA id e17sm4549013eje.218.2022.01.17.08.07.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jan 2022 08:07:32 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: ui/cocoa.m compile error (Cocoa -> SDL)
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAFEAcA8aMc40ea=F1P7vHHeNF=rqE+B=sz+6QdzrOWGwZU7W6A@mail.gmail.com>
Date: Mon, 17 Jan 2022 18:07:31 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <E7A03D00-4F6F-4DC8-A8E5-84D0E13A79E3@livius.net>
References: <586FEC07-844C-4E1B-88E0-93B97FFC9010@livius.net>
 <CAFEAcA_=jn1G==9R1=LuU7GF0=LWPz92f1Qx9xO7w+m+TqL1Tw@mail.gmail.com>
 <F140E9AC-F44C-44A9-8670-F60E33046B83@livius.net>
 <574D1950-B892-430B-A450-23262C258950@livius.net>
 <ef5e98d4-d8b2-fc6e-2735-53c075db3f3b@redhat.com>
 <CCB6E84E-5F90-4FC6-BEEB-42A7C591BDBF@livius.net>
 <CAFEAcA9sNksi2=xiFUp_r0_NeCuUKXYU6sd1LDvX=j0+Mh3gYQ@mail.gmail.com>
 <3DE1FD39-B0F7-45D2-BC44-66D9B0533057@livius.net>
 <CAFEAcA8aMc40ea=F1P7vHHeNF=rqE+B=sz+6QdzrOWGwZU7W6A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::535;
 envelope-from=ilg@livius.net; helo=mail-ed1-x535.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 17 Jan 2022, at 16:06, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> This is newer versions of macOS being stricter about enforcing that
> some operations are only permitted on the correct thread. Older =
versions
> let QEMU/SDL get away with doing them on the "wrong" thread, which
> all happened to work.

Ah, right, I remember this gave me a lot of headaches when I added the =
animated LEDs to qemu-system-gnuarmeclipse, and in the end I had to =
rewrite the SDL code to guarantee that graphical updates happen only on =
the main thread.

> It looks like it's "code would need to be updated to fix the
> problems that newer macOS complains about", which nobody has done.

Later this year I plan to add animated LEDs to qemu-system-arm too, so I =
might face the same problems again.

If you think useful, I can contribute the patches back to upstream.


Liviu


