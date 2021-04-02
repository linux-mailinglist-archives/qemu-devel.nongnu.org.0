Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCC3352FE1
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 21:43:37 +0200 (CEST)
Received: from localhost ([::1]:60236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSPhg-0008Nx-C7
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 15:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lSPgX-0007t6-DY
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 15:42:25 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:28428)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lSPgV-0001fS-4a
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 15:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617392543; x=1648928543;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ofY6JufkZk/uHWx5jrPhpAIvocr84IYB36t6gdprYP8=;
 b=Sfc9jsHQZzXYOoiFMoaCptq0TIEZCyqY4mYhTQuEJOQ5G6L2+fLSCIGI
 KlMyGb/E8OUv/h+S5Ni0CYSF0iyWdAhkTa3uvohfotQWgG4KrvmkWbJy1
 jjtWV66f/4gc5kcv8mxS3eol13gqJc1Tx54Hf+O7ROsOKyIjf559fp3ap k=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Apr 2021 12:42:19 -0700
X-QCInternal: smtphost
Received: from nasanexm03c.na.qualcomm.com ([10.85.0.106])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 02 Apr 2021 12:42:19 -0700
Received: from nasanexm03e.na.qualcomm.com (10.85.0.48) by
 nasanexm03c.na.qualcomm.com (10.85.0.106) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Apr 2021 12:42:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Fri, 2 Apr 2021 12:42:19 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6963.namprd02.prod.outlook.com (2603:10b6:a03:236::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Fri, 2 Apr
 2021 19:42:18 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608%6]) with mapi id 15.20.3977.033; Fri, 2 Apr 2021
 19:42:18 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 01/21] Hexagon (target/hexagon) TCG generation cleanup
Thread-Topic: [PATCH v2 01/21] Hexagon (target/hexagon) TCG generation cleanup
Thread-Index: AQHXJqqeVm1ZS9EKXUqFRq9vSVKKqqqhgvkAgAAT6bA=
Date: Fri, 2 Apr 2021 19:42:17 +0000
Message-ID: <BYAPR02MB48860C83CC91FDFC9D9DC06DDE7A9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-2-git-send-email-tsimpson@quicinc.com>
 <0cbf66d0-e306-972a-ca39-aadae2e9dc27@linaro.org>
