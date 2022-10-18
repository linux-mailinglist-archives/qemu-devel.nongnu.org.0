Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD4E6024B8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 08:46:59 +0200 (CEST)
Received: from localhost ([::1]:35630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okgNN-0002Iq-6Z
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 02:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okfql-00014k-3J
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:13:15 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:45055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okfqd-0007De-7I
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:13:14 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so11497695wmb.3
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 23:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j+bPS0pT70tgEWnxITuyUQC9lQvPcgSkfOZuv2DumMQ=;
 b=GEv+AhCSBPgqQXAvm2zPwkYsZF760ZEWas5kyxZTVQKElaw3y+2Fg4W9Dg/B/S6ylJ
 u1yb2lyTtYnK4cHtBgjUtYZwblSZUMvCLXTHBCDCttY+2dduEA8DkdoHzypAZfcYNnrY
 DGRkgy72HvXMMiWlvkF5qW4/5qSWVBAYAs9EHhtySb1Q1X26dai9021Z6j8DamHHMaXT
 ENJcoc11vlyUAUihqQ5kGspekzRS3vlv7uqeGRAH2u1A3dxpGKsyJeG1V45ANnpITGUE
 BHd0K/zANr6aN4ccU0+snesjZ12+jnRJQHUJrHT+fe5t7qsaSuevE9q6/HmblgtsxtnR
 67kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=j+bPS0pT70tgEWnxITuyUQC9lQvPcgSkfOZuv2DumMQ=;
 b=3PlpkiSfx3RT7aWMWboYNW6/L4kuKY/nPmPdfLBZ9/ep4VDEgkrlFWhmdshdXG2u88
 74qPy4O2J1FoN/9+HQ6Lbc9dMdujXA5Xu2XaAvZ/aL2IkNaQSYPN0BXTh9+Wu4j8li6P
 VteRFe85SH4ZGr6lRl7qiwNvA5XEXU0aT++e6N0EZEHyg/TmK0ZgnP1Fbn9kYCZDLvuM
 WyOetMjwxOjinWRZxgd6br6HkvRjxNO3Lg4/BWltsLVdap0RqKhXdrqIe6uCKOn1auko
 nxXg7s9lzcAtDv9J96mV3kq4Vmke/20Zz1W/hymZYOPHeTMyl6W3SdSlJFJCTU10Whna
 7LpQ==
X-Gm-Message-State: ACrzQf3KyGvgnGWUTLHp6JLFbFf8QKqTGN5vKEFp0U15cDGIiFhmA1Q4
 CWlMTjRXfl9vfvg+2aDlXZ8tag==
X-Google-Smtp-Source: AMsMyM5AnNy6VLyXke6SxAk4aKpDsHoiKS6fn4emMkk9FB9qe2hgG9boy4H5kPCxbcspw5yrt8mD2Q==
X-Received: by 2002:a05:600c:1d95:b0:3c6:fc59:5ed0 with SMTP id
 p21-20020a05600c1d9500b003c6fc595ed0mr692822wms.21.1666073584048; 
 Mon, 17 Oct 2022 23:13:04 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a5d6e82000000b0022ccae2fa62sm10041923wrz.22.2022.10.17.23.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 23:13:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BD6331FFB7;
 Tue, 18 Oct 2022 07:13:02 +0100 (BST)
References: <20221015211025.16781-1-chrisfriedt@gmail.com>
 <20221017134425.jbqvtccg5w4yej5g@mozz.bu.edu>
 <CAFEAcA8Cc+XtwcQz3bJom2=MgYZgLHw8SO6uqQQdVN4aqpq4Hg@mail.gmail.com>
 <87czaqe55s.fsf@linaro.org>
 <84F27875-816B-4E87-8D8B-E57852185512@meta.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Chris Friedt <cfriedt@meta.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Alexander Bulekov
 <alxndr@bu.edu>, Chris Friedt <chrisfriedt@gmail.com>, "jslaby@suse.cz"
 <jslaby@suse.cz>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [v2] hw: misc: edu: fix 2 off-by-one errors
Date: Tue, 18 Oct 2022 07:11:28 +0100
In-reply-to: <84F27875-816B-4E87-8D8B-E57852185512@meta.com>
Message-ID: <874jw1ek29.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Chris Friedt <cfriedt@meta.com> writes:

>> On Oct 17, 2022, at 1:22 PM, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>=20
>> =EF=BB=BF>=20
>>=20
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>=20
>>>> On Mon, 17 Oct 2022 at 14:50, Alexander Bulekov <alxndr@bu.edu> wrote:
>>>>=20
>>>> On 221015 1710, Chris Friedt wrote:
>>>>> From: Christopher Friedt <cfriedt@meta.com>
>>>>>=20
>>>> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
>>>>=20
>>>> As a side-note, seems strange that edu_check_range will abort the enti=
re
>>>> VM if the check fails, rather than handling the error more elegantly.
>>>=20
>>> Yes, this is bad for a device model, though we have a lot of
>>> older device models that still do it. The preferred pattern is:
>>> * for situations which are "if this happens there is a
>>>   bug in QEMU itself", use assert. hw_error() is a kind of
>>>   assert that prints a bunch of guest register state: sometimes
>>>   you want that, but more often you just want normal assert()
>>> * for situations where the guest has misprogrammed the device,
>>>   log that with qemu_log_mask(LOG_GUEST_ERROR, ...)
>>>   and continue with whatever the real hardware would do, or
>>>   some reasonable choice if the h/w spec is vague
>>> * for situations where the guest is correct but is trying to
>>>   get the device to do something our model doesn't implement
>>>   yet, same as above but with LOG_UNIMP.
>>>=20
>>> Probably most hw_error() uses in the codebase should be
>>> replaced with one of the above options.
>>=20
>> We should probably document this best practice somewhere in docs/devel
>> but I guess we really need a "guide to writing device emulation"
>> section.
>
> Should I make a separate PR for that or attach it to the existing
> series (at v3 now)?

I don't think improving our developer documentation needs to be part of
this fix. However if you want to take a run at improving it in a new
series be my guest ;-)

>
> Thanks,
>
> C


--=20
Alex Benn=C3=A9e

