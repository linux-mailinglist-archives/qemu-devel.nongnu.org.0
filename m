Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10832430FBA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 07:25:57 +0200 (CEST)
Received: from localhost ([::1]:43580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcL9n-0004GV-MU
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 01:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mcL83-0003LR-Vn
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 01:24:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mcL7z-0001rd-OC
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 01:24:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634534640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=79XYcC3csEyinc7rrtxTd3CjBoSkpbS1oraIttYD01o=;
 b=Kgfm7kuvs8E7ofKgYjdrylk+59yTVBazqDTLMOC+XEQbfAu/Dtce1ZmDSM40mwi1l2aYRV
 YjWXjYjpFahqOOU6hh7eI1j1k8yIjrRzsUI2jVAivqCK2vsOH4dPhwg73JbJyiVkh5Ygu7
 yIP7FHiW5SZgokwsoaT8zoxdrJiMeyg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-IEX3fhyoMJSP9KpiDxVbXg-1; Mon, 18 Oct 2021 01:23:57 -0400
X-MC-Unique: IEX3fhyoMJSP9KpiDxVbXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD0058066F2;
 Mon, 18 Oct 2021 05:23:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F73810016F4;
 Mon, 18 Oct 2021 05:23:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BB625180063D; Mon, 18 Oct 2021 07:23:54 +0200 (CEST)
Date: Mon, 18 Oct 2021 07:23:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: gitlab build-edk2 failures
Message-ID: <20211018052354.fixjt642v62vnlna@sirius.home.kraxel.org>
References: <95c44864-c316-4396-5863-09e46dfa4671@linaro.org>
 <16cc6428-9a4c-87d0-f092-b7a21f64b0b8@redhat.com>
 <d06193c1-eb84-f27d-cebf-7cde80b3d5ec@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d06193c1-eb84-f27d-cebf-7cde80b3d5ec@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 17, 2021 at 04:58:37PM +0200, Philippe Mathieu-Daudé wrote:
> On 10/16/21 09:27, Paolo Bonzini wrote:
> > On 16/10/21 04:04, Richard Henderson wrote:
> >> I've seen a lot of failures on this job recently, and they're all
> >> timeouts cloning the git submodules.  Would it be better to mirror
> >> these to gitlab?
> >>
> > 
> > They're not timeouts, they're issues with edk2's _own_ submodules.
> > 
> > fatal: unable to access
> > 'https://git.cryptomilk.org/projects/cmocka.git/': server certificate
> > verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile:
> > none
> > fatal: clone of 'https://git.cryptomilk.org/projects/cmocka.git' into
> > submodule path 'UnitTestFrameworkPkg/Library/CmockaLib/cmocka' failed
> > 
> > roms/edk2 is already mirrored to gitlab, so we'd have to add mirrors for
> > all of these and make edk2.yml configure the mirrors in .git/config.  I
> > think the edk2 project should do the mirroring instead...
> 
> IIUC QEMU EDK2 scripts don't require cmocka... IMHO (short term) we
> should update the 'git submodule update' line in roms/Makefile.edk2
> to only update the submodules we require.

Yes, cmocka is not needed.  For ovmf/armvirt we need these:

	BaseTools/Source/C/BrotliCompress/brotli
	MdeModulePkg/Library/BrotliCustomDecompressLib/brotli
	CryptoPkg/Library/OpensslLib/openssl
	ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3

take care,
  Gerd


