Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCCB169C5A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 03:40:09 +0100 (CET)
Received: from localhost ([::1]:58932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j63fE-0006cJ-Sx
	for lists+qemu-devel@lfdr.de; Sun, 23 Feb 2020 21:40:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53455)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <programmingkidx@gmail.com>) id 1j63eU-00065I-R8
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 21:39:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <programmingkidx@gmail.com>) id 1j63eT-0007sN-OT
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 21:39:22 -0500
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:37438)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <programmingkidx@gmail.com>)
 id 1j63eR-0007ra-A2; Sun, 23 Feb 2020 21:39:19 -0500
Received: by mail-yb1-xb44.google.com with SMTP id b196so3557929yba.4;
 Sun, 23 Feb 2020 18:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=9co85jLO9K/PD2zmkfWrDuTmSzqAlmbj5LrUVpza92k=;
 b=UkLD9+HWF5wRKgv+XLVTYsWEAvWCL3UynURcAMiHloK/koUHRZgw2FyQ6yA94jMB5Z
 lXH1lZHrAZCY6kG+4dvJf3fqTLa1Ji6slsCcv1DoSN+DdSCfmGn/31EJsoLkWi81lERy
 WEJrAQTecnP+rVLLz0pRJHaC22Ej/At0ZFdUMj01z5SFvhfoGrMnmDGw9W5VXYbUFYVa
 UcgFrMF7HdIV4ZNzt8zaSxAUZrkSDkM1T7XDlWiN6R4fVLynPIiyN6Hy39+znOeduV5f
 Lwnaw34RhdZAIuITP+g1hW7AEzvrJp2KfiMqITtAmfk5Fep7IxaDCmTjn520tMHBmNXz
 6gqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=9co85jLO9K/PD2zmkfWrDuTmSzqAlmbj5LrUVpza92k=;
 b=nzXCqlt9+I1POMWv81/FCAGs19gvPmuPu3nqJkBrjUGx1/+xcZVQbEgrdneTweq7Jl
 zmh6haSwZarvNsYPGJ+kw2FZNf3O9L3STG7/RIM6QF9+mWkRSkdIpMxB5PurJszC4010
 ixYjIQ7fyPW2kqJ8mrSVw86sxP0i9XE1xlivNPk8aVlI/wXXyqmXldkpOdM3v3uIlMlk
 IzDcR2RMVepQr/Y11noQJB90NELAXy/9dTym4XAxXTcTbdkTQmoTJG6Ykh8G3HAEXbnI
 4CojWdYpk+biPOx2k5CzBK5VBP3Rd+qTrbPdCoKpLRrjnZT3U2463PnN8aAJfupGOg7u
 JmMQ==
X-Gm-Message-State: APjAAAWxCOvBifwydvJmD2hFwy05ilub1d+3Px8yPk8s/CZOcFyGHMRW
 Cx9E5RFoD+88XnkEg00iyVSntpvr
X-Google-Smtp-Source: APXvYqzCXN0IwK8CsniAFEzMfTRzNFT4dC6JbsOfOvxnNe7GCqvIzvxYxuux1o7GafDyle6ayqX48w==
X-Received: by 2002:a25:c64c:: with SMTP id k73mr46469339ybf.175.1582511958152; 
 Sun, 23 Feb 2020 18:39:18 -0800 (PST)
Received: from [192.168.0.5] (d149-67-30-58.try.wideopenwest.com.
 [67.149.58.30])
 by smtp.gmail.com with ESMTPSA id p2sm4779555ywd.58.2020.02.23.18.39.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 Feb 2020 18:39:17 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH v4] Implement the Screamer sound chip for the 	mac99
 machine type
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <mailman.135.1582477227.13245.qemu-ppc@nongnu.org>
Date: Sun, 23 Feb 2020 21:39:15 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <89817DD1-763B-40AA-866F-E4A573852551@gmail.com>
References: <mailman.135.1582477227.13245.qemu-ppc@nongnu.org>
To: qemu-ppc <qemu-ppc@nongnu.org>,
 Andrew Randrianasulu <randrianasulu@gmail.com>
X-Mailer: Apple Mail (2.3273)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b44
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
Cc: qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> On Feb 23, 2020, at 12:00 PM, qemu-ppc-request@nongnu.org wrote:
>=20
> Message: 2
> Date: Sun, 23 Feb 2020 12:43:37 +0300
> From: Andrew Randrianasulu <randrianasulu@gmail.com>
> To: hsp.cat7@gmail.com, qemu-devel@nongnu.org, "qemu-ppc@nongnu.org"
> 	<qemu-ppc@nongnu.org>
> Subject: Re: [PATCH v4] Implement the Screamer sound chip for the
> 	mac99 machine type
> Message-ID: <202002231243.37654.randrianasulu@gmail.com>
> Content-Type: text/plain;  charset=3D"us-ascii"
>=20
> Just thought I must share my uneducated guess on issue reported at
>=20
> https://www.emaculation.com/forum/viewtopic.php?f=3D34&t=3D9820
>> Please note that running with 1024Mb of memory will make sound stop =
working in Mac OS 9.x. So run with less memory.
>> As will running without virtual memory.
>=20
> My guess this has something to do with device memory regions, may be =
because Linux  always uses Virtual memory
> (MMU, address translation), as well as Mac OS X 10.x - this little =
issue was unnoticed until recently ?

Interesting theory. We may have to consult the 'Inside Macintosh' series =
under Memory management to find out how Mac OS 9 works with non-virtual =
memory.=20=