In-Reply-To: <0cbf66d0-e306-972a-ca39-aadae2e9dc27@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30df1481-5ede-47fc-9697-08d8f60f6cbe
x-ms-traffictypediagnostic: BY5PR02MB6963:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB6963AC43FF0ACA17238955C8DE7A9@BY5PR02MB6963.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1aPCIlLwnkc61Xd5AWzbBy1WGdxHkg/YDZEetKsbfLa1Rda1vysNbTudblIDPL1UTYTRyyBRrTlHWNCzS8vFF2ruv1EuJTvz6mZcruRipO8DTOsFGV1dzfIockBRDu66i15WoQi7EUa4u24lSVqxiUfzLP9R7AFFZKKsPomfhTI3YU++xGXTDMElADN3XU2TPLs+fHoPwWQHBT4qYZfl7geAWec/+yJ8+2Vrj9JJ02yuqV2q6hPM6gVrlNeaPkRW0vq3lEKtOuVs55aN8Nh131oKm3oiyk4WjqLDp24oqioUpnV4XgmHtg5ZnQ+H/rFPAaCF4xsPObkKN80p3GrG0VXZNTZ7geAU/+HguXRdyxqxecJXbMFktsFnIwzShEz0xgqUj/w2n2jqzuFbi4rzeplzwaR96z7lkZ8x7Rnj7UUrRaGTtgcve0HDcZZmAPYjfIY0awkAaGxujR8wcmiPdb9bP7xsXeml10uqtfKRGBIOAVhkjq8PYNTBe4e/rR7z2CAY3rMjrpRLuBrB+Eef3jfys1N584+FWWgzzXH+mXjCiWodQuF8JwwQZ2XV4+rAMg6teSmZV0FLG/PLWHUEJhAgLeBcZb+0jYTWfZ2vmxob+AYOJ1DfWyfovsc0WRDvC7vrkXt3+rDIENUBiCykCWfVK62BRTwCfYGtf8ochEw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(66556008)(71200400001)(83380400001)(5660300002)(64756008)(8936002)(2906002)(4326008)(66476007)(186003)(7696005)(478600001)(55016002)(26005)(53546011)(52536014)(66446008)(6506007)(316002)(9686003)(8676002)(33656002)(76116006)(107886003)(86362001)(110136005)(54906003)(38100700001)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WFpvbW5iT2FxNUozcEVteEwyOHlnS0FacGhpdFNsUHltdkFPenkybCs5N2lM?=
 =?utf-8?B?WThkM3c0THQ1TkNMSXB5ZzduVHBITU9pVk1PWjBPalYrd292QTkrM0RkUzU5?=
 =?utf-8?B?bmMrb1FLN3JOLzJUZnpmRElEWHE3RG4xSFJxY2dJVFFDQmZoM084WHFFZWhx?=
 =?utf-8?B?d3RpeUE2OVMyRDdNck5YbGZCQUk0VllvOWxHcXk1UWM3eWo1M2o4bFBIUFNS?=
 =?utf-8?B?RURNOVNwQmJWbDhyMXFkSDZUbXlQS0diZk5mQXVXaVNka25Ndmt0VHRwOHUw?=
 =?utf-8?B?SHZPdW1peXJGN1NJMzZScWQrT3lHdTEwQWZjc1d3RUxUZXBma2p0TWN0eVdi?=
 =?utf-8?B?UDNrT2pad0hoTk1EenoycHZGVTVGeGlqYi9rMVNHSkQwUy85S3BxbE1LRzhB?=
 =?utf-8?B?c29VcEVHN0VIUnN2a25idFdMckdzbDN2UnFFbXJjVGtoN1g5Umdmc2NoQWx2?=
 =?utf-8?B?NzNMazJYQ0tZUEpKR1E1TUhzdTV5MXNqNzgyTWt3NldLVDNvaUVpMTQxL2M3?=
 =?utf-8?B?YlE0emdlZHBIMmJoajR1TVpPL05vL0Z5aTJRaTlIRnNtQklWTjdJcGZaZm90?=
 =?utf-8?B?cmJYVTFWWUp0ZEZkQmJROUExb2xIUjZGMmtLTFFMTENHWDQxY29tTXpMd1E0?=
 =?utf-8?B?SHJzREVZRzNYWTViNk8zeXoxakZ3SzQvb205RlNkSHFkMnFRWjlyVTB0SHVH?=
 =?utf-8?B?TGxjRURLRWNsSm1rYWhiUXJKbDZmRHczVnUrSFpWTlp3WHRZQnhQMk9zbjEr?=
 =?utf-8?B?Q0V3WXhReG1Jc2NzM3FCYVI5MFFReUhrSGZ4VzliUnRUdW13ell5ZG43NXZW?=
 =?utf-8?B?bW9mZjh0bC9yUHYwVXorL1ZFMnB1d2RKdDUwZm9kYWZyNzIxakJxeE1qdVJh?=
 =?utf-8?B?ZUErTmt0STVHamlVd1liNnh6ZXNnSnNhNzhzQjVyOWsvUkYySGdnZURzUEVN?=
 =?utf-8?B?WjBMYkZSdVFvYm5iUEMxMlVoRGJXL2V4VWxJTitxNExDa055RmVzZXFVaE1K?=
 =?utf-8?B?Y2JxdGl0dklQdndwZWdhTkx0cUVwNE5xUTMrNTJTOGtGcmtOK2pkWTh6WjRY?=
 =?utf-8?B?UWhyd2JVMDh6eC90UjVRa2Zlc3J0Tk90enYwQm5tOXE5dW1aZmd5QVN4Kys1?=
 =?utf-8?B?TUY1N2Z5c3ZUSFpjRmhuaTR4VTBDN0NJS0dTZFBHdVkwR1RranFNUU5BTFpn?=
 =?utf-8?B?K2gydlQ4QXNIZnVRUk14OHBiYzhWUjdZOXhlMTIxZ3ppTW80eEo3MW1aNSs1?=
 =?utf-8?B?K0FwcEUrQkV1ZmdpelZjUk96bkpVcnlPcEdHbHMwZ01BQWxxT3FqdnNmeGVL?=
 =?utf-8?B?a1J2TmVaMXdWTExyWjlEWDZPQ1FnZ2ZOVWNIODgrWDhhVG81TmlSdXVCY0xu?=
 =?utf-8?B?d2R5d1Ruc2ZtenhZdmpPM1VrOXZ3SS8wc2hZMlZZdTFjNVErejcrNTJBMGFL?=
 =?utf-8?B?OXE0anZIRW9za3hOR3VoRDZlYXRRdGNJMlJUcmVYK2s2bFh2cDU0azRRRUNF?=
 =?utf-8?B?d0tnUisyQkFtTWdjZDZJUnhqQkJ0SG1IWDRIekw4RTY3S09JRndVWFBhVHJo?=
 =?utf-8?B?cFViR3B2VGhSbm5rQ0pqU2xtSmtKalN4TVZ1UDVoaDhUTmlpaDQ4a1NoYS82?=
 =?utf-8?B?Z2V4enFZY3pLcTNYejcrNmNPcTliQWxkcWFEV0RxZzRtenNMVGpaSW5mS2dh?=
 =?utf-8?B?UldlbEx6QVRrZ3J2Qms5UjVQOGdVelNYeFdxQ0lGTFdod1RCelhVT0VkTnkw?=
 =?utf-8?Q?tyVfibmCWtqnQQj7xCXh3F0rMkl+e7vZHVgLuc0?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1VyjToU4rwudyLbQwqgzjsbaxDGY1RPWvs53deFL2gHCFfLyqmzX0PTGXUUvBaRqk4nbIfU7AsUb2SZVb9Xnqz7FR+v9FmbXQzz4rSgjhEmjeQvP4VoM1CWPbPjCV2P1XHI1D9tuieaKefH5EWAglxlutjlxuQe17+7pWBTVrmizz5J46vUv3TQAMHcdhG643JhtyBNWbE0IWPpeKfv8eLRSbLkUuyE0FfyAilJSCWxl3G1zONCFKAslzRZKQcDOdGCQ0T1qegmm8YM1zgg7Yuxc+mphZlppx70vPO9jqqPwtqWRmHGP7YwBrK0i49XSRZU/jijfLWMmxsTuDO6kg==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dTBaHOXEEIXzvRGYsex/hT+ulfSmo3zMcJeqPREKUM=;
 b=IbonhcHC7vCcgVWpEDbIi0y34NGg8lb2bCnSPmXtfLQXh/chDqKFlnh8ejChiVHi/TJQ+TmJnKL5ymdd2OG8Z/4VdnRocICP8CqGUsMEi74Od2sHFWB47wEBZOtyPwBAh5d+UHgMHMwN6k4JMvfALJOpaRubzBlBX+vWTBgtcnnF0/drvIt+lAXLCN7ZyHJpdCcEZttTow+mvL7pQPN8Igw1czT6/elzHDui9ahg+pv2e/VISHNjF9zLasMaff7G0raciww9oY5eQDujkxdZ4nG+0wIsNQhTL+t3hZrnG9ihh4ic0pdsSoNgHI+k1bZ+Vcp31LlIMkqzawSY/IbSHQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 30df1481-5ede-47fc-9697-08d8f60f6cbe
