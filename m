Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F2D434DE6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:35:29 +0200 (CEST)
Received: from localhost ([::1]:40004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCgh-0001Wz-Oa
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdCUb-0001Gr-JI
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:22:58 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:55987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdCUZ-0003NU-OF
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:22:57 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MVe1U-1mDvre0T3s-00RVpb; Wed, 20 Oct 2021 16:22:54 +0200
Message-ID: <9fd63485-6085-5c49-da68-9adda16a64fd@vivier.eu>
Date: Wed, 20 Oct 2021 16:22:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] q800: drop 8-bit graphic_depth check for Apple 21 inch
 display
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211020141810.7875-1-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211020141810.7875-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yp72Y0Q8pHXN6rlkSZCkxU/tM49UehE8s6lqh7MkUHtOXRlykIW
 noNOL7F+Cp/sxiqaMoTQ3zk0v5ZArG6wJgshxLbEvLf2UFCgrjEgj7FG0c8Bpj6LiPHCMM5
 Ebi1SNrnvt4nCmo9EgcisW+05eFBCAikjwz11EPOs0XsDbkfNdcDBUNTyzFVXwFaCYA0NjE
 TnCOXfHrXPY/zAqH/YTXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vz2VLx/iReQ=:bSyTHDBm7qXATLT7flHE85
 om8xiu/IlCdB/75OEOcuhImxWR7DY3So3QUX/2dkax9lBe/7mrxBlbmrmIuwaGAtBE8HspAAf
 pOf4+qflEAtEva6q/ZtwZtiPDiiyaxq8ftSBXAmM7Y0ot/1RBI+g2abz0myMDxXQHvHPCpJVt
 a26siYP/dXxqcuBhzICCDz6vI/QBApEO1n9MyBKEuf+rtyPbVIyZ5wdj1Rz5FSpo7cpbYFFjg
 no9Q9rPKquTsDVPLj3Wfjs8cqpfyd+5FDZyreSph/iQwELEgBERsSdtkarHsRNEbLSXbRu3F8
 wrf7UOzQlb6jWZZzuD8Q1easVPc4HWNg+q2kLweKtIi1cZ8G8y9o9YLwsY6rWleEzZgAH73Lk
 6Df+rzVpxsz/sAxt/UvI6xwmgzYQkaErekiamsk90gfBoXrtLAvAODXKajK2BQ5mLfb+tPPgF
 iPal6DfpFXtVcmCm6BTKFWbOnZDw3HK9oBI1wIZi9LMVZy+AnFY6zucxkFlU03LBRT5UzWp7g
 JHkNGiMYK+RSXqnWIsICD31Op2bwjHC8M7+B1vdmJ8xtE6hDsGSwzOmM/4G6MFW9Vhgqaplv2
 hH1SsC5vjNvPg/Xw8hRva5Zh/gbqxfHLwHhnF4CV7AE+8s7Uzjivss+9i878DIOitdYaO+Akn
 pG1UH+IdQoG+qkMiNNSz+UNtbN9ISx983g2PRLo4TIYDsYgak7Zo5xQ5HDj5gqO84woA=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.267,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 20/10/2021 à 16:18, Mark Cave-Ayland a écrit :
> The graphic_depth check is no longer required since commit df8abbbadf ("macfb:
> add common monitor modes supported by the MacOS toolbox ROM") which introduced
> code in macfb_common_realize() to only allow the resolutions/depths provided in
> macfb_mode_table to be specified for each display type.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: df8abbbadf ("macfb: add common monitor modes supported by the MacOS toolbox ROM")
> ---
>   hw/m68k/q800.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index fd4855047e..da2736c82c 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -425,7 +425,7 @@ static void q800_init(MachineState *machine)
>       qdev_prop_set_uint32(dev, "width", graphic_width);
>       qdev_prop_set_uint32(dev, "height", graphic_height);
>       qdev_prop_set_uint8(dev, "depth", graphic_depth);
> -    if (graphic_width == 1152 && graphic_height == 870 && graphic_depth == 8) {
> +    if (graphic_width == 1152 && graphic_height == 870) {
>           qdev_prop_set_uint8(dev, "display", MACFB_DISPLAY_APPLE_21_COLOR);
>       } else {
>           qdev_prop_set_uint8(dev, "display", MACFB_DISPLAY_VGA);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

