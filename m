Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6665C41C018
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 09:47:29 +0200 (CEST)
Received: from localhost ([::1]:48050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVUJL-0005xR-Rw
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 03:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mVUG1-0003ii-35
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 03:44:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mVUFv-0001LO-Nz
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 03:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632901434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z7rlegkvs7zVZi2CONZqmHIccGKw8VZtsZVF2yZwpvY=;
 b=Q3lauGelWdLr99aQml8gzpxnjx9/u5kOYIRulBvbDA9txrmQ5Zldr+Lc/v+jZKnwfyoads
 saq8994B67pNyBR7xRR7CtnUDN+YFAfWLAzSx1nutyDT8wK/TFpvo+Nl079ki5XddvNVD8
 mRX50zVi1w9uxxejuytvpGUKi//oMho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-k0SmXnCcPli2oZ-HtW4WjA-1; Wed, 29 Sep 2021 03:43:51 -0400
X-MC-Unique: k0SmXnCcPli2oZ-HtW4WjA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74EEF8145E7;
 Wed, 29 Sep 2021 07:43:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 052234F0BB;
 Wed, 29 Sep 2021 07:43:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C8B0E1800386; Wed, 29 Sep 2021 09:43:46 +0200 (CEST)
Date: Wed, 29 Sep 2021 09:43:46 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Subject: Re: [RFC 0/3] virtio-gpu: Shared memory capability
Message-ID: <20210929074346.h4jwnxae4cm5sajy@sirius.home.kraxel.org>
References: <20210928131548.72005-1-antonio.caggiano@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20210928131548.72005-1-antonio.caggiano@collabora.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 28, 2021 at 03:15:45PM +0200, Antonio Caggiano wrote:
> Previously part of [0], now a patch series on its own.
> 
> This patch series cherry picks two commits from [1] and applies one fix
> according to [2], which should answer Gerd's comment [3] on previous
> patch.
> 
> RFC as I believe it needs a proper review from both authors of first two
> commits.

Looks sane on a quick glance.  I'd tend to squash patch #3 into patch #2.
Doesn't make much sense standalone though ...

take care,
  Gerd


