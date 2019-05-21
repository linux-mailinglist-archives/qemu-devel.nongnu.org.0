Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72F224DAF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 13:12:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT2h6-0006JM-1h
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 07:12:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hT2Wc-0006mH-HI
	for qemu-devel@nongnu.org; Tue, 21 May 2019 07:01:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hT2Wb-0003Uv-Cs
	for qemu-devel@nongnu.org; Tue, 21 May 2019 07:01:42 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:51088)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hT2Wb-0003UL-6L
	for qemu-devel@nongnu.org; Tue, 21 May 2019 07:01:41 -0400
Received: by mail-wm1-f52.google.com with SMTP id f204so2524642wme.0
	for <qemu-devel@nongnu.org>; Tue, 21 May 2019 04:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZOMC6HHFLJupWValHetArLkjeol+mF3LRE2pj6Idbec=;
	b=M95tXbLDWPODdVxYTzwXBkQO82ZEStOTH0oGV7G8A2xe8L948KqBxj2pjV03ndy2LE
	1srjNy6MGPSUT2CwvW3FkZslLZHSFfNIL0MdIk2y0pLoCbov38j7hST9R7iPQULW98bR
	alYui9KKNgoJi/GMUvUWFGS6pR2TzNB7W3+2OE1pCuMsdFCR1kNssnUh8I2HJaUYvIIx
	l77yy3E1Raj/Zdj6DFIa99Zt3tIA6dY+9c/MEJcZN7fApDkc9mzXdi6Rr7XZ+eytvhFL
	R81Y1Z/z1Qo5b6/w3Y9DqAGL+6QHFR2X3xhvorW1cPL3Q3aHx/iBeoV0V4Y0nRk74qG8
	Dksw==
X-Gm-Message-State: APjAAAXFJOFdzG4m4sSiSkgYWFifk6ezajgHAcVfDHokmfsvq4YdxIWS
	FfWwbVlRqPxZv1ujW/6Py7wEPQ==
X-Google-Smtp-Source: APXvYqy9LO0CVRakm7WCbl8FQmwCS/KgfoEUGnzcM6w8WnWycsI1kS/Z7LrT8tiq8Wh6kgrIt7FPnQ==
X-Received: by 2002:a1c:eb07:: with SMTP id j7mr2830066wmh.138.1558436500155; 
	Tue, 21 May 2019 04:01:40 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:ac04:eef9:b257:b844?
	([2001:b07:6468:f312:ac04:eef9:b257:b844])
	by smtp.gmail.com with ESMTPSA id 6sm25731054wrd.51.2019.05.21.04.01.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 04:01:39 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>
References: <20190520184108.GA10764@habkost.net>
	<CAFEAcA_jn6VBHMoKoGRojGTEQXOyzLtPG-rCE+uAt3BDBxYOBw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <34f9ddb5-a4b2-e8ed-ba10-f43036276d4b@redhat.com>
Date: Tue, 21 May 2019 13:01:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_jn6VBHMoKoGRojGTEQXOyzLtPG-rCE+uAt3BDBxYOBw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.52
Subject: Re: [Qemu-devel] Introducing GSoC project: API Documentation
 Generation
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
	Gabriel Barreto <sbarreto.gabriel@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>, "Emilio G. Cota" <cota@braap.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/05/19 11:42, Peter Maydell wrote:
> (The other interesting thing I'd wondered about with generation
> of docs from code comments is whether we would get better
> (ie more accurate, regularly updated) documentation of our
> supported machine models if we generated those parts of the
> docs from comments. But that's definitely much harder than just
> getting API documentation, because it involves trying to
> integrate them into a 'user documentation' manual which we
> have not yet converted from texinfo.)

For the user documentation, makeinfo can produce docbook, and that seems
to be the best way to convert out of Texinfo.  At that point you can
either pass docbook to sphinx (see
https://wiki.qemu.org/Features/Documentation though it's a bit out of
date), or convert it to rST using Pandoc.

Paolo

