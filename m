Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8713A83D4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:22:01 +0200 (CEST)
Received: from localhost ([::1]:53504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltAt4-0007lF-Pn
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ltAru-0006Ln-6L
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:20:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ltArs-0005X6-95
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623770443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hZ6Gw8kvBOH0+1UXzHGgrqQMGpjTsvaI//HWcC2sSr4=;
 b=ghm9js74LZ+ybWPZAI8l5qviiOIFOIt/Vux+nnDiNgFzABUT+2++bXh7RPDnQkipW0j1Bh
 xdrYtah72b7vs96dMG+mUqRUYur1zMUspttvbO1XrBn/YUrBXT6Bj4lHsQzVLm+CeStvPr
 FSKaE7ZRQb39wCqgS2npmqEjj9vds5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-gnxBVwJlNhmpWKLbbNSC9A-1; Tue, 15 Jun 2021 11:20:42 -0400
X-MC-Unique: gnxBVwJlNhmpWKLbbNSC9A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70EBC803624;
 Tue, 15 Jun 2021 15:20:40 +0000 (UTC)
Received: from localhost (unknown [10.22.8.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B14B6060F;
 Tue, 15 Jun 2021 15:20:40 +0000 (UTC)
Date: Tue, 8 Jun 2021 09:52:44 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v8 9/9] qtest/hyperv: Introduce a simple hyper-v test
Message-ID: <20210608125244.phx5lk4uv3jiku6q@habkost.net>
References: <20210608120817.1325125-1-vkuznets@redhat.com>
 <20210608120817.1325125-10-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210608120817.1325125-10-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 DKIMWL_WL_HIGH=-0.197, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 02:08:17PM +0200, Vitaly Kuznetsov wrote:
> For the beginning, just test 'hv-passthrough' and a couple of custom
> Hyper-V  enlightenments configurations through QMP. Later, it would
> be great to complement this by checking CPUID values from within the
> guest.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>

Acked-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


