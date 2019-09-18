Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E9AB623F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 13:27:32 +0200 (CEST)
Received: from localhost ([::1]:57512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAY7P-0006iY-B9
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 07:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45373)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iAY46-0003vH-Mv
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 07:24:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iAY45-0004nE-Jb
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 07:24:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57606
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iAY45-0004mx-GX
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 07:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1568805844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=dPPLJ/WKFZTlWCDp1ygywvosrCbAW+02zkKVteJCeGU=;
 b=WIx3jHOxv5Q5sltOaS35j+0WfpeewRUCpX3zYnVoRA2gsuWTKyrRgeeiL18GV7QeME/aD6
 Q0ra6ycx0MVLQdVF4cUbGhd1XO+JjcuTe/6PVdgxdJ1MkMXDh3XLYFpLKSTiYgi0+CajYB
 QOU4cwVMNT1ms2lTktx/mWo8lIwUIyk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-48A30J0kO8CO94OyGXEXXw-1; Wed, 18 Sep 2019 07:24:03 -0400
Received: by mail-wm1-f70.google.com with SMTP id l3so387199wmf.8
 for <qemu-devel@nongnu.org>; Wed, 18 Sep 2019 04:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dkh7NGoppgA6ZNaaH0C8FS6RAeX9CqiOscek06hZj9I=;
 b=WAdBFhG+IhUlnHN51juAPcQLWE/DTV/yNh5FIqUlMKDv5GvHR8aZYiNFweFgoLLeWe
 PqrzmE2LuyAHFv/bSdCpTsZhK9p+sCbwHIQskfB2O1pb2XaCmrHJsbiRF0kdePo82g90
 8k100cdI6c1xAyy/843GLF8o5jmijsVaObEkmUT9RGaaPM/K5QKeM18S1pKLZZjlkeVe
 jKYRNa2OQJ0yq4vJS62JylY2OTujLAnvZf0I1HidUZoASmy7VQoCt7rjQmbi2P51DU3x
 xcl+NDcyHTQ5SlYpTcqEjRRF1TesUGZyO9HLXScot1Vh6d5QwsBSRYr82Ufx2K7vR7wA
 UsJg==
X-Gm-Message-State: APjAAAV/OXP/1C8wk6rOZ7IAR25WqoieN+WtBbEm4la7ULaimZN1qYN3
 seGJUmeO1rtCTPtXf8aQx5nScldYwBxJpGLDmplHAIcqfqxyPFcZ8oF59K/fGi2VyUqHLAdSt9V
 EPTSWS8zv6bNIuFI=
X-Received: by 2002:adf:f1c3:: with SMTP id z3mr2807071wro.147.1568805842310; 
 Wed, 18 Sep 2019 04:24:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwTlo6/gxEoClKbYCuyQyXSohUzLQ3L/H1e/l4m742QGau6tbP2bS2eOYU6k7gacqofG/iskw==
X-Received: by 2002:adf:f1c3:: with SMTP id z3mr2807061wro.147.1568805842174; 
 Wed, 18 Sep 2019 04:24:02 -0700 (PDT)
Received: from [10.201.33.84] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id q3sm6244545wrm.86.2019.09.18.04.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Sep 2019 04:24:01 -0700 (PDT)
To: Ilias <i.maratos@gmail.com>, qemu-devel@nongnu.org
References: <CANP-_LDVvnbXnk1GpNRbQ3zKBsh-z6_w1qn-t9LKbtGEEKUV-A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ed7f417a-8f25-fcf2-b2d8-b1535fca4422@redhat.com>
Date: Wed, 18 Sep 2019 13:23:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CANP-_LDVvnbXnk1GpNRbQ3zKBsh-z6_w1qn-t9LKbtGEEKUV-A@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: 48A30J0kO8CO94OyGXEXXw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
Subject: Re: [Qemu-devel] qemu patches
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

Hi Ilias,

On 9/18/19 10:19 AM, Ilias wrote:
> Hi,
>=20
> Your recent patch
>=20
> https://github.com/qemu/qemu/commit/12e9493df9242a2051701e7eb64175d4e904a=
cba#diff-d98f9b48cc332d226892f0db74a86b87
>=20
> to the file
>=20
> target/i386/whpx-all.c
> <https://github.com/qemu/qemu/blob/master/target/i386/whpx-all.c>
>=20
> breaks compilation when WHPX is enabled.

How do you build QEMU? Which OS/compiler version, ./configure flags,
etc...? (looking at adding your case in our build setup).

Thanks,

Phil.


