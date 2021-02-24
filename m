Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72BB323AFC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:05:08 +0100 (CET)
Received: from localhost ([::1]:48516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEryd-0003an-VP
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:05:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lErwl-00036j-AM
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:03:11 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lErwf-00064k-Us
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:03:10 -0500
Received: by mail-wr1-x42a.google.com with SMTP id v15so1464995wrx.4
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 03:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:message-id
 :in-reply-to:mime-version:content-transfer-encoding;
 bh=xm97YyC5DL1yFKCov0qNnos1ZXOGM8OcYyxp1IVEiI4=;
 b=DdkrA0OaE3oErJkNbzrLDvigMEum+t4Z1QXDjaKgiXNIA5XD48alrvytrh13mp01Ly
 Mxd0u6GnynNwZQjiPJD03R72ncmiQz3hpf6UPA3emQoVL/jugArCTkKXWaGJmkhYvnF1
 hAiO0Q8HvATqt2ugX8n2rFoiNBruG9+r7tbrbW+mqPkgSeLHKWzLHmdcOMTavLXPT2Ac
 SBApP0bUP4ftwEnWmRU7H8XTHizcrCfdAegn+ui4Q6ESpR4dETlaeefm4RHF+lFwKJWG
 n8ou73RdOeRTofz5uGSHm5jk302EYcK9bcdcZonZFwCaOpkB2l8tTMNZ2ySx/J0a7cSg
 FyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :message-id:in-reply-to:mime-version:content-transfer-encoding;
 bh=xm97YyC5DL1yFKCov0qNnos1ZXOGM8OcYyxp1IVEiI4=;
 b=R3pnvxRM9eWP10MNiM0qeAD1vyoEyt1rvmlTkFrMBKrsxEUl3guDe03gVsTAuhccXD
 dL1prSnKNwHIV6hIGZnZhXFzWnLa4Hjol8GJu45OaX+0Wuft0Sf3JNEMZW8wb1aF96lt
 VfUwtb+uo93l0u2Jchlc0H4h5b2ZxjUg9UGF/T4g9y50JaVz+5SMg7ssjsp6UaJq/8lL
 IEveEWGshr2RPj1sMkTVED4/OplruTH6DriqS5HOhVQTY8c5/+XtkhToEGtmY/DDqKJ/
 xQFOPoNqdKt5wdOMDw8g2TsRd0JwpAuW8e88OblSLLEwfSylwgbIebMJHTO9dSKETPYi
 zvdQ==
X-Gm-Message-State: AOAM532sZuTkNL90VRTYhhlAGotJ74QkNVzCWeFKyr9CHUbpG/7IWJTO
 XRWa1Dcai+Z2UaarakThEFRb4B8ZqdB+oA==
X-Google-Smtp-Source: ABdhPJwswjOMeQsxpmMedJ5Qx1KjsFrsABuZ2kFFhc7O7yua1zkEsSVbjFzPXkTuKk+Wf4JkdHkxkg==
X-Received: by 2002:adf:e68d:: with SMTP id r13mr30416558wrm.303.1614164581107; 
 Wed, 24 Feb 2021 03:03:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l22sm2959599wrb.4.2021.02.24.03.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 03:03:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A08E01FF7E;
 Wed, 24 Feb 2021 11:02:59 +0000 (GMT)
References: <20210223095931.16908-1-alex.bennee@linaro.org>
 <8d149371-56d2-9b91-5b2a-857237ae6823@suse.de>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH] docs: move CODING_STYLE into the developer documentation
Date: Wed, 24 Feb 2021 11:01:56 +0000
Message-ID: <87pn0pbuej.fsf@linaro.org>
In-reply-to: <8d149371-56d2-9b91-5b2a-857237ae6823@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 2/23/21 10:59 AM, Alex Benn=C3=A9e wrote:
>> There is no particular reason to keep this on it's own in the root of
>> the tree. Move it into the rest of the fine developer manual and fixup
>> any links to it. The only tweak I've made is to fix the code-block
>> annotations to mention the language C.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Reviewed-by: Claudio Fontana <cfontana@suse.de>
>
> Are there pointers in wiki.qemu.org that need updating?

