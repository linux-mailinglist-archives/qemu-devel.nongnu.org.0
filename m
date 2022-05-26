Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8C6534F88
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:44:14 +0200 (CEST)
Received: from localhost ([::1]:36042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCqb-00005M-Ka
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nuCal-0001rw-2s; Thu, 26 May 2022 08:27:51 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:51807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nuCaj-0003Sq-GR; Thu, 26 May 2022 08:27:50 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MNssA-1oDvG01ldo-00ODCZ; Thu, 26 May 2022 14:22:28 +0200
Message-ID: <fd921d54-aaf0-8d11-6609-fab80433d814@vivier.eu>
Date: Thu, 26 May 2022 14:22:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 11/11] q800: add default vendor and product information
 for scsi-cd devices
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
 <20220424164935.7339-12-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220424164935.7339-12-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9EQrnF8CVV/kAFM2JDZ0QN7/flCzYQ9cMM61i1hdzJdfaNlcJPM
 xpsXI5ZIyGxJ3GfF3VnvKbZWJn+24IqMG4Zay2Bj4Uoi52m4h13aLgnU4k2lsFndNQfA71j
 pOhfcNxVTQZRODNLz/Hfd1DY/9u6kwwi2N3/XDuogVz8bBqSJtuKRtG39C505aH45rBl8W6
 v8QzBerkgCfnikhWi7RAA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JUsyUMEcxnA=:lBKZ9nQ5QOcRJAmjjRAdFT
 wIOHDFkNpHMbzU30BTcbKPEXmF2DPFC7zon5LBcqHebyV8X4OKh4A5gAE6rH6Lp7QggVVLqfN
 Ebwg03gbgnQwAm3rtWciSaNM1Pq7UEtiPwhVsS46DmsiBE/8dU+rQsNtJSssfBDkPmhbb+VpK
 Od6QuvPHhZFhvJ2k94fBHmpKFHRgn/RWEtydiI+IGPryJlsabUhT2e9/9LMmcn8g8H8JiuwQF
 Ysx0UtbrwrNKqACQOwqTT/T/2yNt0uA4Pesowvs7xz7LN5PEcL1nJY+YXzFk0zz0py2IDep1r
 Tu8NKYw3v7KkO+bwXqRI/okDphH+OBfAwcU4kqkUTUEjiXDqadXHgTe9NjLqK+2L+7S/pw0W8
 rVWkNmz4uT5iY7a4SHpNMEyruY7t0hi+31vQgalXNVaFbqZiIIfYu+Livz9Ld9QknkK2oZ2hK
 +FoLO1vvyagGcepfB9oWv9Xo6eT01jHxewDJg3AhJ+59nC407x59FPtRah+EohaeONGLMXtId
 7uMbitQecWVgtESdo8HMQywywrWc1tQKwtuU83Qyb6uCRbD1YL8DZnFSvMUEnrV2vU+Lj8fPK
 +Rx7yAWzPVqZLOmJcXswzRB30jLw6ttnna7HqoUT4QB4BF2EtNrGtm4fYoxS8H5YDYXMtXSar
 IizpEuN9jv65DhLFd1IXUzxChI75Ah6z+KHZS7wsYU2RvhHgngX3C/LX19r67HIPoOJ623Ek3
 m8IuJp6VswXVDQsTjK3UtZQ93EyR9RI5V70GEQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Le 24/04/2022 à 18:49, Mark Cave-Ayland a écrit :
> The MacOS CDROM driver uses a SCSI INQUIRY command to check that any SCSI CDROMs
> detected match a whitelist of vendors and products before adding them to the
> list of available devices.
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
> index abb549f8d8..8b34776c8e 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -692,6 +692,9 @@ static GlobalProperty hw_compat_q800[] = {
>       { "scsi-hd", "product", "          ST225N" },
>       { "scsi-hd", "ver", "1.0 " },
>       { "scsi-cd", "quirk_mode_sense_rom_force_dbd", "on"},
> +    { "scsi-cd", "vendor", "MATSHITA" },
> +    { "scsi-cd", "product", "CD-ROM CR-8005" },
> +    { "scsi-cd", "ver", "1.0k" },
>   };
>   static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);
>   

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

