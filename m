Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ECA399511
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 23:02:58 +0200 (CEST)
Received: from localhost ([::1]:52824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loY0u-0003Vl-N7
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 17:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1loXzE-0002UA-TO
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 17:01:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1loXzC-0004XI-I7
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 17:01:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622667669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p7sg/IMBwTD2xBJjdgJTtT61hdFxda4nZcANb5K1ByQ=;
 b=C9tLtWD/gsn6OREAK4zaffqtb+2LihCaZELdN0LNUTvVYqVjPSHysr/K8aS+4HNda1rHA6
 wRG30ocl+RS6hOxDx+Vn5nrKX7w2tOGtNzVn48kWQPgxG9j2HMT/QBSfSI8vYscd4UfB6t
 k+N4HQMAk4bBULKCCnFNR/36V8nWmnE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-4sAFZaa2MSiDWdsKFz2jPQ-1; Wed, 02 Jun 2021 17:01:08 -0400
X-MC-Unique: 4sAFZaa2MSiDWdsKFz2jPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0512D1883526;
 Wed,  2 Jun 2021 21:01:07 +0000 (UTC)
Received: from localhost (ovpn-119-154.rdu2.redhat.com [10.10.119.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A390119714;
 Wed,  2 Jun 2021 21:01:06 +0000 (UTC)
Date: Wed, 2 Jun 2021 17:01:06 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v8] qapi: introduce 'query-kvm-cpuid' action
Message-ID: <20210602210106.aahfqxu7cvxr5otx@habkost.net>
References: <20210531123806.23030-1-valeriy.vdovin@virtuozzo.com>
 <20210602205102.icdqspki66rwvc3n@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210602205102.icdqspki66rwvc3n@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, Denis Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 02, 2021 at 03:51:02PM -0500, Eric Blake wrote:
> On Mon, May 31, 2021 at 03:38:06PM +0300, Valeriy Vdovin wrote:
[...]
> > +##
> > +# @CpuidEntry:
> > +#
> > +# A single entry of a CPUID response.
> > +#
> > +# One entry holds full set of information (leaf) returned to the guest in response
> > +# to it calling a CPUID instruction with eax, ecx used as the agruments to that
> 
> arguments
> 
> > +# instruction. ecx is an optional argument as not all of the leaves support it.
> 
> Is there a default value of ecx for when it is not provided by the
> user but needed by the leaf?  Or is it an error if ecx is omitted in
> that case?  Similarly, is it an error if ecx is provided but not
> needed?

What does "not provided by the user" mean here?  This is not
describing the input to a QMP command, but the input to the CPUID
instruction.

-- 
Eduardo


