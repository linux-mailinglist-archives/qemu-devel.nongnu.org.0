Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B654BDB00
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 17:49:45 +0100 (CET)
Received: from localhost ([::1]:39690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMBsd-0005KT-QI
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 11:49:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haiyue.wang@intel.com>)
 id 1nMBnD-0001A8-FG; Mon, 21 Feb 2022 11:44:07 -0500
Received: from mga03.intel.com ([134.134.136.65]:31973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haiyue.wang@intel.com>)
 id 1nMBn8-0001Ru-23; Mon, 21 Feb 2022 11:44:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645461842; x=1676997842;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o5+Y06F+KnZvvXYo19/Z4HCR8FMlkhe9Z5rSRkBhBsY=;
 b=WpkON9d9IHphY8zu/xQVsdOexQ1MhEb3w0UW9pXP8WvRZZADmSrq/ohz
 yre0P6qthuWT+ApwWqihXQ5e4XhrEEoSLk5+pSwwtr9OGtGEchyU0K9V/
 6Sw0b+gqUTi9XUCgPsvtXT4W1Scy7EdzPdGKaog5PotAe6VrfpFV69llG
 QVJgFt0tDcVYrff8qDU0uJdpsXJlqwkbOpQpqs848gsG/NgFVosrb4XOP
 12e3PvtEvRzORehBw7H8M+2od/R3qOzEOlClfc2nGWzSehp+g8Ftdwnpv
 TDS3Mi7ZNUZSFS4j7G4of8VYD22NcPCoa4d0Z+dNGWBSibiFMqomJUXzZ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="251492059"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="251492059"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 08:43:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="776043787"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 21 Feb 2022 08:43:57 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 21 Feb 2022 08:43:57 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 21 Feb 2022 08:43:57 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 21 Feb 2022 08:43:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBzIS339cFpt6XanzclO+sFbwdLeW3P2QFm9zn3bcqHe47tlWgv81qPrvh2j2IozCks0+exJ2hf7Y+NdIsAU854sBTUgI7atBHnykZIEf4poa0naIlhjOpFscG87gHyNXAgOOsHZYqA/uf9Ifenvk6B34ZpbFH4OKsWqdweoQS28jB6l9/LmvVSsi1p07NaRorAfroC3s93B4nDfENPVK5k0p5KZClMBDhYp7ZmDGQw8pW+MAZTcaBAzJLZ5qXmMV+Bu1ruG5+ESYgqAWjU8nh+Qf0r2bnkXzMd+xVy3px6LMQ+mX9noXUDlh33uiO2KJs96/yx1wd2vwpc2bfKBWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5+Y06F+KnZvvXYo19/Z4HCR8FMlkhe9Z5rSRkBhBsY=;
 b=Oz9t/HecvePXT394ozm33q3+Xay3V9JgrKlxs0V+uXtR4O48rkA6fHKi7sP/0KDwQ9OlgySZuYWfWDFGALJjgH0Iwr0KV6kgkI9g6vuVHn67ZNBG5sVwbn9cmwoY43Ax1sNNRb+8V/XWVgz7KScWPfWNJjC3P5wjHizAyhH/ZIGZkQg6ucjAoxbqHNwxntOAQwwqzLeeqm8tDUoOb1Ri4nqpN3TzaS+ohus1A7jZ4XqErKN1zA7h4WKyMkefQ9rbkYHxQunyU/5r4DHjpj1DcwwvMuhEd+afrL9Bi81xurO9LK82NeE25tQCskviD3ukK6YOXoWCy+K5t3gENBeMZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3495.namprd11.prod.outlook.com (2603:10b6:a03:8a::14)
 by MWHPR1101MB2158.namprd11.prod.outlook.com (2603:10b6:301:59::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.19; Mon, 21 Feb
 2022 16:43:55 +0000
Received: from BYAPR11MB3495.namprd11.prod.outlook.com
 ([fe80::714b:35f9:5767:b39b]) by BYAPR11MB3495.namprd11.prod.outlook.com
 ([fe80::714b:35f9:5767:b39b%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 16:43:55 +0000
From: "Wang, Haiyue" <haiyue.wang@intel.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: RE: [PATCH v1] aio-posix: fix build failure io_uring 2.2
Thread-Topic: [PATCH v1] aio-posix: fix build failure io_uring 2.2
Thread-Index: AQHYJB6CvXKHf4tnkEeqnoJ9ZM38qKyeHY4AgAAeBLA=
Date: Mon, 21 Feb 2022 16:43:55 +0000
Message-ID: <BYAPR11MB34957F574192BB1FCEBAB98DF73A9@BYAPR11MB3495.namprd11.prod.outlook.com>
References: <20220217161627.45351-1-haiyue.wang@intel.com>
 <YhOnmC5EDOK0D5/D@stefanha-x1.localdomain>
In-Reply-To: <YhOnmC5EDOK0D5/D@stefanha-x1.localdomain>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4a68e8a-af46-423f-3b1a-08d9f55959c6
x-ms-traffictypediagnostic: MWHPR1101MB2158:EE_
x-microsoft-antispam-prvs: <MWHPR1101MB215877E472EF552A7F30CDB4F73A9@MWHPR1101MB2158.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q4rmsleids3+DUJvbHiLHvwgOVsleS7uKuSnD1yOVLrGEXH7Rx7+FsRK9W7izmLc7IbUIY18LTmS2NBR3ki+LOtGF805p6ECQJ6NTcE39YZK2Vv2IoFx7dD9MnOexNbS8rL+D5thM3ERg7Q+IjDjr7sUva7T2qkrxoSRrDJge+gPcQCKDrZahxsY9DjLmF5k8i8W67Aj1gWiXQXipYPVD7nfPToRkT0ivWQEBLqiVNXmkCTh3Tt+2FV9bsK5z+3HOPkg75XixxwYeSfIXogBh236I5wq8bY+swnCFyHDJ8SuaVPXK+0+GiIjtOmNFAQsrfCnmmYDa9r7tZm49/+6a8SFc02FXtGHA9hJMSKGxusVVblP+4DLivNDRe7t3sxpGFh070QPHSEf/uvP3TAu8Y7NRxi43sBH4KJLw0p1weUVpb1vU79NX9rzdKbvskK0hTPBODhGvHa/7jHujE1QrSg/1JS96gvMkGtIUoypJpXUmx8aUU0/2IPPWQ0LVLQRThMJ++rZMFkt1R98hTinLFJ5A33C24JwQl1vrLdvqvgPX7wvG3EYsHE8BUA/Pg+mX46AGZSkOfCrdutiHprhP8EOzaPCdvFE0Sljvajw8Y3B6gwRrTnAoH0xE+kjjr2RffIWK5Nws0EQCNiZPuFQZLobQ1dnVzSoM/No7YwrwGAWm8pSUrMBJRB1x7Recji01Bd6KZUxUoU6gsZYNO5LVZepjFhBzXtrxpOEoA7JB17VdWB3EBN19ocBggGCHT6jC5OgZPHZWCPxy3ax0cE6O3jLHbaJANoHL6KDxqWQTSw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3495.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52536014)(5660300002)(2906002)(38100700002)(966005)(508600001)(83380400001)(8936002)(122000001)(71200400001)(82960400001)(38070700005)(53546011)(86362001)(186003)(316002)(26005)(54906003)(33656002)(8676002)(6506007)(64756008)(4326008)(76116006)(66946007)(66556008)(66446008)(9686003)(6916009)(55016003)(66476007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0lXbEVKZ3ROQktRLzBBWXZzd29vR2lpYnhOT3NSdWRBRTFwUmVNeHhvMnBN?=
 =?utf-8?B?VDQ3S1ErK0Vpa3BCMzJtZTJCQmUzWitVckFUcG5mN3ZTa0F2NStKaC9INFVY?=
 =?utf-8?B?aXU2YnpEQ1ZveGlBeExHaXh4REQ2SitsNlZaWmo3UzRKdVRnY3lGN09NdDRy?=
 =?utf-8?B?TzNtNnFEYXdlRlZIdlFBM1R6N1RwQVJrVkdyQjlycDlmWXg1OFllb25oMG95?=
 =?utf-8?B?NzFObitLYnlNV2gybGpDcjVXVDZvb0VvbHdvRWFDSUcyNDZGV0FGL1o4elJS?=
 =?utf-8?B?SDJ3OU9jYzBsR0hpQmo1QjVQR1Y5eDZrNTJoTXAwekprdkgxTElrVncxRlNB?=
 =?utf-8?B?akhlUVQ4VHY1ejU2dEhHYTFSbUZZckF5OWhSNmxPTFY4dmkvUzdpc3FvODFw?=
 =?utf-8?B?TE93Y2FzUXNZTnJrYkZLajlSSHoyNDE0VGFFZ2s4ZmZPNE50TkxZTlZ2TGxV?=
 =?utf-8?B?R2pldytFQk1JK1hTcTR2UTJra2NpTTYrUVNHLzFYZEhTZ0J2ejVIY2FCQWZo?=
 =?utf-8?B?dmE2ZnI0T2dpSFNWSkRNQStCNU9aOFNacnFxanRSYVdLY0hCd0srOC9iWFh5?=
 =?utf-8?B?alVJQnJxWkhOT3o5NjJKbTU3ejMrQ05oSENKaC9vYWxLbjJsVWp0TEdJaGFR?=
 =?utf-8?B?K0FEakNYTFFkeFN6aEdTQmdMempTU3pWZHpNcGpBNWZLM0FyOTdYNk9aMXo1?=
 =?utf-8?B?VVVPUHp1ZG5HQXY3MjNWR2dNS2grVDBMUkRMMkN2OWhxbnNJbkJTNnVXN0p3?=
 =?utf-8?B?TVVwYnBvZDA2QUpsQVVhd1Z2MTM3TkZjdE9TNjJSSy9MeFBib0tvcFR1bXVF?=
 =?utf-8?B?TzJwc0oyVjFaalZGTGVvWEhBQVpObmJSWWFmaGZBb3N1YVRUbWYycmdtY29O?=
 =?utf-8?B?cVord1NDenArSDk1cW1TdmRIU1pQVG9ZOS85YzVLMTdWK0ovTFBKV1EyWk9M?=
 =?utf-8?B?b09hTnQ1bTVlZjlQbFA4alJUVFZQNDB4UFpESUVYVHB2b1FiMVBpekRZN1Bi?=
 =?utf-8?B?cmpDYVhxK2J5MGlBUUYwN25qWVcxYzVqM01rQmhSbmhVMUFGK1FiRCtXTFEx?=
 =?utf-8?B?NHZLUGtha2VBR0N0dngyd202d09WMVNzdHBENXptcWNCVkZFOE5VOUlObWth?=
 =?utf-8?B?Vkt1MUs4OTBKZXNHd2ZBOVBzYU1qYVBVTWZOdUxKM1VRZnJTSnI1RXRqV2JB?=
 =?utf-8?B?bWR4bUdpaTdmMzVwdW5DdkFqQXlOZzcwNjlFZnR6QzQ1S1F5RWk0MXIyMXk4?=
 =?utf-8?B?b1BUTk5udzVYQWZjRlo2VUt4NU9qdjlOZlVtY2J6ZjZrUmpQZlBzaCt4cU9C?=
 =?utf-8?B?OHU0YjVoNHYra2pXNjhidFQzY0t5dFN6Nmo1a0psbTlXOWVpUkNDRGUrUGd1?=
 =?utf-8?B?Y0dnNzQvaytYZHFJODRnRWxMMnE1a3RaRU5HMHNJdXhaK0svZjRmeUxNck53?=
 =?utf-8?B?YS9PcWJVbFRMdUZNRGtiS0FMdDRlMTJhc3BvZ3I0S1BHUS9aR1dacTIzWjBx?=
 =?utf-8?B?a3Z0aCtKL3B0d0RKVE5RbndoRnNxUGtxRXJRWGhEZG9EVHRWSVlmZ0ovV2J6?=
 =?utf-8?B?NHZiaUpvc0E3MEVpU0hHbC9ZU1AzcmQ4WlM4Z1lKYm4rNy84QWpvSHNHM29k?=
 =?utf-8?B?R0N6ZXp5ME5RaWI0bE1Rb1NzcThsT1F3eDhjeU5ZVlNINFlXOXZKN3dibnpB?=
 =?utf-8?B?dzlyaGYzWTBEQXNtWU53QUxBNml5NE9RVDVZQnJaaFVZZ21qNm44aDRZelRF?=
 =?utf-8?B?MVdNYzZCbGpOZHlXcGdQb2swSUZ3U1dtRXRXNjRhcEpVSVY5Y2tmb0ZlZGo2?=
 =?utf-8?B?WE5hS0NoemhlRlpFbWE1Y3cybGN4cnM4aU9xUUxDakFySWp5WFRhTmt3Tkdr?=
 =?utf-8?B?Y0lleEF2QlNJakk0dkdxQmU2RnYxbklxZWhZbFlQRC91WU1waWN4MjVwQmxj?=
 =?utf-8?B?UTM4emI1Sm5TTFoyVFlkaElWTWJ2enQ3QTVTS2JIZjI3RnNnc0ZKeXUwQ3M1?=
 =?utf-8?B?SXo2VzJOVHl5R3dXTWRtc3BzUTlzOUdSUWM5TEQzUzhDb2hQOFhYZjBIS1VB?=
 =?utf-8?B?anNQUUQ0TTFIWWg5YjBidDIzWmx4OGVCejg2a1JpYkwvelR2OFg1Z2lMbFNX?=
 =?utf-8?B?eGdWcFphdFgzR2Y4bk14QmtwaXRYMUxWeUdUYkgvQmJPTTdLVmVUQzY3Slhx?=
 =?utf-8?B?bnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3495.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a68e8a-af46-423f-3b1a-08d9f55959c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2022 16:43:55.5287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DfpTRfTZcD9ORuMjgXQ0qtliYC8L33h8EdvbgPCgmJ2NwXXRAZBcwUGLoyE/HtB0pfZz7eGKIWvfGVeNoCweeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2158
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=haiyue.wang@intel.com; helo=mga03.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "open list:Block I/O path" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVmYW4gSGFqbm9jemkgPHN0
ZWZhbmhhQHJlZGhhdC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgRmVicnVhcnkgMjEsIDIwMjIgMjI6
NTQNCj4gVG86IFdhbmcsIEhhaXl1ZSA8aGFpeXVlLndhbmdAaW50ZWwuY29tPg0KPiBDYzogcWVt
dS1kZXZlbEBub25nbnUub3JnOyBGYW0gWmhlbmcgPGZhbUBldXBob24ubmV0Pjsgb3BlbiBsaXN0
OkJsb2NrIEkvTyBwYXRoIDxxZW11LWJsb2NrQG5vbmdudS5vcmc+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjFdIGFpby1wb3NpeDogZml4IGJ1aWxkIGZhaWx1cmUgaW9fdXJpbmcgMi4yDQo+IA0K
PiBPbiBGcmksIEZlYiAxOCwgMjAyMiBhdCAxMjoxNjoyN0FNICswODAwLCBIYWl5dWUgV2FuZyB3
cm90ZToNCj4gPiBUaGUgaW9fdXJpbmcgZml4ZWQgIkRvbid0IHRydW5jYXRlIGFkZHIgZmllbGRz
IHRvIDMyLWJpdCBvbiAzMi1iaXQiOg0KPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5kay9jZ2l0L2xp
YnVyaW5nL2NvbW1pdC8/aWQ9ZDg0YzI5YjE5ZWQwYjEzMDAwMDYxOWNmZjQwMTQxYmIxZmMzNjE1
Yg0KPiA+DQo+ID4gVGhpcyBsZWFkcyB0byBidWlsZCBmYWlsdXJlOg0KPiA+IC4uL3V0aWwvZmRt
b24taW9fdXJpbmcuYzogSW4gZnVuY3Rpb24g4oCYYWRkX3BvbGxfcmVtb3ZlX3NxZeKAmToNCj4g
PiAuLi91dGlsL2ZkbW9uLWlvX3VyaW5nLmM6MTgyOjM2OiBlcnJvcjogcGFzc2luZyBhcmd1bWVu
dCAyIG9mIOKAmGlvX3VyaW5nX3ByZXBfcG9sbF9yZW1vdmXigJkgbWFrZXMNCj4gaW50ZWdlciBm
cm9tIHBvaW50ZXIgd2l0aG91dCBhIGNhc3QgWy1XZXJyb3I9aW50LWNvbnZlcnNpb25dDQo+ID4g
ICAxODIgfCAgICAgaW9fdXJpbmdfcHJlcF9wb2xsX3JlbW92ZShzcWUsIG5vZGUpOw0KPiA+ICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+DQo+ID4gICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gPiAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQWlvSGFuZGxlciAqDQo+ID4gSW4gZmlsZSBp
bmNsdWRlZCBmcm9tIC9yb290L2lvL3FlbXUvaW5jbHVkZS9ibG9jay9haW8uaDoxOCwNCj4gPiAg
ICAgICAgICAgICAgICAgIGZyb20gLi4vdXRpbC9haW8tcG9zaXguaDoyMCwNCj4gPiAgICAgICAg
ICAgICAgICAgIGZyb20gLi4vdXRpbC9mZG1vbi1pb191cmluZy5jOjQ5Og0KPiA+IC91c3IvaW5j
bHVkZS9saWJ1cmluZy5oOjQxNToxNzogbm90ZTogZXhwZWN0ZWQg4oCYX191NjTigJkge2FrYSDi
gJhsb25nIGxvbmcgdW5zaWduZWQgaW504oCZfSBidXQgYXJndW1lbnQNCj4gaXMgb2YgdHlwZSDi
gJhBaW9IYW5kbGVyICrigJkNCj4gPiAgIDQxNSB8ICAgICAgICAgICBfX3U2NCB1c2VyX2RhdGEp
DQo+ID4gICAgICAgfCAgICAgICAgICAgfn5+fn5+Xn5+fn5+fn5+DQo+ID4gY2MxOiBhbGwgd2Fy
bmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMNCj4gPg0KPiA+IFNvIGNvbnZlcnQgdGhlIHBh
cmFtdGVyIHRvIHJpZ2h0IHR5cGUgYWNjb3JkaW5nIHRvIHRoZSBpb191cmluZyBkZWZpbmUuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBIYWl5dWUgV2FuZyA8aGFpeXVlLndhbmdAaW50ZWwuY29t
Pg0KPiA+IC0tLQ0KPiA+ICB1dGlsL2ZkbW9uLWlvX3VyaW5nLmMgfCA0ICsrKysNCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3V0aWwv
ZmRtb24taW9fdXJpbmcuYyBiL3V0aWwvZmRtb24taW9fdXJpbmcuYw0KPiA+IGluZGV4IDE0NjFk
ZmE0MDcuLmU3ZmViYmYxMWYgMTAwNjQ0DQo+ID4gLS0tIGEvdXRpbC9mZG1vbi1pb191cmluZy5j
DQo+ID4gKysrIGIvdXRpbC9mZG1vbi1pb191cmluZy5jDQo+ID4gQEAgLTE3OSw3ICsxNzksMTEg
QEAgc3RhdGljIHZvaWQgYWRkX3BvbGxfcmVtb3ZlX3NxZShBaW9Db250ZXh0ICpjdHgsIEFpb0hh
bmRsZXIgKm5vZGUpDQo+ID4gIHsNCj4gPiAgICAgIHN0cnVjdCBpb191cmluZ19zcWUgKnNxZSA9
IGdldF9zcWUoY3R4KTsNCj4gPg0KPiA+ICsjaWZkZWYgTElCVVJJTkdfSEFWRV9EQVRBNjQNCj4g
PiArICAgIGlvX3VyaW5nX3ByZXBfcG9sbF9yZW1vdmUoc3FlLCAoX191NjQpbm9kZSk7DQo+ID4g
KyNlbHNlDQo+ID4gICAgICBpb191cmluZ19wcmVwX3BvbGxfcmVtb3ZlKHNxZSwgbm9kZSk7DQo+
ID4gKyNlbmRpZg0KPiA+ICB9DQo+IA0KPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4gSSBzdWdnZXN0
IHVzaW5nIHRoZSBzYW1lIGFwcHJvYWNoIGFzIHRoZSBsaWJ1cmluZw0KPiBjb21taXQgdG8gYXZv
aWQgdGhlICNpZmRlZjoNCg0KT2xkIHZlcnNpb24gaXMgInZvaWQgKnVzZXJfZGF0YSIsIHNvIG5l
ZWQgdG8gdXNlICcgTElCVVJJTkdfSEFWRV9EQVRBNjQnLA0KYWxzbywgYXMgdGhlIGNvbW1lbnQg
c2FpZDoNCg0KLyoNCiAqIFRlbGwgdGhlIGFwcCB0aGUgaGF2ZSB0aGUgNjQtYml0IHZhcmlhbnRz
IG9mIHRoZSBnZXQvc2V0IHVzZXJkYXRhDQogKi8NCiNkZWZpbmUgTElCVVJJTkdfSEFWRV9EQVRB
NjQNCg0KQW5kIHllcywgdHdvIGNhc3RzIHNlZW1zIGJlIG1vcmUgc2FmZTogKF9fdTY0KSh1aW50
cHRyX3Qpbm9kZQ0KDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdC9wb2xsLWNhbmNlbC10b24uYyBi
L3Rlc3QvcG9sbC1jYW5jZWwtdG9uLmMNCj4gaW5kZXggZjA4NzVjZC4uMDViZjU2NSAxMDA2NDQN
Cj4gLS0tIGEvdGVzdC9wb2xsLWNhbmNlbC10b24uYw0KPiArKysgYi90ZXN0L3BvbGwtY2FuY2Vs
LXRvbi5jDQo+IEBAIC01NSw3ICs1NSw3IEBAIHN0YXRpYyBpbnQgZGVsX3BvbGxzKHN0cnVjdCBp
b191cmluZyAqcmluZywgaW50IGZkLCBpbnQgbnIpDQo+IA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICBzcWUgPSBpb191cmluZ19nZXRfc3FlKHJpbmcpOw0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICBkYXRhID0gc3FlX2luZGV4W2xyYW5kNDgoKSAlIG5yXTsNCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgaW9fdXJpbmdfcHJlcF9wb2xsX3JlbW92ZShzcWUsIGRhdGEpOw0KPiArICAgICAg
ICAgICAgICAgICAgICAgICBpb191cmluZ19wcmVwX3BvbGxfcmVtb3ZlKHNxZSwgKF9fdTY0KSh1
aW50cHRyX3QpZGF0YSk7DQo+IA0KPiBTbyB0aGUgUUVNVSBhZGRfcG9sbF9yZW1vdmVfc3FlKCkg
ZnVuY3Rpb24gd291bGQgZG86DQo+IA0KPiAgIGlvX3VyaW5nX3ByZXBfcG9sbF9yZW1vdmUoc3Fl
LCAoX191NjQpKHVpbnRwdHJfdClub2RlKTsNCj4gDQo+IFdhcyB0aGVyZSBhIHJlYXNvbiB3aHkg
eW91IGNob3NlIGFuICNpZmRlZiBpbnN0ZWFkPw0KPiANCj4gVGhhbmtzLA0KPiBTdGVmYW4NCg==

