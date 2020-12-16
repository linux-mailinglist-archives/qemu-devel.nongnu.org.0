Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365172DC50D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:08:15 +0100 (CET)
Received: from localhost ([::1]:52754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpaHe-0007WI-6f
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:08:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpa0q-0002aC-53
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:50:52 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpa0o-0002mX-8o
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:50:51 -0500
Received: by mail-wm1-x332.google.com with SMTP id a3so3093612wmb.5
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jqVBo9wHFRKpQhPXb68Xt/ocbHSUWoZPL4MytMDcHhg=;
 b=bCkNd7OebbwD6ryC5XRVfTV6Irzz0NlNweoN87qq9dFje0qLnimPjgvFqyUhbXqKI3
 vCLkddvIGjhe29PnMXI/giSeJ9ARXQWy9voIeueuFLDbgyvnYjaGS1FCOM2WxtWqG5/l
 dYCjlmBGIfBIoAYGvAZlITkpQEFnbPj092eTRxzZe9exA7t6R9V6/f5asgz/x7ddXe5E
 12A8inWgT9bkF+tubNbJQZJ/COn+3vBpihO/l7ee93PSlmbHiNLywxvzos5gTGoy0G21
 1zVrPpxGmtn/3obJ7agCRWvIs+6J+NMGb/5zVEZk6dvIHo/T98RosXs93o9iDRnVuseQ
 AXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jqVBo9wHFRKpQhPXb68Xt/ocbHSUWoZPL4MytMDcHhg=;
 b=b9rZLwTNkvqc40ixmBA/ThT+AHQtAnqDpifKknXu6WafzPekcUIZBdACvb4G7QEpVm
 WJ/SDQZKxAjD9L5cl9gmS8no6t7OG+vBYreZjSc6lUMOJyid75BDCzMuxUH4ytpYbeKW
 h5iu+qQfvw9MaKUmipaRUaOPVaxnXy8935iHFrWXrbWoV9bbOmsxULQdRCjnjlumO5L9
 UYJxslHHg2laScV3ozRj9dsTb4o9fLRHfpB4ciHBxiucXkAWy1Go10uuKInA9p6DO0vt
 mf0t/c1b98p/BNRiM0uKP1nVNdSS3QrZ+bSUaS+YOoPkifXAYoLA+Uep3hGJo6cuBl8Q
 VTEQ==
X-Gm-Message-State: AOAM5305RE+/fRP1DiIwDwCUwRX+EYPptfVxgDw2VgVufp0deLal9CkH
 iOl2AbogRgkTW88QrkgIrUe5xw==
X-Google-Smtp-Source: ABdhPJwIIMRByfFDC9PEkqbmBmEq9WJaV1/eH41kjs4NzrfJHJET0n2wdRr8mzaIg072U6SNEL6Rnw==
X-Received: by 2002:a1c:2394:: with SMTP id j142mr4316840wmj.42.1608137448646; 
 Wed, 16 Dec 2020 08:50:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n12sm4016619wrg.76.2020.12.16.08.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:50:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B8DB11FF7E;
 Wed, 16 Dec 2020 16:50:45 +0000 (GMT)
References: <20201215224133.3545901-1-ehabkost@redhat.com>
 <20201215224133.3545901-2-ehabkost@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 1/2] test-char: Destroy chardev correctly at
 char_file_test_internal()
Date: Wed, 16 Dec 2020 16:50:08 +0000
In-reply-to: <20201215224133.3545901-2-ehabkost@redhat.com>
Message-ID: <87o8itsniy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Eduardo Habkost <ehabkost@redhat.com> writes:

> commit 1e419ee68fa5 ("chardev: generate an internal id when none
> given") changed the reference ownership semantics of
> qemu_chardev_new(NULL, ...): now all chardevs created using
> qemu_chardev_new() are added to the /chardevs QOM container, and
> the caller does not own a reference to the newly created object.
>
> However, the code at char_file_test_internal() had not been
> updated and was calling object_unref() on a chardev object it
> didn't own.  This makes the chardev be destroyed, but leaves a
> dangling pointer in the /chardev container children list, and
> seems to be the cause of the following char_serial_test() crash:
>
>   Unexpected error in object_property_try_add() at ../qom/object.c:1220: \
>       attempt to add duplicate property 'serial-id' to object (type 'cont=
ainer')
>   ERROR test-char - too few tests run (expected 38, got 9)
>
> Update the code to use object_unparent() at the end of
> char_file_test_internal(), to make sure the chardev will be
> correctly removed from the QOM tree.
>
> Fixes: 1e419ee68fa5 ("chardev: generate an internal id when none given")
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Previously I could get a failure within a 100 runs so I think the soak
test is good ;-)

  Results summary:
  0: 1000 times (100.00%), avg time 2.256 (0.00 varience/0.00 deviation)
  Ran command 1000 times, 1000 passes


> ---
>  tests/test-char.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/test-char.c b/tests/test-char.c
> index 953e0d1c1f..06102977b6 100644
> --- a/tests/test-char.c
> +++ b/tests/test-char.c
> @@ -1298,7 +1298,7 @@ static void char_file_test_internal(Chardev *ext_ch=
r, const char *filepath)
>      g_assert(strncmp(contents, "hello!", 6) =3D=3D 0);
>=20=20
>      if (!ext_chr) {
> -        object_unref(OBJECT(chr));
> +        object_unparent(OBJECT(chr));
>          g_unlink(out);
>      }
>      g_free(contents);


--=20
Alex Benn=C3=A9e

