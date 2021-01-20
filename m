Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC842FCF2B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 12:43:41 +0100 (CET)
Received: from localhost ([::1]:44616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Btj-00022s-RF
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 06:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l2BsE-0001Jb-Fd
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 06:42:06 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:39998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l2BsC-00013I-Lr
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 06:42:06 -0500
Received: by mail-pf1-x42d.google.com with SMTP id i63so7257196pfg.7
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 03:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0ShICtWTSEE+FqiPEZmPNIAozbvLjBQN4iw57fYXG8s=;
 b=tx0ABWJLpqeAK/B5or1w82v2gDTE0Yn6bDKBjfU2wBQeTU0gWBdQs2DomMC2OvfXLR
 s2cdUfPK2JCkEPHM1sAy7iz9Qd4XaqxK7AD4TVKpfatxdK75btKucxaXh1JNS34HIc7F
 8eSrt8AKY6vmYHJxufe/zWJsBnTZBne1IPdJVajY3GxluW2wJG8Q+tWSWNioP3CGcTRn
 IEZ5rYvv/uoEF/Uhw6zZXOcN8PqCljZWEyRFYPP63BppCXMH7OjbJS9InX12UzyOCser
 Plmj1eLAgomthLwaHUPUip6v+sfynI0WPCW2adv19u8uoPB5y/YC5WCeiHd+2oQi4AWU
 RThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0ShICtWTSEE+FqiPEZmPNIAozbvLjBQN4iw57fYXG8s=;
 b=tqqjzCl5Nqnflvej/rLzKegDEX7iJ0hFmqRUHxkqzy8BLr3jjzc11rh/2RxZyH3IBp
 bnj2jE6x2GUwqXBsSCRLSx9mbrO1n6IEIqW9xNklCQ4TbIhmI7mYIs5tvBu6RQuT7UrD
 1EipOA1knSBR6MMaCUF6YEN2UbCEcD+l9zCQJdEN2FVR4V0/wx6+g9scrbrwY9GL7mxw
 S7PMlkBJb35x2BUA4OFZ8sBMOEPiTRSRMlqbRnb8m21fRaKV61I9cfuemTi8uc80lUc5
 yRm5RNgR6KTdDRcOKOxdzW9obLsOikUNIUWJsPPWRnN9kEbYDIDOBju+AGY0Kn0z6pG6
 hzzA==
X-Gm-Message-State: AOAM532c1muTTQTFYdVhwr+QaDvaQilN6UbzqH6qSBWpQl944d2OPYLm
 al9FqCA9VFXHMmvlpDPlk9LR079M+IvwBt6JZVA=
X-Google-Smtp-Source: ABdhPJysKQUcXC3g6LGtZ6tw4nQ1bfyrpSnvlfioiJ69sUPU3CYnDWvNljVGBp3Nk0jegYsW5RE/7R7r0rW9kFw+Pas=
X-Received: by 2002:a63:1626:: with SMTP id w38mr8873143pgl.278.1611142922814; 
 Wed, 20 Jan 2021 03:42:02 -0800 (PST)
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
In-Reply-To: <CAAQ-SiPcBeGGgYcPHn7WSnz4jLAza+hE7tSMYSHJ-caC66D48A@mail.gmail.com>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Wed, 20 Jan 2021 17:11:51 +0530
Message-ID: <CAAQ-SiPPk9EfrEq7ja0X2E7gq5x9dH9C3LBDNc4frNi8Ssijug@mail.gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000098c7c205b9537145"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x42d.google.com
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

--00000000000098c7c205b9537145
Content-Type: text/plain; charset="UTF-8"

I wasn't really able to clearly understand how I will use QEMU VIrtqueues
exactly.
So, I decided that I will start implementing the part that I already
understand.
I think once I have something implemented I'll have a better chance at
understanding this.

I am currently writing the boilerplate code for the device, using
`virtio-net` as a reference.

--00000000000098c7c205b9537145
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I wasn&#39;t really able to clearly understand how I =
will use QEMU VIrtqueues exactly.</div><div> So, I decided that I will star=
t implementing the part that I already understand.</div><div>I think once I=
 have something implemented I&#39;ll have a better chance at understanding =
this.<br></div><div><br></div><div> I am currently writing the boilerplate =
code for the device, using `virtio-net` as a reference.</div></div>

--00000000000098c7c205b9537145--

