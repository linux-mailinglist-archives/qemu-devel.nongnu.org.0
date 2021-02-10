Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04637316905
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 15:24:12 +0100 (CET)
Received: from localhost ([::1]:38698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9qPb-0006LF-3d
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 09:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l9qON-0005R9-25
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 09:22:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l9qOK-0006YQ-N2
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 09:22:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612966970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zGSb7IDaGSl6/ZUijtVyCIsjrmeamnoruTV80yhmEWs=;
 b=OIgP5GwTVL2tMRGOxy+uRbyfN5jUjmCQOum03aVZYdEYbdrc03YpNiXO2H+eNJuY9n7018
 +gAWitvdkgyskS9oaZHWUMYAjVkSVhD0gxSloTpX3CMVhaWvoBNgls4MI5y7Q9FUDZBhxu
 3xaf2hfT3JlMXK+DHYUtMgrk7hS9qwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-Hu5EIp6TOkG25VFZdK0TZg-1; Wed, 10 Feb 2021 09:22:47 -0500
X-MC-Unique: Hu5EIp6TOkG25VFZdK0TZg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68DF5593D7;
 Wed, 10 Feb 2021 14:22:41 +0000 (UTC)
Received: from localhost (unknown [10.40.208.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00CD0100164C;
 Wed, 10 Feb 2021 14:22:36 +0000 (UTC)
Date: Wed, 10 Feb 2021 15:22:34 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wang Xingang <wangxingang5@huawei.com>
Subject: Re: [PATCH 1/3] acpi: Allow pxb DSDT acpi table changes
Message-ID: <20210210152234.1f69f027@redhat.com>
In-Reply-To: <1612490205-48788-2-git-send-email-wangxingang5@huawei.com>
References: <1612490205-48788-1-git-send-email-wangxingang5@huawei.com>
 <1612490205-48788-2-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 01:56:43 +0000
Wang Xingang <wangxingang5@huawei.com> wrote:

> From: Xingang Wang <wangxingang5@huawei.com>
> 
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..90c53925fc 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/DSDT.pxb",

Reviewed-by: Igor Mammedov <imammedo@redhat.com>


