Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BE050E191
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 15:25:51 +0200 (CEST)
Received: from localhost ([::1]:59742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niyis-0006hu-9m
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 09:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1niygS-0005ep-DZ
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:23:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1niygQ-0002cx-QH
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:23:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650892998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E3n3QiFOoIKNg95Wcj5R107GFtea93aGsqTPLCo8V7Y=;
 b=LIVBUoRwZqMIZXvcSp+6RynuV9q5ZOMaqZYHKLdTkktPVLYDRA4C9dYHTBQ1a7ShGlFBLQ
 XAO919CYQcLbQKBZymcILOQqUu1XlmV3DFJWGq9S8w8yxOTtpRRN12XXBZ1bFewlEBKnCr
 6MBvXCepCnskkTaPZ4GUTWLR6n9OYJs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277--TBzj3-sNmGYEOclSSDfpw-1; Mon, 25 Apr 2022 09:23:16 -0400
X-MC-Unique: -TBzj3-sNmGYEOclSSDfpw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E633880B71C
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 13:23:15 +0000 (UTC)
Received: from paraplu (unknown [10.39.195.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AA6254C724;
 Mon, 25 Apr 2022 13:23:14 +0000 (UTC)
Date: Mon, 25 Apr 2022 15:23:12 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [qemu.qmp PATCH 06/12] move README.rst to FILES.rst and update
Message-ID: <YmagwD9t/Ay8MX/L@paraplu>
References: <20220422184940.1763958-1-jsnow@redhat.com>
 <20220422184940.1763958-7-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422184940.1763958-7-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 02:49:34PM -0400, John Snow wrote:
> The intent is to use README.rst as the new package-level readme that
> will be bundled with the source and be displayed on the GitLab landing
> page; so move the old "git level readme" over to FILES.rst instead, and
> update it accordingly.

Heh, I almost thought "git level readme" is a command similar to "git
cuddle daemon" [1] :D

[1] https://git-man-page-generator.lokaltog.net/#Y3VkZGxlJCRkYWVtb24

> 
> This is primarily here to just document and explain what all the little
> bits and pieces of files in the root are and what they do. I find this
> stuff helpful when I wander over into other projects, so I'd like to
> extend the same courtesy.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  README.rst => FILES.rst | 49 +++++++++++------------------------------
>  MANIFEST.in             |  1 -
>  2 files changed, 13 insertions(+), 37 deletions(-)
>  rename README.rst => FILES.rst (64%)

As usual, thanks for the care for documentation.

Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>    

[...]

-- 
/kashyap


