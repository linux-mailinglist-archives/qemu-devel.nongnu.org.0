Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B695467D14B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 17:25:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL52E-0001Tu-BM; Thu, 26 Jan 2023 11:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninadpalsule@us.ibm.com>)
 id 1pL52B-0001Sh-Dt; Thu, 26 Jan 2023 11:23:31 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninadpalsule@us.ibm.com>)
 id 1pL527-0007OI-Ue; Thu, 26 Jan 2023 11:23:30 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30QFXYPb022533; Thu, 26 Jan 2023 16:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : date :
 message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=u2vz3V80M66/YrGo9v7MfZotGEu/ikMdayh0N1XmSnQ=;
 b=DwtVxYA6RBIaWVTAZSwEInFbjM1Dyq1rrdlc1Zvu/UFoGfUyQ/VWDKBOzFmB65VvXhvu
 Uf5yznQ2xZUW/GvX9uOLJ7EA+UtULNq1Nelq/EwueVAhjuL5CKBk180s0BZxPdkYvus4
 pLwM24fOQuJyvKUJS2b50KqE4jFt8fsNu86YA8U27BlcG5c5nQyiCdTTLkV/y915ZOb8
 G5t33cI1xeL94Fzlo0chx0UGrSV11C+oCWOK4Vqc3myzvvhjTVKmc7Bs0LFcVB/57cRD
 oNN3HuiEg604GwB2BtaBMXuWs0EKmd2sAB6JuLAXMJNgO+vQrm0HHNY2fvRuT+2hnmMh UA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nbt6rmyw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jan 2023 16:23:15 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30QFni5V002818;
 Thu, 26 Jan 2023 16:23:15 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nbt6rmyut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jan 2023 16:23:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J95J1WG+K7dITkuBgQ4FqvxBaEddlMrLdDsNOtxj0iTZLCpxoxvrn4ro3lydPrxISicNofCIvAtYRPzu4MB2d5OLhSl3+8E+QFLC8Tgmg5dXAx8FM2hlcOol9QuhMuU1Nt5lixgr07S2cenGnqlhABUOBteqWY6m2gvSy4/hAhMMsVI9C9Uvv4Z4K/n654s6zSb+qKtybuZKdq3dSGNQZMjyWevw1OMNF9WM7bsFtvekgpEHj8P+JMsSPPPl31avxfVzvKExFJN2R+9VVw81TFV4zHPAyskUyuTQ4NAB4v2MZpBeAwDuCaRW7pFh9Pz8PJvenjtZmoFsuCZ2BbboHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2vz3V80M66/YrGo9v7MfZotGEu/ikMdayh0N1XmSnQ=;
 b=TOVioU9THQKhyyIeNl2LiXAd5UAkstdDzoY4APtAqCJt1d4zE/9Jp5nhxKpF0xLpxh+RxTv7AQho5mC176YdrGgnb1MkuXjIbirTAyThj/gmb0pCqkBgCm2zvAvE0xUOK3SlbGvjlz2DwL5Ivwx8MzsPO3fEFKoqHMZUBwa8pwn+NRLuDGFrFv5aQYs2cqOKhj/HwV6K116lvHqfrMFzfcf6kdXEeKoigeAl45usitPT6OvTMsKeHtCxyKHqQjHvQ0gqcjYN1v4WlN1nTggSq/N2SIddpUS/bYZ0ZgwT/zMieQv3NcUlZBaL9r6oNePbqfZyUbMk8NeHe6eQjenDxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=us.ibm.com; dmarc=pass action=none header.from=us.ibm.com;
 dkim=pass header.d=us.ibm.com; arc=none
