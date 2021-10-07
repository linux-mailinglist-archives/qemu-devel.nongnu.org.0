Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ADF425675
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 17:13:38 +0200 (CEST)
Received: from localhost ([::1]:35316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYV5V-0005mw-HD
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 11:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYUvG-0004FL-4O
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 11:03:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYUvB-0007sn-NC
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 11:03:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633618976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/H1ivfnHQs97PbDVul2ZuohDEnxb8WnTb7pH2m9FYkg=;
 b=XSQuJVeoba3+M2PK5P/9huyXFE6QyEWzazX8EOlGHVR5m28NWsLlrK+Ep15ckFUPwiHs0q
 LBIK+JOccPtfM9xzWDSvF7h/gUf/Ks359mX3R+uGvxgcj8c8BgTy/GUQGSYMOik6Ugbqx2
 1kewVEi7FEHXTPh8LHPUm5fvDNhXqHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-jj-IRPHRPJeQ2jomdJrXDg-1; Thu, 07 Oct 2021 11:02:52 -0400
X-MC-Unique: jj-IRPHRPJeQ2jomdJrXDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D7E0101C7D4;
 Thu,  7 Oct 2021 15:02:52 +0000 (UTC)
Received: from redhat.com (ovpn-113-216.phx2.redhat.com [10.3.113.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B6387B6D6;
 Thu,  7 Oct 2021 15:02:48 +0000 (UTC)
Date: Thu, 7 Oct 2021 10:02:46 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 07/17] python/aqmp: Disable logging messages by default
Message-ID: <20211007150246.az7m7e4e4pmnym6f@redhat.com>
References: <20210923004938.3999963-1-jsnow@redhat.com>
 <20210923004938.3999963-8-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210923004938.3999963-8-jsnow@redhat.com>
User-Agent: NeoMutt/20210205-818-e2615c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 08:49:28PM -0400, John Snow wrote:
> AQMP is a library, and ideally it should not print error diagnostics
> unless a user opts into seeing them. By default, Python will print all
> WARNING, ERROR or CRITICAL messages to screen if no logging
> configuration has been created by a client application.
> 
> In AQMP's case, ERROR logging statements are used to report additional
> detail about runtime failures that will also eventually be reported to the
> client library via an Exception, so these messages should not be
> rendered by default.
> 
> (Why bother to have them at all, then? In async contexts, there may be
> multiple Exceptions and we are only able to report one of them back to
> the client application. It is not reasonably easy to predict ahead of
> time if one or more of these Exceptions will be squelched. Therefore,
> it's useful to log intermediate failures to help make sense of the
> ultimate, resulting failure.)
> 
> Add a NullHandler that will suppress these messages until a client
> application opts into logging via logging.basicConfig or similar. Note
> that upon calling basicConfig(), this handler will *not* suppress these
> messages from being displayed by the client's configuration.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/__init__.py | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


