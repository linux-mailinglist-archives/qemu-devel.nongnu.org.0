Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA1E586CBA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 16:21:29 +0200 (CEST)
Received: from localhost ([::1]:49566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIWIS-0005Bw-OE
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 10:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIWDC-0001sT-Jx; Mon, 01 Aug 2022 10:16:02 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:43526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIWDB-00023h-22; Mon, 01 Aug 2022 10:16:02 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-31f56c42ab5so110158897b3.10; 
 Mon, 01 Aug 2022 07:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=T0pa0PbXy5LmRaGTYaNgv/4TXJdUpUTR80xCnwD6kf0=;
 b=WLuFogG9r1ceXhgj0Xe55GJp2sSW4Mf9Jw5RNL4yLvBXKx0e6/ivIj5+pcNc9AU+v3
 68XmMOxT2VwVjDXtczIqHVC8Q3jV+mnFiZT46WNFtnsNjqayOTPOJ9dPw9g9Ehg+zgEb
 bKpUJculn6ySl5UnKtmj8fCPktagh54ZCqxlCck3/eMjX7OvixyVtULcr/OPmlfORPIg
 jaa7W4ZiGR0rVpSFGLuOdDBBny7aYsmvIdvI7fvTZjVq2tJTTdFi9nn4isHIoRIiwu4A
 mEquPHzCVPUIfb20YSwR1Jxd5ZbwdXtYYNlEItJgjWRkx4Pqg/WsGr90TM4XdnjQqpZ5
 UXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=T0pa0PbXy5LmRaGTYaNgv/4TXJdUpUTR80xCnwD6kf0=;
 b=3fJAJCoM2qW1e0hfXjhRQQbZJG0fAalW6g5bGdyyKYttCn8XG5w9BFnv/uPP5aZKMv
 UVBExBeBWoqlom9Sy203LdJCsxyecdzUQpyqeY1SJwyB2fdkyfuCWsikm+XhDLK1JZxd
 s4YWSXgppPbxsERpSkYlZzMSxkbQU2hti+eDbXL1UIOTnMJYlLpONk8ux3nFIJPORpmX
 UQc2OsZoA9luna/U6XOUqKBeXZWPw2cTzEpBFrygKaaubr4UJ1AQP5lcXHU5G9xxxAs1
 grVzgzgvIwhve3fvER4T45477b8KhLgTQvI8+JyS827gwNGDYukEjoukHTxB56Eg8ibz
 u/BQ==
X-Gm-Message-State: ACgBeo0kh4ODEpTuQ8VdtN6dX1PfvuIpSv0uxzf011NnAoDuV5wjaxar
 30G+H1doQzOCcsQd4+rXlBAHIjevUppyVd1j5nA=
X-Google-Smtp-Source: AA6agR4WjwxpDcNDgZMR2toKfk6SBtsyhA8/idq1q5UtB7sZXgc13h/YGfE0KM0WKBk/W4z5RdRJSGESXBrQk4U4WiM=
X-Received: by 2002:a81:8746:0:b0:31d:c5a6:ad8f with SMTP id
 x67-20020a818746000000b0031dc5a6ad8fmr13276607ywf.206.1659363358102; Mon, 01
 Aug 2022 07:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220801013148.10334-1-faithilikerun@gmail.com>
In-Reply-To: <20220801013148.10334-1-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 1 Aug 2022 10:15:46 -0400
Message-ID: <CAJSP0QW7xgWkaa7AECxJ=O+T7mCwh1bMXqsXv7rqUm0VBOh=CA@mail.gmail.com>
Subject: Re: [RFC v5 01/11] include: add zoned device structs
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, damien.lemoal@opensource.wdc.com, 
 dmitry.fomichev@wdc.com, hare@suse.de, stefanha@redhat.com, mst@redhat.com, 
 armbru@redhat.com, qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, 
 hreitz@redhat.com, eblake@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Sun, 31 Jul 2022 at 21:32, Sam Li <faithilikerun@gmail.com> wrote:
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  include/block/block-common.h | 43 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/include/block/block-common.h b/include/block/block-common.h
> index fdb7306e78..c9d28b1c51 100644
> --- a/include/block/block-common.h
> +++ b/include/block/block-common.h
> @@ -49,6 +49,49 @@ typedef struct BlockDriver BlockDriver;
>  typedef struct BdrvChild BdrvChild;
>  typedef struct BdrvChildClass BdrvChildClass;
>
> +typedef enum BlockZoneOp {
> +    BLK_ZO_OPEN,
> +    BLK_ZO_CLOSE,
> +    BLK_ZO_FINISH,
> +    BLK_ZO_RESET,
> +} BlockZoneOp;
> +
> +typedef enum BlockZoneModel {
> +    BLK_Z_NONE = 0x0, /* Regular block device */
> +    BLK_Z_HM = 0x1, /* Host-aware zoned block device */
> +    BLK_Z_HA = 0x2, /* Host-managed zoned block device */

The HM and HA comments are swapped.

> +} BlockZoneModel;
> +
> +typedef enum BlockZoneCondition {
> +    BLK_ZS_NOT_WP = 0x0,
> +    BLK_ZS_EMPTY = 0x1,
> +    BLK_ZS_IOPEN = 0x2,
> +    BLK_ZS_EOPEN = 0x3,
> +    BLK_ZS_CLOSED = 0x4,
> +    BLK_ZS_RDONLY = 0xD,
> +    BLK_ZS_FULL = 0xE,
> +    BLK_ZS_OFFLINE = 0xF,
> +} BlockZoneCondition;
> +
> +typedef enum BlockZoneType {
> +    BLK_ZT_CONV = 0x1,

/* Conventional random writes supported */

> +    BLK_ZT_SWR = 0x2,

/* Sequential writes required */

> +    BLK_ZT_SWP = 0x3,

/* Sequential writes preferred */

> +} BlockZoneType;
> +
> +/*
> + * Zone descriptor data structure.
> + * Provide information on a zone with all position and size values in bytes.

s/Provide/Provides/

Once these items have been addressed feel free to add:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

