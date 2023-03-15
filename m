Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C430B6BB8C3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 16:57:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcTUu-0002Rz-Km; Wed, 15 Mar 2023 11:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pcTUr-0002RX-JZ
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:57:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pcTUq-0007gb-9I
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:57:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678895819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ILhPwUl8bw3FtfNiibueeFJqrJE+985PqIr3oJDJ8QI=;
 b=bpS4S5WEDgyLkdw1jiVYWqZorcQsdDEKBXGAqaiVx5bHCOka6cOCuSr8qK6q3CW7veFeMT
 Vq63eIc73d0eHflAadzUpZP2HvTgWzll99dLYdRVXPaByAoT9cc3uZrrj9bg3Liw3NmtK1
 zPHedfCXGIQBx6f5SiivbMPi9StAsuo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-n7cx6BXmNZOS-xHJJBwa0A-1; Wed, 15 Mar 2023 11:56:57 -0400
X-MC-Unique: n7cx6BXmNZOS-xHJJBwa0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 634552808E70;
 Wed, 15 Mar 2023 15:56:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32D70C158C2;
 Wed, 15 Mar 2023 15:56:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E1D4C1800393; Wed, 15 Mar 2023 16:56:55 +0100 (CET)
Date: Wed, 15 Mar 2023 16:56:55 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?B?TMOhc3psw7Mgw4lyc2Vr?= <lersek@redhat.com>
Subject: Re: [PULL 0/3] Edk2 stable202302 20230309 patches
Message-ID: <20230315155655.ww75ox7hougl32wk@sirius.home.kraxel.org>
References: <20230309115714.906369-1-kraxel@redhat.com>
 <CAFEAcA_KwKQjgsx+4C_3an6ujhN=ETYFbaOjgU7Bg4OYt10OgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA_KwKQjgsx+4C_3an6ujhN=ETYFbaOjgU7Bg4OYt10OgA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  Hi,

> ▶ 206/206 ERROR:../tests/qtest/acpi-utils.c:158:acpi_find_rsdp_address_uefi:
> code should not be reached ERROR
> 206/206 qemu:qtest+qtest-aarch64 / qtest-aarch64/bios-tables-test
> ERROR 706.75s killed by signal 6 SIGABRT

mst?  laszlo?  Any hints how to debug that?

Tried to start qemu manually with the command line I get from
"make V=1 check-qtest-aarch64", that seems to start the uefi
app from the iso image just fine ...

take care,
  Gerd


