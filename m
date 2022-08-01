Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198C158630E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 05:25:25 +0200 (CEST)
Received: from localhost ([::1]:38416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIM3X-0001Ox-KK
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 23:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vince.delvecchio@mediatek.com>)
 id 1oIM1i-0008PB-Eb
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 23:23:30 -0400
Received: from [60.244.123.138] (port=32884 helo=mailgw01.mediatek.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vince.delvecchio@mediatek.com>)
 id 1oIM1e-0006wD-Rr
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 23:23:29 -0400
X-UUID: 1b30df95cd7d47c2bffd9dd426251154-20220801
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:afffe99f-0a18-432f-9738-496ce5ba3fea, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:0f94e32, CLOUDID:a09de8cf-a6cf-4fb6-be1b-c60094821ca2,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 1b30df95cd7d47c2bffd9dd426251154-20220801
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <vince.delvecchio@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 166927382; Mon, 01 Aug 2022 11:18:13 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 1 Aug 2022 11:18:12 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Mon, 1 Aug 2022 11:18:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+NvypMfM+fCC8cKGxr9XWI+IE/cluF3x838v+izeHrbro3LAwJ2No3DsHP7x870z3Qm4A8RNnLkRfjBIKP6BrS2flq62lhJtWC+jKg2Nl6UmEr62kv3HLncWeIP2psLaBdI/ajuHtJorhVAIE40QW+3ai4UgaPrE7k/oQfszW5uyIINrK+vYEmsycMW755EgjFECbfRaB3RMrmll3Ot7U36xM5nGlqkx2xTmNoifTYoXX+4jsQK+hMULbj4/3nuADHMwo0fO5CDruafZvmMnHhrBhz3FfGor2vujNOHamfzJh+SVkKdqNJ6PaTHfz7seCWRb395pgxfyeGqtd5VZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weyOt6a886xCzpccHf9VO3/pH2P8tC9Aemon8SFe5Ns=;
 b=Skv+OZw+ZubL3CV30qm9ugt3GOgr2SuJD9t4NPNIhc88pHoiywmUS7ybz/8eiSvHJLQeUrGvM9SGM8ZnmZEH8t7kprlP5U95ZX44C/bVXNMNWN3VCngQSEKB+808oUy1jv0jlCVHIw07KKmywt2PJsKSHYZ0IsFjd5RWlVds2WBSQ8QhkWxvRLjA2is+zAlQ7lDnHDY0UPY8PdDwB7cnw+b6MMX4CJ8xF7xgaK42a9gDMtlxFlTPU/TI+PXZlJONtKacFWAZvmiYhsIpf9AEPFe8ZXBqLoJBxAMrluMrmh5o2yO+sMQ3ySJunTS5cqDvNjkLN1qJwhPBKGPDCnE6Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weyOt6a886xCzpccHf9VO3/pH2P8tC9Aemon8SFe5Ns=;
 b=oN4ouQgu/4NH5kgMrqX/KZSFrKDZtU/JB0I961NhWTtOlBi1PkFDe38ONFxego6le2FdRUamj5NqJnGfOyAjStrc6PV0Txyq+j+bgtqbIaf45Jz019Zc5CsAfisHtUwpIH/bX9vJpu8sirct/zcda1y0SlxUD88b2I6908+n9n0=
