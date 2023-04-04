Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43696D6816
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 18:00:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjj4L-0005YE-Pu; Tue, 04 Apr 2023 11:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pjj4J-0005Y5-Uo
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:59:35 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pjj4I-0000MJ-2R
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:59:35 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9686974634B;
 Tue,  4 Apr 2023 17:58:29 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5DC697462DB; Tue,  4 Apr 2023 17:58:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 5B664745706;
 Tue,  4 Apr 2023 17:58:29 +0200 (CEST)
Date: Tue, 4 Apr 2023 17:58:29 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clegoate@redhat.com>
cc: Thomas Huth <thuth@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, libvir-list@redhat.com, 
 Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>, 
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>, 
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
In-Reply-To: <58b8efff-0cf3-5138-9291-0fc5b7a1dc10@redhat.com>
Message-ID: <5397807f-68ef-4348-20ab-40ed731e435b@eik.bme.hu>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com> <87h6w7694t.fsf@linaro.org>
 <dbc8b2f6-3e9e-65d7-998f-568b6376d25c@ilande.co.uk>
 <4e42ea6b-0f9b-69e0-1593-c3288712d13c@redhat.com>
 <58b8efff-0cf3-5138-9291-0fc5b7a1dc10@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-91968557-1680623909=:49755"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-91968557-1680623909=:49755
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 4 Apr 2023, Cédric Le Goater wrote:
>> Unrelated to KVM: Do you happen to know whether there are any problems when 
>> running 32-bit guests with TCG with the mac99 or g3beige machine while 
>> using qemu-system-ppc64 ?
>
> We removed rfi support for 64bit machine in QEMU 2.7.  Commit a2e71b28e8
> ("ppc: Fix rfi/rfid/hrfi/... emulation"). So a mac99 machine using a 970
> CPU needs a 64 bit kernel. The rfi insn was deleted from the ISA ...

I don't know about that issue but maybe this does not really answer the 
question. AFAIK you could still run 32 bit guests with qemu-system-ppc64 
and they seem to work. One could still get the qemu-system-ppc -M mac99 
machine as qemu-system-ppc64 -M mac99 -cpu G4 but this is very confusing 
and nobody could guess it. Other machines should work the same in 
qemu-system-ppc64, the only concern is that some defines such as 
TARGET_ULONG are different between qemu-system-ppc and qemu-system-ppc64 
and it's not known if this could cause any problems. It's more frequently 
happens that people try qemu-system-ppc64 -M mac99 when they want a G4 Mac 
and get confused that it emulates a G5 Mac instead which does not even 
work for anything than a Linux guest.

Regards,
BALATON Zoltan
--3866299591-91968557-1680623909=:49755--

