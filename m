Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5968B30B2CE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 23:39:13 +0100 (CET)
Received: from localhost ([::1]:45776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6hqh-0008CN-Rh
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 17:39:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6hpm-0007JO-DG
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 17:38:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6hpi-000396-Fe
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 17:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612219088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bzN7ESNkAvVmJRIdLcXkBPkhK8lUdNEH2MELdd9yyzU=;
 b=FyojVQrVwLdBSLqwhgrTB5N9jE1QfOKH94lRBVN4YFNbwwy5Wm5dxaR5UcnxIArcdZIqlJ
 5AA0361XC4/lENjl/7xZkDFx7X1P5Y7sCLMI+OWOfuKHoIBmKcD1SwupAVr5uZRqM/Un9v
 Fh1qUKx1SCFlp+28JZta3mn+8fi35O0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-Otgsx91MMYOhnhScTNnqQg-1; Mon, 01 Feb 2021 17:38:05 -0500
X-MC-Unique: Otgsx91MMYOhnhScTNnqQg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 226E119251A4;
 Mon,  1 Feb 2021 22:38:04 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A406C5D6D5;
 Mon,  1 Feb 2021 22:38:03 +0000 (UTC)
Date: Mon, 1 Feb 2021 17:38:03 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH] i386: Add the support for AMD EPYC 3rd generation
 processors
Message-ID: <20210201223803.GI3872207@habkost.net>
References: <161133338780.27536.17735339269843944966.stgit@bmoger-ubuntu>
 <20210201221627.GH3872207@habkost.net>
 <0ad4017d-e755-94a3-859e-800661bcd2d1@amd.com>
MIME-Version: 1.0
In-Reply-To: <0ad4017d-e755-94a3-859e-800661bcd2d1@amd.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 01, 2021 at 04:29:50PM -0600, Babu Moger wrote:
> Eduardo,
> Please hold off on this patch. I need to update this patch.
> Actually We need to add one more bit to SVM
> feature(CPUID_SVM_SVME_ADDR_CHK). I was planning to do that this week.
> Got busy with some other priority. Will send it this week, Sorry about it.

No problem, thanks for the heads up!

-- 
Eduardo


