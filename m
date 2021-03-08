Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EECDD330EF7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:16:50 +0100 (CET)
Received: from localhost ([::1]:55218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFkg-0001b3-0S
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lJEza-0006Re-4t
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:28:10 -0500
Received: from hera.aquilenet.fr ([2a0c:e300::1]:53682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lJEzY-0000NG-02
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:28:09 -0500
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 08CB731A;
 Mon,  8 Mar 2021 13:28:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6g1hiqJ38iv3; Mon,  8 Mar 2021 13:28:03 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id DC24925F;
 Mon,  8 Mar 2021 13:28:02 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1lJEzQ-006FwR-SH; Mon, 08 Mar 2021 13:28:00 +0100
Date: Mon, 8 Mar 2021 13:28:00 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Joelle van Dyne <j@getutm.app>
Subject: Re: [PATCH 4/4] slirp: feature detection for smbd
Message-ID: <20210308122800.urarbnaddnvbchmh@begin>
References: <20210308064821.81427-1-j@getutm.app>
 <20210308064821.81427-5-j@getutm.app>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308064821.81427-5-j@getutm.app>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 08CB731A
X-Spamd-Result: default: False [-2.50 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 HAS_ORG_HEADER(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MID_RHS_NOT_FQDN(0.50)[]; BAYES_HAM(-3.00)[100.00%]
Received-SPF: softfail client-ip=2a0c:e300::1;
 envelope-from=samuel.thibault@gnu.org; helo=hera.aquilenet.fr
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Joelle van Dyne, le dim. 07 mars 2021 22:48:21 -0800, a ecrit:
> Replace Windows specific macro with a more generic feature detection
> macro. Allows slirp smb feature to be disabled manually as well.
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>

Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  configure   | 26 +++++++++++++++++++++++---
>  meson.build |  3 +++
>  net/slirp.c | 16 ++++++++--------
>  3 files changed, 34 insertions(+), 11 deletions(-)
> 
> diff --git a/configure b/configure
> index 34fccaa2ba..8335a3e6a0 100755
> --- a/configure
> +++ b/configure
> @@ -465,6 +465,7 @@ fuse_lseek="auto"
>  multiprocess="auto"
>  
>  malloc_trim="auto"
> +slirp_smbd="auto"
>  
>  # parse CC options second
>  for opt do
> @@ -834,8 +835,6 @@ do
>      fi
>  done
>  
> -: ${smbd=${SMBD-/usr/sbin/smbd}}
> -
>  # Default objcc to clang if available, otherwise use CC
>  if has clang; then
>    objcc=clang
> @@ -1560,6 +1559,10 @@ for opt do
>    ;;
>    --disable-multiprocess) multiprocess="disabled"
>    ;;
> +  --enable-slirp-smbd) slirp_smbd=yes
> +  ;;
> +  --disable-slirp-smbd) slirp_smbd=no
> +  ;;
>    *)
>        echo "ERROR: unknown option $opt"
>        echo "Try '$0 --help' for more information"
> @@ -1913,6 +1916,7 @@ disabled with --disable-FEATURE, default is enabled if available
>    fuse            FUSE block device export
>    fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
>    multiprocess    Out of process device emulation support
> +  slirp-smbd      use smbd (at path --smbd=*) in slirp networking
>  
>  NOTE: The object files are built at the place where configure is launched
>  EOF
> @@ -5252,6 +5256,19 @@ case "$slirp" in
>      ;;
>  esac
>  
> +# Check for slirp smbd dupport
> +: ${smbd=${SMBD-/usr/sbin/smbd}}
> +if test "$slirp_smbd" != "no" ; then
> +  if test "$mingw32" = "yes" ; then
> +    if test "$slirp_smbd" = "yes" ; then
> +      error_exit "Host smbd not supported on this platform."
> +    fi
> +    slirp_smbd=no
> +  else
> +    slirp_smbd=yes
> +  fi
> +fi
> +
>  ##########################################
>  # check for usable __NR_keyctl syscall
>  
> @@ -5527,7 +5544,10 @@ fi
>  if test "$guest_agent" = "yes" ; then
>    echo "CONFIG_GUEST_AGENT=y" >> $config_host_mak
>  fi
> -echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
> +if test "$slirp_smbd" = "yes" ; then
> +  echo "CONFIG_SLIRP_SMBD=y" >> $config_host_mak
> +  echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
> +fi
>  if test "$vde" = "yes" ; then
>    echo "CONFIG_VDE=y" >> $config_host_mak
>    echo "VDE_LIBS=$vde_libs" >> $config_host_mak
> diff --git a/meson.build b/meson.build
> index ba0db9fa1f..773ce512c7 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2629,6 +2629,9 @@ summary_info += {'pixman':            pixman.found()}
>  summary_info += {'VTE support':       config_host.has_key('CONFIG_VTE')}
>  # TODO: add back version
>  summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
> +if slirp_opt != 'disabled' and 'CONFIG_SLIRP_SMBD' in config_host
> +  summary_info += {'smbd':            config_host['CONFIG_SMBD_COMMAND']}
> +endif
>  summary_info += {'libtasn1':          config_host.has_key('CONFIG_TASN1')}
>  summary_info += {'PAM':               config_host.has_key('CONFIG_AUTH_PAM')}
>  summary_info += {'iconv support':     iconv.found()}
> diff --git a/net/slirp.c b/net/slirp.c
> index be914c0be0..b3ded2aac1 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -27,7 +27,7 @@
>  #include "net/slirp.h"
>  
>  
> -#ifndef _WIN32
> +#if defined(CONFIG_SLIRP_SMBD)
>  #include <pwd.h>
>  #include <sys/wait.h>
>  #endif
> @@ -90,7 +90,7 @@ typedef struct SlirpState {
>      Slirp *slirp;
>      Notifier poll_notifier;
>      Notifier exit_notifier;
> -#ifndef _WIN32
> +#if defined(CONFIG_SLIRP_SMBD)
>      gchar *smb_dir;
>  #endif
>      GSList *fwd;
> @@ -103,7 +103,7 @@ static QTAILQ_HEAD(, SlirpState) slirp_stacks =
>  static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp);
>  static int slirp_guestfwd(SlirpState *s, const char *config_str, Error **errp);
>  
> -#ifndef _WIN32
> +#if defined(CONFIG_SLIRP_SMBD)
>  static int slirp_smb(SlirpState *s, const char *exported_dir,
>                       struct in_addr vserver_addr, Error **errp);
>  static void slirp_smb_cleanup(SlirpState *s);
> @@ -367,7 +367,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
>      struct in6_addr ip6_prefix;
>      struct in6_addr ip6_host;
>      struct in6_addr ip6_dns;
> -#ifndef _WIN32
> +#if defined(CONFIG_SLIRP_SMBD)
>      struct in_addr smbsrv = { .s_addr = 0 };
>  #endif
>      NetClientState *nc;
> @@ -477,7 +477,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
>          return -1;
>      }
>  
> -#ifndef _WIN32
> +#if defined(CONFIG_SLIRP_SMBD)
>      if (vsmbserver && !inet_aton(vsmbserver, &smbsrv)) {
>          error_setg(errp, "Failed to parse SMB address");
>          return -1;
> @@ -592,7 +592,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
>              }
>          }
>      }
> -#ifndef _WIN32
> +#if defined(CONFIG_SLIRP_SMBD)
>      if (smb_export) {
>          if (slirp_smb(s, smb_export, smbsrv, errp) < 0) {
>              goto error;
> @@ -784,7 +784,7 @@ void hmp_hostfwd_add(Monitor *mon, const QDict *qdict)
>  
>  }
>  
> -#ifndef _WIN32
> +#if defined(CONFIG_SLIRP_SMBD)
>  
>  /* automatic user mode samba server configuration */
>  static void slirp_smb_cleanup(SlirpState *s)
> @@ -899,7 +899,7 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
>      return 0;
>  }
>  
> -#endif /* !defined(_WIN32) */
> +#endif /* defined(CONFIG_SLIRP_SMBD) */
>  
>  static int guestfwd_can_read(void *opaque)
>  {
> -- 
> 2.28.0
> 

-- 
Samuel
"And the next time you consider complaining that running Lucid Emacs
19.05 via NFS from a remote Linux machine in Paraguay doesn't seem to
get the background colors right, you'll know who to thank."
(By Matt Welsh)

