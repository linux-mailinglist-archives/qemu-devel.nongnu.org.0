Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADCC3486F4
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 03:33:50 +0100 (CET)
Received: from localhost ([::1]:41742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPFoj-0006DX-6K
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 22:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lPFnk-0005mm-ML
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:32:48 -0400
Received: from mga01.intel.com ([192.55.52.88]:53215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lPFng-000178-Pv
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:32:47 -0400
IronPort-SDR: Muy3z4q2a4/ve4OSfwUt2kD30QjDSygbu6hk+pce8lwZJ3e1W6Hq4ulVYH2pVDnY2Lx81WptPR
 ASTjXrRn6i7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="210960909"
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="210960909"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 19:32:25 -0700
IronPort-SDR: 5ozfS19MssG4hvRsxhpa2pN4FGh3aE4Y1apvHSOjvMOMt2Qo8qO5nWtZyfWz5qwS6FuK0t2Vae
 8iTDvenFwa8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="415756781"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga008.jf.intel.com with ESMTP; 24 Mar 2021 19:32:25 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 24 Mar 2021 19:32:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 24 Mar 2021 19:32:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 24 Mar 2021 19:32:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Valj8ET+9rLAjK2mH7zmXLI1vSq/ILK4HNqSCu2Qx3N84PbIdyB4yjQVM4MbP1QOtQl/X1U2x+32Acltr8pn0WeNx0gdg3SS5ySwX9TClNeCkHwMcchJ5HFWzFmwacnmFKjTU3+UJyzMo23yUuRiEoUvyL19xh1CHCDIwXvPPT/pAdSx5ojFBT4atHaaGQRcjmWeW/xsAVJXU7bEsBQyECymzpkn+3lg74fmsRuqzj1ycqGyxmnoz4k+yu7otoFsAcQ3LzSOaUr8tpMJXZJXphWgaXYgKPFG39GrIQ5OrvcCqty5+z2RhfMMsh+tTAmJ4LHZ6TmnqQRx9Q6RVE61aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PpBA2Act8s02JVRY/lLpMhnfQfQx7Eevd3EGvHC5r8=;
 b=i/ZZZQtLyxQggjmXRvp3Xa3aNFFdPUmrPfOTof0wfX0XO/Vvc4714pAi3ub8lx5mSXPuqIveDuwCHAv3xG+RJRQT2JzOZAchkOQXGA0bMDOuq8Dfa5JmVUFOIu9VnsgHfSFCv10LGb3f4GrjX+CBd1xdB5eTod+qCQ8XOyCxPJgFvdc3u5fhfb0ZXRZ1vAkFmz0S+FItxwzjLEnuZxEIpBFzAXdSFM4qZin+dw+n02UWFnkdL3XxZPUwOcPfVZyDEbUhRrcrTnD6+2qAAZQEFg8k8X87gEywHIuKZg/DbVafzF3HM6/edb/ioDzBUqGqpdeYLIMYB2mYBfbX1D+69w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PpBA2Act8s02JVRY/lLpMhnfQfQx7Eevd3EGvHC5r8=;
 b=j7/lncDhdCorFziQl7CIdFzj1Ho0hGWzu7ZE/xO8UroSDaeI0RXXqWZCMeZ0wSWZQ/udSE452Z4Zymps9JYeEqDlPR8Ip4ztojk63u1xeJzxjm6WVrV3OOjMZ2SlpfhnvqxozLesU3sV+LuuTHKq0f/vGbNTa1P/ARS7FmuPQaA=
Received: from SN6PR11MB3103.namprd11.prod.outlook.com (2603:10b6:805:d7::13)
 by SA0PR11MB4687.namprd11.prod.outlook.com (2603:10b6:806:96::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.25; Thu, 25 Mar
 2021 02:32:22 +0000
Received: from SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::c9c2:8157:5bef:9b2]) by SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::c9c2:8157:5bef:9b2%6]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 02:32:22 +0000
From: "Rao, Lei" <lei.rao@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: RE: [PATCH v3 07/10] Reset the auto-converge counter at every
 checkpoint.
Thread-Topic: [PATCH v3 07/10] Reset the auto-converge counter at every
 checkpoint.
Thread-Index: AQHXHHBSIs7jQRfsMUmC2e1t6PblJ6qTX9OAgACkWcA=
Date: Thu, 25 Mar 2021 02:32:22 +0000
Message-ID: <SN6PR11MB3103131B241CEDD2D741CA10FD629@SN6PR11MB3103.namprd11.prod.outlook.com>
References: <1616123268-89517-1-git-send-email-lei.rao@intel.com>
 <1616123268-89517-8-git-send-email-lei.rao@intel.com>
 <YFtraQXvrrEXwZvQ@work-vm>
