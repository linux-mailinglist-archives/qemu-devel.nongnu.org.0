Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54522576CF
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 11:47:08 +0200 (CEST)
Received: from localhost ([::1]:41158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCgP5-0004vN-CW
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 05:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kCgOH-0004Sp-VX
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 05:46:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kCgOF-0007UL-Ig
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 05:46:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598867173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vYB2FEH1N2f7+55VSYjp4zjHg0CA9j0jUizcsCUhrPU=;
 b=Dria3KjNV0wFjo/ON2sgNwcFOSnnfN8L+/L1g2bJ8AjELEZKJtuMkDpQ/qt4v+QvHK4IPq
 jKL4/Wv27DAl5eNct8vEmLKAhV65JkAmmB9ewZazPi+gVnJiWWDKkb1ErxrwPpK5m8gEcr
 VjtlKmhF6ygXi9/3NOliOu0Ad9kIvls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-RQUPk-fsNJCdcjxlLWq39A-1; Mon, 31 Aug 2020 05:46:12 -0400
X-MC-Unique: RQUPk-fsNJCdcjxlLWq39A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDABC10066FA;
 Mon, 31 Aug 2020 09:46:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0D669F54;
 Mon, 31 Aug 2020 09:46:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 12956991; Mon, 31 Aug 2020 11:46:04 +0200 (CEST)
Date: Mon, 31 Aug 2020 11:46:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v6 19/20] tests/acpi: add microvm test
Message-ID: <20200831094604.2fcrcrjzvfbw2jes@sirius.home.kraxel.org>
References: <20200826105254.28496-1-kraxel@redhat.com>
 <20200826105254.28496-20-kraxel@redhat.com>
 <20200831094322.38b0d571@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200831094322.38b0d571@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 03:02:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > +    test_acpi_one(" -machine microvm,acpi=on,rtc=off",
> I'm just curious, why rtc is off?

Just want to have it set explicitly in the testcase instead of depending
on the default.  The rtc is listed in the dsdt if present so the switch
has an effect on the expected dsdt content.

take care,
  Gerd


