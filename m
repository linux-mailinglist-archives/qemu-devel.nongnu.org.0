Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18F61FAFCA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 14:03:31 +0200 (CEST)
Received: from localhost ([::1]:53024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlAJO-0007gG-S3
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 08:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jlAI1-0006r5-JN
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 08:02:05 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42147
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jlAHz-0000F9-Sp
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 08:02:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592308923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Y8pWv+xyJ4xoNOBTWy0XV6HCfZ4N2L7g/Sr1HorF60=;
 b=aN3hn9WjKsnefnd9hlQuwY+Dx/WwTMjYhiIHvHFmSJYe69k/Dte754H5UINEdR2WChRU6Z
 v16IoJGEHyjQd/l5mugW0RDHvtOGH8mHxFNy2kuLPfHlysUV2jviy/gW5cgXSdv9S84Zt5
 6Au0+W7WJZB9+p8IXHm/mQ8IRFhXghs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-MvJlKW_sMxGL_ZGA3QD53g-1; Tue, 16 Jun 2020 08:02:01 -0400
X-MC-Unique: MvJlKW_sMxGL_ZGA3QD53g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A52F107B467
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 12:02:00 +0000 (UTC)
Received: from localhost (unknown [10.40.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68E347CAA5;
 Tue, 16 Jun 2020 12:01:59 +0000 (UTC)
Date: Tue, 16 Jun 2020 14:01:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v2 2/2] qemu-options.hx: Document hmat-lb and hmat-cache
 order
Message-ID: <20200616140158.5ceaee74@redhat.com>
In-Reply-To: <5bd3f4a03227658cbdb1d184518c7805c1c0122f.1591794890.git.mprivozn@redhat.com>
References: <cover.1591794890.git.mprivozn@redhat.com>
 <5bd3f4a03227658cbdb1d184518c7805c1c0122f.1591794890.git.mprivozn@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:01:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Jun 2020 15:17:35 +0200
Michal Privoznik <mprivozn@redhat.com> wrote:

> To simplify internal implementation the hmat-cache parsing code
> expects hmat-lb to be already parsed. This means, that hmat-lb
> arguments must come before hmat-cache. Document this restriction
> so that management applications can follow it.
> 
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  qemu-options.hx | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index b1a399079a..3fe9e6d6a0 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -319,6 +319,9 @@ SRST
>      'none/direct(direct-mapped)/complex(complex cache indexing)'. policy
>      is the write policy. line is the cache Line size in bytes.
>  
> +    Please note, that due to internal implementation, '\ ``hmat-cache``\ '
> +    must be configured only after '\ ``hmat-lb``\ ' option.
> +
>      For example, the following options describe 2 NUMA nodes. Node 0 has
>      2 cpus and a ram, node 1 has only a ram. The processors in node 0
>      access memory in node 0 with access-latency 5 nanoseconds,