In-Reply-To: <YFtraQXvrrEXwZvQ@work-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.55]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 413ddf5e-a9f6-476a-e280-08d8ef36387e
x-ms-traffictypediagnostic: SA0PR11MB4687:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB4687BB2FD96E5860E5E62C99FD629@SA0PR11MB4687.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 16zUeDmPOzGbWdK249V26S7cogJv1ZagjNyVt9NX5RWwzKS3UlMDjP/GQ1pHFnE8kodWHIEriXv1J7JRYA2ZQAelbhP665ZQePSeFIzBe7mhOvBHdNxsNtIyuJhtqPz/ESOViHnXHXpZTPXC76/iOIXiCS9oxOEZU//8ZkgFIiOKQOfOjnx9sECTxT/i9WRy9XFhRJQtNfqqPqmyQtOH+18+qKJtPOCEJSt1AeVQO9tiLLElIlnmDYmXzuu6G+hPeOUFef8U1wkusNTUepQD5YN1L8cju5hJgoTnt+pHLatynAmwz/Ff3QrffcB8Ju/gRxD732Gc9Psy+seIne8jeo0rwEss6BSPKaKLxzeepILGcweZTKn4sWHED3rjtTrumQH4Pn6jmeCsVCg9jcM1a+bvWt3ZeGkaNdrIv0Lyn2recFHrSValvOpyN/ILVoKPK3lFOFrxrSziC/Ja25QD8b1kIdz7veQzRyXjgwjUotc2A/GAybguHtQiKGxzt7MdE9HEc9vbj1/Jfhf9dPnTQ2a8FaxZ6jpGNv+ueStItNr7lJ2AZCvh+mmWlB9WOHCjz44eIjcctDTobh898hHkUZpGN2LSM4gGhvy8O22HL5HnyCHxMPxvLicoKNwIIcjxQLh2Ge+uLCuK/1K+tuLPLA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3103.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(366004)(396003)(136003)(26005)(64756008)(55016002)(66946007)(66446008)(6916009)(71200400001)(52536014)(4326008)(8936002)(9686003)(2906002)(8676002)(66476007)(186003)(5660300002)(76116006)(66556008)(316002)(53546011)(86362001)(38100700001)(6506007)(7696005)(83380400001)(33656002)(478600001)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?BrHfB/w53XEi43kLqDsccfZprWncj0gIZ1zqfMJoBJbIdPgyAkYDmtE4jsTE?=
 =?us-ascii?Q?PfBxz/glW8Fg5uhC0TSQALQqwROdwATs3Jf65jpHSBEDeWi09dxQaQukwHQV?=
 =?us-ascii?Q?ibh29mvJ76GFbWiRoIGjEZ4SNSMF7Lzm2o1WnMVUzJ8PLQ3gO8AJjlHPmHAe?=
 =?us-ascii?Q?zAE8/kK+EI5xgNzd0BCnKSY+b0uK6vyEMM1f4iUBPIEdAFbMr7RkI0p+zaRy?=
 =?us-ascii?Q?6xnhId1jVeFrcCmpc8zctARGROj6VUbBjzXbpq+7NkaxulK4nHfLQSyeTrzB?=
 =?us-ascii?Q?bQGLmastcQ1RfdsnJOkALPNm+SNsqt91/V7DLDndRdOMjpRlG2b7YvqHsB8x?=
 =?us-ascii?Q?aVBYCxhX6rHBryAS2rRbGW64jDYiuiVWlT0mtLnoWh0waZxukQ6CuDyTRThS?=
 =?us-ascii?Q?ugrTBLTMWkba48rd87CaR+asSBGP+e6yN5wFgfIdVaiednu6wRvR2+D5GzhS?=
 =?us-ascii?Q?4eTgWx2C2bNcSR9T/XZGoqKt1CSmaMhA+PJVQCCinJCML26jssXVqexHYq3q?=
 =?us-ascii?Q?ByqAGbsqlmLiXYRQ7UVVw6fFSn1wegYXS5RdEQ5jAlTMSBkKxHWy4TAEWxTj?=
 =?us-ascii?Q?Sp59kV+S8On9Ao4Tpm8Ff4CXgd+PWkNnqWCcOF6BL+mIpbvWfH3n4Bl2j28U?=
 =?us-ascii?Q?F2Njwjxckyr4APRGce9Vhroihj57AUK+4Jj5oIIvy9EArAFk0bBzhjfyNRts?=
 =?us-ascii?Q?a0ChKU9az50vG7zhEkqSR8C6OJlQhUK9ysOT78T8BrFRt43VCBmOvvn7aWLn?=
 =?us-ascii?Q?CsnBXw0Hvv3ZM5927By/cbL5xKstA+m7Ansh4k4qlfcbL2phPsxHreb87e8a?=
 =?us-ascii?Q?MKUelrVeXuw6kHe78Ftkcv5iT1th/+Sq7zrXl8xcBoKzbz07nYtoer+FYg8Y?=
 =?us-ascii?Q?o7uJBsPTcHLPN+alCNWzx5Su2uE+RDYmiPBAUDmrxP8ns0k83S2pBTT4EGtY?=
 =?us-ascii?Q?15UzfHJ4Jk/a4cWfkUoRz04O+QpkqtZWEG5GxY1vPvy688d/B663gcZ8n+vF?=
 =?us-ascii?Q?yQfe3UJHdVntbhsYCj+S29r40icD4AcdfOWaCGq7vAitx1LtUopZ2T+7gtlp?=
 =?us-ascii?Q?LO7xkg9JE1se+dO2hr8dH0e4CsDbHlz0VeerIHaxOEbW4HmN71CCL/wPpmOp?=
 =?us-ascii?Q?RU3a70Gd71N0MV2Yi+/H6nOfg9mkQqQJw3wlBcMXj5d13YPP7j79M5Nd8hX9?=
 =?us-ascii?Q?+Dqp69crPXX9FN1a0vEyhfg0iradTg1DYCDtg0LI6LHGIJv7RlhpD9cJo7jR?=
 =?us-ascii?Q?qb1WX1s7DwIKTBZ9ry+MMpURN1a/IWU+aIdUkclXwcMDrb8HkXOXU6VfOVoi?=
 =?us-ascii?Q?MxM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3103.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 413ddf5e-a9f6-476a-e280-08d8ef36387e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 02:32:22.6887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3DS4d4gDId95aUynm0jK7E1gTxL0pXbjzbNc19Lm+nGK4jDT+1DGoa0+2nv/TTbkLyjyvOkTgypkDpocQ+dOAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4687
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=lei.rao@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "lukasstraub2@web.de" <lukasstraub2@web.de>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After testing, I think you are right.
Will remove the cpu_throttle_stop() in V4.

