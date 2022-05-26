Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64E7534F5D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:39:25 +0200 (CEST)
Received: from localhost ([::1]:57208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuClw-0002dy-QI
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nuCZj-0000vA-BU; Thu, 26 May 2022 08:26:52 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:45833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nuCZg-0003MM-R6; Thu, 26 May 2022 08:26:46 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mq2Wi-1nXjye1WDK-00nBfG; Thu, 26 May 2022 14:26:38 +0200
Message-ID: <2eb7f54f-c40b-2d5b-812e-15efcf6384ec@vivier.eu>
Date: Thu, 26 May 2022 14:26:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 02/11] scsi-disk: add new quirks bitmap to SCSIDiskState
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
 <20220424164935.7339-3-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220424164935.7339-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8COAc2EZekC4ZqHgi5G9aI9ozCy1WPZ4jNQxuU2cvYj0rM/TcIC
 BurtwJX+ISIrC6H2zy3w69nqPuGqzu/siCCvSONVjzYLy/8hp/zl6Mm9DjqAD62fSPhdvM/
 RjYhhg3dEnmosu7YW5HDye6sbj0KJKqUt0yf75VqQWBN1xgKei43fmo6FBwQrm+5FKwSkeU
 0Ectaxu0HWCnmQqmi+GGQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Syv1plTeJjQ=:UEsOY1TuByyWWeZ76ePT9b
 1G9+E+aoyhWxWS8Ag04XuWjP7FJCkUyMKNSIgIt/pKV2w6X0MJ3EIKQvjlJUoFxvSaL7YnFgo
 Zh0dvo4vStKLrFEfKbaD89CJ1eijnYgiPLLYpynGXrHkIz2eDcUyv8xp0qnG5n1CTbwaO7dm2
 xijP6RyMe/OF/ofGLR8bVgARDuPpbkBoX2FExXMzqQPno9sLJxM12N4qFUaHM6odPgrHVpcVh
 mBvcqfY7kvrjSgKQSNyUgQ+Ye7hp0Z3gRvGG8iQW4fUN+tR5c3ZDzQbcx7FrgXB3AlOd8iX/C
 JwJ8MGbiLfdOPsMgMKYvZ/zt9JvuR2Fm+KAect7scyy9HVydAfg2Na3H6jryfyNDZBGVq/Q0z
 QuUx45fqUSsZmeqakk9n0Djgcjlg1sEf2rW4lWdy5sQkGQEbP16agmXshvzrFjO1lkRDhf++8
 nbOHE91HjIrElOHJw5lbYZgB76hA6ZbYrRruUQYkBIzMnv5cv8crfrH9qJFO1yUTE5p+uuD1P
 Wjwbj8tb4z3FWduKcMBueG0sTEhDUqBx2RIsHQ62EvbD+mUMm4Ng63MVCXDIxn6OamN2oXbPm
 O02Qz9cF1Fkqls+xz3r0ubF432+UFZeyhWTHFzyPzI9nGGJciZHAGw7H+jjmJoZPIxLvXtK3T
 rL7oZzC6DgPAgybpPSOXTBtyaXBFad8Mr8dzCJt23Q/QujGPEF5glVrhtdiuQgH66tEQZN1zq
 vYR7+aiXTqYITS6DyVnxpLuMYUago8EJIc+Zqw==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 24/04/2022 à 18:49, Mark Cave-Ayland a écrit :
> Since the MacOS SCSI implementation is quite old (and Apple added some firmware
> customisations to their drives for m68k Macs) there is need to add a mechanism
> to correctly handle Apple-specific quirks.
> 
> Add a new quirks bitmap to SCSIDiskState that can be used to enable these
> features as required.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/scsi/scsi-disk.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index 090679f3b5..d89cdd4e4a 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -94,6 +94,7 @@ struct SCSIDiskState {
>       uint16_t port_index;
>       uint64_t max_unmap_size;
>       uint64_t max_io_size;
> +    uint32_t quirks;
>       QEMUBH *bh;
>       char *version;
>       char *serial;

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

