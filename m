Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C406C1358D4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 13:06:16 +0100 (CET)
Received: from localhost ([::1]:59100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipWZr-0005uC-Gz
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 07:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35856)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1ipWUi-0000lf-KM
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 07:01:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ipWUh-00065H-FL
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 07:00:56 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21041
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1ipWUh-00062m-8u
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 07:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578571254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mvIAioLD5JoyZ9P3SuHsYIHSuSx01J4S9b3Yah/dFv0=;
 b=g8fwYwhByvnAW427lDgGid3Z6gDjQ601x26qskOk8S2BkJootbFfFzQcmPFwAidWTWfJm2
 +cA7gpVvNAZhvjXN//2P3IBTSelF4lFKv6pYiu4of9ySfZC9hlTpTHqjk8VlxEd/nPAEni
 BnaZQYhoC76pFpcHxe0brtfst6p/xSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-A0MNSHjWMtCrFQYARG9mAQ-1; Thu, 09 Jan 2020 07:00:51 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24599113784B;
 Thu,  9 Jan 2020 12:00:49 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-193.ams2.redhat.com [10.36.117.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D2291001925;
 Thu,  9 Jan 2020 12:00:39 +0000 (UTC)
Date: Thu, 9 Jan 2020 13:00:38 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Pavel Dovgalyuk <dovgaluk@ispras.ru>
Subject: Re: [for-5.0 PATCH 00/11] Support for reverse debugging with GDB
Message-ID: <20200109120038.GD9504@linux.fritz.box>
References: <157709434917.12933.4351155074716553976.stgit@pasha-Precision-3630-Tower>
 <003a01d5c6b3$df62afd0$9e280f70$@ru>
MIME-Version: 1.0
In-Reply-To: <003a01d5c6b3$df62afd0$9e280f70$@ru>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: A0MNSHjWMtCrFQYARG9mAQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, pavel.dovgaluk@ispras.ru,
 crosthwaite.peter@gmail.com, ciro.santilli@gmail.com, jasowang@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 alex.bennee@linaro.org, 'Pavel Dovgalyuk' <pavel.dovgaluk@gmail.com>,
 maria.klimushenkova@ispras.ru, mst@redhat.com, kraxel@redhat.com,
 boost.lists@gmail.com, thomas.dullien@googlemail.com, pbonzini@redhat.com,
 mreitz@redhat.com, artem.k.pisarenko@gmail.com, dgilbert@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.01.2020 um 07:13 hat Pavel Dovgalyuk geschrieben:
> Ping.

I think you have my Acked-by for the block-related patches in this
series now. If I missed something, please let me know.

Kevin


