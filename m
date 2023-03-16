Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C33D6BC7DC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:56:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pciSj-0000x5-Ek; Thu, 16 Mar 2023 03:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pciSf-0000wU-EC
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:55:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pciSc-00018a-OT
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:55:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678953341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ksqTbdQ3++HKkrMwIORxGBff0/nDaT3KolwuqfyAaGM=;
 b=QVomBL5sRDeBY91jJ7rKq3JXxw7utZa6unn+Y0V8nPHQ10mMvDP5UpmzPbCz89v1hyT501
 XayiDN+OxTkqbwn3OytNat2pXvFHHwuZkpbyDxLzKId0l+zQT7J6WVFmN/heYI35dHk25P
 sKtpNhcasJEQMlUBinKP7j0LKK9Myeg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-4ca1a97iPByBlfC5dLb3Qw-1; Thu, 16 Mar 2023 03:55:37 -0400
X-MC-Unique: 4ca1a97iPByBlfC5dLb3Qw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F10172A5955D;
 Thu, 16 Mar 2023 07:55:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32417492B00;
 Thu, 16 Mar 2023 07:55:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CB9521801CF6; Thu, 16 Mar 2023 08:55:34 +0100 (CET)
Date: Thu, 16 Mar 2023 08:55:34 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PULL 0/3] Edk2 stable202302 20230309 patches
Message-ID: <20230316075534.rhk6esmhjyeooyyq@sirius.home.kraxel.org>
References: <20230309115714.906369-1-kraxel@redhat.com>
 <CAFEAcA_KwKQjgsx+4C_3an6ujhN=ETYFbaOjgU7Bg4OYt10OgA@mail.gmail.com>
 <20230315155655.ww75ox7hougl32wk@sirius.home.kraxel.org>
 <703ac3d4-e14e-1df6-aaa1-a7456b7dd89c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <703ac3d4-e14e-1df6-aaa1-a7456b7dd89c@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

On Wed, Mar 15, 2023 at 05:16:10PM +0100, Laszlo Ersek wrote:
> On 3/15/23 16:56, Gerd Hoffmann wrote:
> >   Hi,
> > 
> >> ▶ 206/206 ERROR:../tests/qtest/acpi-utils.c:158:acpi_find_rsdp_address_uefi:
> >> code should not be reached ERROR
> >> 206/206 qemu:qtest+qtest-aarch64 / qtest-aarch64/bios-tables-test
> >> ERROR 706.75s killed by signal 6 SIGABRT
> > 
> > mst?  laszlo?  Any hints how to debug that?
> > 
> > Tried to start qemu manually with the command line I get from
> > "make V=1 check-qtest-aarch64", that seems to start the uefi
> > app from the iso image just fine ...
> 
> This is strange, the search is supposed to continue for 600 seconds (see
> TEST_DELAY and TEST_CYCLES). I've got no better idea than to run the
> UEFI application, then dump the guest memory from the QEMU monitor, and
> then fish around in it...

Turned out to be the numa test case only, and edk2 not booting due to
small numa nodes.

take care,
  Gerd


