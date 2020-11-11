Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7599F2AFAC4
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 22:52:48 +0100 (CET)
Received: from localhost ([::1]:43474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcy2p-0005Vj-6a
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 16:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcy1F-0004q9-JC
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 16:51:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcy1B-0007IZ-55
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 16:51:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605131463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=css4yKUDz+wTlEVYWkhgQ6ECNCuaH4CGgOP+z9lCUfQ=;
 b=Ke7dxTegxCW43E8GB7dlyjEjJKn7dIAxigu5IUbhNFIMq/fi63wtFFrGDXYdzUJ8uT5QAq
 bF8NJn9Am5zUe7GKj/gOrioIpZAlovcKANMYRzUwh5k7zRinK0I5wwQRyGoR/Um/0X8l1k
 NMFsLWG8g5yIzftaJA5PJtCZYs45haQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-BDJbcVjpOh6MtU2hqEA5Vg-1; Wed, 11 Nov 2020 16:48:06 -0500
X-MC-Unique: BDJbcVjpOh6MtU2hqEA5Vg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95D56905C43
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 21:48:05 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CD7A1002C02;
 Wed, 11 Nov 2020 21:48:01 +0000 (UTC)
Date: Wed, 11 Nov 2020 16:48:00 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 12/12] input: Use class properties
Message-ID: <20201111214800.GP5733@habkost.net>
References: <20201111183823.283752-1-ehabkost@redhat.com>
 <20201111183823.283752-13-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201111183823.283752-13-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 11, 2020 at 01:38:23PM -0500, Eduardo Habkost wrote:
> Instance properties make introspection hard and are not shown by
> "-object ...,help".  Convert them to class properties.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> This was originally submitted as part of the series:
> Subject: [PATCH 00/12] qom: Make all -object types use only class properties
> Message-Id: <20201009160122.1662082-1-ehabkost@redhat.com>
> https://lore.kernel.org/qemu-devel/20201009160122.1662082-1-ehabkost@redhat.com

Oops, please ignore this one, I was too eager when cherry-picking
patches from the other series.  The original patch was already
merged to master.

-- 
Eduardo


