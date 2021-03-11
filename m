Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0DB3370F5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:16:02 +0100 (CET)
Received: from localhost ([::1]:55220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJIP-0005MN-AD
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:16:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKJGX-0003wb-5y
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:14:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKJGP-0005v5-9I
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615461235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nPCp+EiHvexB9tG9amSGStPSXm26/bvCCwVfIBxe0/E=;
 b=RNl6Oiz5KaRUZ9fY8jqEfp/LrSrZ0Q19LmmGKCpcOeL8qXAlDce64dlOHZ8QRvmkzzDU9Q
 6FdU9TmHrAHj1NF9u7tRbAIUdM0ZN8cmgkqHn0hBBS1NomduBft7T/OtHarHDnwyHCNZNE
 ie7axl4xH9OLAKYIgcO7S7TZnD7Lhak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-pKee-pLCNwqAlOqBnW29KA-1; Thu, 11 Mar 2021 06:13:54 -0500
X-MC-Unique: pKee-pLCNwqAlOqBnW29KA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E1958015A0
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 11:13:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B83D919934;
 Thu, 11 Mar 2021 11:13:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8CE36180087E; Thu, 11 Mar 2021 12:13:42 +0100 (CET)
Date: Thu, 11 Mar 2021 12:13:42 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 0/4] ui: add support for 'secret' object to provide
 VNC/SPICE passwords
Message-ID: <20210311111342.ctfvodubtlapt7dz@sirius.home.kraxel.org>
References: <20210219184556.154972-1-berrange@redhat.com>
 <YEny+ZFWi9wVQbmF@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YEny+ZFWi9wVQbmF@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 10:37:45AM +0000, Daniel P. Berrangé wrote:
> Ping

Looks good but doesn't apply cleanly, can you rebase?

(current ui queue is gitlab.com/kraxel/qemu queue/ui, there are no
spice/vnc changes queued so it probably doesn't make a difference
compared to latest master)

take care,
  Gerd


