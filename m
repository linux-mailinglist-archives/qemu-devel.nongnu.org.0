Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F54C27B674
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 22:38:49 +0200 (CEST)
Received: from localhost ([::1]:56090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMzv6-0002sI-CO
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 16:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kMztX-00028O-MN
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 16:37:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kMztV-0002im-To
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 16:37:11 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601325428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rk4obKF/VUz/or0z8H5GkBtJviWPbUcEPt5go5hZOl0=;
 b=dqk+p8dq7PzaXSnLDI60atFXUWlUmYIEqgEu6IvBndDOU0BqAZGWuv34UiDJ75QDxQ4XxB
 3JcMCvN5XFDN+EGx91iAXLYdNGzjy02jEtdSxKz4xmdEbAmT1p9AIjQsoE3eKbqk1hopU5
 tP+AuETbfOMWls014awmfS9JG7af9gM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106--jnJ8LGPPCWrDYsck1n0PQ-1; Mon, 28 Sep 2020 16:37:04 -0400
X-MC-Unique: -jnJ8LGPPCWrDYsck1n0PQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6522A1074645;
 Mon, 28 Sep 2020 20:37:03 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40E8473665;
 Mon, 28 Sep 2020 20:37:02 +0000 (UTC)
Date: Mon, 28 Sep 2020 16:37:01 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Subject: Re: [PATCH v4 1/2] Introduce (x86) CPU model deprecation API
Message-ID: <20200928203701.GF3717385@habkost.net>
References: <1600758855-80046-1-git-send-email-robert.hu@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1600758855-80046-1-git-send-email-robert.hu@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 03:47:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com, robert.hu@intel.com,
 pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 22, 2020 at 03:14:14PM +0800, Robert Hoo wrote:
> Complement versioned CPU model framework with the ability of marking some
> versions deprecated. When that CPU model is chosen, get some warning. The
> warning message is customized, e.g. telling in which future QEMU version will
> it be obsoleted.
> The deprecation message will also appear by x86_cpu_list_entry(), e.g. '-cpu
> help'.
> QMP 'query-cpu-definitions' will also return a bool value indicating the
> deprecation status.
> 
> Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


