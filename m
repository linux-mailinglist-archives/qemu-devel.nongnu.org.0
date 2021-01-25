Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F48B302201
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 07:04:22 +0100 (CET)
Received: from localhost ([::1]:36574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3uz7-0008Td-2X
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 01:04:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l3ux8-0007cc-9x
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 01:02:18 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:39130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l3ux5-0004G2-O8
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 01:02:18 -0500
Received: by mail-pj1-x1034.google.com with SMTP id u4so7940654pjn.4
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 22:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GD7H3/XEj81KWlM/4Eztg5kOI2x3j3czf2fvmK6DDpk=;
 b=nIGmBoQgK5/QvouWEzc3/WTDk9YgMatjvJqoZZ0+h2uBVRYXBRoBTQZ5kva7529NwK
 Yxve+JX5l6GhtHcYPaYGgcCyVzJypU9LLpZCp79+800QkEtrhXf20MEvnjp2ino8GWb5
 ifQ69Z5T3fCKp1weBLwHJwlblBYlP3YysZhhT1FDs/ODxA+2Aiw3WeeFMt/j2ErhkY/i
 m80LKPAdI2zTlMA7bnoygHThKVide8I1fx1/YGNrYQSUo1+v7DpYnvfqY3//kp1mWhVK
 XaxNII4BK6wVB1G6/UUv8D+bw54K8lUzEWyu72PbIWc73ydCe8C60UJ5s4T7fN4WK4Le
 uJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GD7H3/XEj81KWlM/4Eztg5kOI2x3j3czf2fvmK6DDpk=;
 b=HY2v2PoCwh5fGqcQ87KkkgG53wUqMErANY4v2qgKiKZFPOEsBLBiJsiXF8QrgokX3U
 akWgPiDmDWjIYL1li+nnRXKG7qAqkZbvIxxrX9zAUS3FCU+7/2x74btZdaSzwwwR73iR
 L7KGEaXJK4W1FIGNbgYVtJhZ1ISZppApcmHCBfdmXe0w96tP7ldDTZvshVUCimOCHz+a
 Cb2Q2pbWQnLdlfY2Tmg6eKftsindmyzEEftjj9H2XY1b+Yec9Fb8P5y+JC7ob1kPQCvT
 cSFlgTuYUWD7vuDzouIn64a5LR+DqrPX082gDes5fzOPT4StWX7DwaqUDb3Jcji86sbP
 MlSw==
X-Gm-Message-State: AOAM5317O4kFwI8f5xHebJ0USed9F9mnVsUIuYy1nLFFG1K9hUHp5+Os
 gTljhfFfO1Mqc9l1NPgH4+GN2qf6azr5Zutv7+Q=
X-Google-Smtp-Source: ABdhPJw8PR1NuH6Sg3qcYFjOChalG1kaxUQOLRGgaCYC8Ms/hJTgxsAZUc1yvRsiKLqbYulIloe/LB1t5IkpcG3mUww=
X-Received: by 2002:a17:90a:578a:: with SMTP id
 g10mr3282822pji.74.1611554533143; 
 Sun, 24 Jan 2021 22:02:13 -0800 (PST)
MIME-Version: 1.0
References: <CAAQ-SiP8G28ade0jHbhTcv0jtGQb4OSgL5p3mAr0MU_FH8vZ3w@mail.gmail.com>
 <87a6tm2sxb.fsf@linaro.org>
 <CAAQ-SiOW8OnWEb0sHUEeS139-Tw0RO2YD1Tx-1s9iuy3ZVQFgw@mail.gmail.com>
 <878s941x85.fsf@linaro.org>
 <20210108083433.pfzhxrd4rezk6yxe@sirius.home.kraxel.org>
 <CAAQ-SiO4VvVTo77J2ga1FmUZ9yrwopeASweO6-AFaakrAUZ80w@mail.gmail.com>
 <CAAQ-SiPiq5NQN=2mvP3isZ9PtYO2Bu64kVEvE6T+3OJd5B-U5A@mail.gmail.com>
 <CAAQ-SiMkJGBnxWSnybJqMD0LSASMtvA_wbrPDQcg-S+Y1ddjJA@mail.gmail.com>
 <878s8zptrf.fsf@linaro.org>
 <CAAQ-SiNKXhJcT1XEodQT6kojqppq37Kg8F8igipQ-HVYOU0=zA@mail.gmail.com>
 <87ft33l8an.fsf@linaro.org>
 <CAAQ-SiMY8W9TS7eXgWuHY0m4yjaRbqqsZ+41Xyhxm+gW0sYakg@mail.gmail.com>
 <CAAQ-SiM8_XnW1Ar5xocR7pUG_WW4SrQSnaKhqr1rY62ti2pw7Q@mail.gmail.com>
 <CAAQ-SiPcBeGGgYcPHn7WSnz4jLAza+hE7tSMYSHJ-caC66D48A@mail.gmail.com>
 <CAAQ-SiPPk9EfrEq7ja0X2E7gq5x9dH9C3LBDNc4frNi8Ssijug@mail.gmail.com>
In-Reply-To: <CAAQ-SiPPk9EfrEq7ja0X2E7gq5x9dH9C3LBDNc4frNi8Ssijug@mail.gmail.com>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Mon, 25 Jan 2021 11:32:00 +0530
Message-ID: <CAAQ-SiMsrkDYzqqqRXONw_HCdORqssw-yL9dFGF32y7aG68iCQ@mail.gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000007bf5d405b9b34759"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007bf5d405b9b34759
Content-Type: text/plain; charset="UTF-8"

Just a follow up.
Still working on device initialization. I am trying to understand the
relation between virtio-net and net device in qemu
in hopes of recreating something similar with the audio device. Once I have
the device initialization part
ready I will send in a couple of patches for review.

--0000000000007bf5d405b9b34759
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Just a follow up. <br></div><div>Still working on dev=
ice initialization. I am trying to understand the relation between virtio-n=
et and net device in qemu</div><div>in hopes of recreating something simila=
r with the audio device. Once I have the device initialization part</div><d=
iv>ready I will send in a couple of patches for review. <br></div></div>

--0000000000007bf5d405b9b34759--

