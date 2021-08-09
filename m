Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13473E4447
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 12:57:53 +0200 (CEST)
Received: from localhost ([::1]:34018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD2ye-00052H-Pw
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 06:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mD2t9-0007OP-CW
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:52:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mD2t7-0005Gk-UE
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628506328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oe+2xjIy4kIXSEUrb0pPqyHsDinJ2CceKrvkllLMPDA=;
 b=LXlOyRhOjytecxv8jfv61EkbNTyPbiCPEjkVe2BX90DxO4+iidBROqx4XIiCnE+61cISs+
 NunZm3ZmjK4gwsGAZ5IhPwF2y+AF/Z5ZGkDdnzdgEogqAbuXWTiTgXR+Ij9yWGCWw/ougz
 Jkpbe5LjxllYAg5SnI1JXSiA314VM18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-AdFKiKP3P16RCH3mpnTe_g-1; Mon, 09 Aug 2021 06:52:07 -0400
X-MC-Unique: AdFKiKP3P16RCH3mpnTe_g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF06F8799EB
 for <qemu-devel@nongnu.org>; Mon,  9 Aug 2021 10:52:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7528100EB3D;
 Mon,  9 Aug 2021 10:52:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 593B71800981; Mon,  9 Aug 2021 12:52:01 +0200 (CEST)
Date: Mon, 9 Aug 2021 12:52:01 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH for-6.2 1/6] acpi: Delete broken ACPI_GED_X86 macro
Message-ID: <20210809105201.pqdbho3dg3iwwrrp@sirius.home.kraxel.org>
References: <20210805193431.307761-1-ehabkost@redhat.com>
 <20210805193431.307761-2-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210805193431.307761-2-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 05, 2021 at 03:34:26PM -0400, Eduardo Habkost wrote:
> The macro never worked and never will, because the
> AcpiGedX86State type never existed.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

> -#define ACPI_GED_X86(obj) \
> -    OBJECT_CHECK(AcpiGedX86State, (obj), TYPE_ACPI_GED_X86)

Oops.  Leftover from an earlier patch revision where the struct did
actually exist.  Thanks for cleaning up.

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd


