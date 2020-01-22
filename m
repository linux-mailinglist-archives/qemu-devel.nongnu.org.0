Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C36144E2B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 10:03:50 +0100 (CET)
Received: from localhost ([::1]:38774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuBvR-0003ZC-30
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 04:03:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49202)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iuBue-0003Af-Rh
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 04:03:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iuBud-0006Ub-S2
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 04:03:00 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53328
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iuBud-0006UM-OX
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 04:02:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579683779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wxiHZgMa/eES3KsKYNTOHYrUWi5DDaxjIfsXp+pBjd8=;
 b=iDpHQ8GpgAQ5Vs+M9F/ipRqMGTwNAMZ5Ml7X706cOgvPEPDerYhYHM483v02Pnyy72fXHB
 TaAXxQF4/gSpaF7DX+lZgljqoVFsjug0VITTg8j4pHMvhy8t9htH1PzA7BjB67kbXMOljP
 gRd1xnNuQAZn4DVOt5sU+emTnrl3YGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-UKw3RodEO6ipC5GjGujV2Q-1; Wed, 22 Jan 2020 04:02:55 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACAE41005513;
 Wed, 22 Jan 2020 09:02:54 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9B0185738;
 Wed, 22 Jan 2020 09:02:48 +0000 (UTC)
Date: Wed, 22 Jan 2020 10:02:46 +0100
From: Andrew Jones <drjones@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 2/4] tests/acceptance: boot_linux_console: Add boot
 Linux with kvm tests
Message-ID: <20200122090246.oehdjxeotx5tz64l@kamzik.brq.redhat.com>
References: <20200122012753.9846-1-wainersm@redhat.com>
 <20200122012753.9846-3-wainersm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200122012753.9846-3-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: UKw3RodEO6ipC5GjGujV2Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: thuth@redhat.com, ehabkost@redhat.com, philmd@redhat.com,
 qemu-devel@nongnu.org, crosa@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 21, 2020 at 10:27:51PM -0300, Wainer dos Santos Moschetta wrote=
:
> +    def test_aarch64_virt_kvm(self):
> +        """
> +        :avocado: tags=3Darch:aarch64
> +        :avocado: tags=3Dmachine:virt
> +        :avocado: tags=3Daccel:kvm
> +        """
> +        self.do_test_aarch64_virt()
> +
> +    def test_aarch64_virt_tcg(self):
> +        """
> +        :avocado: tags=3Darch:aarch64
> +        :avocado: tags=3Dmachine:virt
> +        :avocado: tags=3Daccel:tcg
> +        """
> +        self.do_test_aarch64_virt()
> +

Does do_test_aarch64_virt() add more machine parameters? Also, which cpu
type does it choose? The reason I ask is because aarch64 virt will fail to
run with KVM unless the appropriate gic version is specified (the
gic-version machine parameter). Also the cpu type must be 'host' or 'max'.
'max' is the better choice as it also works for tcg. gic-version also
takes 'max' allowing it to auto-select the appropriate version. So if it's
not already there somewhere, then please ensure aarch64 has these
additional parameters:

 machine:gic-version=3Dmax
 cpu:max

Thanks,
drew


