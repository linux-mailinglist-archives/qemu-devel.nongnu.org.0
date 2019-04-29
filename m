Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E6AEA05
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 20:20:59 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33459 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLAte-00078Y-DF
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 14:20:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLAsO-0006Ta-Fy
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 14:19:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLAsN-00017D-L5
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 14:19:40 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42260)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hLAsN-00016u-8K
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 14:19:39 -0400
Received: by mail-wr1-f66.google.com with SMTP id l2so1778636wrb.9
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 11:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=b8JrVvmhx3q26IahqjD6E/5G69SfIzP3Kim3EOowCVU=;
	b=XY2/TPs4jZnJbNXIdP+sVdqyxIlJfWJoQFtfMW9/vRCXebnnWecbmfJrc7U+YIAsrH
	NXnitqFfuX7Q7ZpGN4GWw0v3Kvm6sC2QN8P9ATdj81ysg2DSHkljn+osyL0BsHBDn3CE
	tHnybFRhA6KdKipyIg4vGDPlWyBJKA1OVESM4d5NURBTQfrke7TOiAB5tdgMEtpn2mFh
	z0sl4r2sELHlYgP9alDjgN/DQfxgimq4e3ToGeFK7xavmP0TrU1/l9FRcgdKDVEjsjYo
	P4NJV/iQrNjciNoZECZoYXMRU7OBeGQO7cPBUV5A/yQUswIK5xBrmSH0lYBtvkBtAyvB
	gBAg==
X-Gm-Message-State: APjAAAXCPbZa88zoCcHj+mmhd2f6WxWO7zdwup+ADx0RYBQuSmCoVygN
	oPmbcTsjw3MB42OX5VsrQkBItg==
X-Google-Smtp-Source: APXvYqyEuqHPju9Rtbx3VhVmXLstxB/H3C8kzfLB42m/o7r+PmJo9AXB1izqtxVMBOEeDVgtisdrqg==
X-Received: by 2002:adf:b64e:: with SMTP id i14mr19509426wre.72.1556561978272; 
	Mon, 29 Apr 2019 11:19:38 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	e6sm25705557wrc.96.2019.04.29.11.19.37
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 11:19:37 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190412165416.7977-1-philmd@redhat.com>
	<CAFEAcA90Pv=zEqaonGV=c022T=CYMo11nkqNwBnGgocESnBNmA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f56687f4-434e-0e6d-77a8-fec6c33c9a62@redhat.com>
Date: Mon, 29 Apr 2019 20:19:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA90Pv=zEqaonGV=c022T=CYMo11nkqNwBnGgocESnBNmA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v3 00/12] hw: Remove
 "hw/devices.h"
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/19 6:51 PM, Peter Maydell wrote:
> On Fri, 12 Apr 2019 at 17:55, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Hi,
>>
>> As his first comment describes itself, the "hw/devices.h" contains
>> declarations for "Devices that have nowhere better to go."
>> This series remove it, creating new headers for devices covered there.
>> MAINTAINERS is updated.
>> I also included 2 cleanups while working on this, in "qemu/typedefs.h"
>> and "hw/net/ne2000-isa.h" header guard.
>>
>> v3:
>> - rebased
>> - added 2 patches suggested by Markus
>> - addressed Markus review comments
>> - added Markus's R-b
> 
> Since these are almost all arm devices I'll take this via the
> target-arm tree (I'm going to make a pullreq later today).

Thanks Peter!

