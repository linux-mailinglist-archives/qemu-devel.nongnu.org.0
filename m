Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A3033F5C6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:42:30 +0100 (CET)
Received: from localhost ([::1]:47902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZFd-0007e7-EQ
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMZ1g-0006gE-7j
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:28:07 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:42251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMZ1Z-0002pS-SL
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:28:03 -0400
Received: by mail-ej1-x630.google.com with SMTP id c10so3571675ejx.9
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 09:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=dVcupL0ln5ZU+HxjYFRHM/+Sdx/teNRasSEqqfuDpGk=;
 b=KiWfmNeR2ZfxLGlsEKJBThX/8/eZhiBIBsj6gmTFqzj9ySBI4abV8x7FBJ3WreHsEe
 XWOMwg2NxT80OHX+zl6hBoKyNNxp1mdNBpr+0vldmLDTkyL4wqbq6TA0E5p+XutxAXDO
 +rYb4+xYS7mV6BI8qvzr18NHrDjBMm8pzF1PZay8Lz/Tkp3gofhDNy2oV1f19htZVVTx
 WG5h9CoDELMtihQpGPge3f+2rwXH/ZPeaoGeSWGWFs98ZmWKNUp+kemnOOZZOgHtNlBx
 Pp+xXxS7gd/LihRqQXEecZ4820nEFpX1nLC/BhYUajuM57gBkNbwEVbaHiuOsIdQgokw
 zUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=dVcupL0ln5ZU+HxjYFRHM/+Sdx/teNRasSEqqfuDpGk=;
 b=eeNT+Cj0xmXPuQX3cmhw46u/FpGbPh1FnhimxOeeikejR35e8mrNZs9hNcOictx34m
 YrUNbp+lhBg0Y3+0+uMrf3sNSnfUVAYrTcJLihOFJkcVm9akcC8LZcBsmNJJH8fesD1D
 sv6rxwz/+8WdrH0+If6uNdXCOkR/3DnjoBvwe5abqD0yy3sglHBdEiDw2avx/KbN5Oo8
 aELE4DeD6Onblt62BDTmCm4RvEtQgcMXNQmwhG7rrWoRHWR11Mh2WcQpz0AknWpJHya1
 PviSHIyg51hT8ThlxiHNPbZH8hj3tL4z7X3TFxhyC47d7S/xv5+f8YACUv3Sr5D/q8Or
 YqjA==
X-Gm-Message-State: AOAM532r64wozVYCMtRK8JxvHmCw1pvIM98oR4eTvRXWbHOEycVvz5VJ
 GlMlv0AwzEZ9VYZmggmVSTCjtg==
X-Google-Smtp-Source: ABdhPJyEdIOHZaGCtT+KJYi1y8SbVTeOUYvvc8UfJ1rqBEJiqtCF57+AuO9FUepZbSnxELDQEmkaNQ==
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr36503226ejg.482.1615998475073; 
 Wed, 17 Mar 2021 09:27:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z9sm13833199edr.75.2021.03.17.09.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 09:27:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2A6751FF7E;
 Wed, 17 Mar 2021 16:27:53 +0000 (GMT)
References: <20210317110512.583747-1-thuth@redhat.com>
 <20210317110512.583747-3-thuth@redhat.com>
 <CAFEAcA89BmZ7_d73Te=DXxDNc+W4NuqXZgpoi9JwsMN0_nh6pg@mail.gmail.com>
 <61029024-17cd-41df-a9d9-ec3323654d76@redhat.com>
 <YFIANJSi+FtVRYQY@redhat.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 2/2] cirrus.yml: Update the FreeBSD task to version 12.2
Date: Wed, 17 Mar 2021 16:24:35 +0000
In-reply-to: <YFIANJSi+FtVRYQY@redhat.com>
Message-ID: <87blbhd9ti.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Mar 17, 2021 at 01:44:05PM +0100, Thomas Huth wrote:
>> On 17/03/2021 12.16, Peter Maydell wrote:
>> > On Wed, 17 Mar 2021 at 11:09, Thomas Huth <thuth@redhat.com> wrote:
>> > >=20
>> > > FreeBSD version 12.1 is out of service now, and the task in the
>> > > Cirrus-CI is failing. Update to 12.2 to get it working again.
>> > > Unfortunately, there is a bug in libtasn1 that triggers with the
>> > > new version of Clang that is used there (see this thread for details:
>> > > https://lists.gnu.org/archive/html/qemu-dove/2021-02/msg00739.html ),
>> > > so we have to disable gnutls for now to make it work again. We can
>> > > enable it later again once libtasn1 has been fixed in FreeBSD.
>> > >=20
>> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
>> >=20
>> > Is it feasible to make configure check for "is libtasn1 broken"?
>> > I guess since it only shows up as "when you try to use it
>> > it fails" that would be a runtime check rather than compile
>> > time, which isn't really possible :-(
>>=20
>> I don't really have a clue about this crypto stuff... Daniel, Stefan, Ro=
man,
>> Christian, Eric ... you debugged the original problem on macOS, do you t=
hink
>> it's possible to add a check for this libtasn1 problem to our "configure"
>> (or meson.build file)?
>
> It is tricky because the flaw is not specific to the version of
> tasn1, rather to the combination of tasn1 and the compiler used,
> so there's no simple way to detect it statically from configure.
>
> If don't want the big hammer of disabling gnutls, perhaps adding
> a flag to disable tasn1 would be simpler, as that would only
> disable test suite, and no actual QEMU core functionality (which
> is all working fine)

I suspect we'll forget to remove this flag as well when the time comes.
Without adding new things I think this patch would be fine with an
additional comments:

  # --disable-gnutls until libtasn1 is fixed in FreeBSD (#ref?)

>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e

