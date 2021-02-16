Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E8A31CEEE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:23:59 +0100 (CET)
Received: from localhost ([::1]:56442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC44s-0007ar-4U
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC3ao-0005WW-HO
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:52:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC3am-0000AP-2l
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:52:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613494369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZCry1nQu1n9CjyJnExQk9p0d9cqatVJwPsjdC9djoj8=;
 b=Eal75Hfw/BmK2p6bBem1xl28HoELuPDADI2d+q35WnNHAaQyC/GYrc5o+pBUxsK1XznMnb
 PQC0QstbZns60RRI6rLYqxUvL1PHCVsYTIHNkS2qtnV2oeN928GHADBFBAsrURKXbfkWLO
 Hy/Ai76ORNgc39XFEwF9Yvr/7CMjy78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-1J88TG2mOrG51reQzolh4g-1; Tue, 16 Feb 2021 11:52:46 -0500
X-MC-Unique: 1J88TG2mOrG51reQzolh4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 407858030BB;
 Tue, 16 Feb 2021 16:52:44 +0000 (UTC)
Received: from work-vm (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFCBF60CFC;
 Tue, 16 Feb 2021 16:52:28 +0000 (UTC)
Date: Tue, 16 Feb 2021 16:52:26 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 2/8] tools/virtiofsd: Replace the word 'whitelist'
Message-ID: <YCv4SoLEoQrUO1/v@work-vm>
References: <20210205171817.2108907-1-philmd@redhat.com>
 <20210205171817.2108907-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210205171817.2108907-3-philmd@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the words "whitelist"
> appropriately.
> 
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

I've queued just this one via virtiofsd.

Dave

> ---
>  tools/virtiofsd/passthrough_ll.c      |  6 +++---
>  tools/virtiofsd/passthrough_seccomp.c | 12 ++++++------
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 147b59338a1..5f3afe85579 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -3204,7 +3204,7 @@ static void setup_mounts(const char *source)
>  }
>  
>  /*
> - * Only keep whitelisted capabilities that are needed for file system operation
> + * Only keep capabilities in allowlist that are needed for file system operation
>   * The (possibly NULL) modcaps_in string passed in is free'd before exit.
>   */
>  static void setup_capabilities(char *modcaps_in)
> @@ -3214,8 +3214,8 @@ static void setup_capabilities(char *modcaps_in)
>      capng_restore_state(&cap.saved);
>  
>      /*
> -     * Whitelist file system-related capabilities that are needed for a file
> -     * server to act like root.  Drop everything else like networking and
> +     * Add to allowlist file system-related capabilities that are needed for a
> +     * file server to act like root.  Drop everything else like networking and
>       * sysadmin capabilities.
>       *
>       * Exclusions:
> diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
> index ea852e2e33b..62441cfcdb9 100644
> --- a/tools/virtiofsd/passthrough_seccomp.c
> +++ b/tools/virtiofsd/passthrough_seccomp.c
> @@ -21,7 +21,7 @@
>  #endif
>  #endif
>  
> -static const int syscall_whitelist[] = {
> +static const int syscall_allowlist[] = {
>      /* TODO ireg sem*() syscalls */
>      SCMP_SYS(brk),
>      SCMP_SYS(capget), /* For CAP_FSETID */
> @@ -117,12 +117,12 @@ static const int syscall_whitelist[] = {
>  };
>  
>  /* Syscalls used when --syslog is enabled */
> -static const int syscall_whitelist_syslog[] = {
> +static const int syscall_allowlist_syslog[] = {
>      SCMP_SYS(send),
>      SCMP_SYS(sendto),
>  };
>  
> -static void add_whitelist(scmp_filter_ctx ctx, const int syscalls[], size_t len)
> +static void add_allowlist(scmp_filter_ctx ctx, const int syscalls[], size_t len)
>  {
>      size_t i;
>  
> @@ -153,10 +153,10 @@ void setup_seccomp(bool enable_syslog)
>          exit(1);
>      }
>  
> -    add_whitelist(ctx, syscall_whitelist, G_N_ELEMENTS(syscall_whitelist));
> +    add_allowlist(ctx, syscall_allowlist, G_N_ELEMENTS(syscall_allowlist));
>      if (enable_syslog) {
> -        add_whitelist(ctx, syscall_whitelist_syslog,
> -                      G_N_ELEMENTS(syscall_whitelist_syslog));
> +        add_allowlist(ctx, syscall_allowlist_syslog,
> +                      G_N_ELEMENTS(syscall_allowlist_syslog));
>      }
>  
>      /* libvhost-user calls this for post-copy migration, we don't need it */
> -- 
> 2.26.2
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


