Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3DC5400D0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 16:11:31 +0200 (CEST)
Received: from localhost ([::1]:34484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyZve-0002TC-10
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 10:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>) id 1nyZtU-0000xu-Sy
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 10:09:16 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:38201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>) id 1nyZtS-00087W-UD
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 10:09:16 -0400
Received: from mail-yb1-f174.google.com ([209.85.219.174]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M7s1M-1ntc5K2jh4-0051cz for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022
 16:09:12 +0200
Received: by mail-yb1-f174.google.com with SMTP id r1so2753783ybd.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 07:09:12 -0700 (PDT)
X-Gm-Message-State: AOAM532sRzs5TZZz0g7Lhz1oZdVvd4dsguV+YqJBy4vVXX/Jxi8HyPwO
 90sZjvkdk5M0hT5VX9TIz0vA5DOB9Z9Om1DO0x8=
X-Google-Smtp-Source: ABdhPJyrHRdcbFGwgQucIuXA511ekWmgPkpq2r3VzjMQDT7UGkzBdYp57tesIEB5uEfd/qHoqMrZCqWLJTK4O/DiuVI=
X-Received: by 2002:a25:31c2:0:b0:641:660f:230f with SMTP id
 x185-20020a2531c2000000b00641660f230fmr29767520ybx.472.1654610951039; Tue, 07
 Jun 2022 07:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XexaTREY3Y-jp8urTAE+UmQWgygFx1MAss9KcJw5tGMtw@mail.gmail.com>
 <CAMuHMdWF_OwTMZZ=joRsnOAuB5UuKjACt3Ku4-o0--fR6xqQbQ@mail.gmail.com>
 <YpkWllpTFzb2HHY5@antec>
 <CAMuHMdXBtihLpdOYn7nj_fH2g08nDUiUd-_zCZ_EdEyvw1UxWA@mail.gmail.com>
 <YpwNtowUTxRbh2Uq@antec> <Ypxb/VDfYLFg3n2s@antec>
 <CAMuHMdVwAzbAOBDcv4y1WmYgCaFOMdywxUZvwMtDccOgDMN+mw@mail.gmail.com>
 <CAK8P3a3Vpn02uDe3rdXSNXANY=u4ZM+wjm-qqszTXzjOKkAeEg@mail.gmail.com>
 <Yp8epZsizfKMEVZV@antec>
 <CAFEAcA97oraa5OSdqmubmJ2-ONTCTF4ZszwfTcZ9VhqKRFhogA@mail.gmail.com>
 <Yp9Al1UfqvIzStI7@antec>
In-Reply-To: <Yp9Al1UfqvIzStI7@antec>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jun 2022 16:08:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a13PTsMExyXZm5sZM3WBK-8hoNFjYoi19pHmKKCJQmHeA@mail.gmail.com>
Message-ID: <CAK8P3a13PTsMExyXZm5sZM3WBK-8hoNFjYoi19pHmKKCJQmHeA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] hw/openrisc: Add the OpenRISC virtual machine
To: Stafford Horne <shorne@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Joel Stanley <joel@jms.id.au>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Openrisc <openrisc@lists.librecores.org>, 
 QEMU Development <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:NiWsm+UG1fcd5JF3nfRqtikpGqB/LutH0XqU7tnDtIzvk7N4PNO
 K6vVR/SM4tIH9IKQLAtB3dQ3KfW+ERTlWlEf9SJCgO8Zp+Nf189Ng/mYZSP5TSdPfFVR6s5
 x9D/wbqz47pmROSpK8CNymEh9H4JvgO7ZVSXjcut3L50KYgszBXURs8NHOAtjBZwaz/QwgH
 DyOjZxHH3zvqzfj45sTuA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MWwDju3rabE=:Gk/xZ97F2Mw+NHXwhAEs7Q
 bhy5CAmtgNRYSjU6gkbSVFXzq6aaA8UDlh4Q8JoQ9+fxi4YUavYdVnecfAbmcLtZWwEEvpold
 +AvLTxVLSFiCmWKlS+ifVntgpIPfGQEUqlPOdfSN3/+YRX+HrIS7wyCkm3wtA8U9K0chiQcjK
 7STpqmMi+k8JWm/PWPhYZ7rBlIwFhTVWUkNqleiR+Ot2QIGKuezcbucvmJPN6FbTsTTLk2ifp
 XirlN3h7A/bTG03S+bQFIZcG5lhZOETFLyqXjACjifnTYGTKpxC9b0tJprvK8Z6B3Nhr/PFFZ
 kVGqlTDDgOy0h/SwTWw20tECzqec9KoEJkDioPEXuJJ7nMnugjfK9JDECnVsxVInszvOpKddJ
 YMCqp9fDjNRwTjcn8OKxbWtZYwGhaJebbdbBJqs0kKrKEhgNPOWJABBLJyuNRV3kQ1oXYMI6B
 6xopO1vTntOOuN2WxMdbvNo2kxa5rDX45fhr59An0wYEycha1dFvOPW1zCHN6jLnMiDRB25QO
 y4kidXIanXnFgCwyQu9UZpGLslaBSMIT31OiuRZBOpjQahCxWsXO01onXOFJbrTFmZIGJgXs3
 tbP5YQxS2EzlXPYiib/O+hVaMRIBFa8J8idQnHlldk2Jlka2EnlcMRXYaTOtZYO5DABIHSug1
 jAOl4JUXijLMKySK99XZLfDs9LQD8/qL+QnpH1MwP8hE5FvZDcpHxHwnVcPZ2mVCtTAuRztkk
 cwuMGBL1at9Cdzj55F+AeN/Bk+u6h0igaxO14Q==
Received-SPF: none client-ip=212.227.17.13; envelope-from=arnd@arndb.de;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

On Tue, Jun 7, 2022 at 2:12 PM Stafford Horne <shorne@gmail.com> wrote:
> On Tue, Jun 07, 2022 at 11:43:08AM +0100, Peter Maydell wrote:
>
> However, in a followup mail from Laurent we see:
>
>   https://lore.kernel.org/lkml/cb884368-0226-e913-80d2-62d2b7b2e761@vivier.eu/
>
>   The reference document[1] doesn't define the endianness of goldfish.
>
>   [1] https://android.googlesource.com/platform/external/qemu/+/master/docs/GOLDFISH-VIRTUAL-HARDWARE.TXT
>
>
> The documentation does not clearly specify it.  So maybe maybe or1k should just
> be updated on the linux side and add gf_ioread32/gf_iowrite32 big-endian
> accessors.

I don't think it makes any sense to use big-endian for a new
architecture, just use
the default little-endian implementation on the linux side, and change
the qemu code
to have the backward-compatibility hack for m68k while using big-endian for
the rest.

       Arnd

