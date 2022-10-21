Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9D160739F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:13:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo5a-0004ns-SV
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:13:15 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnzq-0007qz-Pq
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1olnzE-0007DI-BM
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:06:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1olnzB-0007Hs-Q4
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:06:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666343190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sC66klclz5vrddaB/aXKiHjQXjHWd6+/OmkfYf8av5A=;
 b=eZuwfVjAyHU08yR5oSQBcrIvCw5tJeF24vRKYMI3+LyCKjH6wdVaN0hktc4xkWcvM0o6hn
 mixVc+GI548FPlYM3uNllj2HG+4eZ/AlKlE9lbDtSjC4LUNKaWna8XBpILb72SoE1cJM78
 MB/r1UWR932g8o9QqQXxFPHHAH2boBI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-j--FdPEYOpe6dWze9AyLSA-1; Fri, 21 Oct 2022 05:06:28 -0400
X-MC-Unique: j--FdPEYOpe6dWze9AyLSA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1ADEA85A5A6
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 09:06:28 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 782152166B33;
 Fri, 21 Oct 2022 09:06:27 +0000 (UTC)
Date: Fri, 21 Oct 2022 11:06:26 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Fold "Block QAPI, monitor, ..." into "Block
 layer core"
Message-ID: <Y1JhEugccYHtSAZh@redhat.com>
References: <20221020120541.80757-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020120541.80757-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Am 20.10.2022 um 14:05 hat Markus Armbruster geschrieben:
> Section "Block QAPI, monitor, command line" is about the external
> interfaces we provide for block devices.  It covers the relevant QAPI
> schema parts, monitor and command line code, more or less.
> 
> The section's files are also covered by section "Block layer core",
> except for the QAPI schema files.
> 
> I haven't acted as maintainer in this area for a long time.  Make it
> official: add the QAPI schema files to section "Block layer core", and
> delete section "Block QAPI, monitor, command line".
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Thanks, applied to the block branch.

Kevin


