Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B743753F89A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 10:49:54 +0200 (CEST)
Received: from localhost ([::1]:38246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyUuP-0004m2-QY
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 04:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>) id 1nyUnI-00088t-AT
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:42:32 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:60085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>) id 1nyUnG-0002P7-3A
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:42:31 -0400
Received: from mail-yb1-f182.google.com ([209.85.219.182]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mwfeu-1nZxai0AmI-00yC1C for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022
 10:42:26 +0200
Received: by mail-yb1-f182.google.com with SMTP id w2so29978219ybi.7
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 01:42:25 -0700 (PDT)
X-Gm-Message-State: AOAM533D9g17J50fDNWLXW4lyf1zempj8okRrRqOfADRiQehD0aHw9pT
 wLeJS14A2XOpnGaAXp1FQPP8HrJgaoCoxfIO5i8=
X-Google-Smtp-Source: ABdhPJxwjVDItlSrS0Al6JxMF6wQWQ9M771OSq4DvGMAHa7nSVUVMDBgXcT7K8EAkDFuyPvAEXPNZzO2/pl8+RGy/kQ=
X-Received: by 2002:a25:69c4:0:b0:65c:ed2b:9106 with SMTP id
 e187-20020a2569c4000000b0065ced2b9106mr28705119ybc.394.1654591344613; Tue, 07
 Jun 2022 01:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220527172731.1742837-1-shorne@gmail.com>
 <20220527172731.1742837-4-shorne@gmail.com>
 <CACPK8XexaTREY3Y-jp8urTAE+UmQWgygFx1MAss9KcJw5tGMtw@mail.gmail.com>
 <CAMuHMdWF_OwTMZZ=joRsnOAuB5UuKjACt3Ku4-o0--fR6xqQbQ@mail.gmail.com>
 <YpkWllpTFzb2HHY5@antec>
 <CAMuHMdXBtihLpdOYn7nj_fH2g08nDUiUd-_zCZ_EdEyvw1UxWA@mail.gmail.com>
 <YpwNtowUTxRbh2Uq@antec> <Ypxb/VDfYLFg3n2s@antec>
 <CAMuHMdVwAzbAOBDcv4y1WmYgCaFOMdywxUZvwMtDccOgDMN+mw@mail.gmail.com>
In-Reply-To: <CAMuHMdVwAzbAOBDcv4y1WmYgCaFOMdywxUZvwMtDccOgDMN+mw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jun 2022 10:42:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Vpn02uDe3rdXSNXANY=u4ZM+wjm-qqszTXzjOKkAeEg@mail.gmail.com>
Message-ID: <CAK8P3a3Vpn02uDe3rdXSNXANY=u4ZM+wjm-qqszTXzjOKkAeEg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] hw/openrisc: Add the OpenRISC virtual machine
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stafford Horne <shorne@gmail.com>, Joel Stanley <joel@jms.id.au>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Openrisc <openrisc@lists.librecores.org>, 
 QEMU Development <qemu-devel@nongnu.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:YE695iseoG08pCwy2AY4WMQHVepFhtJ+1FYbRPbeeMVX7ZObfww
 mI2Jz/jkPW6tONSrIQPm/dQDq53FmYn6DKJll2WGyL/68+lWA9jD3DzO353F1y50TvDqjiO
 63cx4sF+SgJ2+uClNLqtF7hHRo4qABT93JsWh03qweEhBC9DomJxh6/1jakAkMkriJQChR+
 2wM7Tor4FWl8wzZ8E7fog==
