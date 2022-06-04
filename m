Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A03653D624
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 10:38:53 +0200 (CEST)
Received: from localhost ([::1]:46486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxPJ5-0002M9-NG
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 04:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nxPH0-0001U4-Bn; Sat, 04 Jun 2022 04:36:42 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nxPGy-0003yq-J3; Sat, 04 Jun 2022 04:36:42 -0400
Received: by mail-ej1-x631.google.com with SMTP id n10so19970544ejk.5;
 Sat, 04 Jun 2022 01:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=Ro8NhecavwgSq1vQjcWquelJzViA9emsGz4dt61HhBE=;
 b=YTXjmMN7FssH9I8tbqAYW94NXfauMAhQC/a2/DnXSRI+4hE72qz+Tvf9a7aJ76yfm7
 w7gLs0a1Qb94EfEBs/kA2lbpkxYHPCX2K5oaN2BPl8z/9Voh91RKscALICqbooUAf8nO
 AwQwo08jauKgykUWYkF30NsnzLUNdu/hbe0w2wdR599+jPkmDU4BT7aSHl5NU+rZq+6O
 IiMtjrmCpUd24BAhifcfCY/t/V1lvyP7z9FegQbfkTLx9dcCF86ZxSLJpyw/a4b1vErO
 qW46scp7/LxbZa6y8mTxrCDYbC7ERXprGGLhYdZKKvQHlLtLBiPwg4a9w+ZMVgq+bH95
 ncNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=Ro8NhecavwgSq1vQjcWquelJzViA9emsGz4dt61HhBE=;
 b=8JPjPyYI51zMCizyQV/9rZbZt0cnIBvZIpJhbcfg5+hjoltPKj68n/GQhBec6FnBRv
 h/A6Smf56J2hiKfllu937NfT7LMIxYeu6KdhxjCZE2XDDSP2lXe5hBUsyKGEhpoW/op6
 VTZUP03nHir1AOYfn8dXI29zkZWW8P6j6jmAHaNmWi+uNZ4VFmUK8l0YU20h0vqo/Fjq
 3yKX9s0baq00vL3b7kAXELdJX++JXO9reuP2v5nARRhSkHbIfBbkQvbP9NZm264kCm4C
 m7GYZ7Lc4XK9dABhXEmxHwrN/2UlWbF0GeIZK+w8O42N1sWGcG67EtRSzJ/NO1XADUlk
 7iFA==
X-Gm-Message-State: AOAM532IYcvE29KzzVrU4MtKpxQEAP7L5YEIFgdRWLs12Dg/8CrgfCnL
 2EjB2k/XdZilmeAl/1hbMyI=
X-Google-Smtp-Source: ABdhPJxGCJKFtZm0dem1cn8Cq+k2yNe9xd4Ke69q2TJxcJRRPpqX6HzXOqsSwu0ako+I03fMysCriw==
X-Received: by 2002:a17:907:6e01:b0:704:8c0e:872f with SMTP id
 sd1-20020a1709076e0100b007048c0e872fmr12257627ejc.387.1654331798298; 
 Sat, 04 Jun 2022 01:36:38 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf303d00888d60a7ef49014d.dip0.t-ipconnect.de.
 [2003:fa:af30:3d00:888d:60a7:ef49:14d])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a17090791c400b007109b15c109sm561772ejz.66.2022.06.04.01.36.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 04 Jun 2022 01:36:37 -0700 (PDT)
Date: Sat, 04 Jun 2022 08:36:34 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Subject: Re: [PATCH v3 0/7] QOM'ify PIIX southbridge creation
In-Reply-To: <c5fd32b5-fe22-a55b-de06-a6eac908bca2@amsat.org>
References: <20220528192057.30910-1-shentey@gmail.com>
 <110e160e-19bd-dd7a-1b4e-1a0e7437b782@ilande.co.uk>
 <ac5d95b2-8be5-1585-3076-deabe749e926@ilande.co.uk>
 <CAG4p6K7DzHVsp8425-O4uvb46XT9nzw-A2CK_jK8Nm+Xt8wsbw@mail.gmail.com>
 <5ef86c6c-719b-f197-3ccb-462e453dffa5@ilande.co.uk>
 <c5fd32b5-fe22-a55b-de06-a6eac908bca2@amsat.org>
Message-ID: <E6DD9B48-0529-4BBF-96AD-16CFCC33ED75@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 30=2E Mai 2022 19:45:26 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <f4bug=
@amsat=2Eorg>:
>On 30/5/22 21:11, Mark Cave-Ayland wrote:
>> On 29/05/2022 14:02, Bernhard Beschow wrote:
>
>>> =C2=A0=C2=A0=C2=A0 Oh wait - I see now it's just the cover letter whic=
h is missing the additional
>>> =C2=A0=C2=A0=C2=A0 maintainer addresses :)=C2=A0 If you could add them=
 into the cover letter for your next
>>> =C2=A0=C2=A0=C2=A0 revision that would be great, since it gives contex=
t for maintainers to help with
>>> =C2=A0=C2=A0=C2=A0 the
>>> =C2=A0=C2=A0=C2=A0 review process=2E
>>>=20
>>>=20
>>> Hi Mark,
>>>=20
>>> Thanks for your great work you put into reviews and the useful insight=
s! It seems to me that the time it takes for patches to be queued depends o=
n the subsystem - some are faster, some are slower=2E=2E=2E
>>>=20
>>> I've automated my setup as described in [1]=2E However, it doesn't see=
m to work for the cover letter which I'd expect to be sent to the union of =
all reviewers of all patches=2E Any idea how to fix this?
>>>=20
>>> Best regards,
>>> Bernhard
>>>=20
>>> [1] https://www=2Eqemu=2Eorg/docs/master/devel/submitting-a-patch=2Eht=
ml#cc-the-relevant-maintainer <https://www=2Eqemu=2Eorg/docs/master/devel/s=
ubmitting-a-patch=2Ehtml#cc-the-relevant-maintainer>=20
>>=20
>>=20
>> Good question=2E I tend to do "git format-patch -o /tmp/foo --cover-let=
ter" to generate the series, fill in the cover letter, and then use "git se=
nd-email /tmp/foo" to send out the emails (entering in the results of get_m=
aintainer=2Epl by hand)=2E I'm not sure why the cover letter isn't being ge=
nerated correctly in your case I'm afraid=2E
>
>Or try git-publish :) It does a first pass collecting Cc for each patch
>(calling get_maintainer=2Epl) then use that set on the cover=2E
>
>https://github=2Ecom/stefanha/git-publish

Yes, that worked=2E What an improvement!

Best regards,
Bernhard

