Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9EA39E5AA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:41:39 +0200 (CEST)
Received: from localhost ([::1]:37866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJFq-0001l5-B9
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lqInB-0004IG-2w
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 13:12:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lqIn6-0004g5-OC
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 13:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623085914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M9xJptO+3AZziU6a0dNhIo1wxlGd3M2OuqJfzoNv8W4=;
 b=NZOaegbgtngimbSJu7FZNYymxr2zAECCyfYFzkOKBXBaM61RnNmUO4O69G80tfLQktXifb
 ZDtR6Hc0pQws5Ifh/n2eBpFpSYyIqwEOPjdlwVqHd4oL1LAAl+388gXRjm1T7XX2nXpgtK
 l1/hm3QifCCMAfNMfXns0HN5FaQgN0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-L2vIpI62PI-38SRF1laqAw-1; Mon, 07 Jun 2021 13:11:51 -0400
X-MC-Unique: L2vIpI62PI-38SRF1laqAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AAB5180FD6E;
 Mon,  7 Jun 2021 17:11:50 +0000 (UTC)
Received: from localhost (ovpn-116-131.gru2.redhat.com [10.97.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8149A60C04;
 Mon,  7 Jun 2021 17:11:46 +0000 (UTC)
Date: Mon, 7 Jun 2021 14:11:44 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v3 3/4] scripts: helper to generate x86_64 CPU ABI compat
 info
Message-ID: <20210607171144.dyzw4bubhsqgafrz@habkost.net>
References: <20210607135843.196595-1-berrange@redhat.com>
 <20210607135843.196595-4-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210607135843.196595-4-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 07, 2021 at 02:58:42PM +0100, Daniel P. Berrangé wrote:
[...]
> +# Assumes externally launched process such as
> +#
> +#   qemu-system-x86_64 -qmp unix:/tmp/qmp,server,nowait -display none -accel kvm
> +#
> +# Note different results will be obtained with TCG, as
> +# TCG masks out certain features otherwise present in
> +# the CPU model definitions, as does KVM.
> +
> +
> +sock = sys.argv[1]
> +cmd = sys.argv[2]
> +shell = qmp.QEMUMonitorProtocol(sock)
> +shell.connect()
> +
> +models = shell.cmd("query-cpu-definitions")

I would make the script launch QEMU itself, using the QEMUMachine
class.

But life is too short for polishing a quick utility script, so:

Acked-by: Eduardo Habkost <ehabkost@redhat.com>

I plan to queue this once I review the rest of the series.

-- 
Eduardo


