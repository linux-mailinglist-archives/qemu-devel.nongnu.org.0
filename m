Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C160C4D309F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 14:57:15 +0100 (CET)
Received: from localhost ([::1]:33034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRwoU-0008I4-Rp
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 08:57:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nRwmp-00070K-8R
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 08:55:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nRwmm-00015J-0B
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 08:55:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646834124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xneWb+nkQxU+DyGf5oiQdAzOZoK1xIWOvXoE1NNiMq0=;
 b=MWJk3By3AxhR45PG95Et/hpryVf9PJTzlZhe4hTGdMlp72r9OaZdydGQT9JmttDgmCbtGM
 lWluo1YNj8KCF0fiuIULb2akAMv9J6Xl+D87RWKpo6JmOI17B8FsjKxc9OXSPrdqSiR8Lv
 Fp1oe7fSSNQXzyQ5cuH+uEA+KE0BsxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-QqgrgAG9ONuWbBYPIIQL7w-1; Wed, 09 Mar 2022 08:55:23 -0500
X-MC-Unique: QqgrgAG9ONuWbBYPIIQL7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A52C1091DA1;
 Wed,  9 Mar 2022 13:55:22 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE10A85476;
 Wed,  9 Mar 2022 13:55:16 +0000 (UTC)
Date: Wed, 9 Mar 2022 07:55:14 -0600
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/qemu-iotests: Use GNU sed in two more spots where
 it is necessary
Message-ID: <20220309135514.2t4jwxg4myptlraz@redhat.com>
References: <20220309101626.637836-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220309101626.637836-1-thuth@redhat.com>
User-Agent: NeoMutt/20211029-410-d8ee8c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 09, 2022 at 11:16:26AM +0100, Thomas Huth wrote:
> These two spots have been missed in commit 9086c7639822 ("Rework the
> checks and spots using GNU sed") - they need GNU sed, too, since they
> are using the "+" address form.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qemu-iotests/common.filter | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Simpler than rewriting as [0-9][0-9]* for non-GNU sed.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


