Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CFF233538
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 17:21:01 +0200 (CEST)
Received: from localhost ([::1]:39052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1AMZ-0007F4-PS
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 11:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k1ALi-0006kX-Ek
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 11:20:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43339
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k1ALe-0007Ue-9N
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 11:20:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596122396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OvyTvBwkyDk+Sk3JWMEK7eSbHAFN/3PPNm/OuEExtHw=;
 b=MKxZwQPqRUVPdbZAea0aSVSDXlQ5q6EOo8CMLQWHVSJ3PzxaNjS5r4G4URtUOwd/8VUH/N
 m1hkWIVuavdSww0Wei7XksOTCAFS+OZLn1NzROQEDPAmV28n5kE6Ci1t4vjPHswfcLPVwc
 cu6WChghUCMhvEgBVmj6gctAv0sW9U4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-Ke9nbF5uMmSe6xSL2LXb1A-1; Thu, 30 Jul 2020 11:19:54 -0400
X-MC-Unique: Ke9nbF5uMmSe6xSL2LXb1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41BC9107ACCA;
 Thu, 30 Jul 2020 15:19:53 +0000 (UTC)
Received: from gondolin (ovpn-112-203.ams2.redhat.com [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 446835C5B7;
 Thu, 30 Jul 2020 15:19:42 +0000 (UTC)
Date: Thu, 30 Jul 2020 17:19:39 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Marc Hartmayer <mhartmay@linux.ibm.com>
Subject: Re: [PATCH 1/2] virtio: add vhost-user-fs-ccw device
Message-ID: <20200730171939.595c6508.cohuck@redhat.com>
In-Reply-To: <20200730140731.32912-2-mhartmay@linux.ibm.com>
References: <20200730140731.32912-1-mhartmay@linux.ibm.com>
 <20200730140731.32912-2-mhartmay@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 03:59:04
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
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 30 Jul 2020 16:07:30 +0200
Marc Hartmayer <mhartmay@linux.ibm.com> wrote:

> From: Halil Pasic <pasic@linux.ibm.com>
> 
> Wire up the CCW device for vhost-user-fs.
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> ---
>  hw/s390x/Makefile.objs       |  1 +
>  hw/s390x/vhost-user-fs-ccw.c | 75 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 76 insertions(+)
>  create mode 100644 hw/s390x/vhost-user-fs-ccw.c

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


