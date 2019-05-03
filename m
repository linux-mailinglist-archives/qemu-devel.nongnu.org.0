Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37A012B75
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 12:30:07 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37767 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMVSA-0002Lc-PQ
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 06:30:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMVRD-00022c-65
	for qemu-devel@nongnu.org; Fri, 03 May 2019 06:29:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMVRC-0003U9-Cn
	for qemu-devel@nongnu.org; Fri, 03 May 2019 06:29:07 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:32973)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hMVRC-0003T3-2o
	for qemu-devel@nongnu.org; Fri, 03 May 2019 06:29:06 -0400
Received: by mail-oi1-x241.google.com with SMTP id l1so4056464oib.0
	for <qemu-devel@nongnu.org>; Fri, 03 May 2019 03:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=W+9F26wJZLvO6u9zd0cUO5/pkkKiUaMfDJ3y+1tnKrM=;
	b=ef0n1XptoJ+/NQT3Mlz8AlNzI1VnWDOgDNpAdGLWt49dhVzpdfX8U9OJDezo3Vmhkl
	jDnG9NQzz4Bi6/F3vuPM40VZOYCreDzFdoulBg23W19n1y7ifaXM2FqIsoSXnBcifJlT
	P064gTm5E0qxAcR1mcXhGvPHrkpdvp8VSAXszQs4TYHrunTZy/2dbdtooMWI8uabXlDp
	05hyskcz8QMkOgRlUxVHKdylt5xct3sOi3ScseD0MbTdgtBKuIB3wSpoVsiZ85ZgeJ//
	b35/eQxvUMzc1+drh0NMANCdus0aSlj0vCqZL/eBBn4IC54IoNKepOLYjJsiEippkBnA
	oXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=W+9F26wJZLvO6u9zd0cUO5/pkkKiUaMfDJ3y+1tnKrM=;
	b=pXKI9sFf6ttJdRB3dBO3TaYVms2wxKZkR3ySAG+44dmz+67MoJddbsZ99y5MASth7t
	jMlE6Mwp9MmqFtGlsriodEip3ESAIntSGCICnrlq0DZ5fyqF5UfMHTkOM0v88TN5IRCU
	bXqi5bWw/26YslavLlBNhRReL9Um14kVHszdQHtvbkpebxU/s/Gh0giaFSsCWpYPUiiv
	VYTD9aXA7oAd0Wsix5WpNKMnnvXPe+O5SnbJq1e3GqY/UX4Ta698dc5wPdBvE/OsocTn
	S4hGw10t1JttqTpiFbmj4AWZ6lmQY9rM54PwLGVAqMzTizo/uavAEDy7iTl9J4b/VQFb
	6w7w==
X-Gm-Message-State: APjAAAXSo9XoT6BwFmmjg3vNj9Dh0cdpFt+6nBsCpP26c3nuIBdgLDFs
	/Jah+ion7irZw+j7KnXLHFlFWg2NxUjYY6PfH32T2Q==
X-Google-Smtp-Source: APXvYqxC6Atjk1ZLaTqkWuanBL7Hlta0R0KnNga9faT6fkWlHiYzVcxino9iMAPX0MrVw80Systc/tsa59dHJ1SzULY=
X-Received: by 2002:aca:ed17:: with SMTP id l23mr5271275oih.146.1556879344323; 
	Fri, 03 May 2019 03:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190425133503.30847-1-stefanha@redhat.com>
	<20190503101921.GC17905@redhat.com>
In-Reply-To: <20190503101921.GC17905@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 May 2019 11:28:53 +0100
Message-ID: <CAFEAcA_CkUBHe1fWg9wy-+HLw8WBZrp3M_oBksCN1GQc1qp4hg@mail.gmail.com>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v2] security.rst: add Security Guide to
 developer docs
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
Cc: Eduardo Otubo <otubo@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 May 2019 at 11:19, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
> Everything above here is useful to QEMU devs, app devs & end users and
> should be made part of the main QEMU doc - convert it to texi and @includ=
e
> it from qemu-doc.texi, as we do for other stuff under docs/

If we convert it to texi we'll have to convert it back again
as/when we migrate properly from texi to sphinx... (I would
like to make further moves in that direction during this
release cycle -- just need to find the time to work on it.)

thanks
-- PMM

