Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90574158010
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 17:47:33 +0100 (CET)
Received: from localhost ([::1]:36098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1CDc-0007dj-Lf
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 11:47:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52458)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j1CCQ-0006nN-Ud
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 11:46:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j1CCP-0001gF-54
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 11:46:18 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56452
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j1CCO-0001ep-Lq
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 11:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581353175;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kg7GL+6Br1Kb49XvJufnA5wYcwECH96txwxCi1gUjpI=;
 b=J/tbdenUoBNQqnv8fcrAqaOlcBa0IYG6eYDWlDVAQzID+vnADcMPFfGe4+z2Qz61UhS5XP
 d43fRFmKYfmA+eJyzQFVkca+Q+eQfK0XCDQtaM60soNVMIlg5eMP2/gOsqq1uczg8beiVv
 ZUzQfQcGvaPXuhIKoYmLR/EEaJMyXHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-BtMMQxq8MwepUcekDWaLUg-1; Mon, 10 Feb 2020 11:46:11 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F76C107ACC5;
 Mon, 10 Feb 2020 16:46:07 +0000 (UTC)
Received: from redhat.com (ovpn-117-6.ams2.redhat.com [10.36.117.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9D425C1D4;
 Mon, 10 Feb 2020 16:45:59 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v15 9/9] virtio-iommu: Support migration
In-Reply-To: <20200208120022.1920-10-eric.auger@redhat.com> (Eric Auger's
 message of "Sat, 8 Feb 2020 13:00:22 +0100")
References: <20200208120022.1920-1-eric.auger@redhat.com>
 <20200208120022.1920-10-eric.auger@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Mon, 10 Feb 2020 17:45:57 +0100
Message-ID: <87y2ta5r22.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: BtMMQxq8MwepUcekDWaLUg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Reply-To: quintela@redhat.com
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, dgilbert@redhat.com, bharatb.linux@gmail.com,
 qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Auger <eric.auger@redhat.com> wrote:
> Add Migration support. We rely on recently added gtree and qlist
> migration. We only migrate the domain gtree. The endpoint gtree
> is re-constructed in a post-load operation.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Acked-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


