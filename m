Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F7C582921
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 16:55:57 +0200 (CEST)
Received: from localhost ([::1]:46486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGiS4-0007LZ-OV
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 10:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGiPO-000429-5o; Wed, 27 Jul 2022 10:53:10 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:45012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGiPL-0008I7-Kc; Wed, 27 Jul 2022 10:53:08 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31f661b3f89so16670837b3.11; 
 Wed, 27 Jul 2022 07:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rddNDXD6w2TYwWkvfuo0TUEXGpS/Fy1rxTu9AAgWLoM=;
 b=JguEZU6RQ3XXHJazC1HLC3eIr37drib8ou5YCcBGnR3qKc5UnYLSjVflotN+E8u2Ex
 2bIEIE4uGY9mkTz+pKBczWpDFrgSs1ai4hSlXiIviYYbZzb85sKQ9MyRpP1xdG3sLvXb
 TAuvoU6fygPLaxyXqawQDTGKhwM9nmgovE275Ys2n5a/O4gAm7EQ8RYpUqOJF7ZoNSlR
 hKwkL5pGyBSnMbMD3VOs1hVatzU35DwHr61NTOk9FfeKORUr0pH/P7WKdEZ82xAbLJG3
 jDLO4wWlz+DfcQoe7vqQGLgxT2o51MV4P58HQRm0CmNnza1DxCPyS+xqNAX3sZkTWKRN
 IWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rddNDXD6w2TYwWkvfuo0TUEXGpS/Fy1rxTu9AAgWLoM=;
 b=RkDHxa9GeJqJjdtwN99FkHp4RXDHEVLk44nPrSAv1poeMKt6ECrQEV+AW+cEA8gUNL
 JPxkV345etGR7XS4vseMEEJHSVAtck0iD0s5Qq8dnb3u+FRq4vFAggayWdMCXKbT4M4y
 Ef/M9aOxMDVZgpLieFiLZi/4CC++BSH0sTUmum5HDHYrjOtidJL95MNAVkeAJJZq+ot4
 mnX01HFBOSbUQqJMwQnuULolqYBwakf2QJV3PIYVd53waK1vtq0hLBqpCSsAZQ6tekc7
 URp9inntkhVzyXjn80rQ+8SbiIaFu+p6M5I04TNZWweDI+Ni4LtlkgwEyoZff+S7EhZn
 9vfg==
X-Gm-Message-State: AJIora9HUdt+sEN+sxTTs03OW/Cof/OTMfEtEs0rSsnKiTNXWQX4R9c+
 ZyoL9pTSeqKkDJKNra2cmG+7sRXLHJKdyMEktfg=
X-Google-Smtp-Source: AGRyM1sXEcYxWU0lnE5WtR4QJtDaEV5FZwqllM0aRCTXHpYxSiykM1SXyK/SEC94KESzjWv+vraYtwGgPuVFfqb75pI=
X-Received: by 2002:a81:91d6:0:b0:322:13f1:5da3 with SMTP id
 i205-20020a8191d6000000b0032213f15da3mr157229ywg.156.1658933586139; Wed, 27
 Jul 2022 07:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-9-faithilikerun@gmail.com>
In-Reply-To: <20220712021345.8530-9-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 27 Jul 2022 10:52:54 -0400
Message-ID: <CAJSP0QVh-JWfhu__rxpeBBGO8w5nw9k8PkP5bJ9ocFUMk2Mj5A@mail.gmail.com>
Subject: Re: [RFC v4 8/9] include: add support for zoned block devices
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu block <qemu-block@nongnu.org>, 
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1134.google.com
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

On Mon, 11 Jul 2022 at 22:21, Sam Li <faithilikerun@gmail.com> wrote:
>
> This is the virtio_blk.h header file from Dmitry's "virtio-blk: add
> support for zoned block devices" patch. It introduces
> virtio_blk_zoned_characteristics struct from Dmitry's virtio-blk zoned
> storage spec.
>
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  include/standard-headers/linux/virtio_blk.h | 157 ++++++++++++++++++--
>  1 file changed, 141 insertions(+), 16 deletions(-)
>
> diff --git a/include/standard-headers/linux/virtio_blk.h b/include/standard-headers/linux/virtio_blk.h
> index 2dcc90826a..f07fbe1b9b 100644
> --- a/include/standard-headers/linux/virtio_blk.h
> +++ b/include/standard-headers/linux/virtio_blk.h
> @@ -25,10 +25,10 @@
>   * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
>   * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
>   * SUCH DAMAGE. */
> -#include "standard-headers/linux/types.h"
> -#include "standard-headers/linux/virtio_ids.h"
> -#include "standard-headers/linux/virtio_config.h"
> -#include "standard-headers/linux/virtio_types.h"
> +#include <linux/types.h>
> +#include <linux/virtio_ids.h>
> +#include <linux/virtio_config.h>
> +#include <linux/virtio_types.h>

This file can't be copied from Linux verbatim. It needs to be
converted using scripts/update-linux-headers.sh.

Stefan

