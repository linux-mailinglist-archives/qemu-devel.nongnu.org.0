Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FD66A8843
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 19:06:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXnJa-0008PL-AG; Thu, 02 Mar 2023 13:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXnJX-0008FS-S0
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 13:05:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXnJW-0004sC-74
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 13:05:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677780357;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uq28CY84X2a6rgRGcIFR8HUgJVL3s2wDxCarfoJ7rwk=;
 b=TRzWdhgVeEB97PJf5rHoKQDwn0Sfnd/oAno9/jk+GMwnyVIlgW8TnjZ4fSuuoWbBje2wnB
 fBKvhfh637oPsX8QdyjKG2W+gwSiDh9rx9Fzlw5oXstvo7TkbbBFBJW3m7K5Ln+6LHh4j1
 JqSjoH6piLYkSljPwfmiUG4fW9XSYa0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-cgKAbBlxMrmaZJ1R6OIDbw-1; Thu, 02 Mar 2023 13:05:54 -0500
X-MC-Unique: cgKAbBlxMrmaZJ1R6OIDbw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7D1F3C10C70;
 Thu,  2 Mar 2023 18:05:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DD6C2026D4B;
 Thu,  2 Mar 2023 18:05:51 +0000 (UTC)
Date: Thu, 2 Mar 2023 18:05:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
Subject: Re: [PATCH v2 2/6] docs/about/deprecated: Deprecate 32-bit x86 hosts
Message-ID: <ZADlfILU11Akp5MT@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-3-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302163106.465559-3-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Mar 02, 2023 at 05:31:02PM +0100, Thomas Huth wrote:
> Hardly anybody still uses 32-bit x86 hosts today, so we should start
> deprecating them to stop wasting our time and CI minutes here.
> For example, there are also still some unresolved problems with these:
> When emulating 64-bit binaries in user mode, TCG does not honor atomicity
> for 64-bit accesses, which is "perhaps worse than not working at all"
> (quoting Richard). Let's simply make it clear that people should use
> 64-bit x86 hosts nowadays and we do not intend to fix/maintain the old
> 32-bit stuff.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 11700adac9..a30aa8dfdf 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -208,6 +208,18 @@ CI coverage support may bitrot away before the deprecation process
>  completes. The little endian variants of MIPS (both 32 and 64 bit) are
>  still a supported host architecture.
>  
> +32-bit x86 hosts (since 8.0)
> +''''''''''''''''''''''''''''
> +
> +Support for 32-bit x86 host deployments is increasingly uncommon in
> +mainstream OS distributions given the widespread availability of 64-bit
> +x86 hardware. The QEMU project no longer considers 32-bit x86 support
> +to be an effective use of its limited resources, and thus intends to
> +discontinue it. Since all recent x86 hardware from the past >10 years
> +is capable of the 64-bit x86 extensions, a corresponding 64-bit OS
> +should be used instead.
> +
> +
>  QEMU API (QAPI) events
>  ----------------------
>  
> -- 
> 2.31.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


