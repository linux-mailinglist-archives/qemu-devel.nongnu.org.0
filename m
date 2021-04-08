Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9457E357BD1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 07:26:58 +0200 (CEST)
Received: from localhost ([::1]:50840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUNBw-0001TK-I4
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 01:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lUNB0-00012R-BB
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 01:25:58 -0400
Received: from mga07.intel.com ([134.134.136.100]:33444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lUNAy-0004yJ-GD
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 01:25:58 -0400
IronPort-SDR: McsClf81PnHgRjaMHKQFoTtPXcIF2QE8MtX+Ihh/a1SBho4nuzeJmCHJUgS21McOfkeNpWUVmk
 ZiK4WNVGwU9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="257447710"
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="257447710"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 22:25:54 -0700
IronPort-SDR: T1IeTe+ThPR+5A9+p5pQ8h7q/BO8PLtHM8EN9/pjdhmaiC6pXR5t1W3ejYuNmFNuMbKRdYr0fp
 ROwjrxeqlrWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="419024561"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga007.jf.intel.com with ESMTP; 07 Apr 2021 22:25:53 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 7 Apr 2021 22:25:53 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX601.ccr.corp.intel.com (10.109.6.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 13:25:51 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Thu, 8 Apr 2021 13:25:51 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Rao, Lei" <lei.rao@intel.com>, "lizhijian@cn.fujitsu.com"
 <lizhijian@cn.fujitsu.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "lukasstraub2@web.de" <lukasstraub2@web.de>
Subject: RE: [PATCH v5 04/10] Remove migrate_set_block_enabled in checkpoint
Thread-Topic: [PATCH v5 04/10] Remove migrate_set_block_enabled in checkpoint
Thread-Index: AQHXJs6Gg35Q2j3fHU6bcTkhfg7Xw6qqIR7Q
Date: Thu, 8 Apr 2021 05:25:51 +0000
Message-ID: <87f2b35dd47145728d4003f0bb52aa0b@intel.com>
References: <1617263249-54501-1-git-send-email-lei.rao@intel.com>
 <1617263249-54501-5-git-send-email-lei.rao@intel.com>
In-Reply-To: <1617263249-54501-5-git-send-email-lei.rao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=chen.zhang@intel.com; helo=mga07.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Rao, Lei <lei.rao@intel.com>
> Sent: Thursday, April 1, 2021 3:47 PM
> To: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com;
> jasowang@redhat.com; quintela@redhat.com; dgilbert@redhat.com;
> pbonzini@redhat.com; lukasstraub2@web.de
> Cc: qemu-devel@nongnu.org; Rao, Lei <lei.rao@intel.com>
> Subject: [PATCH v5 04/10] Remove migrate_set_block_enabled in
> checkpoint
>=20
> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> We can detect disk migration in migrate_prepare, if disk migration is ena=
bled
> in COLO mode, we can directly report an error.and there is no need to
> disable block migration at every checkpoint.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

> ---
>  migration/colo.c      | 6 ------
>  migration/migration.c | 4 ++++
>  2 files changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/migration/colo.c b/migration/colo.c index de27662..1aaf316
> 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -435,12 +435,6 @@ static int
> colo_do_checkpoint_transaction(MigrationState *s,
>      if (failover_get_state() !=3D FAILOVER_STATUS_NONE) {
>          goto out;
>      }
> -
> -    /* Disable block migration */
> -    migrate_set_block_enabled(false, &local_err);
> -    if (local_err) {
> -        goto out;
> -    }
>      qemu_mutex_lock_iothread();
>=20
>  #ifdef CONFIG_REPLICATION
> diff --git a/migration/migration.c b/migration/migration.c index
> ca8b97b..4578f22 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2219,6 +2219,10 @@ static bool migrate_prepare(MigrationState *s,
> bool blk, bool blk_inc,
>      }
>=20
>      if (blk || blk_inc) {
> +        if (migrate_colo_enabled()) {
> +            error_setg(errp, "No disk migration is required in COLO mode=
");
> +            return false;
> +        }
>          if (migrate_use_block() || migrate_use_block_incremental()) {
>              error_setg(errp, "Command options are incompatible with "
>                         "current migration capabilities");
> --
> 1.8.3.1


