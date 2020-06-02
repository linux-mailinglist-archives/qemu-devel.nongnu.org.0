Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7129B1EBE91
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 16:59:22 +0200 (CEST)
Received: from localhost ([::1]:34606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jg8Ns-0000rB-Ug
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 10:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jg8Mz-0008Rx-Jy; Tue, 02 Jun 2020 10:58:25 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:43084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jg8Mx-0000te-TY; Tue, 02 Jun 2020 10:58:24 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8F77874633F;
 Tue,  2 Jun 2020 16:58:19 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7126C74633E; Tue,  2 Jun 2020 16:58:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 6FA1874632C;
 Tue,  2 Jun 2020 16:58:19 +0200 (CEST)
Date: Tue, 2 Jun 2020 16:58:19 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Andrea_Palmat=E8?= <andrea.palmate@gmail.com>
Subject: Re: Sam460Ex screen mode, audio and network
In-Reply-To: <alpine.BSF.2.22.395.2006021510140.40694@zero.eik.bme.hu>
Message-ID: <alpine.BSF.2.22.395.2006021647240.70962@zero.eik.bme.hu>
References: <CAD+yzTSr2edTNmzkGOH7todx7uVPbL_BSNSJPb62mJWCUSa8NA@mail.gmail.com>
 <4d64c939-3431-b637-488e-676a5f9171e5@amsat.org>
 <alpine.BSF.2.22.395.2006021510140.40694@zero.eik.bme.hu>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-816818955-1591109899=:70962"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 10:58:19
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-discuss@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-816818955-1591109899=:70962
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 2 Jun 2020, BALATON Zoltan wrote:
> On Tue, 2 Jun 2020, Philippe Mathieu-Daudé wrote:
>> Cc'ing the sam460ex maintainer.
>> On 6/1/20 8:01 PM, Andrea Palmatè wrote:
>>> It is working on an i5 laptop. I've tried to use the native screen mode
>>> 1366x768 but it has some problems. It seems a stride problem and so is
>>> not usable
>
> I'm not sure if it's a problem on AmigaOS side or in emulation. How to 
> reproduce this? Such resolution does not show up for me in ScreenMode prefs 
> so cannot be simply selected.

OK I've got it. I think you've unticked default and set a custom width. 
This seems to set the width of frame buffer in memory but the mode the 
card is programmed to use is still the one selected from the list so this 
won't work. It seems to be either a bug in AmigaOS or the width option 
does not do what you may think. Maybe ask AmigaOS developers or aCube who 
wrote the driver about this. (Another known issue is that 24/32 bit modes 
are not available with the AmigaOS SM502 driver which would be needed for 
optimal performance with QEMU, the 16 bit mode it offers is much slower 
because it has to be converted on every display update.)

Regards,
BALATON Zoltan
--3866299591-816818955-1591109899=:70962--

