Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947675EFDE6
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 21:26:44 +0200 (CEST)
Received: from localhost ([::1]:59840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odzBD-00013M-Ew
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 15:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1odz5z-0005Mk-5W; Thu, 29 Sep 2022 15:21:19 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:57435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1odz5x-0007Cc-NR; Thu, 29 Sep 2022 15:21:18 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MEVJq-1oTUhb0wUE-00G1hQ; Thu, 29 Sep 2022 21:21:09 +0200
Message-ID: <9e56929e-d939-a2d8-6788-66d27d2644b0@vivier.eu>
Date: Thu, 29 Sep 2022 21:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] checkpatch: ignore target/hexagon/imported/* files
Content-Language: fr
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-trivial@nongnu.org
References: <e3b6a345a88807a1c4daa45f638b2a90af538fd5.1663681339.git.quic_mathbern@quicinc.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <e3b6a345a88807a1c4daa45f638b2a90af538fd5.1663681339.git.quic_mathbern@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AOX1Zh86t297FgzQ1N/StJFiSe6HUrakvQmSI9fhz5LDjsIPKbW
 6Dcvz0Xdp0XHsNX5AJIQ2RAS0vdDCmhkDzwC5m9CZn66RQSA18OH9z9Sbp+iYL8e5AZRwXV
 J5ToKv62N9ymGcvRur3cHQOMJALtVdM4BW47q58jtqPAhHgJkQo54BrTLAQ7dGEXwwphpkG
 x57ReMAD2d5VRWpHEBUrg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:epiVLccRh3g=:VtUA/aII4TVbfN1+MHZNkC
 BRBRbTUFibOJpLw/Q3/gxdxGGOXpd16oGayVIv5vtJtWPnO43Y22PrAswnqw5jAXC+MyaCQV3
 4QSEVKiPnWZMusMEoOtgGFXjxxzwQVaqA/sFE+CFZBpjeyAXLiwSRuh5KslySfSpSbSTzvGc4
 aUQNoeDDDoW9Q38qPNfPCiNzGgpAhzce/TLocLD69f1OWDyfGVcJboKMlKIOg/OCbp3vm2w/Y
 hDbq4kkIZ35lUPfNjG+47QCIBwFSge+LfyygwUBWT3nuGSzemBnWt/xOhmMDo/MSLeI1JvIgm
 I8G/q6Bacwn4df9Sc2JnwwDSfqdnVlBV5NOD09aL+tzphm8VbskN9kpSdz9CLhHuqXbdgi81J
 yyjEpVrg0su6X8N3EN04tqqKVmUX68nKDcknUHU8LDFu3MufGPJcKJc2M1HVtBZgFaVUTuIOG
 F96k7z+AecsjOB8F4OHZb38FDk//Kd/iEOWSjImtoVQ14cF6mtZ3fGSWHXSchZnJTIjNH03p4
 F/dQKbts9GxU2axgyDqqybNIBfeNdvjwSyQBxSv8roSoe1sYpiH4kggVmrVBU+0d7lUIhYgaf
 pgI5jX/LqWIXgP2zFhdEeIlteE4uEFrQeCLYoaY5vCuBeoGbdmt4/gjkpO8OoXdkI0pGPVTJW
 ChHKQJPqGaBjC1SkeYNHmKKDXK5a1PdksCf958NziYGL8AOfQ+qP6w5GawgwccceK7XeYF69W
 Mn81stoLz+yGYvz2LcJuE7PPVaNvCPb2K1AOz97dB9rsCGDXFuw9g6u1aHGjCaIAyUyb+sXfG
 nDxdQAv
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.099,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 20/09/2022 à 15:42, Matheus Tavares Bernardino a écrit :
> These files come from an external project (the hexagon archlib), so they
> deliberately do not follow QEMU's coding style. To avoid false positives
> from checkpatch.pl, let's disable the checking for those.
> 
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>   scripts/checkpatch.pl | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index d900d18048..e3e3b43076 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1667,6 +1667,7 @@ sub process {
>   # some scripts we imported from other projects.
>   		next if ($realfile =~ /\.(s|S)$/);
>   		next if ($realfile =~ /(checkpatch|get_maintainer)\.pl$/);
> +		next if ($realfile =~ /^target\/hexagon\/imported\/*/);
>   
>   		if ($rawline =~ /^\+.*\t/) {
>   			my $herevet = "$here\n" . cat_vet($rawline) . "\n";

Applied to my trivial-patches branch.

Thanks,
Laurent


