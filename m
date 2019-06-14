Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFD8457B1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 10:36:45 +0200 (CEST)
Received: from localhost ([::1]:49286 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbhhU-0005u6-J8
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 04:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55594)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@gmail.com>) id 1hbheC-0003yo-Id
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 04:33:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1hbhe5-00045q-AE
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 04:33:16 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40999)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1hbhe3-00041F-Am
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 04:33:13 -0400
Received: by mail-wr1-x435.google.com with SMTP id c2so1555267wrm.8
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 01:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oDMxe05X7s/kqUFoAgC/6Dc3dkWT1ZRzHu7q2t4kuas=;
 b=r83/gL1NBmSJVvRImhUqXyJQDj6UvtaPeSo83WV8u1tZocsrZNW4XNHOmu8myRxa/I
 azBhmTCM0dd6WndVM+z1vMEvZv9FTKV2Tkk0xBj7Ld+Anc91wmjk8j8CDTacOPjtbP3I
 /N4Yph4whaigOTlQpWpS95yj66JKbu9ErMgOMacITDViZquTWlcQ3tmRviUJJlxvObff
 /30+OxpsI/a/VN7qyQbYYeBcvILxEclN++1Pc8b2sEiZNwWSJ/1QPWM7r9+eiwERN2i/
 eGEwtI+THxn0RpfJTspTTr+LB1x5CdcxcPHli4Z3IiNNt80WH0wTOAjNC/jZBTEMWab1
 fP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oDMxe05X7s/kqUFoAgC/6Dc3dkWT1ZRzHu7q2t4kuas=;
 b=psOwZlDZDqUhnoK1XfPYeAR53TDiQPP1qI7fCIlwfpUQTuHTdW7dRLmM+bl82LMGw9
 4XEKRjNvkRghJZ8Hm0e56xzL/X+M4w92V9ypOUnPKu38jsKsbGve044Ne7RTTe7fB5s4
 ZPqzcPzkxEiGDpQsvyATZ3pk5+ww+DHzOqWqX3SnUFU4NltNmYMMLXbovms20HgOTSvF
 v4HW1jMNVvAuyOCU+nWf0b+FqwlZ7jrHpYnwpInopgdN3K15XSJCIdbOb9cYCx300e97
 bMg70xzEAqmpbousq3Aa0hNH5lVrutwjW+cjXODBZSZioEuNr6yr00KmvveF4TcjG3On
 r3TQ==
X-Gm-Message-State: APjAAAXNImJQ2MLJ7eOf6ujzQu5PTfZecdnjMdwT2QOMcKJKtZCuLrpp
 jJqE1ZLtVdDZzBEKBn1c7CI=
X-Google-Smtp-Source: APXvYqwDgWoU5XTLocWITBFN8WhRsoBo6L2bUS8rp5SBqapdAm+/S0UhHFgYpdbOULTi5aPijXxFbQ==
X-Received: by 2002:a5d:400f:: with SMTP id n15mr123773wrp.312.1560501187880; 
 Fri, 14 Jun 2019 01:33:07 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id u5sm2816460wmc.32.2019.06.14.01.33.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 01:33:06 -0700 (PDT)
Date: Fri, 14 Jun 2019 09:33:02 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Martin Ichilevici de Oliveira <martin.i.oliveira@gmail.com>
Message-ID: <20190614083302.GA10957@stefanha-x1.localdomain>
References: <20190603205826.2345-1-martin.i.oliveira@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
In-Reply-To: <20190603205826.2345-1-martin.i.oliveira@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
Subject: Re: [Qemu-devel] [PATCH] [RFC] Add a eBPF-capable PCIe device
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
Cc: javier@javigon.com, qemu-devel@nongnu.org,
 Stephen Bates <sbates@raithlin.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 03, 2019 at 02:58:26PM -0600, Martin Ichilevici de Oliveira wrote:

Thanks for sharing!

The bpf_ram accesses are unsafe.  The guest can modify bpf_ram while the
device is accessing it.  This is likely to cause security problems.

I think a model is required where the device copies in the program and
additional data before processing.  This way the guest cannot modify it
while the device is executing the program.

Also, please validate inputs.  The guest is untrusted.  Offsets, sizes,
etc cannot be trusted and must be bounds-checked.

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0DW74ACgkQnKSrs4Gr
c8h81AgAlr3HtIcyOYR8abYf3r+TWyT1wicHIiddWcdwzej9tDo5jD0QQieB2F0a
EpW30dAB84M9VouR3e8+0T95tFqzd6bJEy6K30gUdw8HqeHY1zofinbpCLQrGU+P
wghj3bXlM3hukITcv3g1qhRRbQR2uAwsdLZGL7ocwSEt3LuM55bp1oXo4j8JpszT
RYZjkpWbdXo7tWRMcaHcifsFgn/7pmOD9ZpSLNC3Nk7GV4MpsCmGVX9p9CYwM2dR
LurdNJ3I1ndm9MLdtp9bv4eq9469k0h31P5I/nq3vtiC1Ktq1ua4p9zsJVjC5KBj
5AxLUGHTGWgW9X/mPfCgrJkU+SmCQw==
=4VpL
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--

