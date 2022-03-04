Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598FC4CD279
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:35:10 +0100 (CET)
Received: from localhost ([::1]:53424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5HB-0003LJ-Ed
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:35:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ5BR-0007Pg-TF
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:29:13 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:60927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ5BQ-000163-5o
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:29:13 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MybCV-1oO6mt0o4T-00z0Uh; Fri, 04 Mar 2022 11:29:06 +0100
Message-ID: <4f6fed83-464c-9b79-b826-40b2a4de9cf2@vivier.eu>
Date: Fri, 4 Mar 2022 11:29:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 07/10] esp: introduce esp_pdma_cb() function
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, qemu-devel@nongnu.org
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-8-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220302212752.6922-8-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hF82p19XoDMox/0HU8sOzmd2RF0oq03dGocNS6Gd+ktk/uaXmM/
 3TW5IqBMogo/iAiVT7zUU4hfO+y8ETEHbiZLtEm4OyeC2e9QEjAOrdakfl2N6Sg/R/0ESxC
 sfHH2AGi59JZEI/gyqgScYVGzAR7L8GFARjA5W6QfqtwgnRKSdpN0gtQIaFVilwi6pOPgnD
 IhmYqOYoiDvPgkKXLLH5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kHgQpmRkU/w=:x8Iu3cyo62+7SF7/USO/hQ
 xJOvDGvevDaMtfEJR8+UcDuYu1MrG9ouYhjNQufeOpo7qiyG7dBKLKsbEbh79V5KaMyJuPsIc
 7lV98tU1x09AWvivVtD3u55B5gAILY+zvqQi12MQTARkupzIM1hq/hoWBtfACxiFoQeq+Fs6X
 6E8Pn2NbnalkgQsqYEKIoF+qv+l/sRX2/kzoOC4YEfqWfIXCZGa7Fmq5jYhcsJyoT3JarJlJG
 awfXBZK51L9+77M+srDhfs/2ckwwAnvwtJzgUwddKjh6xmVM1h9rsr8N2UlIRvHBFrx0IDIpM
 RkuE0xy3SzGAM5LtoF4vP+C6pyGHWRKNWhmx07vesgNxy1KkuVmvrfjHb5xhU85RfvNLOuanR
 ajoNa6Q6qaSpHN5ch7ps7PUdxhUA29VasYWSSuFCOBlG6/wUo4rVqi1bVexwBuCh1U8RnOsM+
 oCi2PeYovCD2k05Qqo678abBxNpXYI7lkvuXFTp5HYPzfpjfpp7hBGH7SUa4gNmcBOVdbFcvp
 PW+4jFahck9unQbPJpa4llmdK2YBPQx0GiMXWbI7vX08aWPWDgBhYTyxgrKukRcVVLMepyqKj
 aojTBjDXG0dg3Niccv6l8f486Kn7/RZtmSUH7d5FJP2tC5ImyBX7pZBC9FcYWEbZ238iCZtZC
 uAd7eigCY51pD4WGQmrbTeog9v/7EAPmbrmHhP3S8TVuTwA8gHiytcCBAAYHqPLoKKoI=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 02/03/2022 à 22:27, Mark Cave-Ayland a écrit :
> This function is to be used to execute the current PDMA callback rather than
> dereferencing the ESPState pdma_cb function pointer directly.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/scsi/esp.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