Received: from MN2PR15MB3502.namprd15.prod.outlook.com (2603:10b6:208:ff::26)
 by SN7PR15MB5683.namprd15.prod.outlook.com (2603:10b6:806:347::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 16:23:12 +0000
Received: from MN2PR15MB3502.namprd15.prod.outlook.com
 ([fe80::be97:8dd6:5058:a62d]) by MN2PR15MB3502.namprd15.prod.outlook.com
 ([fe80::be97:8dd6:5058:a62d%5]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 16:23:12 +0000
From: Ninad S Palsule <ninadpalsule@us.ibm.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, "peter@pjd.dev"
 <peter@pjd.dev>
CC: "andrew@aj.id.au" <andrew@aj.id.au>, "hskinnemoen@google.com"
 <hskinnemoen@google.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "kfting@nuvoton.com" <kfting@nuvoton.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "philmd@linaro.org" <philmd@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Topic: [EXTERNAL] Re: [PATCH v4 3/5] hw/nvram/eeprom_at24c: Add
 init_rom field and at24c_eeprom_init_rom helper
Thread-Index: AQHZMN2HjTOj4RpcukKp4ueV4IqnkK6wSHCAgAA2NwA=
Date: Thu, 26 Jan 2023 16:23:12 +0000
Message-ID: <5ADC51CD-F3D7-4F51-B125-9480C7FE86B0@us.ibm.com>
References: <3C616E21-EED8-4A17-9FC9-970939CC0926@contoso.com>
 <60a7ed30-b9f7-4943-5afe-fcd826ee6783@kaod.org>
In-Reply-To: <60a7ed30-b9f7-4943-5afe-fcd826ee6783@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR15MB3502:EE_|SN7PR15MB5683:EE_
x-ms-office365-filtering-correlation-id: 0cad29c3-93a6-4a7b-3128-08daffb99ef5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QIo6qJ/F9vNBMzxC1udWZMoFLFzlrEHgtB5o5cVU25uUx+alRwowGNQkC3QQpABepgHent/s1MLrZc5SfGBL3yNZq/URugG591uCaExRBYkUcHW8Wh/PrDifQSM/ixPlAP/Jk3Iwo3A8BBilQXH9CCOT66aqWUSdLWZFVbxnMJLfVbrc3LaoWatbw8mJC/wwOpMKSxZVHtoo+joyDHbnw4sVximqlXDsyan0adHKLjBeDbFDABHstamBowsaK1UyTIw9kyj6iQQHePAGQQAA2dNUn/uzsrDE2Jfh3Trl4ORK9fI8AHXAUnegp/l9xHQU/R1WTeAUYGBsPeONJ8n18uWBw7loaBPMIT6/pkVnoZGnHlP4J/yoO4NAn1SjQ9lqNHbSQgssveSHzJfWR4FbV5tYGKEeFX5fv5AfiZnYIHqHAXx5IFDAYSzWNiXWRvVChvrVnnjsqfjNNxkfW114xdcv0TwuiaShtL2+7bv5WhABUh2T3LdQrl4NPo5j5a8LtjmyQAeMWmJqFabPA0ZpEDsR8ECCG9Rj3YR1cgfNH2VITOOULXHHiJ6w4rgLtnG5r2vLiMz1PPy4DJzH/r/wDSafnL0nfi7nEvaavKSu054lxPdzMiiw9p6hFY11sWkTo49B8HC1tEf///P1r5LSTZ579OPbAweRfjE5lt9+eZAHPP6D74Izc4MG5Iroc4jfabaiJNYddHiY9+6WjPLqN+YLMh9eTU3flxaVS5fc+ZM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR15MB3502.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199018)(66446008)(71200400001)(86362001)(316002)(66946007)(91956017)(8676002)(2616005)(64756008)(6506007)(186003)(53546011)(110136005)(6486002)(478600001)(66476007)(7416002)(5660300002)(54906003)(38070700005)(8936002)(4326008)(33656002)(66556008)(41300700001)(122000001)(2906002)(38100700002)(76116006)(6512007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vm41ZmZhTUw0TlR5R2VqRVBBTlJLbTlqODFHRTdVcmxWdnBLZkNkN2Y1N3Zv?=
 =?utf-8?B?OFNwN1lvM2xmREFscTh2ZFZJcENjMnc2bXRzNHY0Tm1HdXdwaFQrenN3VEE5?=
 =?utf-8?B?cCtNS3l4Ny8zS1NMWklRQnM2OHk3bDNaSDRrYkU3d1Y3d3hEQy9nZG4yalJn?=
 =?utf-8?B?MzhCZjZqcjFwV0VSb3R6Tzc2bzZGWkJscnM4dWRJWHU3TnkyaHhUR0h3YitG?=
 =?utf-8?B?TDlPS2EwUVhGbEdoMitrcENqR0IrMHNYL0RoUWlXVHlDY0JaWno5aEx0alhO?=
 =?utf-8?B?dHdwTEJxaFl6bDh2YlJZTTRxNzNJRGsrc0ZTdjVUQlZ4RHBqSVJ3SWJKa0I4?=
 =?utf-8?B?R0hHNVhYS0xIdi9iRTUraXBhN1ZPeTlzMllTUm02c1RvR0tBa0w4c0cwRGgx?=
 =?utf-8?B?RXV3d0szUDYzK25oRThNZEU3WFR5OUx4bkczcVpjanRhbjhORkl2S2t2U2cx?=
 =?utf-8?B?UWNYL3Z6dXBOUFlCM0dYTXZOWXNudFdaTmdjNkU1alBKRTdXdnlwSTJuWEJw?=
 =?utf-8?B?NVBrTEhCc0xGZENRRFZOTzdKQ0p1aGFHVS9HQXhnTkw2RTYyMloyYjB2Znh1?=
 =?utf-8?B?YUtMVHZxOWsvbWxJVDlRYkhYK2l1RkxtU2hWK3VhRlFodnRjRlE2bFJoTFMw?=
 =?utf-8?B?UWxOYWE1NmtYVlJHdWhvU2dCdGlnMVY1di9Pa1gvWFl5cXFCRkd6MEVncVRl?=
 =?utf-8?B?Q0RkdUxJd0xTcVJpOHQ4SElacHoyMVVxZjJtZk5ibmQ5aTRIQkdGVW1yOGxX?=
 =?utf-8?B?TVB3eTZaREQwbEt0YWhtbnhYTmpETDh3U0JoRTJIWTVtbXJ2Yi9yZzU3eERv?=
 =?utf-8?B?ek03QVhDM1FlK0lOek12ckQzRjI4RkFoSkxrdDFKamQ3ZURsMzdNUnViRERX?=
 =?utf-8?B?WlpUZGhhWVdwQWE5MmdDTUJVeU9oN3hRYmMzblZEZi9MZjNhSWJhaXl4elJs?=
 =?utf-8?B?WkN0MmF3ZjBEK1BSOUt2ZmRDaXd1YVpjdW1VL0hoYVN3WlRoM05yMzlxcEtF?=
 =?utf-8?B?Z0tlY0NGSmdWNHBPemMxcHFPbEwwaHpaaGI0MDFYYXJnV2VURGk5MExBS0dj?=
 =?utf-8?B?cEhMNXRPMkxGZ3psVXVQOUhWdlpUdUk5a0hHbzdMOTV2M010MjZPenlaYWVh?=
 =?utf-8?B?b3pPK0JoWm81MVp4UlNQNERCV3cwZmN4Zk90R3l1VmZiUW8rNGV4Tk5hR3Rw?=
 =?utf-8?B?VThMZDdFMU15TzF5ZDJzZEViR0VJRkxEREY4VTZ3K0o3U1hlaEgrSEVTaWZH?=
 =?utf-8?B?U2ZROCtqRVJjOTJyc1RabTRIVGlOck1JaFNtMDNtTVhtM21pQVgwY0VmSmd2?=
 =?utf-8?B?QWh6dVVSUDYxZDRLcFd4N0wrdFFKMC9QT0M1V2U4dDc1cmZ0STlUOTI5ejZL?=
 =?utf-8?B?N214dlYxNDl3amhabnFWL25NYVJvSDFiS09PQWRZRWJIdjVvbkNpVkVqOGRm?=
 =?utf-8?B?ZTJoQURNQUlKNzVZaGlKWUJPTXVXUUxPVlltQng0UjQvQjVpSHBrUVJNUElk?=
 =?utf-8?B?SHFGbS9FWWtJNWdGamxjemprTkpBNFlLV1NSV1lVNWRSZlI4WUdQL0JDM2FG?=
 =?utf-8?B?dE1UTHliQk0wbXNrWHZ0OWJldCt6S3FydVZTMC9RbEc5YXBSWlVpSXhLTy9I?=
 =?utf-8?B?V0ZjSUF3VytNcld5SVpIcm5adFFZSk5MUmtYQWF6TlNoQWt4N3BRelZ2VnZp?=
 =?utf-8?B?cVd6eUtDeWJyUG1CRzVuUVAwWDZrdm1Ha3pOY2hyUCtoODRhL0pUN0NmNGh0?=
 =?utf-8?B?bk1TZ3BvYVNxa1ZFUVRRSmFMWmRBODE3cnBjRldmOVo4YjQrSkVod0oyWXRh?=
 =?utf-8?B?ZjBLRngzU3hxQlJoL2VuZWdXL1RwSVZzMU1hRCtOQUNXOE1FM1pIRXhSdWhy?=
 =?utf-8?B?RWkwN1lNZnRqQ2phRFhFRkROTUwrbXZtUGJiS0NIMTZYM2tqSG14K1Y0NWtK?=
 =?utf-8?B?Q3p3T1Vncmxtd21xeGg2NDVGcy9pUHVRTmJYVjdhM0tmc0MzVk9xa2h2c0Q3?=
 =?utf-8?B?bXNYSUdjOHRFSVJyKy93cFdUSlMzVEJxUloxeGd3VWo3MGNxNzJtdGwyNEg0?=
 =?utf-8?B?WDhkdzdZQUNtR05hQlhFRXlaT1JlTmkrZnJaNWVxcUttd0dwYU5lMTQ1WGo1?=
 =?utf-8?B?ZFdkVFNPWnpXdXZDRmFiQ1NGcVNUS3JvUjZNaGxla3NxT1U4UjZGSTZRZHpv?=
 =?utf-8?B?eERpaHhFTm1TN0Zxcm1PY2hkSGUybmxmNTVZcE9IaThJTVVpaGxJVHo5MkVR?=
 =?utf-8?B?d2JUV0NhU0dvL1dHcDJPd2ZvUm5RPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D01A23682BC1A408CAA6ED0A6D23E06@namprd15.prod.outlook.com>
X-OriginatorOrg: us.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR15MB3502.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cad29c3-93a6-4a7b-3128-08daffb99ef5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 16:23:12.7091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e0ktdypsM48a6BE0hZvrlYK3l6RA+qOhtxVSBIB0z1ZS7Bd1c4IWWNmq0TrxTT47ntdxFB+XBomjB11gKxfWBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR15MB5683
X-Proofpoint-ORIG-GUID: Z5DgiddKZ9MrrqUKfwfC1kNE2e-SlCc_
X-Proofpoint-GUID: ML2HKf7D5M3Apxx2hxRTNifGblrmSbhL
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
Subject: RE: [PATCH v4 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_07,2023-01-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 mlxscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301260156
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=ninadpalsule@us.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

SGkgQ2VkcmljLA0KDQpHb29kIHN1Z2dlc3Rpb24gYnV0IHdlIHdpbGwgbm90IGJlIGFibGUgdG8g
c2hhcmUgdGhvc2UgRUVQUk9NIGltYWdlIGZpbGVzIHlldC4NCldlIGFyZSB0cnlpbmcgdG8gZmln
dXJlIG91dCBob3cgdG8gc2FuaXRpemUgdGhlbS4gDQoNCu+7v09uIDEvMjYvMjMsIDE6MDkgQU0s
ICJDw6lkcmljIExlIEdvYXRlciIgPGNsZ0BrYW9kLm9yZyA8bWFpbHRvOmNsZ0BrYW9kLm9yZz4+
IHdyb3RlOg0KDQoNCkhlbGxvIE5pbmFkLA0KDQoNCk9uIDEvMjUvMjMgMTc6NTMsIE5pbmFkIFMg
UGFsc3VsZSB3cm90ZToNCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgRGVsZXZvcnlhcyBwZXRlckBw
amQuZGV2IDxtYWlsdG86cGV0ZXJAcGpkLmRldj4gPG1haWx0bzpwZXRlckBwamQuZGV2IDxtYWls
dG86cGV0ZXJAcGpkLmRldj4+DQo+IA0KPiBSZXZpZXdlZC1ieTogSm9lbCBTdGFubGV5IGpvZWxA
am1zLmlkLmF1IDxtYWlsdG86am9lbEBqbXMuaWQuYXU+IDxtYWlsdG86am9lbEBqbXMuaWQuYXUg
PG1haWx0bzpqb2VsQGptcy5pZC5hdT4+DQo+IA0KPiBUZXN0ZWQtYnk6IE5pbmFkIFBhbHN1bGUg
bmluYWRwYWxzdWxlQHVzLmlibS5jb20gPG1haWx0bzpuaW5hZHBhbHN1bGVAdXMuaWJtLmNvbT4g
PG1haWx0bzpuaW5hZHBhbHN1bGVAdXMuaWJtLmNvbSA8bWFpbHRvOm5pbmFkcGFsc3VsZUB1cy5p
Ym0uY29tPj4NCj4gDQo+IEhpIFBldGVyLA0KPiANCj4gSSBhcHBsaWVkIHlvdXIgcGF0Y2hlcyBh
bmQgbWFkZSBzdXJlIHRoYXQgZGlmZmVyZW50IEVFUFJPTSBpbWFnZXMgY2FuIGJlIGxvYWRlZCBm
cm9tDQo+IA0KPiBhcHByb3ByaWF0ZSBpbWFnZSBmaWxlcyBhbmQgaXQgaXMgd29ya2luZyBhcyBl
eHBlY3RlZC4NCg0KDQpNYXkgYmUgeW91IGNvdWxkIGNvbnRyaWJ1dGUgYW4gZWVwcm9tIHF0ZXN0
ID8gSSB3b3VsZCBwdXQgdGhlIGRhdGEgdW5kZXINCnRlc3RzL2RhdGEvZWVwcm9tLg0KDQoNClRo
YW5rcywNCg0KDQpDLg0KDQoNCg0KDQo+IA0KPiAjIFVzZWQgZm9sbG93aW5nIGNvbW1hbmQgdG8g
aW52b2tlIHRoZSBxZW11Lg0KPiANCj4gcWVtdS1zeXN0ZW0tYXJtIC1NIHJhaW5pZXItYm1jIC1u
b2dyYXBoaWMgXA0KPiANCj4gLWtlcm5lbCBmaXRJbWFnZS1saW51eC5iaW4gXA0KPiANCj4gLWR0
YiBhc3BlZWQtYm1jLWlibS1yYWluaWVyLmR0YiBcDQo+IA0KPiAtaW5pdHJkIG9ibWMtcGhvc3Bo
b3ItaW5pdHJhbWZzLnJvb3Rmcy5jcGlvLnh6IFwNCj4gDQo+IC1kcml2ZSBmaWxlPW9ibWMtcGhv
c3Bob3ItaW1hZ2Uucm9vdGZzLndpYy5xY293MixpZj1zZCxpbmRleD0yIFwNCj4gDQo+IC1hcHBl
bmQgInJvb3R3YWl0IGNvbnNvbGU9dHR5UzQsMTE1MjAwbjggcm9vdD1QQVJUTEFCRUw9cm9mcy1h
IiBcDQo+IA0KPiAtZGV2aWNlIGF0MjRjLWVlcHJvbSxidXM9YXNwZWVkLmkyYy5idXMuMCxhZGRy
ZXNzPTB4NTEsZHJpdmU9YSxyb20tc2l6ZT0zMjc2OCAtZHJpdmUgZmlsZT10cG0uZWVwcm9tLmJp
bixmb3JtYXQ9cmF3LGlmPW5vbmUsaWQ9YSBcDQo+IA0KPiAtZGV2aWNlIGF0MjRjLWVlcHJvbSxi
dXM9YXNwZWVkLmkyYy5idXMuNyxhZGRyZXNzPTB4NTAsZHJpdmU9Yixyb20tc2l6ZT02NTUzNiAt
ZHJpdmUgZmlsZT1vcHBhbmVsLmVlcHJvbS5iaW4sZm9ybWF0PXJhdyxpZj1ub25lLGlkPWIgXA0K
PiANCj4gLWRldmljZSBhdDI0Yy1lZXByb20sYnVzPWFzcGVlZC5pMmMuYnVzLjcsYWRkcmVzcz0w
eDUxLGRyaXZlPWMscm9tLXNpemU9NjU1MzYgLWRyaXZlIGZpbGU9bGNkLmVlcHJvbS5iaW4sZm9y
bWF0PXJhdyxpZj1ub25lLGlkPWMgXA0KPiANCj4gLWRldmljZSBhdDI0Yy1lZXByb20sYnVzPWFz
cGVlZC5pMmMuYnVzLjgsYWRkcmVzcz0weDUwLGRyaXZlPWQscm9tLXNpemU9NjU1MzYgLWRyaXZl
IGZpbGU9YmFzZWJvYXJkLmVlcHJvbS5iaW4sZm9ybWF0PXJhdyxpZj1ub25lLGlkPWQgXA0KPiAN
Cj4gLWRldmljZSBhdDI0Yy1lZXByb20sYnVzPWFzcGVlZC5pMmMuYnVzLjgsYWRkcmVzcz0weDUx
LGRyaXZlPWUscm9tLXNpemU9NjU1MzYgLWRyaXZlIGZpbGU9Ym1jLmVlcHJvbS5iaW4sZm9ybWF0
PXJhdyxpZj1ub25lLGlkPWUgXA0KPiANCj4gLWRldmljZSBhdDI0Yy1lZXByb20sYnVzPWFzcGVl
ZC5pMmMuYnVzLjksYWRkcmVzcz0weDUwLGRyaXZlPWYscm9tLXNpemU9MTMxMDcyIC1kcml2ZSBm
aWxlPXZybS5lZXByb20uYmluLGZvcm1hdD1yYXcsaWY9bm9uZSxpZD1mIFwNCj4gDQo+IC1kZXZp
Y2UgYXQyNGMtZWVwcm9tLGJ1cz1hc3BlZWQuaTJjLmJ1cy4xMCxhZGRyZXNzPTB4NTAsZHJpdmU9
Zyxyb20tc2l6ZT0xMzEwNzIgLWRyaXZlIGZpbGU9dnJtLmVlcHJvbS5iaW4sZm9ybWF0PXJhdyxp
Zj1ub25lLGlkPWcgXA0KPiANCj4gLWRldmljZSBhdDI0Yy1lZXByb20sYnVzPWFzcGVlZC5pMmMu
YnVzLjEzLGFkZHJlc3M9MHg1MCxkcml2ZT1oLHJvbS1zaXplPTY1NTM2IC1kcml2ZSBmaWxlPW52
bWUuZWVwcm9tLmJpbixmb3JtYXQ9cmF3LGlmPW5vbmUsaWQ9aCBcDQo+IA0KPiAtZGV2aWNlIGF0
MjRjLWVlcHJvbSxidXM9YXNwZWVkLmkyYy5idXMuMTQsYWRkcmVzcz0weDUwLGRyaXZlPWkscm9t
LXNpemU9NjU1MzYgLWRyaXZlIGZpbGU9bnZtZS5lZXByb20uYmluLGZvcm1hdD1yYXcsaWY9bm9u
ZSxpZD1pIFwNCj4gDQo+IC1kZXZpY2UgYXQyNGMtZWVwcm9tLGJ1cz1hc3BlZWQuaTJjLmJ1cy4x
NSxhZGRyZXNzPTB4NTAsZHJpdmU9aixyb20tc2l6ZT02NTUzNiAtZHJpdmUgZmlsZT1udm1lLmVl
cHJvbS5iaW4sZm9ybWF0PXJhdyxpZj1ub25lLGlkPWoNCj4gDQoNCg0KDQoNCg0K

