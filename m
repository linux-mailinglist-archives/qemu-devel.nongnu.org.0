Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C48930C326
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:12:23 +0100 (CET)
Received: from localhost ([::1]:48116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xLq-00068x-Fj
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:12:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6x1z-0003wu-H3
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:51:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6x1v-0005IK-KU
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:51:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612277507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fPo8gQQJk9NpXNgEPIOEyTyeAJncah9zzVWIVZ2b5pw=;
 b=Ao1jgCwuq9kCf7gHmdS+En9xq1tyHnWWsJgn/bff6wx/KV0z/+F7ZrnKhV+IZlcktbdN5T
 QC5zk+wMdIIOgadeyuuDGnEnBmKNV9MrejD2rrT+4mAMpwBR3RQS0pq1DzYX+dQO2IZnON
 0CN5+K1iYKxp0iyT1KQdpVvC1AMZF3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-fCDG2J-JPNiUj1M_uuT3mQ-1; Tue, 02 Feb 2021 09:51:45 -0500
X-MC-Unique: fCDG2J-JPNiUj1M_uuT3mQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 927B51800D41;
 Tue,  2 Feb 2021 14:51:43 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4525C5C234;
 Tue,  2 Feb 2021 14:51:42 +0000 (UTC)
Date: Tue, 2 Feb 2021 15:51:40 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] iotests: Revert emulator selection to old behaviour
Message-ID: <20210202145140.GD5184@merkur.fritz.box>
References: <20210202142802.119999-1-kwolf@redhat.com>
 <20210202144121.GL4168502@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202144121.GL4168502@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.02.2021 um 15:41 hat Daniel P. Berrangé geschrieben:
> On Tue, Feb 02, 2021 at 03:28:02PM +0100, Kevin Wolf wrote:
> > If the qemu-system-{arch} binary for the host architecture can't be
> > found, the old 'check' implementation selected the alphabetically first
> > system emulator binary that it could find. The new Python implementation
> > just uses the first result of glob.iglob(), which has an undefined
> > order.
> > 
> > This is a problem that breaks CI because the iotests aren't actually
> > prepared to run on any emulator. They should be, so this is really a bug
> > in the failing test cases that should be fixed there, but as a quick
> > fix, let's revert to the old behaviour to let CI runs succeed again.
> 
> Deterministic CI is critically important.

True. I didn't mean to imply that we don't want deterministic behaviour,
but just that this hides some bugs in the test cases that we'll want to
have fixed eventually, too.

Maybe we should rely on automatic picking less and specify different
emulators explicitly in different CI jobs so that we don't only test the
same binary over and over again and others not at all.

Kevin


