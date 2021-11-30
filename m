Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3B4462B46
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 04:43:22 +0100 (CET)
Received: from localhost ([::1]:42976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mru36-0007wA-OL
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 22:43:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mru1t-0007HP-KN
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 22:42:05 -0500
Received: from [2607:f8b0:4864:20::f2b] (port=37862
 helo=mail-qv1-xf2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mru1s-0001if-6U
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 22:42:05 -0500
Received: by mail-qv1-xf2b.google.com with SMTP id u16so16664015qvk.4
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 19:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=WPONpELKALE6WSld8iIoyjdqNBj645f/HgocQ2lmVkk=;
 b=am/Re0CXD2c/co4wL8moHaaA0xjg3ScEOul9oFcXj7ALUIvmd6A6dPEHZ+/dZsEoGr
 ByK28/RkE81kBabn5pQ+LUjvkLcr6M0TaxaKGci3O6DJ3whka5vwbmcrc/nOXHRjUceU
 I0abUTExLyEQv5Y2O8UuOueJEyIh8nTJfD+Ns6XXJbAHN/FJM1T7LH2TLM3HnTN8uSWX
 AAWY0rfzq60KedIQFMLeznid9mpVE35gUD2q7MZ8oYU0//7q/wRB7h45d6RGlmb8HEtB
 cmd2MZMwFHIEofN7baj+mwavtEg/Vxo0jxVyZ7mTqEOL1EWw8rZn/wI0E+cvcOgRiJvJ
 XyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=WPONpELKALE6WSld8iIoyjdqNBj645f/HgocQ2lmVkk=;
 b=1BsqsODlf9eF6u5FrwEMoFjrhnGZMugDIamkaK2m3xUXdf/Qia9SeYIXaJ26DLRBrE
 6gqnuE/Bvj3eT7nHRbliViHK1C8V3yS0AhoiozpnldgYXuseArnvDuXNYV9YqWNfVJZe
 1LKXwE5fbxxn4HcMxDv1enjL+9/ggaEGJmKi3lQr8pRK83cUbFr8ZtG6RcS6fW0xhdNv
 uOi75o88ACPpPyx02QaTb61iXy0WvhcCTf/5j4oXSP5y/nU1XbBvp5TMXszPyLGguTfh
 cvIg7p2pHUKdarRCMVUFUPULI5qoo+cKdK9vaOJO/RMEWOUF7/3r1osTabPlVDnYMMy7
 LfQQ==
X-Gm-Message-State: AOAM533A3SyayzKU+w4NZ7Vp9/USiM4ETKkXnX4IXtMeY04VGasPD4LS
 p+E9VTTPucD9KcSdeFy73Nf+kJu0WMR0wT1bnvQJt1JoOlpWZA==
X-Google-Smtp-Source: ABdhPJxRM+ZPa7B9djXIK3+skSyZyfm5UIpI/D6D2LheUxtDY7pFS6C8txTTXxbxjLbnfP3H4uCkFO4csJe04p+nmVg=
X-Received: by 2002:a05:6122:2193:: with SMTP id
 j19mr42692605vkd.7.1638243310810; 
 Mon, 29 Nov 2021 19:35:10 -0800 (PST)
MIME-Version: 1.0
From: Duo jia <jiaduo19920301@gmail.com>
Date: Tue, 30 Nov 2021 11:35:00 +0800
Message-ID: <CALUzjTayHdqbqMbuRaF-57HQ9u21fGTzaXuBQsSLu5ifDkGkFg@mail.gmail.com>
Subject: How to simulate a microcontroller whose ROM and RAM are the same
 address space?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000098bd8e05d1f93e9c"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=jiaduo19920301@gmail.com; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: 16
X-Spam_score: 1.6
X-Spam_bar: +
X-Spam_report: (1.6 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--00000000000098bd8e05d1f93e9c
Content-Type: text/plain; charset="UTF-8"

How to simulate a microcontroller whose ROM and RAM are the same address
space?

Some microcontrollers have a Haval architecture. ROM and RAM have separate
buses, which means they have the same address space, such as 0-0x100. How
do I set the memory region?

Thanks!

--00000000000098bd8e05d1f93e9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">How to simulate a microcontroller whose ROM and RAM are th=
e same address space?<br><br>Some microcontrollers have a Haval architectur=
e. ROM and RAM have separate buses, which means they have the same address =
space, such as 0-0x100. How do I set the memory region?<br><br>Thanks!<br><=
/div>

--00000000000098bd8e05d1f93e9c--

