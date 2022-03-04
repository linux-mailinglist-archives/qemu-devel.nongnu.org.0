Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB254CD27C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:36:34 +0100 (CET)
Received: from localhost ([::1]:57004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5IX-00060A-R3
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:36:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ5Ax-0006of-SI
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:28:43 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:59911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ5Av-00007Z-GX
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:28:43 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MmU5P-1nq24Y2ew5-00iSK9; Fri, 04 Mar 2022 11:28:35 +0100
Message-ID: <90809b8f-d91a-2e4c-e7f9-99a300c4d8e6@vivier.eu>
Date: Fri, 4 Mar 2022 11:28:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 06/10] esp: introduce esp_set_pdma_cb() function
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, qemu-devel@nongnu.org
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-7-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220302212752.6922-7-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vhEh+MjMCTT4debRqVXDe8Wvo2ay2NsPk2eBo1qjlqcb9btivN6
 5m1IW6yiytRR2H9MXe1TyWf114lup4N5fjm+VMAblYF8kXp1P/KUDYbTO5YN5xUqYFOOh93
 v2Dw1AeHMze80j4JgMKnzaYPaEL0KnNO+WFPWfVkWWogJQ5VQb9j8Cz1vK8odYIZGGIkUE9
 SgiAW7GBMcF2j6gszpAFQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uUk0er0wtMY=:EFXzqtYfZ01vK9UTfHpdZ5
 KvktNlWwcH2e5lUga3QIrjyXuqGEQOifLiXKBDe4xxh55T2IV7rtmHMpYq0rotxrmygAhwV2o
 BocDqGHrxP6OAEPYsfEn3pD1SWpuofO6NB2tweofPKJ3OP0kTQxl3cMTrlAE1Ug7Alq3GXCSF
 QIQCfD80nfsFUSb85JcBQk22864jX0Y2ilWoCLKEu7+pjc/UBcqAklsA2Kl2r/zZrFQR+nAcr
 NlMXNFDgn8UHwDzMwhEsSCJ5hAO3nDjXctb6l/AaL0qgCGxd0GbguSWC/EmIxFLz0zyuMNiZg
 dz67MmnK4sCYf9+1fEcHeg8O1mZdBCGqbRURv9xGRDDx1olAC2eZmvuLWFwrpDrO8ZbCDqwZH
 /r8E5ck5hD+9jG0lnpgm5kSWF5XO767dOIsmAu/qqRtp4jH9aN/pq/VNEuQJZumUyb+fZ0ALB
 twY/RB0AMNnlIGKSN4Dk1q1MmJlQeJxWuSI3xfzRZttv/BuGKus2ccl72IsUvGdStdL6zw4Y8
 /3Rp3FT0CVAxfdg4KFkHHWMv+0hOZrPgrVWm80/9QNzAfIAj4KmfKRIaK+JtV2TTYphI5yVBf
 L0mXfn6ri3ZVICp/l+Xl6AgmVca+Ogq4OUXn9VQAmqAlhPpdIHQ7zs9vsiqu7g7K8sqhSm72e
 TXqKRKqwmeRGy/tJ7Kc6QVfYiAMcLAWPPYN+gDeh5yXt2O6jVtumXPl7Y2vxBWYawfJQ=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
> This function is to be used to set the current PDMA callback rather than
> accessing the ESPState pdma_cb function pointer directly.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/scsi/esp.c | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

