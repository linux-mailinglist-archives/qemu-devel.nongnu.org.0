Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FD7F8349
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 00:15:13 +0100 (CET)
Received: from localhost ([::1]:57756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUItr-0005sK-Rc
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 18:15:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44578)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iUIst-0005OE-6v
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 18:14:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iUIsq-0005RM-GG
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 18:14:09 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40590
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iUIsq-0005R8-Ad
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 18:14:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573514047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRw3Xdb7NaV1vA6WHNoYg4MDOkg1dAD9yg9d9nXQZbY=;
 b=dIJZQNaYcZBKJ8qw75/3z3OARhDWW3+nq/W722uJ+SeKY8DlKQ6jMk/kdYiNbGW3cfs1pE
 B8zlWFtzC1XnVy2DEQrzwvzpZnTgEMAI7OxsoPEIv8g8r+Z+siYPDt7E/NS9IDzwCr8vd7
 1KbTmlpFGkcZxJqse2BNo+26+rEMIOY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-l0XJrTTHPG-imUJJYTkCag-1; Mon, 11 Nov 2019 18:12:57 -0500
Received: by mail-wm1-f71.google.com with SMTP id 2so559256wmd.3
 for <qemu-devel@nongnu.org>; Mon, 11 Nov 2019 15:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aQmZYLRV7l9ci/nw67CCcR0Fp0qnN9bl/lzcnzk+1Ik=;
 b=LjWpr3wy3WD1fKt/JFj+tr1Un4nQ1M6nl4Q//UAimwoY7zFAmUF0Q8o8zhDttaODiw
 BuBkanNsQpNqBICve3qgedOT7/s/paotJZYuFEDdWaCVRr73uKFVpJld0+HFXEy6OyJ7
 AZzBcRtwYGdKdl4vVHMzX2xVlMULgaOlwJrxroStbeDyYf6TCsTPkleLxyJFV3Nb9qJl
 hKMBh6KT2ToZ9d4hhv21IvbcewaiQ1D/mDXJDW0+p9oWS80pWrq0iFpzZSr0ULvuw1sr
 9+vt6exMpcFlRPFmwXqlfQzzswHz6VVrXvYV0LBBIaXycg0hhzOf+Zw5f2WFMzzrk543
 NPBw==
X-Gm-Message-State: APjAAAVJk0AC8FE+HGRTSayxIqm5WmwcAAOribDUgXphb/8YfgcL1tgi
 Af6H0TVb5jFCMYVyHFOfy/swdXsyRhk5gpXnXwgW2+MzGMSPvTss/u/oiw1dnEpMTGaK96Iv9GI
 CGVr0UOidpzJX/L8=
X-Received: by 2002:a1c:4907:: with SMTP id w7mr1140026wma.62.1573513976354;
 Mon, 11 Nov 2019 15:12:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqyrUZek1Q7ZVwced20u8h9i/lCZGJNfaWFXgu3GYRy4WQnl3TN+pSsSeN+hFJQhyNslsNsihA==
X-Received: by 2002:a1c:4907:: with SMTP id w7mr1140019wma.62.1573513976080;
 Mon, 11 Nov 2019 15:12:56 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:8c9d:1a6f:4730:367c?
 ([2001:b07:6468:f312:8c9d:1a6f:4730:367c])
 by smtp.gmail.com with ESMTPSA id w11sm11923294wra.83.2019.11.11.15.12.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2019 15:12:55 -0800 (PST)
Subject: Re: pcmcia support in windows xp guest
To: Ilver Belletti <Ilver.Belletti@ocmigroup.com>,
 "'qemu-devel@nongnu.org'" <qemu-devel@nongnu.org>
References: <ad594e0b002f4a4daeb16dbe4ab1681b@MSG00.local.ocmigroup.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <741421ed-50e4-b10e-3c08-0969a05e6a2f@redhat.com>
Date: Tue, 12 Nov 2019 00:12:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ad594e0b002f4a4daeb16dbe4ab1681b@MSG00.local.ocmigroup.com>
Content-Language: en-US
X-MC-Unique: l0XJrTTHPG-imUJJYTkCag-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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

On 24/09/19 14:45, Ilver Belletti wrote:
> We would like to install Windows XP 32 bit as a guest operating system
> in a Windows 10 64 bit host operating system. With the QEMU emulator
> will be the pcmcia slot available ?
>=20
> We would like to use an epp parallel port in the guest operating system
> by means of Quatech pcmcia card installed in the slot.

No, however CardBus PCMCIA cards are essentially PCI devices so you
could add emulation of a PCI parallel port device.  Note that QEMU does
_not_ come with such a device, only with an ISA parallel port device.
It should not be hard to write one if it follows the same I/O port
structure as the ISA parallel port at 0x378/0x278.

Paolo


