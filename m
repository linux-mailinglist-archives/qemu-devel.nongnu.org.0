Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FD4F8B28
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 09:54:55 +0100 (CET)
Received: from localhost ([::1]:60244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iURws-0005HZ-8v
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 03:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43121)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iURvf-0004Zm-EF
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 03:53:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iURve-0003qo-59
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 03:53:39 -0500
Received: from 10.mo179.mail-out.ovh.net ([46.105.79.46]:54378)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iURvd-0003cP-VG
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 03:53:38 -0500
Received: from player735.ha.ovh.net (unknown [10.109.143.201])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 07A0214ACD1
 for <qemu-devel@nongnu.org>; Tue, 12 Nov 2019 09:53:28 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player735.ha.ovh.net (Postfix) with ESMTPSA id 7BAC8BFDC3C1;
 Tue, 12 Nov 2019 08:53:23 +0000 (UTC)
Date: Tue, 12 Nov 2019 09:53:21 +0100
From: Greg Kurz <groug@kaod.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu] scripts: Detect git worktrees for
 get_maintainer.pl --git
Message-ID: <20191112095321.0b42ade4@bahia.lan>
In-Reply-To: <20191112034532.69079-1-aik@ozlabs.ru>
References: <20191112034532.69079-1-aik@ozlabs.ru>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 8288875114856290805
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddvkedgjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.79.46
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Nov 2019 14:45:32 +1100
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

> Recent git versions support worktrees where .git is not a directory but
> a file with a path to the .git repository; however the get_maintainer.pl
> script only recognises the .git directory, let's fix it.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---

Makes sense. The script in the linux kernel tree has this since 2014 BTW :)

Reviewed-by: Greg Kurz <groug@kaod.org>

>  scripts/get_maintainer.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
> index 71415e3c7061..27991eb1cfb4 100755
> --- a/scripts/get_maintainer.pl
> +++ b/scripts/get_maintainer.pl
> @@ -81,7 +81,7 @@ my %VCS_cmds;
>  
>  my %VCS_cmds_git = (
>      "execute_cmd" => \&git_execute_cmd,
> -    "available" => '(which("git") ne "") && (-d ".git")',
> +    "available" => '(which("git") ne "") && (-e ".git")',
>      "find_signers_cmd" =>
>  	"git log --no-color --follow --since=\$email_git_since " .
>  	    '--format="GitCommit: %H%n' .


