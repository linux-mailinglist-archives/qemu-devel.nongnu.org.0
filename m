Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F204A6328
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 19:06:40 +0100 (CET)
Received: from localhost ([::1]:51758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nExY7-0000vg-10
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 13:06:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nEv81-0002vy-Sv
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:31:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nEv7z-0005qe-EA
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643729490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iapliayacNkltBnfxQ0uTRLpVUxAMV6XJoi5hKlHuH8=;
 b=SSjuZZrzFQiBtKai297XnSSvgFm+M6RIPq5AwxkQZPF31Px4sbnAWH3QRCaFpkibZXJXNU
 u2A2cQeFzj6nvH3IAddvQA3DDn3LGRLspL7MXxLKvVUMQJIdsFQBrwE+o3SNkDpoy1MS2u
 ddzbhnTdbiWYjr9k6ohtB5vb3b+0rqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-lnv4Fed_O8mYKFlhckZh2A-1; Tue, 01 Feb 2022 08:30:39 -0500
X-MC-Unique: lnv4Fed_O8mYKFlhckZh2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07245193F560;
 Tue,  1 Feb 2022 13:30:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C28997DE2D;
 Tue,  1 Feb 2022 13:30:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 192541800608; Tue,  1 Feb 2022 14:30:36 +0100 (CET)
Date: Tue, 1 Feb 2022 14:30:36 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Kashyap Chamarthy <kchamart@redhat.com>
Subject: Re: [PATCH v2] docs: expand firmware descriptor to allow flash
 without NVRAM
Message-ID: <20220201133036.kwep2tw5mvcjbyt2@sirius.home.kraxel.org>
References: <20220131125509.170307-1-berrange@redhat.com>
 <YffrgRRVCEWVLS41@paraplu> <Yffz/v/7b6jJOBwi@redhat.com>
 <Yff+gCndUlijqMsz@paraplu>
MIME-Version: 1.0
In-Reply-To: <Yff+gCndUlijqMsz@paraplu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 04:21:36PM +0100, Kashyap Chamarthy wrote:
> On Mon, Jan 31, 2022 at 02:36:46PM +0000, Daniel P. Berrangé wrote:
> > On Mon, Jan 31, 2022 at 03:00:33PM +0100, Kashyap Chamarthy wrote:
> > > On Mon, Jan 31, 2022 at 12:55:09PM +0000, Daniel P. Berrangé wrote:
> 
> [...]
> 
> > > I briefly wondered if in this "combined" mode whether the no. of
> > > duplicate copies can ever fill up the storage.  I doubt that, as the
> > > combined size of _VARS + _CODE is just about 2MB.  So it only starts
> > > mattering if you're running tens of thousands of guests.
> > 
> > When guest root / data disk sizes are measured in 100's of MB, or
> > GBs, I struggle to get worried about even a 16 MB OVMF  blob being
> > copied per guest.
> 
> Heh, fair enough.

Main advantage of the split is that it is much easier to update the
firmware code without smashing the guest vars, not so much the disk
space requirements.

take care,
  Gerd


