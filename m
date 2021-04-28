Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3299436DC8E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:59:07 +0200 (CEST)
Received: from localhost ([::1]:42708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmag-0007B5-8d
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbm3e-0002OT-40
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:24:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbm3b-0004PQ-34
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:24:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619623493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YsBMStnl1u3aB/6+yznmp8zdN0/RZFwPbU9pycRSV1A=;
 b=FYd9x1jBoRaWXLmk2/yzBHwvzpgi2fXIDW6GYhaVU+VD+mtMMKPq9Aqlg4vnbkNiOf2qWU
 Eiu1uisCgwOnD3KIozxv0AhBEuwlkgrxumD0AfqRqAmdM/U2/qhESGQhQBTaybdFmQliWu
 LgP5XdoDXfwNgYiaC2RLJBqtSKy8etY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-vgpUVt9ROQqAkxME3dlwpg-1; Wed, 28 Apr 2021 11:24:50 -0400
X-MC-Unique: vgpUVt9ROQqAkxME3dlwpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96CF018C35C0;
 Wed, 28 Apr 2021 15:24:48 +0000 (UTC)
Received: from localhost (unknown [10.22.9.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D7AC226FB;
 Wed, 28 Apr 2021 15:24:48 +0000 (UTC)
Date: Wed, 28 Apr 2021 11:24:47 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Subject: Re: [PATCH RESEND v2] i386/cpu: Remove the deprecated cpu model
 'Icelake-Client'
Message-ID: <20210428152447.tf2xugpiptgl3hej@habkost.net>
References: <1619577673-152264-1-git-send-email-robert.hu@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1619577673-152264-1-git-send-email-robert.hu@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 robert.hu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 28, 2021 at 10:41:13AM +0800, Robert Hoo wrote:
> As it's been marked deprecated since v5.2, now I think it's time remove it
> from code.
> 
> Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> ---
> (Sorry, forgot to append changelog in last send.)
> Changelog:
> v2:
>     Update removed-features.rst.
>     Since previously no its deprecation info was recorded in
> docs/system/deprecated.rst, nothing to update in it.

deprecated.rst has an entry for Icelake-Client.  See commit
3e6a015cbd0f ("i386: Mark Icelake-Client CPU models deprecated").

-- 
Eduardo


