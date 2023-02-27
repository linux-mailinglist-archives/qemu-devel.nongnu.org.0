Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CEC6A3FF4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:06:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbKQ-0000RZ-Ue; Mon, 27 Feb 2023 06:05:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWbKB-0000Oc-Qv
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:05:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWbKA-0008Ig-1f
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677495941;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KbjbpDoK0glsFSGLjxDzbN6mv0fu5UGwJ3QN2XHj2II=;
 b=ME0jZGXpH7OQ9Q6ma8BXiQPLE0RGGn4G/FWLZvUtG21S7FqEdLp5rsUQbFj4EB1lfp5+cm
 g4bcUyi6ABVZ0rewZR6XfRnk7IBwIyvTTbmUsSpZgEvwrqL/ibDVqfFr0QlIU7uXGDGMjx
 sCXc1VdEmFX6t289eRa3sxmoQimpcv8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-rp_W8Jg5NGi7GrwOPRxDxg-1; Mon, 27 Feb 2023 06:05:38 -0500
X-MC-Unique: rp_W8Jg5NGi7GrwOPRxDxg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9600F3C0E441;
 Mon, 27 Feb 2023 11:05:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D13E140EBF6;
 Mon, 27 Feb 2023 11:05:35 +0000 (UTC)
Date: Mon, 27 Feb 2023 11:05:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] .gitlab-ci.d/base: Mark jobs as interruptible by default
Message-ID: <Y/yOfGHoZj3funIM@redhat.com>
References: <20230223191343.1064274-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230223191343.1064274-1-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 23, 2023 at 08:13:43PM +0100, Thomas Huth wrote:
> When handling pull requests in the staging branch, it often happens
> that one of the job fails due to a problem, so that the pull request
> can't be merged. Peter/Richard/Stefan then informs the sender of the
> pull request and continues by pushing the next pending pull request
> from another subsystem maintainer. Now the problem is that there might
> still be lots of other running jobs in the pipeline of the first pull
> request, eating up precious CI minutes though the pipeline is not
> needed anymore. We can avoid this by marking the jobs as "interruptible".
> With this setting, the jobs from previous pipelines are automatically
> terminated when pushing a new one. If someone does not like this auto-
> matic termination, it can still be disabled in the settings of the
> repository. See this URL for details:
> 
>  https://docs.gitlab.com/ee/ci/yaml/index.html#interruptible
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/base.yml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


