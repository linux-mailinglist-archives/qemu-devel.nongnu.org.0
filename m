Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4694529D14B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 18:21:32 +0100 (CET)
Received: from localhost ([::1]:35638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXp8d-0002go-8X
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 13:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kXodH-00086j-F1
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 12:49:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kXodF-0002Bc-4f
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 12:49:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603903743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OLXCtsgCfl5Zj3fHeFHwz1ddkbf1A6kVeTpga9dlzgQ=;
 b=KS7mdjQHQMIVrdt0c1ObCZunt++ZMFvYWRiWWf8kHAUThwMcGi3fSM6CH5OVvvSujVMDsy
 7QEHwlXwzcajww9/u1zsN2bWzacygOrlSzKPlpXc6EVMR7m1Nm1rNbPWci+fAkT0jalAwY
 AhZozPQ+KIXI7BRw9lWS/x39+77DexM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-sTTSrd5VN9-EfjaeUhCDNw-1; Wed, 28 Oct 2020 12:49:01 -0400
X-MC-Unique: sTTSrd5VN9-EfjaeUhCDNw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 226551099F67
 for <qemu-devel@nongnu.org>; Wed, 28 Oct 2020 16:49:00 +0000 (UTC)
Received: from localhost (unknown [10.40.208.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA1F160BF1;
 Wed, 28 Oct 2020 16:48:58 +0000 (UTC)
Date: Wed, 28 Oct 2020 17:48:57 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 04/29] vl: remove bogus check
Message-ID: <20201028174857.59e2242e@redhat.com>
In-Reply-To: <20201027182144.3315885-5-pbonzini@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-5-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:51:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Oct 2020 14:21:19 -0400
Paolo Bonzini <pbonzini@redhat.com> wrote:

> There is no reason to prevent -preconfig -daemonize.  Of course if
> no monitor is defined there will be no way to start the VM,
> but that is a user error.

it was related to how libvirt starts QEMU but I don't recall why anymore,
CCing Daniel

> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  softmmu/vl.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 7f39ebdfee..dbb72e621e 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -4027,12 +4027,6 @@ void qemu_init(int argc, char **argv, char **envp)
>      }
>  
>      if (is_daemonized()) {
> -        if (!preconfig_exit_requested) {
> -            error_report("'preconfig' and 'daemonize' options are "
> -                         "mutually exclusive");
> -            exit(EXIT_FAILURE);
> -        }
> -
>          /* According to documentation and historically, -nographic redirects
>           * serial port, parallel port and monitor to stdio, which does not work
>           * with -daemonize.  We can redirect these to null instead, but since


