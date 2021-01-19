Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1836C2FBBBE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:55:04 +0100 (CET)
Received: from localhost ([::1]:48610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tLT-0006zm-5h
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:55:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1tIn-0004gB-PW
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:52:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1tIk-0007lm-TC
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:52:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611071533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XLR7fPDCVIdtWPgW9cgoLcS7Y3ULEmmYe6s5LQclo7c=;
 b=ePQVdVvDgOoENDomd3ZUu2htZaKpz43ZjyW1Wy5MiZfIjp23cHSWH1LL2szTEwZ2IBTvCV
 gCGTsh9Yl6P+bYBjS8P1NPVi2noN4977oTGQ0BcO1CP0gmFY5dwKYOsjaT10D4C43gs8yP
 4y/rGlkMyFcxZqpCkvb+d35iR7V6aU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-XKFXn2kiOCC5oXwTZPV_vQ-1; Tue, 19 Jan 2021 10:52:12 -0500
X-MC-Unique: XKFXn2kiOCC5oXwTZPV_vQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 032458066E6;
 Tue, 19 Jan 2021 15:52:11 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-149.ams2.redhat.com [10.36.115.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7E2519486;
 Tue, 19 Jan 2021 15:52:09 +0000 (UTC)
Date: Tue, 19 Jan 2021 16:52:08 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/check-block.sh: Refuse to run the iotests with
 BusyBox' sed
Message-ID: <20210119155208.GH5012@merkur.fritz.box>
References: <20210119134749.401311-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210119134749.401311-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.01.2021 um 14:47 hat Thomas Huth geschrieben:
> BusyBox' sed reports itself as "This is not GNU sed version 4.0"
> when being run with the --version parameter. However, the iotests
> really need GNU sed, they do not work with the BusyBox version.
> So let's make sure that we really have GNU sed and refuse to run
> the tests with BusyBox' sed.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks, applied to the block branch.

Kevin


