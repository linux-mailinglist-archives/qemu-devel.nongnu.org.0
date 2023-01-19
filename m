Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478A9672FCB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 04:56:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIM1q-0004ka-AC; Wed, 18 Jan 2023 22:55:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1pIM1o-0004kK-9m
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 22:55:52 -0500
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1pIM1m-0005fl-LH
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 22:55:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674100550; x=1705636550;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=dFO8kEe7bD0ePjbMqYnxO5WXokIqdv+46yU9giY5H2Y=;
 b=DnTZpTNhCzje5ibQD48qMVKyWFoBggSJDKRAczaPmPlKyKQt6BAq34Az
 w5Egxt9zetQmwEa350MMjOezDAhCHpG1vrMBJ19p7YTjdCg2jxHJ24vx2
 Pvp4Si3lRjVoEogiAPPdpN0HUq02QT/jcc4zFj3HUc5/cfjHgDnvD5a7F
 chLHM1yX04eNnZIkCKIu5dM/L37Bh3lYk5OBL3h6evWJ0pnB01djOR2BA
 wX9GIv06x8Lg1T5CAzbh53fokGa9qyWwUYbIDexln0gRxHGk3E67nkuku
 ZMzzHiFspPvCqUTaCtho9KC9YkKeDNqWQjPQCGbhCl74MDwlc2IQMysU+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="387534435"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="387534435"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 19:55:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="653223532"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="653223532"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 18 Jan 2023 19:55:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 19:55:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 19:55:47 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 19:55:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jep2jD3+n6ATfS3UwTBtcUTeGyHWdfUdUcAbAgkd243kcNCbKYl7+cjwcNodh+DN6zZBQ5eEHLiUExzel88rcVUAg2tv9FIpOm4rKf6DoAMNGiRnvEdXfJwjL8tGVJmknUcjo0UP0voiOLSv9JaFbWL4U042HCezALaUhF9shGs7Sry5yQJe7kjOZF3ITqQUc0pmQ8DdaD7X3CC15N5Aj8xYmtsMQBX28Nd/SvrsqDc4xfDNdoCzfoN5G3iOVihUJbG4rShexmbd+8Db1VD645/ZivWGNiEp47OT3MOk7CFQ3A/mSupcZJu1lpJ2UGMb4MjbS3+vYlUl2ArHOw+8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFO8kEe7bD0ePjbMqYnxO5WXokIqdv+46yU9giY5H2Y=;
 b=mVaMuJGAoqXA6JNOD+UdLda6PaGcPK6g1tUfF0x/fFeDH2slA/Mc4cNQJUVq9P3ssgBipeRzUGLDyHDMgC7SwZL9rCTT6TxC5qVtSdG7+JlyxCLlA9fWBXU0SgcuOjHjIf6/g9nOokzr99rVPrxfSvi6Xp5742KuapC/faCy9ewhja1iew2zTcUmnCszpc4NYPk+BAPVeTuBDrEL6AkOAcNvJYeS6GLlw2uRuPCyxV7k8QG9Pdguk4Q7akVnL9EZ1Kg//BSILpgOa/f67vueeAqYm2M4x8DC4t9dwNdBkl8P6qhuEcsHIRq6A/bheZ1M3aphPyYUOj5EA7cw39jqzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4090.namprd11.prod.outlook.com (2603:10b6:5:195::10)
 by IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 03:55:45 +0000
