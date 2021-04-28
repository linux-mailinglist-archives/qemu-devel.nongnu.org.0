Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8664036DDE5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:09:31 +0200 (CEST)
Received: from localhost ([::1]:45680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbngo-0004BF-Iy
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbnQk-0008WQ-HP
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:52:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbnQh-0000ex-TR
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619628767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FGt0H2U+ZTVWIduKksB45XsXQfgq/phiYy7CSbpl/SM=;
 b=Q8OIqXpr/KlA7qqyoynb1GMDEzPltS190ND62EcvDZCUWLnP3w0KYi0IonVNzVLJ1FXcH3
 ZF0ZAzP5KUQ99zFcIj8sw1T8F4hFhSW88pdo88s6fnD7AsRVMkrEn+lYf6xHRilbwg8aO0
 XCZisc9PjEL9DLuR1wOzkUa6CeRiM6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-YjpRlr3NOruiiUe2Nwprfw-1; Wed, 28 Apr 2021 12:52:45 -0400
X-MC-Unique: YjpRlr3NOruiiUe2Nwprfw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C896C801106;
 Wed, 28 Apr 2021 16:52:44 +0000 (UTC)
Received: from work-vm (ovpn-115-35.ams2.redhat.com [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D7ED60E3A;
 Wed, 28 Apr 2021 16:52:35 +0000 (UTC)
Date: Wed, 28 Apr 2021 17:52:32 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/2] virtiofsd: Meson build fixes
Message-ID: <YImS0CTG5OgqLgFe@work-vm>
References: <20210428144813.417170-1-philmd@redhat.com>
 <CAFEAcA9_5C4sLwb-MXwg-yCgN+Esb0mop=baCv5kgoW58UPQzA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9_5C4sLwb-MXwg-yCgN+Esb0mop=baCv5kgoW58UPQzA@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Wed, 28 Apr 2021 at 15:53, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> >
> > A pair of fixes to allow building virtiofsd without sysemu/tools.
> >
> > Should this configuration be tested in CI?
> 
> Does the configuration make sense to support? I thought
> virtiofsd was only of use with system emulation ?

It probably is; although arguably it makes sense to build
virtiofsd by itself without either emulation.

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


