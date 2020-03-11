Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12587181D26
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 17:05:14 +0100 (CET)
Received: from localhost ([::1]:55098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3r6-0003GO-KK
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 12:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34533)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wrampazz@redhat.com>) id 1jC3nE-0005SS-Bx
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:01:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wrampazz@redhat.com>) id 1jC3nD-0001lf-1Y
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:01:12 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:28950
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wrampazz@redhat.com>) id 1jC3nC-0001lQ-T2
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583942470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v7U8FqVeyNiJ4QL2vqEc3cbXsr0IiPM0HhRIpDe6M4E=;
 b=Jbdg207P1duEYLC6/j9GKMn5ic15HQQSPl4jnLD5YfzJEQI6leSFTwvLs2ZxR70rgKLGjS
 BVJxAkNWx4uE2KafgZNzUp42BCtNYf5B+WtXzZEQ18iK+R/5xU07hPcDZZTvjB1LLzBBxY
 KXbPEYUvfZLA75cxuG5gwQK6qbHKXc0=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-pqN8g_UMPaeBjz4GbzEVGw-1; Wed, 11 Mar 2020 12:00:00 -0400
X-MC-Unique: pqN8g_UMPaeBjz4GbzEVGw-1
Received: by mail-vk1-f199.google.com with SMTP id x124so1096597vkf.11
 for <qemu-devel@nongnu.org>; Wed, 11 Mar 2020 09:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FU+U9/CIaPeVP51KEkmy8zOPCQt0qoYb7ZJfboE1a2s=;
 b=a7T4DjcAxsMXDT0I15UJhtHz7m9zwpv8oc1hBvS+fmKV446qi/xsrzTGTclElwIblK
 v3qiXaPAt2Pa089b1xpv611ydifHUs1lfMARkFPrCIN3bPF0dXVXfpkvYW0WoT5ZZTCV
 PJVdEYh3YGRWnav99MzzQfUdsKUmjXkUeS/y2jY+59JsH07pWf7P2GaLCoXsUrOZIXqU
 ia6T5CAG7L6WmHPgEGOlYq0xbzgvZPcxsQ6Kna8sE8Mg7W8gcoODKfrzXHFYPbpfbFdl
 1SJoOEmRFZ1gtkiNe+mHyUnMgKJHyF5fuup4eud1ev0/ODJHE17lRyUtFi8QItM95cN/
 fCQA==
X-Gm-Message-State: ANhLgQ27TawkZs5ZC4YXYa4+eakSO2x3gWo3+Y5rCxReUsb96Z2r7vgG
 T3n2rkLRgdwGEmzpAJhlP9rXOZbunJ6mfDwAx/3nbniERI1CzNVCo/62+S8uC4a2EeFjRLj2CMa
 FFR6rxn3dqsY6KJHeX9pD2gtdhwEgZKg=
X-Received: by 2002:a9f:2ac3:: with SMTP id d3mr2227461uaj.110.1583942399750; 
 Wed, 11 Mar 2020 08:59:59 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv6TnStnnEqXy334txhxenzbObzis1hOCLNfAL0dmRA5ATabO74OwBHtu1JgGiepxlXu9oZCLAp73cdFBUYI+k=
X-Received: by 2002:a9f:2ac3:: with SMTP id d3mr2227437uaj.110.1583942399427; 
 Wed, 11 Mar 2020 08:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200211134504.9156-1-philmd@redhat.com>
 <87eeuewv4k.fsf@linaro.org>
 <20200310014116.GF660117@umbus.fritz.box>
 <517418432.204149.1583807554368.JavaMail.zimbra@redhat.com>
 <20200311045449.GX660117@umbus.fritz.box>
In-Reply-To: <20200311045449.GX660117@umbus.fritz.box>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 11 Mar 2020 12:59:44 -0300
Message-ID: <CAKJDGDZpRrtSVkH0+h0ec8bfnAvfQGftTu7whOn9hXpYLLnDqA@mail.gmail.com>
Subject: Re: [PATCH] tests/acceptance/ppc_prep_40p: Use cdn.netbsd.org hostname
To: David Gibson <david@gibson.dropbear.id.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> That certainly sounds like an improvement.  I still don't love the
> idea that the test results will vary based on something outside of the
> tested code, even if a cancel is definitely better than a fail.

During the development of Avocado release 76.0, we have discussed how
to implement a new resolver that gathers requirements listed for a
test and fulfills them before the test starts. The discussion resulted
in blueprint BP002 [1]. We are in the last development week of release
77.0, so the development of this new feature should start during the
next release cycle.

>
> > +Willian can explain how it works, and if found to be suitable, and wor=
k
> > on a patch.
>
> Ok.  That would be good to know - will there be some command to run in
> advance to attempt to download all the necessary images?  Would that
> run without a timeout - or at least a much longer timeout than the
> testcase itself has.

In the current release development (77.0), we are adding a feature
that makes it possible to cancel a test if an asset is not available
in the cache. It should be as simple as setting two parameters during
the fetch call, like:

bios_path =3D self.fetch_asset(bios_url, asset_hash=3Dbios_hash,
find_only=3DTrue, cancel_on_missing=3DTrue)

Release 77.0 of Avocado is scheduled for the beginning of next week.
As soon as it is available, I can send a patch to bump the Avocado
version for qemu tests and a patch to this test enabling this new
feature.

Since avocado 73.0, it is possible to fetch the assets from a test
without actually running the test. It is a feature that parses the
test code looking for the fetch_asset call and its parameters defined
as variables, at a limited depth. I have tested it on ppc_prep_40p.py,
and it works as expected. This command does not have a timeout for
fetching the assets and is as follows:

avocado assets fetch ppc_prep_40p.py

The upcoming feature to cancel the test when an asset is not available
used in conjunction with the command line fetch should give some
flexibility to people running this test while the resolver is under
development.

[1] https://avocado-framework.readthedocs.io/en/latest/blueprints/BP002.htm=
l


