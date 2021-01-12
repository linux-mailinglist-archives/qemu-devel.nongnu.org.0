Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7982F2E04
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:36:15 +0100 (CET)
Received: from localhost ([::1]:42418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHyA-0001JM-1S
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kzHoN-0000KO-Gm
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:26:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kzHoK-00007s-Cr
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:26:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610450763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LZjKK2rgRnLflZ8NfvaBvdtbRgNsz9N2nt4mA0pKmsQ=;
 b=IuMakIKFyg+q0NquPJ+mEr0afY+rP6Kctg6d+iS/1KauRJ+UooVRk+5EgOOb4ScvNIb60A
 U/7Zc1qKQjcPb77jhy+U5nrT6kdoXP7q7FtmUoP1xD2DwBEj4pWJlvL+iQdgtdbDnfvmGX
 A9p/Orm7niiKZSw9acxxUJ4pHpk6K5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-7O_LWenEMJuR3iHZA_7G1g-1; Tue, 12 Jan 2021 06:25:59 -0500
X-MC-Unique: 7O_LWenEMJuR3iHZA_7G1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C89C0B8100;
 Tue, 12 Jan 2021 11:25:58 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-194.ams2.redhat.com [10.36.115.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D022E5C1B4;
 Tue, 12 Jan 2021 11:25:57 +0000 (UTC)
Date: Tue, 12 Jan 2021 12:25:56 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] tests/iotests: drop test 312 from auto group
Message-ID: <20210112112556.GA6075@merkur.fritz.box>
References: <20210105100402.12350-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210105100402.12350-1-alex.bennee@linaro.org>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.01.2021 um 11:04 hat Alex Bennée geschrieben:
> The "auto" documentation states:
> 
>   That means they should run with every QEMU binary (also non-x86)
> 
> which is not the case as the check-system-fedora build which only
> includes a rag tag group of rare and deprecated targets doesn't
> support the virtio device required.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

I think the better solution would be to do something like in 192 so that
the test is still run at least for one binary:

if [ "$QEMU_DEFAULT_MACHINE" != "pc" ]; then
    _notrun "Requires a PC machine"
fi

Kevin


