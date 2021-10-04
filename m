Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2071C421669
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 20:27:38 +0200 (CEST)
Received: from localhost ([::1]:38882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXSga-0004V1-L4
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 14:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mXSfB-0003lr-KQ
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 14:26:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mXSf3-00035R-W2
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 14:26:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633371960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SE2BdF3/BpxKnYMPhlDhgqUbVbf1xJGVDZjzRFMzD3E=;
 b=Likq17kY3/ikHltrCw/oih/El6L/jUeJy1qzl6dsblPGskrSLFp05HsJ/93dbVWu5DIH0M
 Gb52eLrIjGeFy0C+jAbTUYqzvEG8jtn1pDHdvAzDlbAYVNQ5GgSTvYwQgCGOrqoDIvYJtn
 Os3/kFh/hTgNOfo6bDGw1XhlBumdA2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-cMnjpb3OOny-eSO4blJnUg-1; Mon, 04 Oct 2021 14:25:57 -0400
X-MC-Unique: cMnjpb3OOny-eSO4blJnUg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D5CC18414A0;
 Mon,  4 Oct 2021 18:25:56 +0000 (UTC)
Received: from redhat.com (ovpn-113-32.phx2.redhat.com [10.3.113.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FD8460843;
 Mon,  4 Oct 2021 18:25:31 +0000 (UTC)
Date: Mon, 4 Oct 2021 13:25:29 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v3 04/19] docs/devel: add example of command returning
 unstructured text
Message-ID: <20211004182529.2c4lmmz75kftb2lh@redhat.com>
References: <20210930132349.3601823-1-berrange@redhat.com>
 <20210930132349.3601823-5-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930132349.3601823-5-berrange@redhat.com>
User-Agent: NeoMutt/20210205-804-7958fd
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 02:23:34PM +0100, Daniel P. Berrangé wrote:
> This illustrates how to add a QMP command returning unstructured text,
> following the guidelines added in the previous patch. The example uses
> a simplified version of 'info roms'.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  docs/devel/writing-monitor-commands.rst | 87 ++++++++++++++++++++++++-
>  1 file changed, 86 insertions(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