Received: from TY0PR03MB6797.apcprd03.prod.outlook.com (2603:1096:400:217::10)
 by SG2PR03MB4959.apcprd03.prod.outlook.com (2603:1096:4:df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.12; Mon, 1 Aug
 2022 03:18:10 +0000
Received: from TY0PR03MB6797.apcprd03.prod.outlook.com
 ([fe80::56b:35fe:4f65:e8f3]) by TY0PR03MB6797.apcprd03.prod.outlook.com
 ([fe80::56b:35fe:4f65:e8f3%4]) with mapi id 15.20.5482.011; Mon, 1 Aug 2022
 03:18:10 +0000
To: Peter Maydell <peter.maydell@linaro.org>, Milica Lazarevic
 <milica.lazarevic@syrmia.com>
CC: "thuth@redhat.com" <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "cfontana@suse.de" <cfontana@suse.de>,
 "berrange@redhat.com" <berrange@redhat.com>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "djordje.todorovic@syrmia.com"
 <djordje.todorovic@syrmia.com>, "mips32r2@gmail.com" <mips32r2@gmail.com>,
 "dragan.mladjenovic@syrmia.com" <dragan.mladjenovic@syrmia.com>
Subject: RE: [PATCH] disas/nanomips: Convert nanoMIPS disassembler to C
Thread-Topic: [PATCH] disas/nanomips: Convert nanoMIPS disassembler to C
Thread-Index: AQHYo1RD1wp/NSyzxUSDuA5BRkq9n62VZVWAgAP08yA=
Date: Mon, 1 Aug 2022 03:18:10 +0000
Message-ID: <TY0PR03MB6797A66CB742211212CD1B2BE29A9@TY0PR03MB6797.apcprd03.prod.outlook.com>
References: <20220729140252.66572-1-milica.lazarevic@syrmia.com>
 <CAFEAcA-N-GPKqLeQtOWVMHvB-Di4inKK8Cy9XFjT62PMeiyBRA@mail.gmail.com>
In-Reply-To: <CAFEAcA-N-GPKqLeQtOWVMHvB-Di4inKK8Cy9XFjT62PMeiyBRA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbXRrNTAxMjdcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy04ZmRlMjQyMC0xMTQ4LTExZWQtOGUwMi05NGU2ZjdmNmRlYjBcYW1lLXRlc3RcOGZkZTI0MjEtMTE0OC0xMWVkLThlMDItOTRlNmY3ZjZkZWIwYm9keS50eHQiIHN6PSIyNzE5IiB0PSIxMzMwMzc5NzQ4Nzg5NjEwNDQiIGg9Ik4wWHlHcUluOFdocTc2K1pEZWVCV056K3RTST0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cf15b87-00de-4544-ea1e-08da736c763e
x-ms-traffictypediagnostic: SG2PR03MB4959:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aMr37DinWwhuzY25ssYsc0ndPP0VwtKTnmQ83VGFwX3Y1gflikucDfiXIKo7ioFmz+G49VOyzxFDmktCFPWp139fOH8YLNV69Jrc2HKMm+0j0abI+azVlYC+oa8Su6hwWy5JtvBqBpFDL1j4r3kdrvCkjdwGJTV1qJVPx0iIE+S3I/+bjdruJmRxS3sCJBZ1tUCtAR1WPgqkvw1VPgYgdCCjo58wrHa534RWCpASe11c93f0XmKoWh+v7VESTI2e86Ty2HHXggq3SguJuczxWeNzXrf1B9ULHanH8GDQoOkhBTbj2iTJvBdNLupAN0d65WvLhwvbHd+V5/jwc90GLNr2d9jcSNRTjg+78Ckiim+eTqCd/mG2R7uFWJJnCSQJaauhXb9UIK65ZaGOXOmIChBtWyIVj6u29yux6/RbYCe4jJ3+H/jUx0KEU53JOBPE8kmF0uggrFJAck73Kg3NKWnohjnBrq/whFp5r7POb11R6DNymlod0XApwfPrjENji43gEWCzFpFju7Yy0byDxcowsiG9MTRo7HXOkSGJwzL1qcanW9Xo5o3nAL5as3LFDHZjG94Gq02C17AWsOS40CjlLg60Legb/WO4TEcPba7KquOMOPnDz/PItJpWoaZa8EyKhB97IqRHWiks0NUYRI/DA7n57ovZI/X1n1EHhjhPMAhoZ0UMkEXJ/m0x2mqP8gCvQvXjRsIwYlE1BtTRG/W+N3oDIgjNjSbBAlrrXmXY3cBVSWZbtDqKBblkueeOwdyrhUrk3XORhSTtVvl2zgXTQ1WkO2sI1ympfoEXQl9GC/Uh/pXRhqZeNDeZsmZs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6797.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(5660300002)(7416002)(316002)(4326008)(8676002)(7696005)(55016003)(66946007)(64756008)(66476007)(38070700005)(66446008)(66556008)(6506007)(76116006)(122000001)(38100700002)(33656002)(86362001)(52536014)(186003)(41300700001)(478600001)(2906002)(71200400001)(8936002)(26005)(54906003)(9686003)(110136005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVJBR2l0cjQ2WXJ5OWRMLzlORFRSUnp2NCtoVmk5dVh2bGNEYk52K0JrOUVm?=
 =?utf-8?B?eGRnT29VUnAwZlZsQ1pLVkNhYnJ4eTRIc3RhV0hUZVBaQ2tQSFAvVlc3aEdZ?=
 =?utf-8?B?b2h3MUZQUWNzeTFQMEJFRVFoNG04ZnFnVXVHV1dmY2svUUhaK05TcEtMV3pM?=
 =?utf-8?B?TjdFa1BweVN2ckFRVG1JOEVoWlJvMTJwZnlxNTI5OVpLNWtuZEp5VkFTZW1H?=
 =?utf-8?B?VDhEYjJJZVFLdVRZQzFFa1U4bk90WmxTcXM3Z3oyRUN3UGNDVG11Z1ZVam1P?=
 =?utf-8?B?ZGdKdzVaUit2TzRQbXJodUhqSE1hbm9SUXpIQmpSRHdLVWFyZjB4WmdIU3RK?=
 =?utf-8?B?UjJ4d2NaNm5nR0Q4a0UrM2lXOXZPSGFLNkVoaGd5QVhzN3hGek0xUGhnZytR?=
 =?utf-8?B?ajNKT2lXdHB5WUZLU1V6cmgyQ3RsMnJUZ0gxbjFoODliam84eVpUTVBaZkVy?=
 =?utf-8?B?OVdXb3FMQy9SMFVKOXZlR25pbUhoQ0t4Vm5Jem1haXkzNm9Cck5Yejdhdk9x?=
 =?utf-8?B?cXM4d1IvU21Na3RCSGJZOGl4cTUzQWZEVGo0ckUwSWlCR2VTUkpQbDRjL3pz?=
 =?utf-8?B?TXNxSUhscmk4eGIrT0VVbllxYytEd1hkd3BiNXpVb2J0VVhFbjRPSVQ0TFdl?=
 =?utf-8?B?bGtmcGFkcUM2ejBSM2NSWGRkZHBpK3hhNHRFVU5XeDlZQlVsb1VpYkwrbGRw?=
 =?utf-8?B?ay9GYzZCRWkybWFCTmN5ODV1Qi9PekVZbzdTQ2xzREdNaG5aai9vTjFURjZQ?=
 =?utf-8?B?cUlhTzhpa3owUFlIQVNGWVRtaUJycVJaeThUUWx4SDRVSi9tQ0k2ZU5BdHBI?=
 =?utf-8?B?cE1GMEhBaVJqcjdWQ05PRkxLN3k4L2RqNk8yNFpUZ1FoNmxEVTlhVjV1MDBT?=
 =?utf-8?B?L3JmN3VRNzY4NUJGUFFsT2ZTMnhldXJxOXAwM1JUaDVYUTJNUGdPUGdXOFZZ?=
 =?utf-8?B?N1VYVkNwMlczL2habkRBTDZZdTBBRnRKTkRxUnlNOVRyWTl2TDdvNjlrQmtP?=
 =?utf-8?B?UzRlaGJ4c1IyYThLRFJlajIyQXNJaVM0YkF4c052V01rZmUwWCtzbGgzZS9k?=
 =?utf-8?B?eGo5UWM0akRvMStpZjVKY2Z4L3c1blFOaDhGcVFoTldFeGFZaDYyUlNoMmdJ?=
 =?utf-8?B?UC95dStSSHI2MmJsekNGdjg0WEVUQUNCZ3hNazZNelJONDhxdU5YOW85RmpQ?=
 =?utf-8?B?ZVhXU3lXbS8zdUFQOFkwWjh4MEFZVU9Db3NRdmJseVVOWjZIengwUEEwVllR?=
 =?utf-8?B?cm5TZVpKeWFkY044YjhoVjhuTmtjbFFpMjY0REVqNHNLUjNqaGF5dEVpQ0x2?=
 =?utf-8?B?MTh5K09wT1J6Nm5PYlQ1ak12TWdldTRZUXFkTUxyRlVHNDhvU3l4Ymxkblo4?=
 =?utf-8?B?QnU1UThKSERSUlZFYW5BeGM0NHNTL2l6ZTY1Wko3SGtmRElQQzRqM3NIUGto?=
 =?utf-8?B?RWdHYzVac2tDNWNGRld3dS9PS1ExczJsVE9haVIzYWNKNmtpR3VnSHIxd0d1?=
 =?utf-8?B?S0xLcWZ4amlsTG8rWWMyTmxnWjhTLzRod3NxdjZuaGZIU090amlMQzRhL3NV?=
 =?utf-8?B?aGJncWpCR0h2eXVIWVV4YUFoeDNMT3dFNnV1WVlPU0lOQjUrUURFMDNHWGFQ?=
 =?utf-8?B?MklnM2xHWW5vS2ZVQW53eHQrbmZldWloZ2plY3pobHptMUxBQkQxcEtPNHB1?=
 =?utf-8?B?cGhhVzBCRTRQUWMzODBBTFR2TFpiU0pnaU9ZeW11OFRMQjNaaFFobUFGQzNW?=
 =?utf-8?B?cDBiMGNkOGNEakI2ZFRoU0dlYXg2RVRwUUFlNjNNWEhUMnBDbXBHemtZbFUx?=
 =?utf-8?B?Z3MvTyt5RWt2blhOb28vUU5SdXRWakpub3pUbTl3MUM2dHJRS3U4ZVdIRTBX?=
 =?utf-8?B?eVZ2Ti9yZXprbXZoSTlQKzErdUJkQ2xMYjRHU2cwQ0N6by92dlNhSkZvSkEr?=
 =?utf-8?B?MkVETEVZbE5lTFMzRnZGZVpZRTZaVm84bk81eFVQb1ZmbGViWFUwRHNPeTd6?=
 =?utf-8?B?K3hJUm1EWmVoSDlpeGdQems1VDdlR2ZyQmNvSFI0SGtkU3NTeWYvMWt0cFhF?=
 =?utf-8?B?cXNRUmpuTFRoVk4rUWtpQ2JuV3JJWHhwbGs5WmFRV0ZxQlJjdVMyK3crcDlI?=
 =?utf-8?B?M3FwZ0kxZDZNRUNkSXVHNE16VXd6Y0FzRi9rZHJmbjBBK1ZpVVNEbW83YVB1?=
 =?utf-8?B?eVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6797.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf15b87-00de-4544-ea1e-08da736c763e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2022 03:18:10.3374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UodgpD2pyuRH+FQ079T57Ggm4vSQNCFCirxb5ASDaKHzNIuCkkGHW88BdHoUeuZ7US6FNBxOzfr1yCW0kaVs5pOMyt6+h6kKfoqbQzPie8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB4959
X-MTK: N
X-Host-Lookup-Failed: Reverse DNS lookup failed for 60.244.123.138 (failed)
Received-SPF: pass client-ip=60.244.123.138;
 envelope-from=vince.delvecchio@mediatek.com; helo=mailgw01.mediatek.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_MSPIKE_H2=-0.001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Reply-to:  Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
From:  Vince Del Vecchio via <qemu-devel@nongnu.org>

T24gRnJpLCAyOSBKdWwgMjAyMiBhdCAxMDoxOCwgUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVs
bEBsaW5hcm8ub3JnPiB3cm90ZToNCj4gLi4uDQo+IElzIGl0IHBvc3NpYmxlIHRvIGJyZWFrIHRo
aXMgZG93biBpbnRvIHNtYWxsZXIgcGllY2VzIHNvIGl0IGlzbid0IG9uZSBzaW5nbGUgZW5vcm1v
dXMgNTAwMCBsaW5lIHBhdGNoID8NCj4gDQo+IEkgZ3Vlc3MgcGFydGlhbCBjb252ZXJzaW9uIGlz
IGxpa2VseSB0byBydW4gaW50byBjb21waWxhdGlvbiBkaWZmaWN1bHRpZXMgbWlkLXNlcmllczsg
aWYgc28gd2UgY291bGQgZG8gImRpc2FibGUgdGhlIGRpc2Fzc2VtYmxlcjsgY29udmVydCBpdDsg
cmVlbmFibGUgaXQiLg0KPiANCj4gVGhlIHJhdGlvbmFsZSBoZXJlIGlzIGNvZGUgcmV2aWV3IC0t
IHJldmlld2luZyBhIHNpbmdsZSBodWdlIHBhdGNoIGlzIGVzc2VudGlhbGx5IGltcG9zc2libGUs
IHNvIGl0IG5lZWRzIHRvIGJlIGJyb2tlbiBkb3duIGludG8gY29oZXJlbnQgc21hbGxlciBwaWVj
ZXMgdG8gYmUgcmV2aWV3YWJsZS4NCg0KSGkgUGV0ZXIsDQoNClNvbWV0aGluZyBsaWtlIDkwJSBv
ZiB0aGUgcGF0Y2ggaXMgcHVyZWx5IG1lY2hhbmljYWwgdHJhbnNmb3JtYXRpb25zIG9mIHdoaWNo
IEkndmUgZXhjZXJwdGVkIHR3byBleGFtcGxlcyBiZWxvdy4gIChUaGVyZSBhcmUgMy00IGNodW5r
cyBvZiBtZWNoYW5pY2FsIHRyYW5zZm9ybWF0aW9ucywgb2Ygd2hpY2ggSSd2ZSBzaG93biB0aGUg
bW9zdCBjb21wbGljYXRlZCB0eXBlIHRoYXQgYWNjb3VudHMgZm9yIH42MCUgb2YgdGhlIGNoYW5n
ZWQgbGluZXMuKSAgRGlkIHlvdSBpbnRlbmQgdG8gcmV2aWV3IHRoaXMgYnkgaGF2aW5nIGEgaHVt
YW4gaW5zcGVjdCBhbGwgb2YgdGhlc2U/DQoNCldvdWxkIGl0IGJlIGZlYXNpYmxlIGluc3RlYWQg
dG8gcHJvdmlkZSBhIHNlZCBzY3JpcHQgdG8gZWZmZWN0IHRoZSBtZWNoYW5pY2FsIHBhcnRzIG9m
IHRoZSBwYXRjaCAodGhlIHJldmlld2VyIGNvdWxkIHJldmlldyB0aGUgc2NyaXB0LCBhcHBseSBp
dCB0aGVtc2VsdmVzIHRvIHZlcmlmeSBlcXVpdmFsZW5jZSBpZiBkZXNpcmVkLCBhbmQgc3BvdCBj
aGVjayB0aGUgcmVzdWx0KSB0b2dldGhlciB3aXRoIGEgKG11Y2ggc21hbGxlcikgbm9uLW1lY2hh
bmljYWwgZGlmZj8NCg0KLVZpbmNlDQoNCg0KQEAgLTIwMDQsMTcgKzE3NDAsMTcgQEAgc3RkOjpz
dHJpbmcgTk1EOjpBRERfUyh1aW50NjQgaW5zdHJ1Y3Rpb24pDQogICogICAgIHJ0IC0tLS0tDQog
ICogICAgICAgICAgcnMgLS0tLS0NCiAgKi8NCi1zdGQ6OnN0cmluZyBOTUQ6OkFERElVXzMyXyh1
aW50NjQgaW5zdHJ1Y3Rpb24pDQorc3RhdGljIGNoYXIgKkFERElVXzMyXyh1aW50NjQgaW5zdHJ1
Y3Rpb24pDQogew0KICAgICB1aW50NjQgcnRfdmFsdWUgPSBleHRyYWN0X3J0XzI1XzI0XzIzXzIy
XzIxKGluc3RydWN0aW9uKTsNCiAgICAgdWludDY0IHJzX3ZhbHVlID0gZXh0cmFjdF9yc18yMF8x
OV8xOF8xN18xNihpbnN0cnVjdGlvbik7DQogICAgIHVpbnQ2NCB1X3ZhbHVlID0gZXh0cmFjdF91
XzE1X3RvXzAoaW5zdHJ1Y3Rpb24pOw0KIA0KLSAgICBzdGQ6OnN0cmluZyBydCA9IEdQUihjb3B5
KHJ0X3ZhbHVlKSk7DQotICAgIHN0ZDo6c3RyaW5nIHJzID0gR1BSKGNvcHkocnNfdmFsdWUpKTsN
Ci0gICAgc3RkOjpzdHJpbmcgdSA9IElNTUVESUFURShjb3B5KHVfdmFsdWUpKTsNCisgICAgY29u
c3QgY2hhciAqcnQgPSBHUFIoY29weV91aShydF92YWx1ZSkpOw0KKyAgICBjb25zdCBjaGFyICpy
cyA9IEdQUihjb3B5X3VpKHJzX3ZhbHVlKSk7DQorICAgIGNvbnN0IGNoYXIgKnUgPSBJTU1FRElB
VEVfVUkoY29weV91aSh1X3ZhbHVlKSk7DQogDQotICAgIHJldHVybiBpbWc6OmZvcm1hdCgiQURE
SVUgJXMsICVzLCAlcyIsIHJ0LCBycywgdSk7DQorICAgIHJldHVybiBpbWdfZm9ybWF0KCJBRERJ
VSAlcywgJXMsICVzIiwgcnQsIHJzLCB1KTsNCiB9DQogDQogDQpAQCAtMjAyNywxNSArMTc2Mywx
NSBAQCBzdGQ6OnN0cmluZyBOTUQ6OkFERElVXzMyXyh1aW50NjQgaW5zdHJ1Y3Rpb24pDQogICog
ICAgIHJ0IC0tLS0tDQogICogICAgICAgICAgcnMgLS0tLS0NCiAgKi8NCi1zdGQ6OnN0cmluZyBO
TUQ6OkFERElVXzQ4Xyh1aW50NjQgaW5zdHJ1Y3Rpb24pDQorc3RhdGljIGNoYXIgKkFERElVXzQ4
Xyh1aW50NjQgaW5zdHJ1Y3Rpb24pDQogew0KICAgICB1aW50NjQgcnRfdmFsdWUgPSBleHRyYWN0
X3J0XzQxXzQwXzM5XzM4XzM3KGluc3RydWN0aW9uKTsNCiAgICAgaW50NjQgc192YWx1ZSA9IGV4
dHJhY3Rfc19fc2UzMV8xNV90b18wXzMxX3RvXzE2KGluc3RydWN0aW9uKTsNCiANCi0gICAgc3Rk
OjpzdHJpbmcgcnQgPSBHUFIoY29weShydF92YWx1ZSkpOw0KLSAgICBzdGQ6OnN0cmluZyBzID0g
SU1NRURJQVRFKGNvcHkoc192YWx1ZSkpOw0KKyAgICBjb25zdCBjaGFyICpydCA9IEdQUihjb3B5
X3VpKHJ0X3ZhbHVlKSk7DQorICAgIGNvbnN0IGNoYXIgKnMgPSBJTU1FRElBVEVfSShjb3B5X2ko
c192YWx1ZSkpOw0KIA0KLSAgICByZXR1cm4gaW1nOjpmb3JtYXQoIkFERElVICVzLCAlcyIsIHJ0
LCBzKTsNCisgICAgcmV0dXJuIGltZ19mb3JtYXQoIkFERElVICVzLCAlcyIsIHJ0LCBzKTsNCiB9
DQogDQo=

