Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD9E4330D7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 10:10:55 +0200 (CEST)
Received: from localhost ([::1]:33536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mckD0-0000u6-20
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 04:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mcjyA-0001aP-HV; Tue, 19 Oct 2021 03:55:34 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:41323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mcjy8-00080t-Rw; Tue, 19 Oct 2021 03:55:34 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N63i4-1mnkOg1cQS-016M9B; Tue, 19 Oct 2021 09:55:30 +0200
Subject: Re: [PATCH] README: Fix some documentation URLs
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <163456470882.196333.17366490695504718038.stgit@bahia.huguette>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <5d244fc2-e241-e1bc-1cb6-8d93941d2d51@vivier.eu>
Date: Tue, 19 Oct 2021 09:55:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <163456470882.196333.17366490695504718038.stgit@bahia.huguette>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9uz8ZtAlQ77ixlMSoUnlv750/dOs66LolJHsx6ARaSVsrbAmnJ3
 soev0L6lKKggN+wtuvroyJHRbEaVqKsQl656o59KQvHGvI2c051eLPBGd1cLKHpiKvmyPJ/
 SXWdJXay039DGOrFGGgkarxGurAPEuOlKTtO6fPZPvhoD0qcBaR09A34HFLWTVkP1p1dmuK
 ZuVwGI43gqFP+kaRxDFvQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/bx1cOFNqj0=:2HJ6qB7KDDedzh5Vi/h1Vf
 TQhWCXdD4m4HhjP2dGYFaKBW4jfj6mhDcNwoCpMPmIGP4SgTtEDVgc1GmxY8VsQ6DEnkbZ3tM
 inE5FFKHrN+kCdyLoo1txfkkdIAvoKIrB51vezyuhIU/ohKhNWLz5W8FprmOL2FbLf0Wv0kIZ
 PArx7scMaw5rEXoi3/nKNhRYjpgeLEsJYsG8QHzjbDMO1X9xmIYi4gjxbAnSurj2+r/ORQRkq
 OGcjZQ3QyT9LGVTxyAuYblYj7FvnEliq6FpC/ljhSZJgfPuKiTFE8iMqbHSR9xfNot+6HKmv0
 RgCOVKZt5vo89gsYQqpRkGrXy0F3Sdod62wGFmE3T1bmZaLdrNzCFOy8gKoP23OLUa/dS8rIo
 fb6s+7FK3mJUNJglaQhacRXDCXH2hQqv6ucqaH4zAjbuEzqQ60revdeTyYtJohSuLKnhd2Tb/
 21wiAT1lyCegbb2BW607NHBuN+Kv1CXCa7NOfd98y58ZGo3miJdDydU2CC/LDlMhr1rTwgkPx
 JUDVoiHDqtjvjaDjDWatRd10Cg1CD2zvbw+TCOaz3OK86hjNfsT0ISuzzdIOPYA0LyFjCo4KN
 gZQN3tneoeFrcttQpU8HmHhE7vK3j0+K7Vzjac8SP5MYO5/8B1rD9iHXVhMy7c9zc1VaQC4ER
 wgQVznuYFON/S8Y0+7M3tZqk8HSwiull9bFwJruw1fcv7+A47pnlT5AuhiG80jbzC/OzGwQhn
 leOB6ZVg4Od8vNty4xv5Jzxx0/lzyc2DifYFfQ==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/10/2021 à 15:45, Greg Kurz a écrit :
> All of these pages live in the wiki, not in the main web site.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  README.rst |   14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/README.rst b/README.rst
> index 79b19f1481e1..23795b837740 100644
> --- a/README.rst
> +++ b/README.rst
> @@ -59,9 +59,9 @@ of other UNIX targets. The simple steps to build QEMU are:
>  
>  Additional information can also be found online via the QEMU website:
>  
> -* `<https://qemu.org/Hosts/Linux>`_
> -* `<https://qemu.org/Hosts/Mac>`_
> -* `<https://qemu.org/Hosts/W32>`_
> +* `<https://wiki.qemu.org/Hosts/Linux>`_
> +* `<https://wiki.qemu.org/Hosts/Mac>`_
> +* `<https://wiki.qemu.org/Hosts/W32>`_
>  
>  
>  Submitting patches
> @@ -84,8 +84,8 @@ the Developers Guide.
>  Additional information on submitting patches can be found online via
>  the QEMU website
>  
> -* `<https://qemu.org/Contribute/SubmitAPatch>`_
> -* `<https://qemu.org/Contribute/TrivialPatches>`_
> +* `<https://wiki.qemu.org/Contribute/SubmitAPatch>`_
> +* `<https://wiki.qemu.org/Contribute/TrivialPatches>`_
>  
>  The QEMU website is also maintained under source control.
>  
> @@ -144,7 +144,7 @@ reported via GitLab.
>  
>  For additional information on bug reporting consult:
>  
> -* `<https://qemu.org/Contribute/ReportABug>`_
> +* `<https://wiki.qemu.org/Contribute/ReportABug>`_
>  
>  
>  ChangeLog
> @@ -168,4 +168,4 @@ main methods being email and IRC
>  Information on additional methods of contacting the community can be
>  found online via the QEMU website:
>  
> -* `<https://qemu.org/Contribute/StartHere>`_
> +* `<https://wiki.qemu.org/Contribute/StartHere>`_
> 
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent



