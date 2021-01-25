Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1DF30244B
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 12:31:26 +0100 (CET)
Received: from localhost ([::1]:39368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l405d-0002QA-6v
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 06:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l402a-0000gr-Lu
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:28:17 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l402Y-0008KL-DD
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:28:16 -0500
Received: by mail-wm1-x32a.google.com with SMTP id m187so10392169wme.2
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 03:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wCtxPLNCPlGLdnaX11oTBEefZBMUtG+52v4v4Ig9Fas=;
 b=xxbN1vV48Ar1Udmfpr5qtR5nFmWdgRn4VAX9nWWjWLHmeTuEIG3Gl69L0AjVLqyQ7v
 P+47Ie606ZueDuLHCS8dvX0vYPF6mIV42Kcn8Q+ELCsEMboPkVf4UcT/SjBKYedibmZR
 r7AksNsV4BdHFHwJIhwAlJCWWuKzg63ejnAgFeY2lsdvX28S9iTTHtpNg+ttmgVTEMD8
 sVuLXKasKTpy0HXruAwlgxTqG/kQ8D3/BOsA//2tKq+CIn87wTroz6iteF5JCvh0cxaw
 Pb8sbPqx+oLppEmd47fRO0Q6bN1JhV0zgw4uaaERBvBrdHPX5f6je7M+xMgH9shtDQbL
 WYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wCtxPLNCPlGLdnaX11oTBEefZBMUtG+52v4v4Ig9Fas=;
 b=D2CmDf4bUI8mjlK1unojECari4gdMFJ+ej/9ueJun56IsgoVLoCHtcyWw6x5C+rzPn
 gQHbjx7f4oIqlbr9BU/vRe2P4m7MeB7FWprn8a+WCNgtAv11p1OTnbdS+85wLOEreEEA
 qmrlFN8Q3MU8VTlA08exJjdnQAJsQMYaspdfPvQRvSJeGwu3v1ZVGpEBU1Y5QCaUcTzT
 V/dNX7RK9UXvIDmL1HDbn7jnZvIOlo/g+u5FFjJI/iKmyn1STlFOIWgZNxlrlh1ALS8N
 JdIQ4Lgoui+crQQDnliMIG6k5EBD3MIIi6U3yjk+TXz4lDxxTUsP3ASfugG+YWbbxOyo
 2U1A==
X-Gm-Message-State: AOAM532OHzd55kNlBnnoI52ThZtecaCysOcS4FLmoMCHTwxchHsyjsrI
 QAoVfxodJ2xMR9fYdrgDQqA8OA==
X-Google-Smtp-Source: ABdhPJyL7Em2JZYelu/0RyiBBOQyKEKYwKBJ/7TzKKFY6P0ZqRqAzEPW7heq7+Xj5nlYFW68rnq1nA==
X-Received: by 2002:a7b:cbd7:: with SMTP id n23mr729488wmi.162.1611574092947; 
 Mon, 25 Jan 2021 03:28:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d9sm14615327wrq.74.2021.01.25.03.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 03:28:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9F5E01FF7E;
 Mon, 25 Jan 2021 11:28:10 +0000 (GMT)
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
 <CAAQ-SiMsrkDYzqqqRXONw_HCdORqssw-yL9dFGF32y7aG68iCQ@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
Date: Mon, 25 Jan 2021 11:23:17 +0000
In-reply-to: <CAAQ-SiMsrkDYzqqqRXONw_HCdORqssw-yL9dFGF32y7aG68iCQ@mail.gmail.com>
Message-ID: <87v9blmf1x.fsf@linaro.org>
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


Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com> writes:

> Just a follow up.
> Still working on device initialization. I am trying to understand the
> relation between virtio-net and net device in qemu
> in hopes of recreating something similar with the audio device.

All QEMU devices have two parts, a frontend (which the guest sees) and a
backend (which is how the data gets to somewhere in the host). Some of
the command line options in QEMU elide the details for convenience (-nic
and -drive are examples). The -netdev device is all about configuring
the backend of the network part for a paired -device front end. There is
a similar setup for audio (-audiodev) although I'll defer to Gerd's
expertise on how the two interact.

> Once I have
> the device initialization part
> ready I will send in a couple of patches for review.

Good stuff.

--=20
Alex Benn=C3=A9e