X-UI-Out-Filterresults: notjunk:1;V03:K0:d86jiYe9O+w=:hQdM+ER3NFS3qLxL1j7keQ
 4ycB5WKgBB4OR4oNAXv4UdzxQKcx2jtWY3zdV5TgXSHF60ejz5cy9tNZT5G6mMpV1knJtX8jO
 0PrhHlzGHfuTqYmHwKj68Z99ByG6cFpSc4j1VBw/p2AxxUq754qd68wUahtu7Gu7LaxzQZggP
 wE08W7gpVvCuUgD+wbmN+DWEMOhKPFb7U1rQJsCMOj290OT85zJL97IknzKu1vLFS8WJPIRaX
 eNPAai73yo8sx+68nCufZJ1cK6ke6iqAB2bwbnB6peKPM55qw1TnG988QQ8cg9SmzHF4cwFwt
 qi3yAqwoG+PjgKa3sENEZPZ4pb+Vu0MDepcr6OsZCAjqFlAVHT0+AUIGt9XiHm0KqEbqXiW87
 90YFe9IdCCXXLqsxFzl2922rIEqORYqx4KsBaGgsQZQ34/9CTma0kfxLqWy8YYiqBm7LN927s
 3bFTTYeFOvV/Od1ndUTcn/LxTkf4ylKjTWJUoNr24EGfs9spJgcxU4ygK/VMIm/UaqJ4nPHUz
 2fOeWGTpS0qnX8JME20NhgLEEp+kcMwfIOul+aKFe1aj6aos6wjtMhd2/8xEZoKIoROMFYtMF
 WDp+unca5Ey5aPjRLxAT/EVMExbki8T+d69vH8SxQTNBUcuhivPY9Y1dvbymTt6pG1JqzCk9c
 wyoEWh7THzLPNxQ2ikL6LmSyXoeXZNgqUizWVJ4aoB/xN02A4AInMZUwjVD8amGNJ5KElbl2S
 SbKtwGG53eXLtxmJPXjaf5x34hZBRytA3d6AywymKjdUj7EWwE52G90RW2y0BTdpz7wn4aNu1
 lWyy6ka+ZtyhQLhldsFnQxZF/trHsu0Nb0N9cOYzQjgbHh7SaXdD/KCo6hYDO8laVandhQWTn
 t2K1kAleIA+IUnkKBWbQ==
Received-SPF: none client-ip=217.72.192.73; envelope-from=arnd@arndb.de;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

On Tue, Jun 7, 2022 at 10:11 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, Jun 5, 2022 at 9:32 AM Stafford Horne <shorne@gmail.com> wrote:
> > On Sun, Jun 05, 2022 at 10:58:14AM +0900, Stafford Horne wrote:
> >     It might be a good idea to revisit the qemu implementation and make
> >     sure that the extra byteswap is only inserted on m68k and not on
> >     other targets, but hopefully there are no new targets based on goldfish
> >     anymore and we don't need to care.
> >
> > So, it seems that in addition to my patch we would need something in m68k to
> > switch it back to 'native' (big) endian?
> >
> > Looking at the m68k kernel/qemu interface I see:
> >
> > Pre 5.19:
> >    (data) <-- kernel(readl / little) <-- m68k qemu (native / big) - RTC/PIC
> >    (data) <-- kernel(__raw_readl / big) <-- m68k qemu (native / big) - TTY
> >
> > 5.19:
> >    (data) <-- kernel(gf_ioread32 / big) <-- m68k qemu (native / big) - all
> >
> > The new fixes to add gf_ioread32/gf_iowrite32 fix this for goldfish and m68k.
> > This wouldn't have been an issue for little-endian platforms where readl/writel
> > were originally used.
> >
> > Why can't m68k switch to little-endian in qemu and the kernel?  The m68k virt
> > platform is not that old, 1 year? Are there a lot of users that this would be a big
> > problem?
> >
> > [1] https://lore.kernel.org/lkml/CAK8P3a1oN8NrUjkh2X8jHQbyz42Xo6GSa=5n0gD6vQcXRjmq1Q@mail.gmail.com/

Goldfish is a very old platform, as far as I know only the kernel port is new.
I don't know when qemu started shipping goldfish, but changing it now would
surely break compatibility with whatever OS the port was originally made for.

      Arnd

