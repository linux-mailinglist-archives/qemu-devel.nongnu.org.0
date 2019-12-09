Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6BA116E07
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 14:35:17 +0100 (CET)
Received: from localhost ([::1]:40194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieJC0-0001AS-RL
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 08:35:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51576)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1ieJ9u-0008OY-Ce
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 08:33:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ieJ9t-0007LI-Em
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 08:33:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46398
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1ieJ9t-0007Ky-Bf
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 08:33:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575898384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sp/rroFjQzRzz+BDDCk+rDZJ3uAWQKcXCtsHHwdRRn0=;
 b=JUtR1vgPGYwc3wNlmVUq/ceaH3lrK5ib1s33EITNo2mW3nnryc+G6fRCsYxq8LFtDsQB3R
 jorwuV71PINipYKwNtvN13Qmmo1HABCo9S9j0ajHf/M9uQbbeuKlKMaZaOyRL7SxN3HizN
 aiEIgr38VwNeGTZ7mDJphRjW7fRrOpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-4XbETEKkOyiFr3nfUlXSyA-1; Mon, 09 Dec 2019 08:33:02 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB77F800D41;
 Mon,  9 Dec 2019 13:33:01 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-116.ams2.redhat.com [10.36.117.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADADA600D3;
 Mon,  9 Dec 2019 13:33:00 +0000 (UTC)
Date: Mon, 9 Dec 2019 14:32:59 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/3] iotests: Check for the possibility to create large
 files
Message-ID: <20191209133259.GA6715@linux.fritz.box>
References: <20191202101631.10003-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191202101631.10003-1-thuth@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 4XbETEKkOyiFr3nfUlXSyA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.12.2019 um 11:16 hat Thomas Huth geschrieben:
> Travis recently added the possibility to test on ppc64le, arm64 and s390x
> hosts, too. However, the containers are very restricted there and do not
> allow the creation of large files, so that the tests 060 and 079 are
> currently failing there. So let's add some proper checks to these tests
> first.

Thanks, applied to the block branch.

Kevin


