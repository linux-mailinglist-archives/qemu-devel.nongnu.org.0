Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0CC3F35DD
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 23:06:06 +0200 (CEST)
Received: from localhost ([::1]:50894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHBiH-0005j7-HM
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 17:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mHBfv-0004RS-0H
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 17:03:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mHBfs-0004on-Fu
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 17:03:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629493414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7acQRFUwRgEcDT7oFM8uvMfQnchISSu6mi0xswNEtv8=;
 b=FYErWhQXtzKuDkzhrsUCXnWKKrHiZAhZzrIcTGkIHRrrUx7Ifijr0OvAPMZzD5wX9EL7p/
 LioOyv1RI2HhKnsYus+UQx+gHWDbxb6hy4fgIT9bh+eOn0caN+m3Wf6I6d/qtxBn7cZqeq
 qPmyZgoiYOY67QThTnkuy7osi0I+6wc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-qsLHZW3OOaq3sR6LgQCQlg-1; Fri, 20 Aug 2021 17:03:33 -0400
X-MC-Unique: qsLHZW3OOaq3sR6LgQCQlg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C73718C8C02;
 Fri, 20 Aug 2021 21:03:32 +0000 (UTC)
Received: from localhost (unknown [10.22.32.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 458DDBA6F;
 Fri, 20 Aug 2021 21:03:32 +0000 (UTC)
Date: Fri, 20 Aug 2021 17:03:31 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH] i386/cpu: Remove AVX_VNNI feature from Cooperlake cpu
 model
Message-ID: <20210820210331.umqfdmojncgrx572@habkost.net>
References: <20210820054611.84303-1-yang.zhong@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210820054611.84303-1-yang.zhong@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: chayang@redhat.com, qemu-devel@nongnu.org, plai@redhat.com,
 pbonzini@redhat.com, ailan@redhat.com, nanliu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 20, 2021 at 01:46:11PM +0800, Yang Zhong wrote:
> The AVX_VNNI feature is not in Cooperlake platform, remove it
> from cpu model.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>

Fixes: c1826ea6a052 ("i386/cpu: Expose AVX_VNNI instruction to guest")

Queued, thanks!

-- 
Eduardo


