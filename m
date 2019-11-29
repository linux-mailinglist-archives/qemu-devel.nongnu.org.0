Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D095E10D5FD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Nov 2019 14:08:25 +0100 (CET)
Received: from localhost ([::1]:58874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iag0V-0006TJ-Sh
	for lists+qemu-devel@lfdr.de; Fri, 29 Nov 2019 08:08:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49621)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iafAZ-0004cZ-9K
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 07:14:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iafAU-0004ql-GD
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 07:14:41 -0500
Received: from 7.mo5.mail-out.ovh.net ([178.32.124.100]:52925)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iafAU-0004D7-5O
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 07:14:38 -0500
Received: from player711.ha.ovh.net (unknown [10.109.143.145])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 46E4B25CDB1
 for <qemu-devel@nongnu.org>; Fri, 29 Nov 2019 13:14:26 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id 77978C9700C1;
 Fri, 29 Nov 2019 12:14:22 +0000 (UTC)
Date: Fri, 29 Nov 2019 13:14:21 +0100
From: Greg Kurz <groug@kaod.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] build: rename CONFIG_LIBCAP to CONFIG_LIBCAP_NG
Message-ID: <20191129131421.6a3f0db5@bahia.w3ibm.bluemix.net>
In-Reply-To: <20191129111632.22840-1-pbonzini@redhat.com>
References: <20191129111632.22840-1-pbonzini@redhat.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 837951006930147790
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeiledgfeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.32.124.100
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Nov 2019 12:16:31 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Since we are using the newer capng library, rename the symbol to match.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  configure             |  2 +-
>  qemu-bridge-helper.c  |  6 +++---
>  scsi/qemu-pr-helper.c | 12 ++++++------
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/configure b/configure
> index 6099be1d84..afe9393f04 100755
> --- a/configure
> +++ b/configure
> @@ -6759,7 +6759,7 @@ if test "$l2tpv3" = "yes" ; then
>    echo "CONFIG_L2TPV3=y" >> $config_host_mak
>  fi
>  if test "$cap_ng" = "yes" ; then
> -  echo "CONFIG_LIBCAP=y" >> $config_host_mak
> +  echo "CONFIG_LIBCAP_NG=y" >> $config_host_mak
>  fi
>  echo "CONFIG_AUDIO_DRIVERS=$audio_drv_list" >> $config_host_mak
>  for drv in $audio_drv_list; do
> diff --git a/qemu-bridge-helper.c b/qemu-bridge-helper.c
> index 3d50ec094c..88b26747fc 100644
> --- a/qemu-bridge-helper.c
> +++ b/qemu-bridge-helper.c
> @@ -43,7 +43,7 @@
>  
>  #include "net/tap-linux.h"
>  
> -#ifdef CONFIG_LIBCAP
> +#ifdef CONFIG_LIBCAP_NG
>  #include <cap-ng.h>
>  #endif
>  
> @@ -207,7 +207,7 @@ static int send_fd(int c, int fd)
>      return sendmsg(c, &msg, 0);
>  }
>  
> -#ifdef CONFIG_LIBCAP
> +#ifdef CONFIG_LIBCAP_NG
>  static int drop_privileges(void)
>  {
>      /* clear all capabilities */
> @@ -246,7 +246,7 @@ int main(int argc, char **argv)
>      int access_allowed, access_denied;
>      int ret = EXIT_SUCCESS;
>  
> -#ifdef CONFIG_LIBCAP
> +#ifdef CONFIG_LIBCAP_NG
>      /* if we're run from an suid binary, immediately drop privileges preserving
>       * cap_net_admin */
>      if (geteuid() == 0 && getuid() != geteuid()) {
> diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
> index debb18f4aa..0659ceef09 100644
> --- a/scsi/qemu-pr-helper.c
> +++ b/scsi/qemu-pr-helper.c
> @@ -24,7 +24,7 @@
>  #include <linux/dm-ioctl.h>
>  #include <scsi/sg.h>
>  
> -#ifdef CONFIG_LIBCAP
> +#ifdef CONFIG_LIBCAP_NG
>  #include <cap-ng.h>
>  #endif
>  #include <pwd.h>
> @@ -70,7 +70,7 @@ static int num_active_sockets = 1;
>  static int noisy;
>  static int verbose;
>  
> -#ifdef CONFIG_LIBCAP
> +#ifdef CONFIG_LIBCAP_NG
>  static int uid = -1;
>  static int gid = -1;
>  #endif
> @@ -97,7 +97,7 @@ static void usage(const char *name)
>  "                            (default '%s')\n"
>  "  -T, --trace [[enable=]<pattern>][,events=<file>][,file=<file>]\n"
>  "                            specify tracing options\n"
> -#ifdef CONFIG_LIBCAP
> +#ifdef CONFIG_LIBCAP_NG
>  "  -u, --user=USER           user to drop privileges to\n"
>  "  -g, --group=GROUP         group to drop privileges to\n"
>  #endif
> @@ -827,7 +827,7 @@ static void close_server_socket(void)
>      num_active_sockets--;
>  }
>  
> -#ifdef CONFIG_LIBCAP
> +#ifdef CONFIG_LIBCAP_NG
>  static int drop_privileges(void)
>  {
>      /* clear all capabilities */
> @@ -920,7 +920,7 @@ int main(int argc, char **argv)
>              pidfile = g_strdup(optarg);
>              pidfile_specified = true;
>              break;
> -#ifdef CONFIG_LIBCAP
> +#ifdef CONFIG_LIBCAP_NG
>          case 'u': {
>              unsigned long res;
>              struct passwd *userinfo = getpwnam(optarg);
> @@ -1056,7 +1056,7 @@ int main(int argc, char **argv)
>          exit(EXIT_FAILURE);
>      }
>  
> -#ifdef CONFIG_LIBCAP
> +#ifdef CONFIG_LIBCAP_NG
>      if (drop_privileges() < 0) {
>          error_report("Failed to drop privileges: %s", strerror(errno));
>          exit(EXIT_FAILURE);