Thanks,
Lei.

-----Original Message-----
From: Dr. David Alan Gilbert <dgilbert@redhat.com>=20
Sent: Thursday, March 25, 2021 12:40 AM
To: Rao, Lei <lei.rao@intel.com>
Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com; jasowang@=
redhat.com; quintela@redhat.com; pbonzini@redhat.com; lukasstraub2@web.de; =
qemu-devel@nongnu.org
Subject: Re: [PATCH v3 07/10] Reset the auto-converge counter at every chec=
kpoint.

* leirao (lei.rao@intel.com) wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> if we don't reset the auto-converge counter, it will continue to run=20
> with COLO running, and eventually the system will hang due to the CPU=20
> throttle reaching DEFAULT_MIGRATE_MAX_CPU_THROTTLE.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> ---
>  migration/colo.c |  4 ++++
>  migration/ram.c  | 10 ++++++++++
>  migration/ram.h  |  1 +
>  3 files changed, 15 insertions(+)
>=20
> diff --git a/migration/colo.c b/migration/colo.c index=20
> 1aaf316..723ffb8 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -459,6 +459,10 @@ static int colo_do_checkpoint_transaction(MigrationS=
tate *s,
>      if (ret < 0) {
>          goto out;
>      }
> +
> +    if (migrate_auto_converge()) {
> +        mig_throttle_counter_reset();
> +    }
>      /*
>       * Only save VM's live state, which not including device state.
>       * TODO: We may need a timeout mechanism to prevent COLO process=20
> diff --git a/migration/ram.c b/migration/ram.c index 72143da..e795a8d=20
> 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -652,6 +652,16 @@ static void mig_throttle_guest_down(uint64_t bytes_d=
irty_period,
>      }
>  }
> =20
> +void mig_throttle_counter_reset(void) {
> +    RAMState *rs =3D ram_state;
> +
> +    rs->time_last_bitmap_sync =3D qemu_clock_get_ms(QEMU_CLOCK_REALTIME)=
;
> +    rs->num_dirty_pages_period =3D 0;
> +    rs->bytes_xfer_prev =3D ram_counters.transferred;
> +    cpu_throttle_stop();

I think this is right, so:

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

however, do you really need the cpu_throttle_stop?  Shouldn't the previous =
iteration have called that in migration_iteration_finish() ?

Dave

> +}
> +
>  /**
>   * xbzrle_cache_zero_page: insert a zero page in the XBZRLE cache
>   *
> diff --git a/migration/ram.h b/migration/ram.h index 6378bb3..3f78175=20
> 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -50,6 +50,7 @@ bool ramblock_is_ignored(RAMBlock *block);  int=20
> xbzrle_cache_resize(uint64_t new_size, Error **errp);  uint64_t=20
> ram_bytes_remaining(void);  uint64_t ram_bytes_total(void);
> +void mig_throttle_counter_reset(void);
> =20
>  uint64_t ram_pagesize_summary(void);
>  int ram_save_queue_pages(const char *rbname, ram_addr_t start,=20
> ram_addr_t len);
> --
> 1.8.3.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


