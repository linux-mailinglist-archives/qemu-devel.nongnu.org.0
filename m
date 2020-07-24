Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF34B22CBED
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 19:22:07 +0200 (CEST)
Received: from localhost ([::1]:33376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jz1OY-0002LD-FK
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 13:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1jz1Nl-0001sZ-7L
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 13:21:17 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:56353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1jz1Nj-0008TR-Ae
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 13:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Lv0H4ZUlhiuw6jtXbl0KytiCkF9kntugzLamritpvAU=; b=DVrxJI2shqFxPci58ivEXH8fQ9
 gca2KZ5nj5hEgIw3nPGdAfbqLuWZCJbAsidkrXnf+nn2fGHEAw2ZHtZzrPBhuA1VUuJsvjCsgIEgQ
 fKgtBuaCLs8tCciudqqnJDoYnFz3HXddZD1lia700YdMsXS7tjdZVX5aHPgo5TPgD0rYAGTUmR3xY
 ynHabN+3pGi+ArHNlUTrO6mkT9Om+8ArBMRpRGoZgw9PXueVjq2y2JZvL2VIN5/61GH/Cp1yFaHao
 KAmv7j8W8M9k/8uxBB1gwXLH0ZzgLsdyG6hjofnq0zmSnHYpiLyHCKq8N/t1SwWg58qWV9qwUuU/s
 Okd3jpDQ==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 2/3] cirrus.yml: Compile macOS and FreeBSD with -Werror
Date: Fri, 24 Jul 2020 19:21:11 +0200
Message-ID: <13876222.7aOH5gNrAa@silver>
In-Reply-To: <CAFEAcA9C9V_sJT15jkny+zDzZgGDpuQSkuU6XjEDp1i7J0r8CA@mail.gmail.com>
References: <20200724143220.32751-1-thuth@redhat.com>
 <506e2579-410e-8553-6cbf-508793bb35a0@redhat.com>
 <CAFEAcA9C9V_sJT15jkny+zDzZgGDpuQSkuU6XjEDp1i7J0r8CA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 13:21:13
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 24. Juli 2020 18:50:47 CEST Peter Maydell wrote:
> On Fri, 24 Jul 2020 at 17:46, Philippe Mathieu-Daud=E9 <philmd@redhat.com=
> wrote:
> > I guess we were expecting the distrib to update the pkg.
>=20
> Apple's view is that you shouldn't be using the sasl header
> at all but instead their proprietary crypto library APIs, so
> I wouldn't expect them to ever ship something without the
> deprecation warnings.

AFAIK Apple's reason for this is similar to no longer providing headers for
OpenSSL [1] (or now actually BoringSSL): they cannot guarantee binary
compatibility of these libs beyond individual macOS releases (i.e. without
breaking old clients) and bad things happened [2] in the past for apps which
expected it would.

[1] https://lists.apple.com/archives/macnetworkprog/2015/Jun/msg00025.html
[2] https://lists.andrew.cmu.edu/pipermail/cyrus-sasl/2007-November/001254.=
html

The common recommendation is: "Ship your macOS app bundled with the preferr=
ed
version of these libs."

Best regards,
Christian Schoenebeck



