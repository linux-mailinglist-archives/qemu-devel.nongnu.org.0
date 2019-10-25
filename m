Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF32DE482D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 12:09:50 +0200 (CEST)
Received: from localhost ([::1]:58240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNwXU-0003yo-N0
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 06:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60114)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <baiyaowei@cmss.chinamobile.com>) id 1iNwHY-0007Ey-HG
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 05:53:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <baiyaowei@cmss.chinamobile.com>) id 1iNwHW-0001vP-6P
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 05:53:20 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:10072)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <baiyaowei@cmss.chinamobile.com>)
 id 1iNwHM-0001mZ-PL; Fri, 25 Oct 2019 05:53:10 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by
 rmmx-syy-dmz-app12-12012 (RichMail) with SMTP id 2eec5db2c5f0487-60880;
 Fri, 25 Oct 2019 17:52:48 +0800 (CST)
X-RM-TRANSID: 2eec5db2c5f0487-60880
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost (unknown[112.25.65.41])
 by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee65db2c5ee910-bff0d;
 Fri, 25 Oct 2019 17:52:48 +0800 (CST)
X-RM-TRANSID: 2ee65db2c5ee910-bff0d
Date: Fri, 25 Oct 2019 17:53:08 +0800
From: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
To: pbonzini@redhat.com, fam@euphon.net, dillaman@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com
Subject: Re: [PATCH 3/4] hw/scsi: add SCSI COMPARE_AND_WRITE support
Message-ID: <20191025095308.GA28031@byw>
References: <1571996163-27688-1-git-send-email-baiyaowei@cmss.chinamobile.com>
 <1571996163-27688-4-git-send-email-baiyaowei@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571996163-27688-4-git-send-email-baiyaowei@cmss.chinamobile.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.81
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
Reply-To: baiyaowei@cmss.chinamobile.com
Cc: baiyaowei@cmss.chinamobile.com, yangjun@cmss.chinamobile.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 25, 2019 at 05:36:01PM +0800, Yaowei Bai wrote:
>  
> diff --git a/include/tcmu/tcmu.h b/include/tcmu/tcmu.h
> new file mode 100644
> index 0000000..656a545
> --- /dev/null
> +++ b/include/tcmu/tcmu.h
> @@ -0,0 +1,14 @@
> +#ifndef QEMU_TCMU_H
> +#define QEMU_TCMU_H
> +
> +#include "qemu-common.h"
> +
> +typedef struct TCMUExport TCMUExport;
> +extern QemuOptsList qemu_tcmu_export_opts;
> +
> +void qemu_tcmu_stop(void);
> +void qemu_tcmu_start(const char *subtype, Error **errp);
> +TCMUExport *tcmu_export_new(BlockBackend *blk, bool writable, Error **errp);
> +int export_init_func(void *opaque, QemuOpts *all_opts, Error **errp);
> +
> +#endif

Please ignore this odd part.

> -- 
> 1.8.3.1
> 



