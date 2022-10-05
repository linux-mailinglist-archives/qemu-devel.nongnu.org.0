Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E5C5F5226
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 12:02:14 +0200 (CEST)
Received: from localhost ([::1]:32898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og1EB-0008QA-RK
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 06:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1og1As-0006Wq-5I
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 05:58:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1og1Ao-0006UG-Lm
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 05:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664963921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=btCB3+yaka9exJ0yV739yE5zoi8BvSvRtYE9yJke0Tc=;
 b=f5YlsS3TmOk50ajRc4lYElD7voEtKuMXr98ziT7IoaJisFsZjniUnU+ntf19EaXof4GZFw
 YuyFTCIciWvrQhoAtFxCWQ1tjoa5FGhJJIYDV5Q1n0xKX8DtRHVDgm/lTqHphoshLHOapK
 v4TyLUSs4IS7utlqaIEGwgO4aKo826Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-5QMME3J3OSupgB_WSNzPpA-1; Wed, 05 Oct 2022 05:58:37 -0400
X-MC-Unique: 5QMME3J3OSupgB_WSNzPpA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F2213C025C2
 for <qemu-devel@nongnu.org>; Wed,  5 Oct 2022 09:58:37 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9110EC15BA4;
 Wed,  5 Oct 2022 09:58:36 +0000 (UTC)
Date: Wed, 5 Oct 2022 11:58:35 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, victortoso@redhat.com
Subject: Re: [PATCH] Revert "qapi: fix examples of blockdev-add with qcow2"
Message-ID: <Yz1VS9h9MxRQFZkn@redhat.com>
References: <20220930171908.846769-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930171908.846769-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 30.09.2022 um 19:19 hat Markus Armbruster geschrieben:
> This reverts commit b6522938327141235b97ab38e40c6c4512587373.
> 
> Kevin Wolf NAKed this patch, because:
> 
>     'file' is a required member (defined in BlockdevOptionsGenericFormat),
>     removing it makes the example invalid. 'data-file' is only an additional
>     optional member to be used for external data files (i.e. when the guest
>     data is kept separate from the metadata in the .qcow2 file).
> 
> However, it had already been merged then.  Revert.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Thanks, applied to the block branch.

Kevin


