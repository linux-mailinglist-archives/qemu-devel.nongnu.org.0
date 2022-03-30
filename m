Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3DD4EBD0A
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 10:58:42 +0200 (CEST)
Received: from localhost ([::1]:49628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZUA5-0007DA-Dr
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 04:58:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nZTYU-0005te-Aa
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:19:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nZTYR-00011x-6L
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648628386;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8MUMJ7zrBakiX+BWQ+pm72WlQZhAh1NMA62oczQ8umE=;
 b=ZgvWZ/BKR3OPDziYs1WoN56wHW0i+2jAwrTRzp9ZbuoxZK5cmsqAnOChJoeVD7WmjjAcmx
 mHlg3h7EyBQ379+raQPqSVYQwacoo4t00hvB8XcvGkLlhMmolxkN+Ped/XOXa1f213Htd4
 UOu3Wz0wxkcxOr63OsoDEtU2qWylKVI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-FyHxRDnrPbi1_R0m2vvLWQ-1; Wed, 30 Mar 2022 04:19:34 -0400
X-MC-Unique: FyHxRDnrPbi1_R0m2vvLWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2BD3100BAAF;
 Wed, 30 Mar 2022 08:19:33 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 223BD1410F3B;
 Wed, 30 Mar 2022 08:19:32 +0000 (UTC)
Date: Wed, 30 Mar 2022 09:19:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-7.1] tests: Drop perl-Test-Harness from the CI
 containers / VMs
Message-ID: <YkQSkGLb6F7zB10b@redhat.com>
References: <20220329102808.423681-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220329102808.423681-1-thuth@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Ed Maste <emaste@freebsd.org>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 29, 2022 at 12:28:08PM +0200, Thomas Huth wrote:
> The perl test harness is not necessary anymore since commit 3d2f73ef75
> ("build: use "meson test" as the test harness"). Thus remove it from
> tests/lcitool/projects/qemu.yml, run "make lcitool-refresh" and manually
> clean the remaining docker / vm files that are not managed by lcitool yet.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Note: This triggers a rebuild of the Centos-stream 8 container when
>  pushed to gitlab.com - which is however currently failing due to a
>  completely unrelated problem in the distro. Thus I've marked this as
>  "for-7.1" for now to avoid disturbing up our 7.0 freeze phase.

FYI The centos repo issues appear to be resolved this morning.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


