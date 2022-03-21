Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF654E2F5B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 18:48:31 +0100 (CET)
Received: from localhost ([::1]:38720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWM8s-00032O-TD
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 13:48:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWM31-0000Yt-K7
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:42:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWM2z-0005mW-9e
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647884535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qpjosIfx4K7+Jd/CBDYGP9dyTVaTrKBUJZVl5Eu0EBI=;
 b=F2likNes4dOqcKphGuaJZG6ltPa+PmTe4ejX4nzdTIOY8EDlmEbYaB92BbRjIOvTrmKCRD
 CkYcV8uByMtISwENw8ENz9iZ1HfHfdbPPv9GUtYNvM7J4S4vyE2U4NoWbSPJ0tp81g+yEl
 gL/1kM+ayBDhlGioq2+qxFH2QQLIFn8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261--70zI-evPGK4mIUrehrJsQ-1; Mon, 21 Mar 2022 13:42:12 -0400
X-MC-Unique: -70zI-evPGK4mIUrehrJsQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFEE7800882;
 Mon, 21 Mar 2022 17:42:11 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BD1D40CF8FB;
 Mon, 21 Mar 2022 17:42:11 +0000 (UTC)
Date: Mon, 21 Mar 2022 12:42:09 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 10/15] iotests/245: fixup
Message-ID: <20220321174209.7yz53vjhnrq3h4vn@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-11-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220318203655.676907-11-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, Mar 18, 2022 at 04:36:50PM -0400, John Snow wrote:
> (Merge with prior patch.)
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/242 | 2 +-
>  tests/qemu-iotests/245 | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>

Okay, now that I've looked at the fixups, and played a bit more with
applying the patches locally to this point, you can give the squashed
patch:

Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


