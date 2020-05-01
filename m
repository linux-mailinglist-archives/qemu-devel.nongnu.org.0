Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEA51C1DE8
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 21:32:35 +0200 (CEST)
Received: from localhost ([::1]:54288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUbOk-0004gj-NA
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 15:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jUbNh-0003ms-Aa
 for qemu-devel@nongnu.org; Fri, 01 May 2020 15:31:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jUbNf-0005n2-Ga
 for qemu-devel@nongnu.org; Fri, 01 May 2020 15:31:28 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jUbNe-0005hF-Ac
 for qemu-devel@nongnu.org; Fri, 01 May 2020 15:31:27 -0400
Received: by mail-wr1-x442.google.com with SMTP id g13so12619966wrb.8
 for <qemu-devel@nongnu.org>; Fri, 01 May 2020 12:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=GVigOjc7WbcFaD6+3bkBGFuI8NHRRREkHfYH7x4RLm4=;
 b=TqqqZFq+8fhBkW9LXJCkS6o3RlvqlYyRQl8w7KiHbgo6ZBCUA1YZvHvDV7kDyB+wk8
 iPhJmirzx4PSBG2moREolDTmTPOF84uP5+dxuaRZoeEMZYJ+viU2m0nzRn3dCZHKrpYg
 PP9kk4EHU5BGgSVITSV5dsyD0j049m0ZagRoCU5sm8DmDNbhP3788JB0fTsR/jbrR3Rk
 Q7UUcYXg1mMAlTVeZT7GqWPnb0BoNScya+tNddlFcmUSacp8bEVlyjzKAGARFM2dK5FQ
 16OMemdsUykeT2jzSp/jkoDJ81frD7jdbDp6/t9fQKNmvnw0GQc3wUwNYVaRr/TN0JV7
 xSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=GVigOjc7WbcFaD6+3bkBGFuI8NHRRREkHfYH7x4RLm4=;
 b=WKuTixJEPWqlKjHqe7fhO0H+k1eZkaqvqf1HIlBTRMFi1gv6GP0REpw5YsN8rHMHKl
 33BKJiHK0T4jQ8Yd+GvDj1irKDkh6Kt2vRkjzRK27oRiWetpiQljRsmKt0ds1fsq8wzM
 uLNwBG+RjCat6iGFtDSwlOx0jFq3i1UmXIkKnDES0Hn/71c0QMZieIJoO0pJu0LiRfJu
 T9fUj+fVOV8j/3W0DsdLKp8JIDclISdNip1njLcgONCT+haxWD643gK2rve8nq8uxtIG
 FjGtKf7mv28V604Nx3EtDqSfMKFfY9Y7njEdBIqq2ofIuEejUUz+JbqJrb4NddyReal7
 lKeg==
X-Gm-Message-State: AGi0PuZTUOymqeTfM1KLydVm66OGnEz0Z7NZmaDNAragcxgWeZcN5g8e
 wdc0u6QgC7N0PSozggNMbqUa+5Waxdw=
X-Google-Smtp-Source: APiQypIm7Ikugn87SAA1LV0fMn+TnJwDFhFku5oubXZ6hMBptFaJ7rPpWEyyl6zzKy+rP86ZJJA+jw==
X-Received: by 2002:a5d:4711:: with SMTP id y17mr3284223wrq.49.1588361484340; 
 Fri, 01 May 2020 12:31:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d133sm823018wmc.27.2020.05.01.12.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 12:31:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7166A1FF7E;
 Fri,  1 May 2020 20:31:22 +0100 (BST)
References: <alpine.DEB.2.21.2005010038260.30535@digraph.polyomino.org.uk>
 <87d07niidw.fsf@linaro.org>
 <alpine.DEB.2.21.2005011911420.26026@digraph.polyomino.org.uk>
User-agent: mu4e 1.4.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH 3/4] softfloat: fix floatx80 pseudo-denormal comparisons
In-reply-to: <alpine.DEB.2.21.2005011911420.26026@digraph.polyomino.org.uk>
Date: Fri, 01 May 2020 20:31:22 +0100
Message-ID: <87a72rih9x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::442
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Joseph Myers <joseph@codesourcery.com> writes:

> On Fri, 1 May 2020, Alex Benn=C3=A9e wrote:
>
>>=20
>> Joseph Myers <joseph@codesourcery.com> writes:
>>=20
>> > The softfloat floatx80 comparisons fail to allow for pseudo-denormals,
>> > which should compare equal to corresponding values with biased
>> > exponent 1 rather than 0.  Add an adjustment for that case when
>> > comparing numbers with the same sign.
>> >
>> > Note that this fix only changes floatx80_compare_internal, not the
>> > other more specific comparison operations.  That is the only
>> > comparison function for floatx80 used in the i386 port, which is the
>> > only supported port with these pseudo-denormal semantics.
>>=20
>> Again I can't see anything that triggers this although I noticed
>> le_quiet has been fixed in the meantime. lt_quiet still fails with:
>
> It looks like this test is only testing the separate comparison functions=
,=20
> which aren't used in the i386 port and which I didn't change, not anythin=
g=20
> that uses floatx80_compare_internal.  (That's apart from probably not=20
> covering pseudo-denormals either.)

OK - so these only turn up in i386?

I think then the things we need for v2 are:

 a) ensure we don't break the existing working TestFloat tests
 b) try an enable the previously broken tests for areas touched
 c) introduce some i386 specific tests to guard the pseudo-denormal
 behaviour

We have two tests currently (float_convs and float_madds) which
currently exercise the various combinations of limits and NaN types
using some common float_helpers.c support. Maybe extend it for have a
table of the various ext80 types and write a i386 only test case to
exercise the functions you fixed?

--=20
Alex Benn=C3=A9e