x-ms-exchange-crosstenant-originalarrivaltime: 02 Apr 2021 19:42:18.0938 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: XSiUailCtbWyrMH+XnhheItV6A4+H75QxosM9AApL1lZ/L2x5LbKxP/KhI7LpkqnOgVpEK6bjnJN2oWl0pwbXw==
x-ms-exchange-transport-crosstenantheadersstamped: BY5PR02MB6963
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.39; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian
 Cain <bcain@quicinc.com>, "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJpY2hhcmQgSGVuZGVyc29u
IDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KPiBTZW50OiBGcmlkYXksIEFwcmlsIDIs
IDIwMjEgMTI6NDcgUE0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNv
bT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogcGhpbG1kQHJlZGhhdC5jb207IGFsZUBy
ZXYubmc7IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyIDAxLzIxXSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgVENHIGdlbmVyYXRpb24NCj4g
Y2xlYW51cA0KPg0KPiBPbiAzLzMxLzIxIDg6NTMgUE0sIFRheWxvciBTaW1wc29uIHdyb3RlOg0K
PiA+IFNpbXBsaWZ5IFRDRyBnZW5lcmF0aW9uIG9mIGhleF9yZWdfd3JpdHRlbg0KPiA+DQo+ID4g
U3VnZ2VzdGVkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJv
Lm9yZz4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2lu
Yy5jb20+DQo+ID4gLS0tDQo+ID4gICB0YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyB8IDE0ICsrKysr
KysrKy0tLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jIGIv
dGFyZ2V0L2hleGFnb24vZ2VucHRyLmMNCj4gPiBpbmRleCA3NDgxZjRjLi44N2Y1ZDkyIDEwMDY0
NA0KPiA+IC0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jDQo+ID4gKysrIGIvdGFyZ2V0L2hl
eGFnb24vZ2VucHRyLmMNCj4gPiBAQCAtMzUsNyArMzUsNiBAQCBzdGF0aWMgaW5saW5lIFRDR3Yg
Z2VuX3JlYWRfcHJlZyhUQ0d2IHByZWQsIHVpbnQ4X3QNCj4gbnVtKQ0KPiA+DQo+ID4gICBzdGF0
aWMgaW5saW5lIHZvaWQgZ2VuX2xvZ19wcmVkaWNhdGVkX3JlZ193cml0ZShpbnQgcm51bSwgVENH
diB2YWwsIGludA0KPiBzbG90KQ0KPiA+ICAgew0KPiA+IC0gICAgVENHdiBvbmUgPSB0Y2dfY29u
c3RfdGwoMSk7DQo+ID4gICAgICAgVENHdiB6ZXJvID0gdGNnX2NvbnN0X3RsKDApOw0KPiA+ICAg
ICAgIFRDR3Ygc2xvdF9tYXNrID0gdGNnX3RlbXBfbmV3KCk7DQo+ID4NCj4gPiBAQCAtNDMsMTIg
KzQyLDE3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBnZW5fbG9nX3ByZWRpY2F0ZWRfcmVnX3dyaXRl
KGludA0KPiBybnVtLCBUQ0d2IHZhbCwgaW50IHNsb3QpDQo+ID4gICAgICAgdGNnX2dlbl9tb3Zj
b25kX3RsKFRDR19DT05EX0VRLCBoZXhfbmV3X3ZhbHVlW3JudW1dLA0KPiBzbG90X21hc2ssIHpl
cm8sDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2YWwsIGhleF9uZXdfdmFsdWVb
cm51bV0pOw0KPiA+ICAgI2lmIEhFWF9ERUJVRw0KPiA+IC0gICAgLyogRG8gdGhpcyBzbyBIRUxQ
RVIoZGVidWdfY29tbWl0X2VuZCkgd2lsbCBrbm93ICovDQo+ID4gLSAgICB0Y2dfZ2VuX21vdmNv
bmRfdGwoVENHX0NPTkRfRVEsIGhleF9yZWdfd3JpdHRlbltybnVtXSwNCj4gc2xvdF9tYXNrLCB6
ZXJvLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIG9uZSwgaGV4X3JlZ193cml0dGVuW3Ju
dW1dKTsNCj4gPiArICAgIC8qDQo+ID4gKyAgICAgKiBEbyB0aGlzIHNvIEhFTFBFUihkZWJ1Z19j
b21taXRfZW5kKSB3aWxsIGtub3cNCj4gPiArICAgICAqDQo+ID4gKyAgICAgKiBOb3RlIHRoYXQg
c2xvdF9tYXNrIGluZGljYXRlcyB0aGUgdmFsdWUgaXMgbm90IHdyaXR0ZW4NCj4gPiArICAgICAq
IChpLmUuLCBzbG90IHdhcyBjYW5jZWxsZWQpLCBzbyB3ZSBjcmVhdGUgYSB0cnVlL2ZhbHNlIHZh
bHVlIGJlZm9yZQ0KPiA+ICsgICAgICogb3InaW5nIHdpdGggaGV4X3JlZ193cml0dGVuW3JudW1d
Lg0KPiA+ICsgICAgICovDQo+ID4gKyAgICB0Y2dfZ2VuX3NldGNvbmRfdGwoVENHX0NPTkRfRVEs
IHNsb3RfbWFzaywgc2xvdF9tYXNrLCB6ZXJvKTsNCj4gPiArICAgIHRjZ19nZW5fb3JfdGwoaGV4
X3JlZ193cml0dGVuW3JudW1dLCBoZXhfcmVnX3dyaXR0ZW5bcm51bV0sDQo+IHNsb3RfbWFzayk7
DQo+ID4gICAjZW5kaWYNCj4NCj4gSGF2aW5nIGxvb2tlZCBmb3J3YXJkIGF0IHBhdGNoIDUsIGl0
IGFwcGVhcnMgdGhpcyBjb3VsZCBiZSBmdXJ0aGVyIGltcHJvdmVkDQo+IGJ5IGV4YW1pbmluZyBj
dHgtPnJlZ3Nfd3JpdHRlbi4NCg0KSXQncyBub3Qgb2J2aW91cyBob3cuICBUaGlzIGlzIGZvciBh
IHByZWRpY2F0ZWQgaW5zdHJ1Y3Rpb24gKGUuZy4sIGlmIChwMCkgcjIgPSBhZGQocjEsIHIwKSks
IHNvIHRoZSBjaGVja3MgbmVlZCB0byBiZSBtYWRlIGF0IHJ1bnRpbWUuICBUaGVyZSBjYW4gYmUg
bW9yZSB0aGFuIG9uZSBwcmVkaWNhdGVkIGluc3RydWN0aW9uIGluIGEgcGFja2V0IHRoYXQgd3Jp
dGVzIHRvIHRoZSBzYW1lIHJlZ2lzdGVyIGFzIGxvbmcgYXMgb25seSBvbmUgb2YgdGhlIHByZWRp
Y2F0ZXMgaXMgdHJ1ZSBhdCBydW50aW1lLg0KDQpBbSBJIG1pc3Npbmcgc29tZXRoaW5nPw0KDQoN
ClRoYW5rcywNClRheWxvcg0KDQo=

