Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC7B41EB04
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 12:36:11 +0200 (CEST)
Received: from localhost ([::1]:37442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWFth-0003aS-MO
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 06:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mWFs8-0002n8-SF
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 06:34:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mWFs4-0007eW-Uc
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 06:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633084466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NnqOcNrpipD5eyophIrSEeHAg8sVoBq4BwIe8Qv0mBY=;
 b=ZqC3BVCYGFcBWVTNOScuPf+W4BDF4G03tRUOmUfdS/k4OkqtDGTO4Sl/yJmlto1NTRjUsh
 GDFTduzlR5FFrS02IYHCGIdH8nkWm6IPQeHPuqaeeEMWiDQU6ihk48X+AFCUNPq5D/JUNa
 sP+fcpaHDvX5gf1kc/fTZvjrAsJ9jG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-8u3h40pyNFSE8vTG_lAHhQ-1; Fri, 01 Oct 2021 06:34:23 -0400
X-MC-Unique: 8u3h40pyNFSE8vTG_lAHhQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4362B10151E1;
 Fri,  1 Oct 2021 10:34:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3134D19C59;
 Fri,  1 Oct 2021 10:34:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1C2B918007AC; Fri,  1 Oct 2021 12:34:16 +0200 (CEST)
Date: Fri, 1 Oct 2021 12:34:16 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: Moving QEMU downloads to GitLab Releases?
Message-ID: <20211001103416.zquwneah34iv3mmz@sirius.home.kraxel.org>
References: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
 <CAJSP0QUq46nOTAv=4V0mhT2ZNbfKBPJXLNLY5Jun5B_h=sedQw@mail.gmail.com>
 <26661c01-e7ae-e225-7ec4-2e915b7a6ac5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <26661c01-e7ae-e225-7ec4-2e915b7a6ac5@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 michael.roth@amd.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Maybe we should also discuss again whether we could decrease the size of the
> release tarballs. Someone recently mentioned that we could e.g. remove the
> edk2 sources from the tarballs - edk2 is licensed under a BSD-style license,
> so we are not forced to ship its sources in our tarballs (unlike the other
> firmwares which are licensed under GPL).
> 
> Or maybe we could also finally move the firmware images completely into a
> separate tarball instead?

The idea of a separate qemu-firmware repo is floating around for a
while already but never really took off.

Now with hosting moved to gitlab we should be able to run automated
firmware binary builds in CI and purge all firmware from the qemu git
repo (both submodules and binaries) and add a script fetching those
from gitlab instead.

take care,
  Gerd


