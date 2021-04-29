Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDE136E748
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 10:47:02 +0200 (CEST)
Received: from localhost ([::1]:46744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc2K5-0006vm-4n
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 04:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lc2Ha-00066J-WC
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 04:44:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lc2HZ-0008CW-4C
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 04:44:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619685864;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IHALPWaU060r7Q3JWvtZnf/NSXgtD5jWHcD4RA3Z5Qw=;
 b=V/D1SQm4BMT1i+tUFDgkxMod4+pRBPzuBLCFqSNE4/m9uHCofTqqaofYBozts5QR3bafcM
 rCwdi2wC2XAZ5CGPYprwhIy2rKP1Waxu6DkIbNBXPNYZFg6bgFasHQlztLEXmVmwYz+taF
 U6DkBjmI0Up3P2/bSP4CACGteYRnnNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-AdXr2yWPPNCnNS653eit8A-1; Thu, 29 Apr 2021 04:44:12 -0400
X-MC-Unique: AdXr2yWPPNCnNS653eit8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28F778030DD;
 Thu, 29 Apr 2021 08:44:11 +0000 (UTC)
Received: from redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4010E610DF;
 Thu, 29 Apr 2021 08:43:58 +0000 (UTC)
Date: Thu, 29 Apr 2021 09:43:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 2/2] gitlab-ci: Add a job to build virtiofsd standalone
Message-ID: <YIpxy4jSazVrYFJ9@redhat.com>
References: <20210429083346.61030-1-philmd@redhat.com>
 <20210429083346.61030-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210429083346.61030-3-philmd@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 10:33:46AM +0200, Philippe Mathieu-Daudé wrote:
> Add a job which builds virtiofsd without any emulation or tool.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> https://gitlab.com/philmd/qemu/-/jobs/1222007991
> Duration: 7 minutes 48 seconds
> ---
>  .gitlab-ci.yml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 52d65d6c04f..ba3c7ade6ca 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -800,6 +800,19 @@ build-libvhost-user:
>      - meson
>      - ninja
>  
> +build-virtiofsd-fedora:
> +  <<: *native_build_job_definition
> +  needs:
> +    job: amd64-fedora-container
> +  variables:
> +    IMAGE: fedora
> +    CONFIGURE_ARGS: --enable-virtiofsd
> +        --disable-system --disable-user --disable-tools --disable-docs
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build/tools/virtiofsd/virtiofsd

I'm not convinced that this job is justiable given our need to keep
the total CI pipeline size constrained. The precedent this sets is
that we need to test every configure args combination for each binary
we build. That is not scalable as a pattern. Neither this virtiofsd
arg scenario, nor others is going to be commonly used by downstream
consumers of QEMU, so the payoff from having this job is also small.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