The Contribute/StartHere wiki page redirects to Contribute but I guess
it would be better to move some of that content either to the devel
manual or the website.

>
>
>> ---
>>  docs/devel/index.rst                     | 1 +
>>  CODING_STYLE.rst =3D> docs/devel/style.rst | 6 +++---
>>  README.rst                               | 4 +++-
>>  scripts/fix-multiline-comments.sh        | 2 +-
>>  4 files changed, 8 insertions(+), 5 deletions(-)
>>  rename CODING_STYLE.rst =3D> docs/devel/style.rst (99%)
>>=20
>> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
>> index 22854e334d..ae664da00c 100644
>> --- a/docs/devel/index.rst
>> +++ b/docs/devel/index.rst
>> @@ -14,6 +14,7 @@ Contents:
>>     :maxdepth: 2
>>=20=20
>>     build-system
>> +   style
>>     kconfig
>>     testing
>>     fuzzing
>> diff --git a/CODING_STYLE.rst b/docs/devel/style.rst
>> similarity index 99%
>> rename from CODING_STYLE.rst
>> rename to docs/devel/style.rst
>> index 7bf4e39d48..8b0bdb3570 100644
>> --- a/CODING_STYLE.rst
>> +++ b/docs/devel/style.rst
>> @@ -641,7 +641,7 @@ trace-events style
>>=20=20
>>  In trace-events files, use a '0x' prefix to specify hex numbers, as in:
>>=20=20
>> -.. code-block::
>> +.. code-block:: c
>>=20=20
>>      some_trace(unsigned x, uint64_t y) "x 0x%x y 0x" PRIx64
>>=20=20
>> @@ -649,14 +649,14 @@ An exception is made for groups of numbers that ar=
e hexadecimal by
>>  convention and separated by the symbols '.', '/', ':', or ' ' (such as
>>  PCI bus id):
>>=20=20
>> -.. code-block::
>> +.. code-block:: c
>>=20=20
>>      another_trace(int cssid, int ssid, int dev_num) "bus id: %x.%x.%04x"
>>=20=20
>>  However, you can use '0x' for such groups if you want. Anyway, be sure =
that
>>  it is obvious that numbers are in hex, ex.:
>>=20=20
>> -.. code-block::
>> +.. code-block:: c
>>=20=20
>>      data_dump(uint8_t c1, uint8_t c2, uint8_t c3) "bytes (in hex): %02x=
 %02x %02x"
>>=20=20
>> diff --git a/README.rst b/README.rst
>> index ce39d89077..f5d41e59b1 100644
>> --- a/README.rst
>> +++ b/README.rst
>> @@ -66,7 +66,9 @@ When submitting patches, one common approach is to use=
 'git
>>  format-patch' and/or 'git send-email' to format & send the mail to the
>>  qemu-devel@nongnu.org mailing list. All patches submitted must contain
>>  a 'Signed-off-by' line from the author. Patches should follow the
>> -guidelines set out in the CODING_STYLE.rst file.
>> +guidelines set out in the `style section
>> +<https://qemu.readthedocs.io/en/latest/devel/style.html>` of
>> +the Developers Guide.
>>=20=20
>>  Additional information on submitting patches can be found online via
>>  the QEMU website
>> diff --git a/scripts/fix-multiline-comments.sh b/scripts/fix-multiline-c=
omments.sh
>> index 93f9b10669..c15a041272 100755
>> --- a/scripts/fix-multiline-comments.sh
>> +++ b/scripts/fix-multiline-comments.sh
>> @@ -1,6 +1,6 @@
>>  #! /bin/sh
>>  #
>> -# Fix multiline comments to match CODING_STYLE
>> +# Fix multiline comments to match docs/devel/style.rst
>>  #
>>  # Copyright (C) 2018 Red Hat, Inc.
>>  #
>>=20


--=20
Alex Benn=C3=A9e

