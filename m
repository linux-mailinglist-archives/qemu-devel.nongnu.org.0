Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1AA2F7E26
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:28:03 +0100 (CET)
Received: from localhost ([::1]:52802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Q54-0007zl-DA
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:28:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l0PUi-0005Ym-Bw
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:50:30 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:53485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l0PUe-0006fA-Re
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:50:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Klpk2VSxnBp+iY3WJ+xwx1nffILUY7cB1RkcSTgbNm8=; b=MwX+U4DMn3xyFa5Ax3UbT3ixXd
 ebMsDBeEfMQRuC+b+gIac5PB6qNQwIvDwXgVGlRFOlQraryfNv1iOlil5o6AnbOnkzOPVBZs6Avgf
 XyNZJl7gmK6Hj09sljFnzboNyAKOfQv3VumhtHWLenkTA30yDIDD9BPi7qA0ZG26cITcEC/eNzbSp
 8e6rvJDiZKDywnJuw+eJyxp0O8eq84S36yFH14IIed7NHvMjDpO6P2RSQ62drtR/AE2rR/5bvqRu1
 TMlC3W06rEPYjJxxNj+MwAoSHLwdHrV+iZiqDxBRAjtS+1Yr46BPaddttaQGquZXhOMFRPrBs7z72
 EkIxHmtLAEmhApgucWlOviWv+pmFzJeduyCt8WfNVqsjBkKEo44qIJZd2rJnMU0UGfBXOiMMjYhHr
 mvMA/eK10WH5U5W2h5U9t705wYA5XiyXBpxed1l4n2W5KynCBRO9Tlb/VM5PG+oQ32pwkf3PYrMQU
 FkNQhvIeyKg8f244TwbSAjZYaT1KjjwvpMClUZb2CdDzKutWHgib7v/M5e5UU/WVsXMf1VR/iNSXe
 Cb73zgODzkQybjlautaf8wXLvzmbM+MjlvW0LZIq8LPL+Dac8KpAx2df1JBVHWWXbRshMBywaE0ai
 IRfeV59ASfIGVbc63/L+bs6+yoiINKwAynl5isvuU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] MAINTAINERS: Update 9pfs tree URL
Date: Fri, 15 Jan 2021 14:50:17 +0100
Message-ID: <2867808.c4G3KLOmWt@silver>
In-Reply-To: <161071814430.152031.14540382419012818908.stgit@bahia.lan>
References: <161071814430.152031.14540382419012818908.stgit@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 15. Januar 2021 14:42:24 CET Greg Kurz wrote:
> I've already moved my repositories to gitlab for extra CI coverage,
> and I won't use the ones at github anymore.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

> ---
>  MAINTAINERS |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cb0656aec3d4..21038d3fdfce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1828,7 +1828,7 @@ X: hw/9pfs/xen-9p*
>  F: fsdev/
>  F: docs/interop/virtfs-proxy-helper.rst
>  F: tests/qtest/virtio-9p-test.c
> -T: git https://github.com/gkurz/qemu.git 9p-next
> +T: git https://gitlab.com/gkurz/qemu.git 9p-next
> 
>  virtio-blk
>  M: Stefan Hajnoczi <stefanha@redhat.com>

Best regards,
Christian Schoenebeck



