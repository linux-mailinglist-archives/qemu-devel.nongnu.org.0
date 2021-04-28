Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B84536DF3A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 20:53:31 +0200 (CEST)
Received: from localhost ([::1]:39084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbpJS-0005of-KG
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 14:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbpIG-0004v1-Lg
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 14:52:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbpID-0005qE-Ih
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 14:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619635932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kAHw4D+9G9iuDBJZHtTKNbxcw+vPRybljedes2nkWhk=;
 b=IZ9IqlR4tvxaCgqSsTrMsHtgj53EvH0sJhcJCtVsQLTmizCebB0QhgZyVmK6J8x3bzZMfl
 TcyGeHzSCPLBMb7e75ERiKe8VyYEjg5kVuarW49QogbntyCr9DzlCqjipMBGqp6iKcc/yP
 ODSk/wNojKEDjuDtutZlhIikWknBY0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-LqEUk912OF23AZibHhd6lg-1; Wed, 28 Apr 2021 14:52:10 -0400
X-MC-Unique: LqEUk912OF23AZibHhd6lg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E454106BB29;
 Wed, 28 Apr 2021 18:52:09 +0000 (UTC)
Received: from localhost (unknown [10.22.9.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33B065D9C0;
 Wed, 28 Apr 2021 18:52:09 +0000 (UTC)
Date: Wed, 28 Apr 2021 14:52:08 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] i386: Document when features can be added to
 kvm_default_props
Message-ID: <20210428185208.saqzdpyhsb7iwlru@habkost.net>
References: <20200925211021.4158567-1-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200925211021.4158567-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 25, 2020 at 05:10:21PM -0400, Eduardo Habkost wrote:
> It's very easy to mistakenly extend kvm_default_props to include
> features that require a kernel version that's too recent.  Add a
> comment warning about that, pointing to the documentation file
> where the minimum kernel version for KVM is documented.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

I forgot about this.  I'm queueing it now (7 months later).

-- 
Eduardo


