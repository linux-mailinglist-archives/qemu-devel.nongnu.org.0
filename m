Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B58415BB3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:03:35 +0200 (CEST)
Received: from localhost ([::1]:54228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTLZm-0006zn-Ad
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTLXi-0005Kn-Bt
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:01:26 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:40613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTLXa-0005bw-Sk
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:01:25 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MWAjC-1mNFuY3ana-00Xdz1; Thu, 23 Sep 2021 12:01:16 +0200
Subject: Re: [PATCH v5 01/20] nubus: add comment indicating reference documents
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-2-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e59d654a-65ed-63d3-1c20-15ecb52fbad8@vivier.eu>
Date: Thu, 23 Sep 2021 12:01:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210923091308.13832-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yQnxcwtR6uHbUQtXYqLt5ir4gDOP4XEDlFWQm9q/CSRifLpxH7g
 9LcxXeTVMyB2MJ2ZMrDG918/Op0M5MLa0BYGe1yHGTqCEN+iYb7x5P0xHt2ipqVDYCVW9m9
 97oXu8SjJvhLgzi2g3aF2FPhYJwnevICk2XIVCpI0+iTIwJ8E1Z1nC/qx5LqBFOtic3/Txs
 43CpAjc3wtQbc5hRjg89w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2Vb1kIQS3aU=:8QiCLyRU7Se1JgBIjkialm
 MzBqt9ebYecyoBq7qCFO+ACMBAoH/0EQnebsqm0ogcZGw0wZuAiGcI/kBonfTttwK8wcTlv2A
 WnvJQ+BrGc6TTJctYsN5OGUG4EU/7Srx8SsFFsLnHaouaUJfU/TIwhUMf4lpQjnkbrTEPOqsq
 tIH+YuqZhVcbsCWrk74iB7myg2VNt9MStDBpnoUKd8lwLn28GDaI+/aJAT8mrbRBFnKHL0Tf1
 GbytRbjsnAMtWcIwipB3vCQFBRd1DraPPNP3kjJj7AsZP+nKU2vutNxKPfyiML8wikq5Es76Y
 bFHsejAVVROHftpn7vhLKLKD7F/nWKmpsiKc7cpNfBtvtBhkiwLCy418LilYlZLnsoESegDNT
 Wk646VwIP5nCem0xbqSpj72scK9MTMoJ3O5GejCzWIJWoDswBw8rEoy5IUseKPF80MnhPdNIA
 mawc21hxZr49/pB1J4RwgwOM+0BTyOBDFgpr+LnHZKUg3xJtFGSoaiZNbpozy8n1qT4xzAsgW
 k8p7xYgjua4L9HvjSpCgDHlh+8O7EF4OhRKITpqrRv46uIyPKK8g9WwNMUQahofGFLO890zK3
 E73cQjnrTSArDSfa+AhqXuPVbimfokmHf1tjc20n1XFpNGSN4tCLG1l1TtnvBRGrWUt8Ix8yq
 7oLl7+Zwidl10PfAJmf67fG14doR9e+PletW1H1aiKNwYJsNAgLrM2ImK5QZQw4LKxhshFVB2
 1YJDeDzuUcDCpXrGwxYNs1KWAgHZrSgooWZ1qw==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/09/2021 à 11:12, Mark Cave-Ayland a écrit :
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-bus.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
> index 5c13452308..f4410803ff 100644
> --- a/hw/nubus/nubus-bus.c
> +++ b/hw/nubus/nubus-bus.c
> @@ -8,6 +8,14 @@
>   *
>   */
>  
> +/*
> + * References:
> + *   Nubus Specification (TI)
> + *     http://www.bitsavers.org/pdf/ti/nubus/2242825-0001_NuBus_Spec1983.pdf
> + *
> + *   Designing Cards and Drivers for the Macintosh Family (Apple)
> + */
> +
>  #include "qemu/osdep.h"
>  #include "hw/nubus/nubus.h"
>  #include "qapi/error.h"
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

