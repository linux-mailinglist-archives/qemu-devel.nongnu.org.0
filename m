Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02E34EBC9E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 10:22:20 +0200 (CEST)
Received: from localhost ([::1]:57512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZTat-00065j-M2
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 04:22:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nZTHb-0006JD-Ok
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:02:23 -0400
Received: from mga03.intel.com ([134.134.136.65]:48237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nZTHZ-0004HT-AW
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648627341; x=1680163341;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=12u9MOvadTGpSzxF5ac/V4t9NZS0xlZDRTnDi4l97Mo=;
 b=YyQpkUydS/GlYagkHq9LLZKx/O+WIq/uzYKej7KYg07D3HAeSoTl1DBp
 ghI9s78SCIkylRePwiOmbZG3pZTAeDCEyKOb26O2bN65vuEBVMyY/YFlT
 l9r85YAEj8ElukAPVEgthspmqzc7ZagOqfNERQXJllmdUzTzkXSe/NaF1
 QS5ag+i88f2R95gaoSRZ64oeGUOpZ28jXWDtVR4ivg8OzDRad5hFA0YUv
 kRZPc7dwrDTGQjsdDIRWHXSS3JUOGipGRsbUBbxaO+m+ot1QC/tFvUsLn
 BxC0MfZWgEGOE2wGv4As1DrE1gcZ00HhkUBWi40WlnOswZm8j6Plm8MuI w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259451386"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="259451386"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 01:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="554573596"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga007.fm.intel.com with ESMTP; 30 Mar 2022 01:02:18 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 30 Mar 2022 01:02:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 30 Mar 2022 01:02:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 30 Mar 2022 01:02:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdopzTYjmp0eV406MzvjQAgdD+/JuIs6bnSD+O9q7SbYYNonO1JTEjTQRgSXty7BRi1d0Ak4mVPjfsciib19F/pK4loyIa9PgeE2/bIBX3yZdOSb52PXKgly6SR7rK6dpTjUXdGrTCoP2LLt0/JKeEaPfxTkxnEru9MSC3g2IF+cGNjqT9iPgMcHHXKBSfmU7BzMVBtYu2hC1XLpm2COXfU1vNNctzusrGlw92UaJMGWKyAwiTCH+SQZx31On+CtzkDSyBn2PV3570dk2JFyEJr3vyUd2jcV877eMByjfnpoz0bFzCPqjwFRH7Ngdukele+CqlOH3VUuvvAeNGAheg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12u9MOvadTGpSzxF5ac/V4t9NZS0xlZDRTnDi4l97Mo=;
 b=DrlMbXQwEAQzzkf7q9RKi7VS8l060fZeyy0MuHko9nfD51pi3gSSfbwHsNbql0zxEGoa9F2OkawpekvjxfuPcf7BHpslOLJ3ZJMeiNOqaZhwOMxFwt07HxEelb7w4TPp7QTW9nuVpMZX0PUyXvSqR8yx8epB+9By1Kr38oBDPdC21jjVzUmNDbt1zwY6LjDUmqKetoUAqFlG5yuG4qRi50v4mIMudeG8T5o6FkT513Lv/ZAeu1msnHyCy/d2xJ6xxvMhP4xPw8Yuar2kfZ097Bws0oX53nEWAmyW8B/ofraFfnM71+GLDPbtzdvaZzAOajOXX0tUMNBBZ1ahWCQQTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM5PR1101MB2153.namprd11.prod.outlook.com (2603:10b6:4:56::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Wed, 30 Mar
 2022 08:02:16 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0%4]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 08:02:16 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH V2 4/4] intel-iommu: PASID support
Thread-Topic: [PATCH V2 4/4] intel-iommu: PASID support
Thread-Index: AQHYPOjLkFETw43vekSHA4amP0dz7KzUZd9wgAFwzoCAAcfiYA==
Date: Wed, 30 Mar 2022 08:02:16 +0000
Message-ID: <BN9PR11MB5276FB0451ABA184476BD4038C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-5-jasowang@redhat.com>
 <BN9PR11MB527635384D3CD8F0FB4232388C1D9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEv4gN4=SzeWroMXdOouxQnzarQX_U5Jv528_fROoYNHyw@mail.gmail.com>
In-Reply-To: <CACGkMEv4gN4=SzeWroMXdOouxQnzarQX_U5Jv528_fROoYNHyw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cce2e946-3002-49a3-5d1b-08da12239b14
x-ms-traffictypediagnostic: DM5PR1101MB2153:EE_
x-microsoft-antispam-prvs: <DM5PR1101MB21535DBEE95D85A732D296D38C1F9@DM5PR1101MB2153.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yjF6+hIAHvF2mvB2gt/UTC+rl/0jLVhLV7jp56oak539RGAXU2Bl37yFu6C/gbhxjtUOYHwes/d0vpaYBZ6KCQT7YVQr7QuqpEFU/jjrXkLn/sPBf/z3mk/EsRu/qokWQ2xU9BvICScPBZG0ktwBe68V0enWQM8npylErm0nCktCvmvpzhE4OPLdqW1KG7hXp4i4+3oyz0VAf2ia5jUPvvucJoW7kSeW1XYYqIUG/FgxWvTCBIcVG5gPHLtriUfVxpmQMl6069ZpwxU6BVD072+bM5pUEmXMjO/WFYTQCgoMIPGfqJu6W40rchcES1d4xb21OGT8dzYTzFa93bCD0hR3b25rsZ3C9bJakLtfRMMeFYRvgGPJZjJapwjUHYFAF10M25utY11thqIvx40iwHDnNXOOMhK4OIvEGkv3Ge2ZfCNgcLs8pQILYFpAhQ3vfRH5CCSwc54Xgeg6EPLHWtnfYoGHft3r9m4mcMzLBkJJfNIRyb0AbFQuE2KcVFh2VEHYHOBwJEB8nTdBLw4qUDLybHjxYu7J3HaCieyp4fhU3uSpHlKQNClt8PGI/F2WawZV/39vRW5AWHOmZeg5LXY/1IXWE613MH+Z63c1MDf+XfBzDURFIjiwL5naDaDzIZedAbaKRWSifKtB1hBz8LFogsIU/ULX6umAP2XyGxnt7rDVmDV9Il8FLXsjEDIfjzxi5DFBPLspzIGcJV3ju2zKrw/Cxtl8qgvK1bgUVWDG9LSeOnpCGsdLFG9YAYzV3d8TaarG8pulFC3nz90yZA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(53546011)(66946007)(64756008)(66446008)(316002)(55016003)(186003)(8676002)(76116006)(66476007)(38070700005)(82960400001)(83380400001)(66556008)(122000001)(4326008)(2906002)(8936002)(6916009)(52536014)(966005)(5660300002)(7696005)(26005)(71200400001)(6506007)(38100700002)(33656002)(9686003)(508600001)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3k3bHlSdkF2T0pGbFQxS0RIRmt6ODNFd21leksyYlBJMEJYbXpxdVdnanpP?=
 =?utf-8?B?cVhuN2EwYlFkRW9QVzVuWVhtV1N6ZXBhSUxBVi8weFJJWmJ4Tjh5aldaN0R4?=
 =?utf-8?B?Yjg5dG0wUDRIeWt1SUMweXovanhxdm1INy9aSnFwWDQwSlNla2E5STRYN2k3?=
 =?utf-8?B?MzdQUGc4WnRSNndzWUc5WllaNEg1YXU0Q3FYLzlqL1JaVEU3TmpCbFBVUWpw?=
 =?utf-8?B?bnBESmFrYzNRczJDWi8vTFRJTHVlNUhIN2R0N1JrTzVnZi9mT1BGejNaSUZW?=
 =?utf-8?B?WXBWSm8rRVE0aE9PT1ZyK3dwUzJQUVF1dlljWlFPZGpnYWpmUlB2a29UdUtY?=
 =?utf-8?B?UHNIZDRnQzBucURrNVRWNmNGRlpBamdmVHNjR3I4WjFlYXp6bUkzaVNZWDhn?=
 =?utf-8?B?TUd5cjF6bkJZZUtEbk41Y0t1SzZWaitoK2NibENCck9JNUs4c05oVnVmQUdo?=
 =?utf-8?B?SnE2M2hRVkRNVklTdW9Bc3Vyc3NvcUUrS0ozTDNIaEljOVlneUJJS1U3cFZJ?=
 =?utf-8?B?ZSsrVjdIdnZLVFh1bjQ0azQ4dVB5TFlXcVAwV0dXbDBGYUl4Zm8rL1lzWG9y?=
 =?utf-8?B?Q20ycCt6TGROZDJQQy9NNFJHOTZmN3BGU2VFbU0wY29sbXA4K2tTUkF1K05j?=
 =?utf-8?B?Y0JaL056dDdmRkZTUTdrL3F6c0Jqc1Fwamo0bzZ4cWlkRWRTYWlTRXdsVmZs?=
 =?utf-8?B?VDl3UzVDSDhJYXNJQ01uV0h3MkQ5Z0lUVHQ5aVlmUjlMYWUrRys3MXJEWVdQ?=
 =?utf-8?B?alVBWit2NWhBSk1zZERQeE56MmdxckVQTG1HR2t1aUMvdUNvWjRFTTJYdEJB?=
 =?utf-8?B?OC91SE1lRTA3YTlDY2cxL1lYK0FJZGNqWExHYkdZTUx3cVh1enFyQlArbE1o?=
 =?utf-8?B?NTBJSVFKWGIyWWxkc1g0YnJjdmZzaWpVZisyeDZvekh5alNONUtBTm1qeWJz?=
 =?utf-8?B?L3ZlTlNDT2VJc3lVOTU5QlI4MVlKRGNjQzQ1RHVvTnVGT25CMFFIL1Fsekw0?=
 =?utf-8?B?STlybzNtMjRQSWpmamw3WVZWUnBlVU1oS012Uk9MQ3lXTFhaUEQ3UngvLy90?=
 =?utf-8?B?TTg3czZJcTRwekxmY3cvdXVmZXllME95eU9DUktzRHQ2VHZXaE5nTjN1Q05I?=
 =?utf-8?B?NnZVWlh0a3I1RzREanhYUjhrdERLeEg0ZEt0clptcS84a2VybTlzbHd3TVRQ?=
 =?utf-8?B?TXN1ejBIRUFiWnVaTEF3V3pXbmZDeDY2bXFPS0t2K2YxNnBiSjh2YW4yemFu?=
 =?utf-8?B?L3V1eGEvZEZxbFppSlFPRkdCbmxyakUvREtZdUc3aWlNMWFxZnp3cWhhQ2JZ?=
 =?utf-8?B?cENDbzh6TG1JcUpwWkIxZXJNc0hsTG9pSFNveU9qY1E2MVVFNzZCMVQveGlv?=
 =?utf-8?B?RCtaRGtyNVpac3Q0dDV2bDlHWS9qbHNCNGhGRVlCQU9uMHJ1UC8vcyt3L3dp?=
 =?utf-8?B?eW84RnFLaHRLR2U1NlV6UXhHbUdZUndpc283UHM4VG5aYXVLSkhTRVJIQzNI?=
 =?utf-8?B?MktYVngvajVkTTdxYzB0dnlubjNzb0ZDTU04cjZxMFJXZ2xrb01Tcmx3TW5R?=
 =?utf-8?B?SExBNW10Z3ArNWo3YnVuVU5SSXo0ZTFXbnhza1BoSUZTY05HOEJFRVJCZ2h1?=
 =?utf-8?B?NUlTVTkzajJ4MUtXWWRJZFF6Tm1FRXRPM25aMndZMTRUR2xPcGpWOHE4cHh5?=
 =?utf-8?B?WGtLN0ZLTFpWZDIxMUxmVDE1SnlNcE1yQUNjYmk4WDIzSisvWHVyRi91YnlR?=
 =?utf-8?B?TVVGV0xva1lHZXlobnM4b0V5M3dXdjhWWFpmQkMrYjZ1VDRlUXcyKzArWnBq?=
 =?utf-8?B?Ym8yc3lacmZQaGFvL3Y1YlRoOHQyRXBVa2FZVmxjY2xCOXRNZzl0cHhOdkF6?=
 =?utf-8?B?ZGdESzdRbHdrUTRqMjVnZ0ZVaXNteSs5aUJCY0ZLaHEyNVhUeGIxNTMzeTBJ?=
 =?utf-8?B?Mis3alJISzdGZTlyRWphNVBTcHEyL1lJOWJpa2E4dmFSYnpJalgwU2FpS2Jq?=
 =?utf-8?B?dUdXR1JWUEgwNThkRXBXYlI5ZHFTeklZYWhoVTFTVDhXOXdpQVFpUmRLa3JU?=
 =?utf-8?B?VlZIOGN1U3IxWUZ3TmtKclFrZExzTnBQSzlyZUFHRFkwN3plNittd3lTSnNw?=
 =?utf-8?B?V3BwanVOcERTTURHL05sOHFKQi9JeWUycEhJMndDTW5rQ3F4SmgvOHZUaEZ4?=
 =?utf-8?B?b3BxMzJjcGpkQUhBSC9zTWlWZTQ1TXRJenIxT1ZlbjcxMjdsZzJCTzhhKzhx?=
 =?utf-8?B?VEloNTBEM2JKY0xTVzVQSW4xRmZmZndUTi9wSU8rM0VobzRDQy95UjM1aTIv?=
 =?utf-8?B?M0g0QjRuSFFyRHJRV2hKTFAzd3JFSzBjeUhZaGNXazRyZy9IRWw4UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce2e946-3002-49a3-5d1b-08da12239b14
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2022 08:02:16.0475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oQFgrErEEVUpltJvSaB7jaidyAY6uTVywbekvHf9X/fUbRpgfJ6/Z3A5WKaBdlwaAHZIiW1teatPhz9rmZ5tNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2153
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=kevin.tian@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVzZGF5
LCBNYXJjaCAyOSwgMjAyMiAxMjo0OSBQTQ0KPiANCj4gT24gTW9uLCBNYXIgMjgsIDIwMjIgYXQg
MzowMyBQTSBUaWFuLCBLZXZpbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+IHdyb3RlOg0KPiA+DQo+
ID4gPiBGcm9tOiBKYXNvbiBXYW5nDQo+ID4gPiBTZW50OiBNb25kYXksIE1hcmNoIDIxLCAyMDIy
IDE6NTQgUE0NCj4gPiA+DQo+ID4gPiArICAgIC8qDQo+ID4gPiArICAgICAqIHZ0ZC1zcGVjIHYz
LjQgMy4xNDoNCj4gPiA+ICsgICAgICoNCj4gPiA+ICsgICAgICogIiIiDQo+ID4gPiArICAgICAq
IFJlcXVlc3RzLXdpdGgtUEFTSUQgd2l0aCBpbnB1dCBhZGRyZXNzIGluIHJhbmdlIDB4RkVFeF94
eHh4IGFyZQ0KPiA+ID4gKyAgICAgKiB0cmFuc2xhdGVkIG5vcm1hbGx5IGxpa2UgYW55IG90aGVy
IHJlcXVlc3Qtd2l0aC1QQVNJRCB0aHJvdWdoDQo+ID4gPiArICAgICAqIERNQS1yZW1hcHBpbmcg
aGFyZHdhcmUuIEhvd2V2ZXIsIGlmIHN1Y2ggYSByZXF1ZXN0IGlzIHByb2Nlc3NlZA0KPiA+ID4g
KyAgICAgKiB1c2luZyBwYXNzLXRocm91Z2ggdHJhbnNsYXRpb24sIGl0IHdpbGwgYmUgYmxvY2tl
ZCBhcyBkZXNjcmliZWQNCj4gPiA+ICsgICAgICogaW4gdGhlIHBhcmFncmFwaCBiZWxvdy4NCj4g
Pg0KPiA+IFdoaWxlIFBBU0lEK1BUIGlzIGJsb2NrZWQgYXMgZGVzY3JpYmVkIGluIHRoZSBiZWxv
dyBwYXJhZ3JhcGgsIHRoZQ0KPiA+IHBhcmFncmFwaCBpdHNlbGYgYXBwbGllcyB0byBhbGwgc2l0
dWF0aW9uczoNCj4gPg0KPiA+ICAgMSkgUFQgKyBub1BBU0lEDQo+ID4gICAyKSB0cmFuc2xhdGlv
biArIG5vUEFTSUQNCj4gPiAgIDMpIFBUICsgUEFTSUQNCj4gPiAgIDQpIHRyYW5zbGF0aW9uICsg
UEFTSUQNCj4gPg0KPiA+IGJlY2F1c2UuLi4NCj4gPg0KPiA+ID4gKyAgICAgKg0KPiA+ID4gKyAg
ICAgKiBTb2Z0d2FyZSBtdXN0IG5vdCBwcm9ncmFtIHBhZ2luZy1zdHJ1Y3R1cmUgZW50cmllcyB0
byByZW1hcCBhbnkNCj4gPiA+ICsgICAgICogYWRkcmVzcyB0byB0aGUgaW50ZXJydXB0IGFkZHJl
c3MgcmFuZ2UuIFVudHJhbnNsYXRlZCByZXF1ZXN0cw0KPiA+ID4gKyAgICAgKiBhbmQgdHJhbnNs
YXRpb24gcmVxdWVzdHMgdGhhdCByZXN1bHQgaW4gYW4gYWRkcmVzcyBpbiB0aGUNCj4gPiA+ICsg
ICAgICogaW50ZXJydXB0IHJhbmdlIHdpbGwgYmUgYmxvY2tlZCB3aXRoIGNvbmRpdGlvbiBjb2Rl
IExHTi40IG9yDQo+ID4gPiArICAgICAqIFNHTi44Lg0KPiA+DQo+ID4gLi4uIGlmIHlvdSBsb29r
IGF0IHRoZSBkZWZpbml0aW9uIG9mIExHTi40IG9yIFNHTi44Og0KPiA+DQo+ID4gTEdOLjQ6ICBX
aGVuIGxlZ2FjeSBtb2RlIChSVEFERFJfUkVHLlRUTT0wMGIpIGlzIGVuYWJsZWQsIGhhcmR3YXJl
DQo+ID4gICAgICAgICBkZXRlY3RlZCBhbiBvdXRwdXQgYWRkcmVzcyAoaS5lLiBhZGRyZXNzIGFm
dGVyIHJlbWFwcGluZykgaW4gdGhlDQo+ID4gICAgICAgICBpbnRlcnJ1cHQgYWRkcmVzcyByYW5n
ZSAoMHhGRUV4X3h4eHgpLiBGb3IgVHJhbnNsYXRlZCByZXF1ZXN0cyBhbmQNCj4gPiAgICAgICAg
IHJlcXVlc3RzIHdpdGggcGFzcy10aHJvdWdoIHRyYW5zbGF0aW9uIHR5cGUgKFRUPTEwKSwgdGhl
IG91dHB1dA0KPiA+ICAgICAgICAgYWRkcmVzcyBpcyB0aGUgc2FtZSBhcyB0aGUgYWRkcmVzcyBp
biB0aGUgcmVxdWVzdA0KPiA+DQo+ID4gVGhlIGxhc3Qgc2VudGVuY2UgaW4gdGhlIGZpcnN0IHBh
cmFncmFwaCBhYm92ZSBqdXN0IGhpZ2hsaWdodHMgdGhlIGZhY3QgdGhhdA0KPiA+IHdoZW4gaW5w
dXQgYWRkcmVzcyBvZiBQVCBpcyBpbiBpbnRlcnJ1cHQgcmFuZ2UgdGhlbiBpdCBpcyBibG9ja2Vk
IGJ5IExHTi40DQo+ID4gb3IgU0dOLjggZHVlIHRvIG91dHB1dCBhZGRyZXNzIGFsc28gaW4gaW50
ZXJydXB0IHJhbmdlLg0KPiA+DQo+ID4gPiArICAgICAqICIiIg0KPiA+ID4gKyAgICAgKg0KPiA+
ID4gKyAgICAgKiBXZSBlbmFibGUgcGVyIGFzIG1lbW9yeSByZWdpb24gKGlvbW11X2lyX2ZhdWx0
KSBmb3IgY2F0Y2hpbmcNCj4gPiA+ICsgICAgICogdGhlIHRyYW5sc2F0aW9uIGZvciBpbnRlcnJ1
cHQgcmFuZ2UgdGhyb3VnaCBQQVNJRCArIFBULg0KPiA+ID4gKyAgICAgKi8NCj4gPiA+ICsgICAg
aWYgKHB0ICYmIGFzLT5wYXNpZCAhPSBQQ0lfTk9fUEFTSUQpIHsNCj4gPiA+ICsgICAgICAgIG1l
bW9yeV9yZWdpb25fc2V0X2VuYWJsZWQoJmFzLT5pb21tdV9pcl9mYXVsdCwgdHJ1ZSk7DQo+ID4g
PiArICAgIH0gZWxzZSB7DQo+ID4gPiArICAgICAgICBtZW1vcnlfcmVnaW9uX3NldF9lbmFibGVk
KCZhcy0+aW9tbXVfaXJfZmF1bHQsIGZhbHNlKTsNCj4gPiA+ICsgICAgfQ0KPiA+ID4gKw0KPiA+
DQo+ID4gR2l2ZW4gYWJvdmUgdGhpcyBzaG91bGQgYmUgYSBidWcgZml4IGZvciBub3Bhc2lkIGZp
cnN0IGFuZCB0aGVuIGFwcGx5IGl0DQo+ID4gdG8gcGFzaWQgcGF0aCB0b28uDQo+IA0KPiBBY3R1
YWxseSwgbm9wYXNpZCBwYXRoIHBhdGNoZXMgd2VyZSBwb3N0ZWQgaGVyZS4NCj4gDQo+IGh0dHBz
Oi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20vcWVtdS1kZXZlbEBub25nbnUub3JnL21zZzg2Nzg3OC5o
dG1sDQo+IA0KPiBUaGFua3MNCj4gDQoNCkNhbiB5b3UgZWxhYm9yYXRlIHdoeSB0aGV5IGFyZSBo
YW5kbGVkIGRpZmZlcmVudGx5Pw0KDQpUaGFua3MNCktldmluDQo=

