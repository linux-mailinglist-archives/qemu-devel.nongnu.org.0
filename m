Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0163BA940
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 17:30:26 +0200 (CEST)
Received: from localhost ([::1]:60762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzhb7-0002sh-0P
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 11:30:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1lzhZl-0002CU-Am
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 11:29:01 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:34469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1lzhZj-00037Q-Mc
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 11:29:01 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 t24-20020a9d7f980000b029046f4a1a5ec4so13388095otp.1
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 08:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=i6UGVjL9yRASoLZFRbudLH88IwJ7zFgPKXubBzPJClo=;
 b=e81r6MZ+PDTVF1HCcFGIUqDzB8HKpvXraOAZlIKpbUYTgAhWEI5SFMu6cPm84LKRW6
 4viZGE5FJvmIRtEYpruDhdWkaoARZPoR6dVe9zwJmpuLnIe1NYwV4tukhC2FE2Q1DnBB
 6UPzEvjHwyPhv2NKaJAxK2NRLvmCh/Oh+4uj3Va+xt7lwVxwCK5Y1cd6+KHmoAk3qbNX
 kihGhiztrg5xlwO5j9g4V3YsKS9oPjWKnwJfEwV4fepwCJdj1MGA/OgRUn4TSKOGq/NS
 nU2uOKU8MphRqDHOZb6tim7O5CGvo2p/pG0G75LVimcZ+twuIsH1hiQma4+wdZliVa13
 C2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=i6UGVjL9yRASoLZFRbudLH88IwJ7zFgPKXubBzPJClo=;
 b=RR5qgv69knvRIPLxgD21kotP8QpobCg+bUyHFii3B5dUDAZdEhbx3Fck+PLijSbwqo
 db9pbEapDrDlwkpUe4bimSEVTPDq9N09+Y6rN/T0c3zCS9DhmIaGm6SjIpp3GaX5jVa3
 3lF8npqoFRVq42JC7oghTxqa/P21EFyaKWOQTmrDCO+5Zn9sFiGLQD14bdUNnY3WrOrv
 XuoaJW4JY5LW6E54rRQOdQ5rnazdMBewso79jPOp44704E+ZNvRnddFTHJG1BAL8PcD6
 jaowTHQpCwLpQ3rHj2W+7EIlBDF2Yq6ZqZ2XNI3Qh1zdPGxHPjs6Ksy9/EiEkCala3mF
 aMlQ==
X-Gm-Message-State: AOAM531fkPL20Ih/8+2zbnfOF4ZgQj77QT8FaYzxwHxB0lLGPCZnEeLM
 xqYF8lr/2YbBzqdOOC2M3q8eEyogs5TI26e4kAucGmPI
X-Google-Smtp-Source: ABdhPJyX7UG0Aj6xw8WhT0lG/hLkRM0h+ppRIpdAqUUU9IQgZyX8RrXSDb1YrRu6bj5jXXHh0zkxXSgsamTM10mf/Mg=
X-Received: by 2002:a05:6830:1bd8:: with SMTP id
 v24mr3929150ota.343.1625326137557; 
 Sat, 03 Jul 2021 08:28:57 -0700 (PDT)
MIME-Version: 1.0
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Sat, 3 Jul 2021 11:28:46 -0400
Message-ID: <CAK7rcp-VAb2H5xZsvdcATOyMTRQKRBuSWKv8vY_HaDoZ-uiS9w@mail.gmail.com>
Subject: Getting started developing
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000012c47005c639bbb5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=kennethadammiller@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000012c47005c639bbb5
Content-Type: text/plain; charset="UTF-8"

Hello,

I just wanted to ask how I can get started developing other than just
starting building? QEMU is a huge project, and getting familiar with all of
the source and stuff is a lot of work. Probably, it wouldn't be helpful to
know the entire source, but just what I need.

I want to add a new system target for an architecture in which non-user
mode instructions might be used. In my case, I am reading the documentation
at qemu-project.gitlab.io/qemu/devel/*, and I find that some of it is good
for getting started because it tells about the roles of different build
targets. At the current time though, I feel like I'm so far at the
beginning that I don't know what question to ask to help myself best. Is
there any way to know in more detail how a system target would both share
and differ from one architecture to another? For example, the same devices
may be present from arm to x86, but this isn't true for how the processor
works. Also, is there any reference on the execution lineage or data
structures used?

--00000000000012c47005c639bbb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I just wanted to ask how I can g=
et started developing other than just starting building? QEMU is a huge pro=
ject, and getting familiar with all of the source and stuff is a lot of wor=
k. Probably, it wouldn&#39;t be helpful to know the entire source, but just=
 what I need.</div><div><br></div><div>I want to add a new system target fo=
r an architecture in which non-user mode instructions might be used. In my =
case, I am reading the documentation at <a href=3D"http://qemu-project.gitl=
ab.io/qemu/devel/*">qemu-project.gitlab.io/qemu/devel/*</a>, and I find tha=
t some of it is good for getting started because it tells about the roles o=
f different build targets. At the current time though, I feel like I&#39;m =
so far at the beginning that I don&#39;t know what question to ask to help =
myself best. Is there any way to know in more detail how a system target wo=
uld both share and differ from one architecture to another? For example, th=
e same devices may be present from arm to x86, but this isn&#39;t true for =
how the processor works. Also, is there any reference on the execution line=
age or data structures used?</div></div>

--00000000000012c47005c639bbb5--

