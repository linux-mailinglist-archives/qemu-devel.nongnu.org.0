Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A50841A14A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 23:20:14 +0200 (CEST)
Received: from localhost ([::1]:43078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUy2n-0000TO-HE
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 17:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUy1P-0007ar-1z
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:18:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUy1L-0007CQ-1C
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:18:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632777521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sL+lHTvuswMgF3m1GXUFQKIm0jm/utfJCCuKC8MeJ3k=;
 b=fSO5vqbRBx1vVQRz1Z2Ho2lknsEA4mn77dBO16IoiEoFwLUT6d1wMhC8QpE57XcA29rtUj
 r8mBvRC6pBZsARJ+Ey4l+dE3yfMFZggyANry5lLNcIBgIE8zWF7AMEA0krviFAY2aFeR9k
 mEsAn/RjJHp0+egQJP3xuEG2otfbpb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370--jReo5YRNimkIw3HyL95ZQ-1; Mon, 27 Sep 2021 17:18:37 -0400
X-MC-Unique: -jReo5YRNimkIw3HyL95ZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 107D3802935;
 Mon, 27 Sep 2021 21:18:37 +0000 (UTC)
Received: from redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A6A510013D7;
 Mon, 27 Sep 2021 21:18:36 +0000 (UTC)
Date: Mon, 27 Sep 2021 16:18:34 -0500
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH v2] nbd/server: Add --selinux-label option
Message-ID: <20210927211834.tzqpx4egzwbvjmrs@redhat.com>
References: <20210723103303.1731437-1-rjones@redhat.com>
 <20210723103303.1731437-2-rjones@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210723103303.1731437-2-rjones@redhat.com>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, berrange@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23, 2021 at 11:33:03AM +0100, Richard W.M. Jones wrote:
> Under SELinux, Unix domain sockets have two labels.  One is on the
> disk and can be set with commands such as chcon(1).  There is a
> different label stored in memory (called the process label).  This can
> only be set by the process creating the socket.  When using SELinux +
> SVirt and wanting qemu to be able to connect to a qemu-nbd instance,
> you must set both labels correctly first.
> 
> For qemu-nbd the options to set the second label are awkward.  You can
> create the socket in a wrapper program and then exec into qemu-nbd.
> Or you could try something with LD_PRELOAD.
> 
> This commit adds the ability to set the label straightforwardly on the
> command line, via the new --selinux-label flag.  (The name of the flag
> is the same as the equivalent nbdkit option.)
> 
> A worked example showing how to use the new option can be found in
> this bug: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
> 
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---

I'm making one tweak to your patch before sending the pull request:

> +++ b/qemu-nbd.c
> @@ -64,6 +68,7 @@
>  #define QEMU_NBD_OPT_FORK          263
>  #define QEMU_NBD_OPT_TLSAUTHZ      264
>  #define QEMU_NBD_OPT_PID_FILE      265
> +#define QEMU_NBD_OPT_SELINUX_LABEL 266
>  
>  #define MBR_SIZE 512
>  
> @@ -116,6 +121,9 @@ static void usage(const char *name)
>  "  --fork                    fork off the server process and exit the parent\n"
>  "                            once the server is running\n"
>  "  --pid-file=PATH           store the server's process ID in the given file\n"
> +#ifdef CONFIG_SELINUX
> +"  --selinux-label=LABEL     set SELinux process label on listening socket\n"
> +#endif

The new option is only conditionally advertised under --help (qemu-nbd
lacks a stable machine-parseable output, so scraping --help output
will have to do for now)...

>  #if HAVE_NBD_DEVICE
>  "\n"
>  "Kernel NBD client support:\n"
> @@ -532,6 +540,8 @@ int main(int argc, char **argv)
>          { "trace", required_argument, NULL, 'T' },
>          { "fork", no_argument, NULL, QEMU_NBD_OPT_FORK },
>          { "pid-file", required_argument, NULL, QEMU_NBD_OPT_PID_FILE },
> +        { "selinux-label", required_argument, NULL,
> +          QEMU_NBD_OPT_SELINUX_LABEL },

...but is unconditionally supported as a long option even when support
was not compiled in...

>          { NULL, 0, NULL, 0 }
>      };
>      int ch;
> @@ -558,6 +568,7 @@ int main(int argc, char **argv)
>      int old_stderr = -1;
>      unsigned socket_activation;
>      const char *pid_file_name = NULL;
> +    const char *selinux_label = NULL;
>      BlockExportOptions *export_opts;
>  
>  #ifdef CONFIG_POSIX
> @@ -747,6 +758,9 @@ int main(int argc, char **argv)
>          case QEMU_NBD_OPT_PID_FILE:
>              pid_file_name = optarg;
>              break;
> +        case QEMU_NBD_OPT_SELINUX_LABEL:
> +            selinux_label = optarg;
> +            break;
>          }
>      }
>  
> @@ -938,6 +952,16 @@ int main(int argc, char **argv)
>          } else {
>              backlog = MIN(shared, SOMAXCONN);
>          }
> +        if (sockpath && selinux_label) {
> +#ifdef CONFIG_SELINUX
> +            if (setsockcreatecon_raw(selinux_label) == -1) {
> +                error_report("Cannot set SELinux socket create context "
> +                             "to %s: %s",
> +                             selinux_label, strerror(errno));
> +                exit(EXIT_FAILURE);
> +            }
> +#endif

...but here we silently ignore it if support is not compiled in.
Better is to issue an error message about using an unsupported option,
so I'll squash this in:

diff --git i/qemu-nbd.c w/qemu-nbd.c
index 5dc82c419255..94f8ec07c064 100644
--- i/qemu-nbd.c
+++ w/qemu-nbd.c
@@ -962,6 +962,9 @@ int main(int argc, char **argv)
                              selinux_label, strerror(errno));
                 exit(EXIT_FAILURE);
             }
+#else
+            error_report("SELinux support not enabled in this binary");
+            exit(EXIT_FAILURE);
 #endif
         }
         saddr = nbd_build_socket_address(sockpath, bindto, port);
@@ -978,6 +981,9 @@ int main(int argc, char **argv)
                              strerror(errno));
                 exit(EXIT_FAILURE);
             }
+#else
+            error_report("SELinux support not enabled in this binary");
+            exit(EXIT_FAILURE);
 #endif
         }
     } else {


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


