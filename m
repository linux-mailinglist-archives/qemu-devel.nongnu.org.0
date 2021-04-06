Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923C5355A05
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 19:09:18 +0200 (CEST)
Received: from localhost ([::1]:43306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTpCX-0003rv-7i
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 13:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lTp9Y-0002vc-0k
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:06:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lTp9V-00049E-0A
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617728764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v0poFtPT5w2NFWt06yQPNVrMANGchEIWbHYJbX57C9g=;
 b=CkQPD6cdTNrHuYgPmuntCEytMnr8QiURnePdNBLEWPgMgtDFrFbAEBDrYO5H0bA0MiOO7V
 /qc0re7PmgM48egp76v4JdUiQGbPlKvG3OpMaKOYpOnhLe9i+r0ECzEDNWDCZ9TWqj8gs0
 bMBG0uBbczfV8Med3fUwTDMZ9nN+nQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189--MADt71WMSKGmn7tOE6xxw-1; Tue, 06 Apr 2021 13:06:03 -0400
X-MC-Unique: -MADt71WMSKGmn7tOE6xxw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 025411018F75;
 Tue,  6 Apr 2021 17:06:02 +0000 (UTC)
Received: from work-vm (ovpn-114-244.ams2.redhat.com [10.36.114.244])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 154131002EF0;
 Tue,  6 Apr 2021 17:05:57 +0000 (UTC)
Date: Tue, 6 Apr 2021 18:05:55 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH] tests/migration: fix parameter of auto-converge migration
Message-ID: <YGyU8+7YzYM67u1w@work-vm>
References: <0195d34a317ce3cc417b3efd275e30cad35a7618.1616513998.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <0195d34a317ce3cc417b3efd275e30cad35a7618.1616513998.git.huangy81@chinatelecom.cn>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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

Queued

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
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


