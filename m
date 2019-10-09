Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3715D1791
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 20:29:42 +0200 (CEST)
Received: from localhost ([::1]:53844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIGiS-0007bH-Pz
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 14:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59953)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <flukshun@gmail.com>) id 1iICmZ-0000Yb-Qb
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 10:17:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <flukshun@gmail.com>) id 1iICmX-0005Cc-U1
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 10:17:39 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41303)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <flukshun@gmail.com>)
 id 1iICmX-0005CA-KU; Wed, 09 Oct 2019 10:17:37 -0400
Received: by mail-oi1-x244.google.com with SMTP id w65so1867268oiw.8;
 Wed, 09 Oct 2019 07:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:mime-version:content-transfer-encoding:to:from:in-reply-to
 :cc:references:message-id:user-agent:subject:date;
 bh=bX6N+owBJLlE+ZvXbQpkuPrJh3QN8kTTEqzEG5sCiIg=;
 b=uSti2IEyVqipwpkftiJqbV1pju3CKelx46hDl6ruH9fNQSZ4zcxsnQkrmDorjr0V0E
 XBtLbjO9Ajg+SxyACLeQ8AEzYfUUDdkIWp5iPhPYKkiG2ZJH3+jM3fXihXzaGHuFd7x/
 OYZd5Dz5GIRCOAhYPJmu4e6nGT79msoWXFhkXExAqsGShh51VfGV9jlpI2ywrdmmju1A
 yWecukC502PTWzA9AuEU59OUKjjN/VNw4Ny4tVYidIbxVJIIkFqH9fwQHei6BjWg5a0o
 zXcosnjP0OMSp/+b5QrFJXguMFq+jqVdENfqlu9NZZ3s2TK0uaSfKQHxa1ntvNrhuh6t
 bPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:mime-version:content-transfer-encoding:to
 :from:in-reply-to:cc:references:message-id:user-agent:subject:date;
 bh=bX6N+owBJLlE+ZvXbQpkuPrJh3QN8kTTEqzEG5sCiIg=;
 b=eXwgvqB4b26Rgji8D0wtdNBKpnXZ3hIxHkLvprh/3oxbVYdHAJ0bLD8AMzvP0dLocD
 peRWjAbaQXqFsIVbsIKfIaaDSmgIER47nS/+JzgGvO3In71mmo3orvTUsTYSgyt7HvRA
 cMBOHk2x4VU2/dCCDzUAysIcP9cleRjQD44r9CvwXRUjebKdBcH9xxxy3j5KedWZx4tV
 6ceXigpMvrbeBH0kyVtLZ1Q7sSJOLnledpw13oGt08116COn2tBpRn9zVRiNq4/BBTfb
 XIOcoD0VEAVI67qIlIXJY8RRATVtieAEkiy0eRslA7UtLNtgmNVTLHVIk+26arnb5IN7
 MWgQ==
X-Gm-Message-State: APjAAAUUmqo1x268QOTkUeNTLJh1L/TUBErAW5HwKmvI6OV+97ytXvrF
 mlc0ouSM44twgj8gXeldhFk=
X-Google-Smtp-Source: APXvYqw1JjFLL3R8VZpGk7v/eimtvX1bNXekF7Fe+WIV6xsC24eWSmz12JzfiMvPmE1dwcmIfwFjzg==
X-Received: by 2002:aca:5c06:: with SMTP id q6mr2529800oib.175.1570630655088; 
 Wed, 09 Oct 2019 07:17:35 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id 109sm703819otc.52.2019.10.09.07.17.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 09 Oct 2019 07:17:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <78c46a05-76eb-ccec-df4d-103bee7c2760@redhat.com>
References: <20191001234616.7825-1-mdroth@linux.vnet.ibm.com>
 <78c46a05-76eb-ccec-df4d-103bee7c2760@redhat.com>
Message-ID: <157063064956.3717.12528742598919174752@sif>
User-Agent: alot/0.7
Subject: Re: [PATCH 00/97] Patch Round-up for stable 4.0.1,
 freeze on 2019-10-10
Date: Wed, 09 Oct 2019 09:17:29 -0500
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quoting Philippe Mathieu-Daud=C3=A9 (2019-10-08 08:04:52)
> Hi Michael,
> =

> On 10/2/19 1:44 AM, Michael Roth wrote:
> > Hi everyone,
> > =

> > The following new patches are queued for QEMU stable v4.0.1:
> > =

> >    https://github.com/mdroth/qemu/commits/stable-4.0-staging
> > =

> > The release is planned for 2019-10-17:
> > =

> >    https://wiki.qemu.org/Planning/4.0
> > =

> > Please respond here or CC qemu-stable@nongnu.org on any patches you
> > think should be included in the release.
> =

> Since it is a "release", these probably fit:
> =

> commit 45c61c6c23918e3b05ed9ecac5b2328ebae5f774
> Author: Michael Roth <mdroth@linux.vnet.ibm.com>
> Date:   Thu Sep 12 18:12:01 2019 -0500
> =

>      make-release: pull in edk2 submodules so we can build it from tarbal=
ls
> =

> commit f3e330e3c319160ac04954399b5a10afc965098c
> Author: Michael Roth <mdroth@linux.vnet.ibm.com>
> Date:   Thu Sep 12 18:12:02 2019 -0500
> =

>      roms/Makefile.edk2: don't pull in submodules when building from tarb=
all
> =

> When is the next qemu-stable release scheduled? Do we care about Python2 =

> use for this one?

4.1.1, likely early November during 4.2 hard-freeze. I think Python2 is okay
since presumably downstreams would've crossed that bridge with 4.1.0, assum=
ing
you're thinking of the changes in your recent edk2 pull.

