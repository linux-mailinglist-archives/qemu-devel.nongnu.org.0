Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBBA376868
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 18:05:46 +0200 (CEST)
Received: from localhost ([::1]:41446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf2z3-0001uR-0L
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 12:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <susinilorenzo1@gmail.com>)
 id 1lf2uv-0007DB-L8
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:01:31 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34]:39578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <susinilorenzo1@gmail.com>)
 id 1lf2ul-0007FM-7S
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:01:29 -0400
Received: by mail-vs1-xe34.google.com with SMTP id v188so4917856vsb.6
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 09:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=WZggkCbc/y2l7PN87RnDAEK25jfge/Oktmd9TQqeO7s=;
 b=gxT/jYpAfcpMdVr1ZwO5Yei/H9lP6PoM1Pm/Ky6tcF4n6aHZN0Ymu1Z1PI6VDqLfVk
 tRmK++EeY2PdtqvgFOlwYvdlw68JkTNpeuwejwJZQVA7lSqmiOTKiVwWguE0WprROPrJ
 sww3WM7HlhsH/YwNEsziOgJniayrT/US9+nHerkpT3zy9yytUHx/bIRZ4LjvAIkZkGmK
 s8EoxL/xJFe22/yk9yZ3lUIM9ImCAZNsBfLTsrejiYXOirZA8B6XMJMJjXV6t9JwXCv8
 23aIaP2g1UDPzXvgs+qsvxnagPUkazRsTzBHLYxEyiR0bn9ClRbIrLdHSSv04v0Hb23l
 MEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=WZggkCbc/y2l7PN87RnDAEK25jfge/Oktmd9TQqeO7s=;
 b=VkDHBdrNvzpQSFb3xBOMpa9l/mUoMMCiVj+pwLZBCzkC5JUQfnJbJQd3Yo8eo3OXnT
 hpOJFoi97qdW1h4gWB2FWQurXP5iZdGZjKN1Xr6e55FcN0ELARndCSCKmuLsNIGo6MDv
 p7GKDj76RfQdF6bjDQ4gmyXxueQXj/Q7JVaItdVdlrK/3bJQlcWA8ujdAzxeSZL60Zb/
 oFPb0L55leToytjFiDns9S/17ebkYR/nS1LUiOpvrbKsLCN9FMWMbgWQdzTtS8nJRlc4
 3zJDcChaet707ZSoo6rrdzl+So5IgFX4m5kf0lOfyHbgUjnL3TBcuv+HwLLDUxhaci62
 wmxA==
X-Gm-Message-State: AOAM531h0LPLtWn9sZLUyXNf8fNy6InI95eKEx7vhtv3ZPZ+ZA1eh+80
 PvBqvPfthOcrJ2V89IFEkQ81UD5AoPQjOI67GFfCKiamw40=
X-Google-Smtp-Source: ABdhPJx2AP9K8XI+u2Kkk9R3uLR5/GL2xpuT3jLsTqn5q1hCsYkelyaJUzU/ac5yXaqbeZG93W/sXuU+83uT+tslaRA=
X-Received: by 2002:a05:6102:21c8:: with SMTP id
 r8mr9147878vsg.59.1620403274391; 
 Fri, 07 May 2021 09:01:14 -0700 (PDT)
MIME-Version: 1.0
From: Lorenzo Susini <susinilorenzo1@gmail.com>
Date: Fri, 7 May 2021 18:01:02 +0200
Message-ID: <CAHFRQs0Y8Cey4UbN08v0SV796xVgp_c-d6ucqq3FOtPPAXLLog@mail.gmail.com>
Subject: Implementing an access log
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000090236305c1bf8911"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=susinilorenzo1@gmail.com; helo=mail-vs1-xe34.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000090236305c1bf8911
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm a student and am working on a personal project, I would like to receive
some feedback on implementing a memory access log
in QEMU (or in KVM, since I'm always enabling it). In particular, I want to
keep track of the guest physical pages which are accessed during a certain
interval of time. To implement it, I was thinking about these two options:

1. To keep track of each memory access, one could potentially unmap each
memory slot of the currently running VM. This way, every memory access
should
trap to KVM and then to userspace QEMU. Userspace will satisfy the request
by reading or writing memory using its virtual address space (actually
translating
the guest physical address to the corresponding host virtual address) and
it can record which page was accessed. This approach led me to a
KVM_EXIT_SHUTDOWN
and I did not know how to go further.

2. Another way to do it would be by introducing two new ioctls in KVM and
using the tdp mmu. The first one, let's call it KVM_CLEAR_ACCESS_LOG, takes
as input a memslot id. By iterating over
the paging structures leading to the translation of each gfn in the slot,
it reset the access bit. Then, the second, KVM_GET_ACCESS_LOG, will
generate a bitmap
containing one bit for each page of the memslot, pretty much like the
bitmap already implemented for the dirty log. I've tried to implement the
first ioctl, iterating the paging
structures using tdp_iter. When it comes to reset the access bit, my system
freezes. The output of dmesg is the following:

get_mmio_spte: detect reserved bits on spte, addr 0x....

I would like to receive any suggestions on the feasibility of these two
approaches, what do you think would be better and maybe some hints on how
to solve the problem.
Anyway, am I missing something similar that is already implemented? Other
ideas to implement this are welcome too.

Kind regards,
Lorenzo

--00000000000090236305c1bf8911
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div><br></div><div>I&#39;m a student and am =
working on a personal project, I would like to receive some feedback on imp=
lementing a memory access log=C2=A0</div><div>in QEMU (or in KVM, since I&#=
39;m always enabling it). In particular, I want to keep track of the guest =
physical pages which are accessed during a certain</div><div>interval of ti=
me. To implement it, I was thinking=C2=A0about=C2=A0these two options:=C2=
=A0</div><div><br></div><div>1. To keep track of each memory access, one co=
uld potentially unmap each memory slot of the currently running VM. This wa=
y, every memory access should</div><div>trap to KVM and then to userspace Q=
EMU. Userspace will satisfy=C2=A0the request by reading or writing memory u=
sing its virtual address space (actually translating=C2=A0</div><div>the gu=
est=C2=A0physical address to the corresponding host virtual address) and it=
 can record which page was accessed. This approach led me to a KVM_EXIT_SHU=
TDOWN</div><div>and I did not know how to go further.</div><div><br></div><=
div>2. Another way to do it would be by introducing two new ioctls in KVM a=
nd using the=C2=A0tdp mmu. The first one, let&#39;s call it KVM_CLEAR_ACCES=
S_LOG, takes as input a memslot id. By iterating over=C2=A0</div><div>the p=
aging structures leading to the translation of each gfn in the slot, it res=
et the access bit. Then, the second, KVM_GET_ACCESS_LOG, will generate a bi=
tmap=C2=A0</div><div>containing one bit for each page of the memslot, prett=
y much like the bitmap already implemented for the dirty log. I&#39;ve trie=
d to implement the first ioctl, iterating the paging</div><div>structures u=
sing tdp_iter. When it comes to reset the access bit, my system freezes. Th=
e output of dmesg is the following:</div><div><br></div><div>get_mmio_spte:=
 detect reserved bits on spte, addr 0x....</div><div><br></div><div>I would=
 like to receive any suggestions on the feasibility of these two approaches=
, what do you think would be better and maybe some hints on how to solve th=
e problem.=C2=A0</div><div>Anyway, am I missing something similar that is a=
lready implemented? Other ideas to implement this are welcome too.=C2=A0</d=
iv><div><br></div><div>Kind regards,=C2=A0</div><div>Lorenzo</div></div>

--00000000000090236305c1bf8911--

