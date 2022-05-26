Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C134534F28
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:32:38 +0200 (CEST)
Received: from localhost ([::1]:50470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCfN-0005Ya-PN
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nuCWZ-0005ar-Kp; Thu, 26 May 2022 08:23:31 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:34257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nuCW5-0002Vy-Dd; Thu, 26 May 2022 08:23:31 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MfqCF-1nN3Y42qzJ-00gI6j; Thu, 26 May 2022 14:22:53 +0200
Message-ID: <22e8b57d-7532-0b97-ea57-8a9bdc4e0750@vivier.eu>
Date: Thu, 26 May 2022 14:22:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 10/11] q800: add default vendor and product information
 for scsi-hd devices
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
 <20220424164935.7339-11-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220424164935.7339-11-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Qz/F7AVzNL7Iy18DX1FP7ZdNS6YvNZbUXj6AZimdKM9dZj5OZDS
 aAe+l3tMhxO8fWZuEfaAcRsp6Fw8qrG1FuSvngpxJil6EBqICSFWhDZr7+cx7DD2nx1PA7/
 rgJKdPaVHoc8wD26jYCtkPpJjMDQuWT/QMA24E9oWmqxckZgqJMaDMscAc11vgFiSLCa8fp
 acmA+AZwb/ZUu/Ojwb5DA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IR+PVPw0XoE=:3/O9tbZ4vuyhDsob2xI8TJ
 s5pax+I58yK5EoHrvOCY8QjUbtloK7hQdJ4Yxbu1E+wpMLtxzudxQHnEjLGQBCDyYWH3AKlHT
 +FslYQbD6WQkCcGOIbKprMMRdzDETBUiMxgxWAANP+4gPCikeXHk3D/lZdeXRukJLaIPXyPDh
 WIyb1RU5PnHgHv48VuHhNTvPeoMVDqRGTMnRwSI8NZFFs//GVRex5bYnyDjURyp+ghfSqZo8d
 WExPtwi1MdSOybeSnmwZSgwYLTN/0srC0UZxm41hRE2a9LEHWCjb2J1LT0Tf3UlPg0kTNLFLd
 8ou9pQucJroubmhkebiCynULzTjS68o/qv4bW3hHSEkKwjG85fZU318YfYC1WnHFkNxd8CCyJ
 nNwKCxUCZaK/nPITS8ovi9QEgJPfzJSBFM6wnphZbmFLJKP1YwVX81ewo+003W9O2jtTqHSYc
 OvWmvtF+bpX4te4jCCdwIuDthPOgLu0FeGnNVxriK7iV0e6lIv6U6aRH1bB3Jctlg4tNkjEM+
 Cl11PsjASOD4jeI7dNOlIeUkDwvyl4Si3Ojy49RdIhhBRkgKfgIINeaSQKaQY0wXqPJ1Nyfqn
 mAdz36QucZPHWvYFybLDMT+YRe/7u7l/raj9mrJypOnMT7OjRQo/utAIjEyAOVPxNh9jJO1Bf
 lMyfDhq0KNZjgYE/Xp16tfgjjInoVp3uWH36vyAjmShdaJKYBtVaUZylmmUI2sZF1LFeY7CbF
 2iSAow2w2pvsi7sJuf3245yek3KqxLqu53rqsg==
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
> The Apple HD SC Setup program uses a SCSI INQUIRY command to check that any SCSI
> hard disks detected match a whitelist of vendors and products before allowing
> the "Initialise" button to prepare an empty disk.
> 
> Add known-good default vendor and product information using the existing
> compat_prop mechanism so the user doesn't have to use long command lines to set
> the qdev properties manually.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/m68k/q800.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index f27ed01785..abb549f8d8 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -688,6 +688,9 @@ static void q800_init(MachineState *machine)
>   
>   static GlobalProperty hw_compat_q800[] = {
>       { "scsi-hd", "quirk_mode_page_apple_vendor", "on"},
> +    { "scsi-hd", "vendor", " SEAGATE" },
> +    { "scsi-hd", "product", "          ST225N" },
> +    { "scsi-hd", "ver", "1.0 " },
>       { "scsi-cd", "quirk_mode_sense_rom_force_dbd", "on"},
>   };
>   static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

