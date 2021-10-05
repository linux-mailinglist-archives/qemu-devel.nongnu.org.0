Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E854234BB
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 02:02:20 +0200 (CEST)
Received: from localhost ([::1]:32786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXuO3-0000pn-OV
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 20:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1mXuLI-0007B4-7x; Tue, 05 Oct 2021 19:59:28 -0400
Received: from hera.aquilenet.fr ([185.233.100.1]:47568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1mXuLG-0002hM-QJ; Tue, 05 Oct 2021 19:59:28 -0400
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id B98CC456;
 Wed,  6 Oct 2021 01:59:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z6E9GaH7h1DD; Wed,  6 Oct 2021 01:59:24 +0200 (CEST)
Received: from begin (acaen-652-1-186-147.w86-215.abo.wanadoo.fr
 [86.215.106.147])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id E864F417;
 Wed,  6 Oct 2021 01:59:23 +0200 (CEST)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@gnu.org>) id 1mXuJ8-00GfHx-0F;
 Wed, 06 Oct 2021 01:57:14 +0200
Date: Wed, 6 Oct 2021 01:57:13 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] ide: Cap LBA28 capacity announcement to 2^28-1
Message-ID: <20211005235713.iodzsdcfazo6gtme@begin>
References: <20210824104344.3878849-1-samuel.thibault@ens-lyon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210824104344.3878849-1-samuel.thibault@ens-lyon.org>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: B98CC456
X-Spamd-Result: default: False [-2.50 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 HAS_ORG_HEADER(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MID_RHS_NOT_FQDN(0.50)[]; BAYES_HAM(-3.00)[100.00%]
Received-SPF: softfail client-ip=185.233.100.1;
 envelope-from=samuel.thibault@gnu.org; helo=hera.aquilenet.fr
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: damien@zamaudio.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping?

Samuel Thibault, le mar. 24 août 2021 12:43:44 +0200, a ecrit:
> The LBA28 capacity (at offsets 60/61 of identification) is supposed to
> express the maximum size supported by LBA28 commands. If the device is
> larger than this, we have to cap it to 2^28-1.
> 
> At least NetBSD happens to be using this value to determine whether to use
> LBA28 or LBA48 for its commands, using LBA28 for sectors that don't need
> LBA48. This commit thus fixes NetBSD access to disks larger than 128GiB.
> 
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> ---
>  hw/ide/core.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index fd69ca3167..e28f8aad61 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -98,8 +98,12 @@ static void put_le16(uint16_t *p, unsigned int v)
>  static void ide_identify_size(IDEState *s)
>  {
>      uint16_t *p = (uint16_t *)s->identify_data;
> -    put_le16(p + 60, s->nb_sectors);
> -    put_le16(p + 61, s->nb_sectors >> 16);
> +    int64_t nb_sectors_lba28 = s->nb_sectors;
> +    if (nb_sectors_lba28 >= 1 << 28) {
> +        nb_sectors_lba28 = (1 << 28) - 1;
> +    }
> +    put_le16(p + 60, nb_sectors_lba28);
> +    put_le16(p + 61, nb_sectors_lba28 >> 16);
>      put_le16(p + 100, s->nb_sectors);
>      put_le16(p + 101, s->nb_sectors >> 16);
>      put_le16(p + 102, s->nb_sectors >> 32);
> -- 
> 2.32.0
> 

