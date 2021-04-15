Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2334A36019B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 07:29:42 +0200 (CEST)
Received: from localhost ([::1]:50486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWuZR-00075m-9F
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 01:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWuYH-0006XT-73; Thu, 15 Apr 2021 01:28:29 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:44904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWuYF-0006tx-No; Thu, 15 Apr 2021 01:28:28 -0400
Received: by mail-pf1-x42e.google.com with SMTP id m11so15297584pfc.11;
 Wed, 14 Apr 2021 22:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=LP+57eqfwYFNzuYtHRfZIvRZ3vd53H3lc6YsNNaRRmg=;
 b=ZGHDzo6o2EoBVWd053I4e4W9RYIR7fN9vJ40V8Pg5Dwf+tORUC9Vf6YXOTqiF7DjGG
 n1yV+6GN8Uw/CW9gqiPomBbOxI4SXmElbuP/gNBd7TN7Jcw8+MOmt4zttqPK1eXVshzq
 7ZepWmQ3B+lrqkHxkKT3l+wpZZMVWoLYKgFfww/x332oB+hTe7G54jggZPzetVk4meTm
 2ZPv1rTbBSSFMIVtINsK825wrFTdrim2onbvKE/6aylEZNka6n04BN17JISdm9/bKxH2
 a92pC+x+D/WghwV3AVYFL4GUrA1rF5mz7mMdIt44Qe9kGwbgDuOB9611I+v3B79VWmGv
 Kpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=LP+57eqfwYFNzuYtHRfZIvRZ3vd53H3lc6YsNNaRRmg=;
 b=aantx4dxU+0SmNcubqT2DucFWQFI7KadRqIdbzv3Hi61e5hg0/tsySgzNBVL/ph9pa
 MS/+hAH3XNckqZ4eUq5r2jqNedbKjWC2IChXJZbe0HVRo5IUBd6gFQTq4xfh97Jji2ti
 ZwuBSUbZ1Uj6lcA4a/A1d66KXu37OBKOIuN9ke67QeEVh83D92sqWTlTcAAXzsFJ1nVS
 +mPc5w2uEcOKNcMqXpm5Sx7d6eiz27jPg5hdptXwTYmc7pKt6wmWmH7DmWyGrTS/NgvN
 ZEXQMNtER4FetSomTH9L4d3NsbRKJK/sgKElZ6sQFrPE95NrUzwcz0jvFIkPfqEBPlfs
 W2lw==
X-Gm-Message-State: AOAM533A5da6ulIdv9YtzZ9ehlnHPQTaaZ36zIkTOocIGZHX3MEpqUlI
 tXsiOqs+ocTj++bzad9jKbw=
X-Google-Smtp-Source: ABdhPJzHRFmQOL2uwrKiWu+12yYQL5HtFwhaUPlw227B8qThVoefNQqoq3tIaHCYxSJ6I7yV9VFsFA==
X-Received: by 2002:a63:4442:: with SMTP id t2mr1965739pgk.232.1618464505886; 
 Wed, 14 Apr 2021 22:28:25 -0700 (PDT)
Received: from localhost (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id e10sm874228pfv.196.2021.04.14.22.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 22:28:25 -0700 (PDT)
Date: Thu, 15 Apr 2021 15:28:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [EXTERNAL] [RFC PATCH 2/2] target/ppc: Add POWER10 exception model
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org
References: <20210414032343.1720010-1-npiggin@gmail.com>
 <20210414032343.1720010-3-npiggin@gmail.com>
 <07285365-1c95-27b3-6922-260709d22624@kaod.org>
In-Reply-To: <07285365-1c95-27b3-6922-260709d22624@kaod.org>
MIME-Version: 1.0
Message-Id: <1618464352.9ndmtpt9ct.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 =?iso-8859-1?q?C=E9dric?= Le Goater <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from C=C3=A9dric Le Goater's message of April 15, 2021 1:54 am:
> On 4/14/21 5:23 AM, Nicholas Piggin wrote:
>> POWER10 adds a new bit that modifies interrupt behaviour, LPCR[HAIL],
>> and it removes support for the LPCR[AIL]=3D0b10 mode.
>=20
> This looks good but it's missing the MSR_LE setting. A part from that :=20

Oh, and lpes as well. Looks like a mis-merged from my original patch.
Thanks for catching it, great.

>=20
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> and=20
>=20
> Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks, this was tested after you added the MSR_LE bit?
>=20
> distros using scv on P10 now need your patch to boot :
>=20
> "powerpc/powernv: Enable HAIL (HV AIL) for ISA v3.1 processors"
>=20
> I guess it will get merged in time.=20

Yes, unfortunately. Real hardware crashes the same way though, so
nothing to be done about it.

Thanks,
Nick

