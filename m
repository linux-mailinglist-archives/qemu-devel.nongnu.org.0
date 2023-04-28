Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B61C6F1B15
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 17:07:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psPfd-0007Ly-34; Fri, 28 Apr 2023 11:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1psPfY-0007Lf-HW
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 11:05:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1psPfW-0008QA-Hl
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 11:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682694333;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O2R4pfrnZ8MWwbKhc9dveaflexOywdHt4RarQ65x2mM=;
 b=ikPiIOMp1sc6sCzO3gC5ywMDlUCK8otL9PP9WZ0sNekqysqSnJ6j8y4Udmw+7p/HKrTcBV
 3DVPOa57K6Dq30g48eNa09EXCPmuPreE1VCFv24e/M/VAjBmGCxwvAYM22zhyZyo16ovh1
 PfqcyFQUiEyOLuKIcqWNjVzVaqXPNXA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-GJZdUY0kOPy6Uegvn6mWtw-1; Fri, 28 Apr 2023 11:05:07 -0400
X-MC-Unique: GJZdUY0kOPy6Uegvn6mWtw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1588D3802AC5;
 Fri, 28 Apr 2023 15:04:37 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BC701410F1C;
 Fri, 28 Apr 2023 15:04:35 +0000 (UTC)
Date: Fri, 28 Apr 2023 16:04:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3] meson: Pass -j option to sphinx
Message-ID: <ZEvgfEn3Wl+x1KAN@redhat.com>
References: <20230428150102.13114-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230428150102.13114-1-farosas@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Apr 28, 2023 at 12:01:02PM -0300, Fabiano Rosas wrote:
> Save a bit of build time by passing the number of jobs option to
> sphinx.
> 
> We cannot use the -j option from make because meson does not support
> setting build time parameters for custom targets. Use nproc instead or
> the equivalent sphinx option "-j auto", if that is available.
> 
> Also make sure our plugins support parallelism and report it properly
> to sphinx. Particularly, implement the merge_domaindata method in
> DBusDomain that is used to merge in data from other subprocesses.
> 
> before:
>   $ time make man html
>   ...
>   [1/2] Generating docs/QEMU manual with a custom command
>   [2/2] Generating docs/QEMU man pages with a custom command
> 
>   real    0m43.157s
>   user    0m42.642s
>   sys     0m0.576s
> 
> after:
>   $ time make man html
>   ...
>   [1/2] Generating docs/QEMU manual with a custom command
>   [2/2] Generating docs/QEMU man pages with a custom command
> 
>   real    0m25.014s
>   user    0m51.288s
>   sys     0m2.085s
> 
> Tested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>  docs/meson.build           | 12 ++++++++++++
>  docs/sphinx/dbusdomain.py  |  4 ++++
>  docs/sphinx/fakedbusdoc.py |  5 +++++
>  docs/sphinx/qmp_lexer.py   |  5 +++++
>  4 files changed, 26 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


