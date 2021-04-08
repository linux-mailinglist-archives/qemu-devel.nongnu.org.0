Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E801357E6B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 10:51:13 +0200 (CEST)
Received: from localhost ([::1]:41242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUQNa-0003Pl-7R
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 04:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lUQLM-0002Xs-Uf
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:48:52 -0400
Received: from mga17.intel.com ([192.55.52.151]:49863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lUQLE-0000yd-Ky
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:48:52 -0400
IronPort-SDR: PdNp9r3JTOruEOufyWuPt8GADlad4qnslExb2xsuxVZdlbXZwknS5Z1QVb84VmRR/bDzgdM34m
 dOwsUCZpzBrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="173573835"
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="173573835"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 01:48:37 -0700
IronPort-SDR: gXBAdlwymzL4xtAwgZr0CQYFU9wuADOnErRs5KAylDja8LbXTXkcVhIbYedyfdrQ7KdevPBOvF
 zdg/33cmBuMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="422144891"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga008.jf.intel.com with ESMTP; 08 Apr 2021 01:48:36 -0700
Received: from shsmsx604.ccr.corp.intel.com (10.109.6.214) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 01:48:35 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX604.ccr.corp.intel.com (10.109.6.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 16:48:34 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Thu, 8 Apr 2021 16:48:33 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Rao, Lei" <lei.rao@intel.com>, "lizhijian@cn.fujitsu.com"
 <lizhijian@cn.fujitsu.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "lukasstraub2@web.de" <lukasstraub2@web.de>
Subject: RE: [PATCH v5 06/10] Add the function of colo_compare_cleanup
Thread-Topic: [PATCH v5 06/10] Add the function of colo_compare_cleanup
Thread-Index: AQHXJs6K36+J1rVfTEq3HFzc2UzMCKqqWefg
Date: Thu, 8 Apr 2021 08:48:33 +0000
Message-ID: <50a163a2045b4099a2a8b22732f58cf4@intel.com>
References: <1617263249-54501-1-git-send-email-lei.rao@intel.com>
 <1617263249-54501-7-git-send-email-lei.rao@intel.com>
In-Reply-To: <1617263249-54501-7-git-send-email-lei.rao@intel.com>
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
Received-SPF: pass client-ip=192.55.52.151; envelope-from=chen.zhang@intel.com;
 helo=mga17.intel.com
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
> Subject: [PATCH v5 06/10] Add the function of colo_compare_cleanup
>=20
> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> This patch fixes the following:
>     #0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/ra=
ise.c:50
>     #1  0x00007f6ae4559859 in __GI_abort () at abort.c:79
>     #2  0x0000559aaa386720 in error_exit (err=3D16, msg=3D0x559aaa5973d0
> <__func__.16227> "qemu_mutex_destroy") at util/qemu-thread-posix.c:36
>     #3  0x0000559aaa3868c5 in qemu_mutex_destroy (mutex=3D0x559aabffe828)
> at util/qemu-thread-posix.c:69
>     #4  0x0000559aaa2f93a8 in char_finalize (obj=3D0x559aabffe800) at
> chardev/char.c:285
>     #5  0x0000559aaa23318a in object_deinit (obj=3D0x559aabffe800,
> type=3D0x559aabfd7d20) at qom/object.c:606
>     #6  0x0000559aaa2331b8 in object_deinit (obj=3D0x559aabffe800,
> type=3D0x559aabfd9060) at qom/object.c:610
>     #7  0x0000559aaa233200 in object_finalize (data=3D0x559aabffe800) at
> qom/object.c:620
>     #8  0x0000559aaa234202 in object_unref (obj=3D0x559aabffe800) at
> qom/object.c:1074
>     #9  0x0000559aaa2356b6 in object_finalize_child_property
> (obj=3D0x559aac0dac10, name=3D0x559aac778760 "compare0-0",
> opaque=3D0x559aabffe800) at qom/object.c:1584
>     #10 0x0000559aaa232f70 in object_property_del_all (obj=3D0x559aac0dac=
10)
> at qom/object.c:557
>     #11 0x0000559aaa2331ed in object_finalize (data=3D0x559aac0dac10) at
> qom/object.c:619
>     #12 0x0000559aaa234202 in object_unref (obj=3D0x559aac0dac10) at
> qom/object.c:1074
>     #13 0x0000559aaa2356b6 in object_finalize_child_property
> (obj=3D0x559aac0c75c0, name=3D0x559aac0dadc0 "chardevs",
> opaque=3D0x559aac0dac10) at qom/object.c:1584
>     #14 0x0000559aaa233071 in object_property_del_child
> (obj=3D0x559aac0c75c0, child=3D0x559aac0dac10, errp=3D0x0) at qom/object.=
c:580
>     #15 0x0000559aaa233155 in object_unparent (obj=3D0x559aac0dac10) at
> qom/object.c:599
>     #16 0x0000559aaa2fb721 in qemu_chr_cleanup () at chardev/char.c:1159
>     #17 0x0000559aa9f9b110 in main (argc=3D54, argv=3D0x7ffeb62fa998,
> envp=3D0x7ffeb62fab50) at vl.c:4539
>=20
> When chardev is cleaned up, chr_write_lock needs to be destroyed. But the
> colo-compare module is not cleaned up normally before it when the guest
> poweroff. It is holding chr_write_lock at this time. This will cause qemu
> crash.So we add the function of colo_compare_cleanup() before
> qemu_chr_cleanup() to fix the bug.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

> ---
>  net/colo-compare.c | 10 ++++++++++
>  net/colo-compare.h |  1 +
>  net/net.c          |  4 ++++
>  3 files changed, 15 insertions(+)
>=20
> diff --git a/net/colo-compare.c b/net/colo-compare.c index c142c08..5b538=
f4
> 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -1402,6 +1402,16 @@ static void colo_compare_init(Object *obj)
>                               compare_set_vnet_hdr);  }
>=20
> +void colo_compare_cleanup(void)
> +{
> +    CompareState *tmp =3D NULL;
> +    CompareState *n =3D NULL;
> +
> +    QTAILQ_FOREACH_SAFE(tmp, &net_compares, next, n) {
> +        object_unparent(OBJECT(tmp));
> +    }
> +}
> +
>  static void colo_compare_finalize(Object *obj)  {
>      CompareState *s =3D COLO_COMPARE(obj); diff --git a/net/colo-compare=
.h
> b/net/colo-compare.h index 22ddd51..b055270 100644
> --- a/net/colo-compare.h
> +++ b/net/colo-compare.h
> @@ -20,5 +20,6 @@
>  void colo_notify_compares_event(void *opaque, int event, Error **errp);
> void colo_compare_register_notifier(Notifier *notify);  void
> colo_compare_unregister_notifier(Notifier *notify);
> +void colo_compare_cleanup(void);
>=20
>  #endif /* QEMU_COLO_COMPARE_H */
> diff --git a/net/net.c b/net/net.c
> index 725a4e1..8fcb2e7 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -53,6 +53,7 @@
>  #include "sysemu/sysemu.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/sysemu.h"
> +#include "net/colo-compare.h"
>  #include "net/filter.h"
>  #include "qapi/string-output-visitor.h"
>  #include "qapi/hmp-output-visitor.h"
> @@ -1463,6 +1464,9 @@ void net_cleanup(void)  {
>      NetClientState *nc;
>=20
> +    /*cleanup colo compare module for COLO*/
> +    colo_compare_cleanup();
> +
>      /* We may del multiple entries during qemu_del_net_client(),
>       * so QTAILQ_FOREACH_SAFE() is also not safe here.
>       */
> --
> 1.8.3.1


