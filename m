Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D742C0061
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 07:58:52 +0100 (CET)
Received: from localhost ([::1]:34886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh5oI-0004iU-Cp
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 01:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kh5n8-0004Iq-2R
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 01:57:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kh5n5-0006YV-Cl
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 01:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606114653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wKXdEWryJpaG08rOq8tsz7WZmZW1wtTQYaQ2pFxfIA4=;
 b=NDELDLPQEgg84Vt2Lxi1X2v9OoZj86fUrHnWhSFXATTdMcE2C47ShXyl6YzUrCeFGcwrBo
 STY1u9jZa6TdoxFqrQuyFGBRKdFhurGaSYu7c9CehJ7hgOscCo7NvbY5idkUU3CL//SvtZ
 CENsVm9lQpxldnk+nSTvR95pl/zlVaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-Uq7ffmHyO1yDrU4pirQDrQ-1; Mon, 23 Nov 2020 01:57:31 -0500
X-MC-Unique: Uq7ffmHyO1yDrU4pirQDrQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6428108442F;
 Mon, 23 Nov 2020 06:57:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 879E319C46;
 Mon, 23 Nov 2020 06:57:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2EB7217532; Mon, 23 Nov 2020 07:57:29 +0100 (CET)
Date: Mon, 23 Nov 2020 07:57:29 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] usb: fix kconfig for usb-xhci-sysbus
Message-ID: <20201123065729.zyxffgqt2izktzj3@sirius.home.kraxel.org>
References: <20201120154506.2496906-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201120154506.2496906-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org, Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 10:45:06AM -0500, Paolo Bonzini wrote:
> Remove the "default y" for USB_XHCI_SYSBUS because
> sysbus devices are not user creatable; boards that use them will
> specify them manually with "imply" or "select" clauses.
> 
> It would be nice to keep the ability to remove PCIe and USB from microvm,
> since thos can be disabled on the command line and therefore should not
> be included if QEMU is configured --without-default-devices.  However
> it's too late for 5.2 to figure out a place for the DSDT creation code.

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