Received: from DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3]) by DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3%5]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 03:55:45 +0000
From: "Wang, Wenchao" <wenchao.wang@intel.com>
To: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
CC: qemu-devel <qemu-devel@nongnu.org>
Subject: Recall: Announcement of aboring HAXM maintenance
Thread-Topic: Announcement of aboring HAXM maintenance
Thread-Index: AQHZK7noGOEq+rn1REOHnBidCR84dg==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Thu, 19 Jan 2023 03:55:44 +0000
Message-ID: <DM6PR11MB4090F7A25FD02914BC3788BA87C49@DM6PR11MB4090.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4090:EE_|IA1PR11MB7775:EE_
x-ms-office365-filtering-correlation-id: af379f86-9fbe-46ce-9315-08daf9d10aa6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UoJ4sdNCosz57mPMpw48lpZZrRnsCgwoIe18VLxyWFv8H6Fk2zIHBCM3P43Zugh9CnkT2mITfZ4Kz/TE68gx65AKfZKz0u2/2JvBDeFfxIo6IWG1oPKIL3zKXdFKKzWxctjEL24vZopiIgbZtKr0JapjcmQvYDFm5D+vCnAuOV7UXddwKZ8KpbGl6RhJlysarr1VOv98Dp5TqmLPq/FAZoxjvjwBoGUohD3Gsj5PXLb2oOkx9LOvdhH3+jDlUTF8NZhIWZZtsZuWWp9cz3m20ZRxr2yT+fS+IRRHPaTgjVNaFC78oetYoveVF0YtNzbSBovjUtC0Rq8bxQmfsAPFzpFwBJmBCHlTBVebBVaSEe6zwbGJ21BlOSbSU0GGnQDpwYbud1vgYizzXoJjSTNETygrN++nji10UsKQQ5xiJVCx/F7MzDqAHYqumBwTksQJ8yyTVrRkavG0jCgR8NXRcl48QdMUjCCgUrhKnTowkgroJWRzrpKMjx+/LubnoakBOmxjDyJW9RBDpCvLI7Lgi6tBzW4w7eQ31OwoSmGGCDtxUPVTr5D5L25MUKDFb1LBJtQa6V6eiqocWU89iHmIOlRDoymMOUmSSgkE8BdW88X3TEheYG7jmq5Zwm6IS+KFARxa7rHWf36nJ3MFxM/L5dg2fRmCv5nU1QRU/611xTdOrc059G8MD/5NEHEZyGDtf4M+W9MfkwFbdBrXI322ew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4090.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199015)(86362001)(33656002)(66556008)(186003)(558084003)(26005)(4270600006)(66476007)(4326008)(76116006)(66946007)(41300700001)(64756008)(66446008)(9686003)(8676002)(6506007)(55016003)(2906002)(71200400001)(110136005)(316002)(38100700002)(7696005)(478600001)(38070700005)(122000001)(82960400001)(52536014)(83380400001)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?B62j7iK6W6ZySZS0Xeyvvbu+p40Kp+YImm9aklmZBEGzMwSiGZJqW17tgN?=
 =?iso-8859-1?Q?Bf8qGxteXDphog5xDQpPoucUYu8eaGUjUMyyFMkO4eJfKHnqlCzAN+uGjq?=
 =?iso-8859-1?Q?M+nDBEsX4PpjP8YgrpUoonu6fOptTdhCIMGpAyHGaAMWpf8/jeW4GJxO79?=
 =?iso-8859-1?Q?xNI/bVwLb9vPzIpFd9vXgoSVXKRukC2klt+WP1bqJ94OeJCkiTbpWQpZe9?=
 =?iso-8859-1?Q?oYABT3sDUsS7q48iXvtl8H9QiNRAFwTJJHr0Tl2IwFPCM3vxPIoyEGL6GW?=
 =?iso-8859-1?Q?aCevMvcQfePpzSI7+UdVxbNsm8VG3Gar5ki7nB9x0If6oyEZEb6HkouVGJ?=
 =?iso-8859-1?Q?zgpJRcuXl9gd37eosGKSS4+AbIdBc0Xx1iWbZNwhuCd/c/j3k56yZ4WG6h?=
 =?iso-8859-1?Q?yA8rLnCCjWpaDOmqJJvYQmCTPUqYG3cTdZU1GrujyIV0kZSRsXRSAUFo8e?=
 =?iso-8859-1?Q?r2CPy4kC9FkKp/JKhVMc13FdzdFKvyftj1SLY6ntVM/7MnGkkAC2OctdEw?=
 =?iso-8859-1?Q?eQtH0ENwuLcT0splE9jNIEYvDg3t0x29bCkiao49EapuEojlDoMiTZqe6Z?=
 =?iso-8859-1?Q?NyuK3OkA9ipMeAPKsOI1+lqhEe2QJgMWvxgrinBI0nsC7krzbzakjhDNzg?=
 =?iso-8859-1?Q?Gah1TQjxSJZGlG+h0PsCfpG0Ggwebu7jn2WEuXDtDgXO1fBmDJIoBzqFJB?=
 =?iso-8859-1?Q?i/K1iodto0ZG1kZcX4coeU5LwKg4JKeNWdJXIY1mVSspx5dtCQMWkiML3s?=
 =?iso-8859-1?Q?Mh1U729mR/o8vhjXMyxdWzpvvZoxsazEyMMPn4zUAqr7jUNBdtF8iWh6X5?=
 =?iso-8859-1?Q?qsifvmru5Q82ij2vujUqpY+9RtKt2C+8ySJQmvsiYoOGFdPZvFYWVVC+OI?=
 =?iso-8859-1?Q?ONPq6Qea9jP6p9xX3neh7Pl1fpMLjX/sQ4IXOlWWpgLU2/M/XORz8m4F5w?=
 =?iso-8859-1?Q?RQZwBCo7j7S2C7LIfx8q30zQNAF9DMARcNmu5f7RFGv23DKE9FfVdMQulh?=
 =?iso-8859-1?Q?mYwLrLi6ywFs/qDcB9GAg2Yw8YJtZWEu0kPfOrdpgzzpyaR42V9XiVmfcA?=
 =?iso-8859-1?Q?8COjLDNrTwBOiC92QKQ+RZxPE/zVqLec623NCmyWynkiZR7Nz6So6dJOcL?=
 =?iso-8859-1?Q?hmH6NRrXyjih814xKvzKWMl6noe32rHe1MGPFCRS1B3P75SBs4wZhQvw73?=
 =?iso-8859-1?Q?meAsaQGRnEWyp63UZXP47NuIElf9VXqlAE+/smV/8MYVVNaQjvBu9Cv18S?=
 =?iso-8859-1?Q?Rt8z7XZJeTZZshUfHdgHe6Gi3eO7Pw9pTj47ep0bkWVIn7Ru8mOFyx18wF?=
 =?iso-8859-1?Q?9La5+d+2UbHKKLk+2WWIX/LUITPejdUU29AtHXMIi6KO1+B+Axy3gr151s?=
 =?iso-8859-1?Q?h04U3d30ktCJoU0Py6hDeN5s4+lcURDOIcvXnt52cHQXGTut/4+UE+715U?=
 =?iso-8859-1?Q?LDJZUbABHS7G0+uwG0sp/5jaK13W4qJjenDapjuJHs+9u89tel11fctziy?=
 =?iso-8859-1?Q?w3lHwbczVxqucRqnDBrWDsv+QtUNJ/63ayYYIGrC7wh+HA707NhTWOOcMy?=
 =?iso-8859-1?Q?+E3rlu7btdvY3NxtbqLvzKyu1wTWBPsrCewqAfRUdc8S7cvuR7AuY4vp+4?=
 =?iso-8859-1?Q?3wLJKUyzK4E7DHKErEOUA8KBmWFtszzMbi?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4090.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af379f86-9fbe-46ce-9315-08daf9d10aa6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 03:55:44.7891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t8rZFY95eoo+VV2DFzH71CuLCZlFUJqOZSSnT/D/6OtBqcti9Wd5QYwTdxLttwFfnrIJbV0biKZcaveuAfN0+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7775
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=wenchao.wang@intel.com; helo=mga06.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Wang, Wenchao would like to recall the message, "Announcement of aboring HA=
XM maintenance".=

