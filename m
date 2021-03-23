Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE3F346943
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:43:02 +0100 (CET)
Received: from localhost ([::1]:44398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmvd-0003RN-BK
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lOmtD-0000sa-VY
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 15:40:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lOmt9-0008W5-FH
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 15:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616528424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wK0cRoX1+nDgngKPZU212YLYC8cfxyWLJkg7DHWghMM=;
 b=jDYZOCVoiHZOqeyJGlOEEcu0J7KcL8z2YVdbDzL+e0QwjoQHoRWzKehKgA9UHo88E8Xdcx
 qA2i9lSuvZ4RRirpgFASMxiw1mET05B8CVlKXRxjY8gwl7NdHtyejfoVNpB8VMC/JIlRU7
 PWelqjXi8WV5joKJ9m4TamIwWfCSWLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-CL6ZuZatPU-XLRtyCWFqnw-1; Tue, 23 Mar 2021 15:40:22 -0400
X-MC-Unique: CL6ZuZatPU-XLRtyCWFqnw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69BBA800D53;
 Tue, 23 Mar 2021 19:40:21 +0000 (UTC)
Received: from work-vm (ovpn-115-35.ams2.redhat.com [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4031E694CD;
 Tue, 23 Mar 2021 19:40:20 +0000 (UTC)
Date: Tue, 23 Mar 2021 19:40:17 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: huangy81@chinatelecom.cn, thuth@redhat.com, berrange@redhat.com
Subject: Re: [PATCH] tests/migration: fix parameter of auto-converge migration
Message-ID: <YFpEId2vw9ceC1Ly@work-vm>
References: <0195d34a317ce3cc417b3efd275e30cad35a7618.1616513998.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <0195d34a317ce3cc417b3efd275e30cad35a7618.1616513998.git.huangy81@chinatelecom.cn>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* huangy81@chinatelecom.cn (huangy81@chinatelecom.cn) wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> when execute the following test command:
> $ ./guestperf-batch.py --auto-converge \
>     --auto-converge-step {percent} ...
> test aborts and error message be throwed as the following:
> "Parameter 'x-cpu-throttle-increment' is unexpected"
> 
> The reason is that 'x-cpu-throttle-increment' has been
> deprecated and 'cpu-throttle-increment' was introduced
> Since v2.7. Use the new parameter instead.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Please cc thuth@redhat.com and berrange@redhat.com on fixes to this
file.

> ---
>  tests/migration/guestperf/engine.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
> index e399447..6b49aed 100644
> --- a/tests/migration/guestperf/engine.py
> +++ b/tests/migration/guestperf/engine.py
> @@ -102,7 +102,7 @@ def _migrate_progress(self, vm):
>              info.get("downtime", 0),
>              info.get("expected-downtime", 0),
>              info.get("setup-time", 0),
> -            info.get("x-cpu-throttle-percentage", 0),
> +            info.get("cpu-throttle-percentage", 0),
>          )
> 
>      def _migrate(self, hardware, scenario, src, dst, connect_uri):
> @@ -135,7 +135,7 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
>                                       "state": True }
>                                 ])
>              resp = src.command("migrate-set-parameters",
> -                               x_cpu_throttle_increment=scenario._auto_converge_step)
> +                               cpu_throttle_increment=scenario._auto_converge_step)
> 
>          if scenario._post_copy:
>              resp = src.command("migrate-set-capabilities",
> --
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


