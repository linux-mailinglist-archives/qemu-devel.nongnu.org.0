Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD7C4318AA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 14:14:30 +0200 (CEST)
Received: from localhost ([::1]:58704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcRXB-0001w9-2l
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 08:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mcRVs-0001G4-5Q
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:13:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mcRVn-0001qZ-Gn
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:13:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634559182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jAVcttOnw725Fz1G2wwYXzF99VoFM2ha/l426wNWiu8=;
 b=NCcc6DfODjlysTJJAObVyhSwo4w3hipbIHy112Ty732ovIG2zPfnSNEwfwklc7A7WrsBdK
 5eAVcxm9kqt0l0uNb6wALPBFA1+pq29Zc5dzSW36MdGF0EMmboFrzjMcPTF9L6xLYA4tc4
 HFR1a/hv27TyZiCU8QZRBrTtB6+KBS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-MZ-GYKo1MM6bNwKHYrs5sg-1; Mon, 18 Oct 2021 08:12:56 -0400
X-MC-Unique: MZ-GYKo1MM6bNwKHYrs5sg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1BD2802682;
 Mon, 18 Oct 2021 12:12:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A06A5100E809;
 Mon, 18 Oct 2021 12:12:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AF0D0180063D; Mon, 18 Oct 2021 14:12:53 +0200 (CEST)
Date: Mon, 18 Oct 2021 14:12:53 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 0/2] roms/edk2: Avoid cloning unused cmocka submodule
Message-ID: <20211018121253.xloory75bcc3v6uf@sirius.home.kraxel.org>
References: <20211018105816.2663195-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211018105816.2663195-1-philmd@redhat.com>
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
Cc: Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 18, 2021 at 12:58:14PM +0200, Philippe Mathieu-Daudé wrote:
> cmocka website SSL certificate expired, making CI pipelines
> fail [*]. However EDK2 images built to test QEMU don't need
> cmocka, nor oniguruma. Avoid cloning them.
> 
> Note: scripts/make-release is neither covered in MAINTAINERS
>       nor in our CI.
> 
> [*] https://gitlab.com/rth7680/qemu/-/jobs/1685387520
> fatal: unable to access 'https://git.cryptomilk.org/projects/cmocka.git/': server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile: none
> fatal: clone of 'https://git.cryptomilk.org/projects/cmocka.git' into submodule path 'UnitTestFrameworkPkg/Library/CmockaLib/cmocka' failed
> 
> Since v1:
> - Fixed typo (thuth)
> - Added missing '--' shell separator

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


