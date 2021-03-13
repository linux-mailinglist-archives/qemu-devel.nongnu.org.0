Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E891339FC9
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 19:15:09 +0100 (CET)
Received: from localhost ([::1]:35608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL8n6-00033F-2y
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 13:15:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <susinilorenzo1@gmail.com>)
 id 1lL8mK-0002cv-DB
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 13:14:20 -0500
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:42451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <susinilorenzo1@gmail.com>)
 id 1lL8mI-0003qB-KJ
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 13:14:20 -0500
Received: by mail-vs1-xe29.google.com with SMTP id v123so14252501vsv.9
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 10:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=u350/wTxQ9+AVeqHLz5TL+b1DsdzeqHANiQujjkjQKc=;
 b=mO1iwp1XBhLhY12KoSOMqSJ/6uFhzXRU9SDuqQemT6QQgKC/UiXz+GGq8fDt6KWnF2
 8AwGq94b8m5FQySaACnwwPszcM3TXsk0xdeJimlGOOsYyyXhhN82vVWrSd2SrEVtXeVR
 5Ah0T9Bd7WMsjCdsqXQ3K7xIjRWu9Bw+UFwKC4JnfPiPWYsOdCF1Xxi6fbrECqJNZU0o
 ZiJBtlqjf/SrJwN753gZuf2hji8YJhg1nizgseMvpGj/aewAZjcfKG4Nxj6ChoGErjeX
 el7o3/IU77faN43eyQwR/v0JpvGZUCzJlB4Hqp/t0I3KSE4ouALXNuNgLbEPKjT+v7hH
 JXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=u350/wTxQ9+AVeqHLz5TL+b1DsdzeqHANiQujjkjQKc=;
 b=O/RdLclXhR3wpcDxfsOe10UNbApx+bjobmDmSE/Ri2XOGdiDuboSN9MiOsO6aDHM6w
 Z1w8C8EIfXF7PQp/fm0LkwzIHe/XdTLWcMLz1ShlCCEZ4xsuCzmHckPqlDmxP+DYTxoh
 qs6NVXLJurqxGCxHnq6ejZYhJS/eHvwItz8QW7LxxQ9sC3jxzkmFGEHoEkQkPFiG0SSW
 aPb9V8sedjutpLgCrMISSKF4Xxe2qhTnZ9QfmOleHWq3W3Z8PblHIC5wyg0u2XIlLlvj
 XCNw+xG00OTQgogL6qxlzQETrXrBtN3h9T4lI4oNTDUHc3FhvoqK9pcJ8rt/6znmLfQp
 peEQ==
X-Gm-Message-State: AOAM533cLr4v2nymZ6ShI8pzS7OYnWxu1kGuFo4t+SSXXIs0oy+yG6ws
 hWsl/R2u9qwMGGQzvL8+kEoHUMnjYeC0Sc3Kk5uoOjgy85ZzPw==
X-Google-Smtp-Source: ABdhPJxqSB5WVylvHK7ss9smA4FEEKhIfpZzREjXm+FlCPR4lrDJztZTJiGaYYiEDO2g/KUk2LgwG29CHTvvXn889FM=
X-Received: by 2002:a67:6891:: with SMTP id d139mr1721876vsc.59.1615659256840; 
 Sat, 13 Mar 2021 10:14:16 -0800 (PST)
MIME-Version: 1.0
From: Lorenzo Susini <susinilorenzo1@gmail.com>
Date: Sat, 13 Mar 2021 19:14:05 +0100
Message-ID: <CAHFRQs3z6HEspqLmQQqyhq4CPhkpzUF4g8e04w+cjXXtM4-Jzw@mail.gmail.com>
Subject: KVM guest physical address and its corresponding host virtual address
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001504fd05bd6efcca"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=susinilorenzo1@gmail.com; helo=mail-vs1-xe29.google.com
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

--0000000000001504fd05bd6efcca
Content-Type: text/plain; charset="UTF-8"

Hi all,
I'm a student and I'm new to QEMU and virtualization.

I would like to locate the Interrupt Descriptor Table of the guest from the
host and so I want to obtain a host virtual address pointing to it.
I don't know if I've found the right way to do that, but till now I'm doing
like this from the kvm-all.c file:

   1. I'm reading the IDTR register using KVM_GET_SREGS
   2. Given that this is a guest virtual address, I'm using the translation
   of the vcpu to translate it to a guest physical address. This is achieved
   by using KVM_TRANSLATE.
   3. Now that I obtained a guest physical address, I think I can use it as
   an index to the physical memory allocated to the guest by the host, which
   of course resides in the host itself.

Now the question is how to implement point 3? The idea is simply to get the
base address of the guest's memory and then add the physical address
obtained at point 2.
I was looking for that base address, and it turned out that there are many
many memory slots in use.

Then, I found out this function: kvm_physical_memory_addr_from_host to do
that. It seems to me it does what I'm thinking about but I'm not sure. Do
you think I can use this?
I see it is also use to inject something (mce), so maybe it's good to use
it.

Could you also explain to me the meaning of the ram field of the KVMSlot
struct?

Best regards,
Lorenzo Susini

--0000000000001504fd05bd6efcca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div>I&#39;m a student and I&#39;m new to QEM=
U and virtualization.=C2=A0</div><div><br></div><div>I would like to locate=
 the Interrupt Descriptor Table of the guest from the host and so I want to=
 obtain a host virtual address pointing to it.=C2=A0</div><div>I don&#39;t =
know if I&#39;ve found the right way to do that, but till now I&#39;m doing=
 like this from the kvm-all.c file:=C2=A0</div><div><ol><li>I&#39;m reading=
 the IDTR register using KVM_GET_SREGS</li><li>Given that this is a guest v=
irtual address, I&#39;m using the translation of the vcpu to translate it t=
o a guest physical address. This is achieved by using KVM_TRANSLATE.=C2=A0<=
/li><li>Now that I obtained a guest physical address, I think I can use it =
as an index to the physical memory allocated to the guest by the host,=C2=
=A0which of course resides in=C2=A0the host itself.</li></ol><div>Now the q=
uestion is how to implement point 3? The idea is simply to get the base add=
ress of the guest&#39;s memory and then add the physical address obtained a=
t point 2.=C2=A0</div></div><div>I was looking=C2=A0for that base address, =
and it turned out that there are many many memory slots in use.</div><div><=
br></div><div>Then, I found out this function: kvm_physical_memory_addr_fro=
m_host to do that. It seems to me it does what I&#39;m thinking about but I=
&#39;m not sure. Do you think I can use this?</div><div>I see it is also us=
e to=C2=A0inject something (mce), so maybe it&#39;s good to=C2=A0use it.</d=
iv><div><br></div><div>Could you also explain to me the meaning of the ram =
field of the KVMSlot struct?</div><div><br></div><div>Best regards,</div><d=
iv>Lorenzo Susini</div><div></div></div>

--0000000000001504fd05bd6efcca--

