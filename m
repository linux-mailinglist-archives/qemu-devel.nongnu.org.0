Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C1D248B41
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 18:14:51 +0200 (CEST)
Received: from localhost ([::1]:36444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k84GA-0004qd-0g
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 12:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k83vC-0002LY-CE
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 11:53:10 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60135
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k83v7-0006Cy-VW
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 11:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597765983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vszjc0FYD45E3BfJR3oabQeAeSXw+qKqDgUEHrXpP7s=;
 b=Bk6A1IQ9YKofbyYW0dhNetPasA+45kMRWukfLt6Nwp65KZAtuSbo393BOCtyk8tMoC9TQ8
 2XtCuluQxLnRKjkOpRxZgrxrhkTc82vXQ3SLfhzUEhrmdlhZHaGmBBWk25vkHv2XInkZgO
 VDc/3eSfiP4lSakKQNKPKOGvO1s81N8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-Iwd5o-ZuOP6DEkRVVmReOg-1; Tue, 18 Aug 2020 11:50:51 -0400
X-MC-Unique: Iwd5o-ZuOP6DEkRVVmReOg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FC0C81F021;
 Tue, 18 Aug 2020 15:50:50 +0000 (UTC)
Received: from gondolin (ovpn-112-221.ams2.redhat.com [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1872860BE5;
 Tue, 18 Aug 2020 15:50:42 +0000 (UTC)
Date: Tue, 18 Aug 2020 17:49:55 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: virtio-vsock requires 'disable-legacy=on' in QEMU 5.1
Message-ID: <20200818174955.1180e092.cohuck@redhat.com>
In-Reply-To: <20200818152807.oig6p3ajve5ju32b@steredhat>
References: <CAGxU2F7pVNWtJG2BM2bk9qtJ_UHgDw4kjVqRmL-=yme7VX83Vg@mail.gmail.com>
 <20200813112820.62ffd63e.cohuck@redhat.com>
 <20200813102430.vjnc56anqjaxn4tw@steredhat.lan>
 <20200813123737.25ba11d2.cohuck@redhat.com>
 <20200813120415.s5we6mihe6fywm4a@steredhat.lan>
 <20200817122746.0b786372.cohuck@redhat.com>
 <20200817131128.lgxn3pyzuzly4edp@steredhat>
 <20200818144450.0701d68c.cohuck@redhat.com>
 <20200818140120.c46fsf6cia2ol53v@steredhat>
 <20200818163101.72abd288.cohuck@redhat.com>
 <20200818152807.oig6p3ajve5ju32b@steredhat>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 02:16:14
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Qinghua Cheng <qcheng@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Aug 2020 17:28:07 +0200
Stefano Garzarella <sgarzare@redhat.com> wrote:

> On Tue, Aug 18, 2020 at 04:31:01PM +0200, Cornelia Huck wrote:

> > > Do you prefer to send them? Otherwise I can do that.  
> > 
> > If you already have something on your disk, please go ahead :)  
> 
> Yes, I have something for pci, and I'll follow your suggestion for ccw!

Cool, thx!

> 
> If you have time, can you share with me some tips on how to install
> s390x guest on my laptop?

The easiest way is probably to use virt-manager. I have installed
Fedora s390x guests via this, works well.

Once you have a guest, you can grab the qemu command line from
libvirt's log, trim it down, and start it directly.

https://wiki.qemu.org/Documentation/Platforms/S390X might also be
helpful.


