Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25B7228240
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 16:32:04 +0200 (CEST)
Received: from localhost ([::1]:53366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxtJL-0000xR-Ul
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 10:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jxtHs-0000Vw-G4
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 10:30:32 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42584
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jxtHq-0004tv-Lp
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 10:30:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595341828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GJql53MjyjZaNNz/EOWJFXJgmVlvzEfIg8Ujd6PqybM=;
 b=PnugLYjtbd38ly9yioSOTSRfOPJlNV1YP/noXFqc4dIEWxOJ/Ds6uq/LWSdCLHIuTvxGmI
 nYLpgAQLpVKp7hHKgQmqlcN7zNGItD0Oc/6mH+eTdG+gYYQpXlaPay4Ep9dzRpWt4FUCIV
 yOGDssf6m0nIyuJQgXbY2IHUi727980=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-ADiZrR9GMRS6KflkzkZvWw-1; Tue, 21 Jul 2020 10:30:26 -0400
X-MC-Unique: ADiZrR9GMRS6KflkzkZvWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D79B58
 for <qemu-devel@nongnu.org>; Tue, 21 Jul 2020 14:30:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2F7B5D9CA;
 Tue, 21 Jul 2020 14:30:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F0A099D05; Tue, 21 Jul 2020 16:30:16 +0200 (CEST)
Date: Tue, 21 Jul 2020 16:30:16 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Subject: Re: [PATCH v5 04/10] build: fix device module builds
Message-ID: <20200721143016.l5rtw3i7piiaxrw5@sirius.home.kraxel.org>
References: <20200624131045.14512-1-kraxel@redhat.com>
 <20200624131045.14512-5-kraxel@redhat.com>
 <7hpn8qmglv.fsf@turbo.dinechin.lan>
MIME-Version: 1.0
In-Reply-To: <7hpn8qmglv.fsf@turbo.dinechin.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 10:17:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > +# filling obj-y.  Clear it.  Fixes suspious dependency errors when
> 
> Typo: suspicious

Fixed.

thanks,
  Gerd


