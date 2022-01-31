Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB624A4A7B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 16:24:44 +0100 (CET)
Received: from localhost ([::1]:59244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEYXr-0001lJ-Ge
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 10:24:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nEYV2-0007Ub-PR
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:21:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nEYV0-0005D8-4x
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643642504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YhB0Qjf7NDFI/PnjBQS8ALRT4bXYiJu1xQeX6seATrQ=;
 b=a6PaCKzYx4n/yPB6ggwIOeHksYEvhL3IdCulcZEgR5OLdHYR4KEQiy0TxiB7chNEuuDphM
 2HaNym4m+VhlV05f20Fhh8MaoibVeM/NZvF+lboABhJpHDvEuRxRXqTdCd6snivvZqQ7Nd
 NejDW6gfKKcCfnJnHdQK0G/NWlEtRx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-G5sDE_qYN8uJkUY65Ilhqw-1; Mon, 31 Jan 2022 10:21:41 -0500
X-MC-Unique: G5sDE_qYN8uJkUY65Ilhqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E04F1091DA1;
 Mon, 31 Jan 2022 15:21:40 +0000 (UTC)
Received: from paraplu (unknown [10.39.195.135])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A3E57DE26;
 Mon, 31 Jan 2022 15:21:39 +0000 (UTC)
Date: Mon, 31 Jan 2022 16:21:36 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2] docs: expand firmware descriptor to allow flash
 without NVRAM
Message-ID: <Yff+gCndUlijqMsz@paraplu>
References: <20220131125509.170307-1-berrange@redhat.com>
 <YffrgRRVCEWVLS41@paraplu> <Yffz/v/7b6jJOBwi@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Yffz/v/7b6jJOBwi@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 02:36:46PM +0000, Daniel P. Berrangé wrote:
> On Mon, Jan 31, 2022 at 03:00:33PM +0100, Kashyap Chamarthy wrote:
> > On Mon, Jan 31, 2022 at 12:55:09PM +0000, Daniel P. Berrangé wrote:

[...]

> > I briefly wondered if in this "combined" mode whether the no. of
> > duplicate copies can ever fill up the storage.  I doubt that, as the
> > combined size of _VARS + _CODE is just about 2MB.  So it only starts
> > mattering if you're running tens of thousands of guests.
> 
> When guest root / data disk sizes are measured in 100's of MB, or
> GBs, I struggle to get worried about even a 16 MB OVMF  blob being
> copied per guest.

Heh, fair enough.

> The firmware can be provided in qcow2 format too, so if really
> concerned, just create a qcow2 file with a backing store pointing
> to the readonly master, so you're only paying the price of the
> delta for any guest VARs writes. That's more efficient than what
> we do today with copying the separate raw format VARS.fd file.

That's nice, I didn't know the qcow2 possibility in this context.  For
some reason I assumed the file format always has to be raw here.  Your
qcow2 point above should  be documented, if it isn't already.  Although
I don't know the right place for it.

[...]

-- 
/kashyap


