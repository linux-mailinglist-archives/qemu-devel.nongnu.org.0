Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD086109D0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:50:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooIDz-0006oR-60; Fri, 28 Oct 2022 01:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1ooIDw-0006nd-4e
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:48:08 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1ooIDf-0006o1-U2
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:48:07 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RMO7tM005927
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=corp-2022-7-12;
 bh=a9CeHsaEtAOkAhLRdEiw3Q0F/FOB2h81MD/JVlUTLwo=;
 b=2/femCWxViSNaoAi9DSkuFJHFLvtDed3ZK6wGJRa7hSTf0BL9rHV6nMx1q4stHSzm0/P
 sYR2lK3E1E5UMcJJOAJdkl8Uadp6ae/O408WO/ERkP1wCxDqgEaGmPjfUpye4F/nAy+2
 IV1T3kMtTaSQjnDlHkcVPL192oHISUucumlUTfsmTNQz9B0GFP4YOHFWRLeDtCLxBFcm
 7SqE1r4DQlAk8fFP6b86l9jD2jQxTP9iQ7jsehVHPsYqWBlMxH6/zEe8ttM6f+kb4rID
 /BDNv3Qjj36mJs2zS0wX2itMHN4Deh3OwOCX+VQXE7qxm/E1+CVDr21XOXMMKD5VYxW9 ag== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kfax7uw2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:47:46 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29S24qBp026557
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:47:45 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3kfagqrdu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:47:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjcmJmfeRUDHcrIWUtRnnrl8S07bBk4DmGSw9OSFk6Fyoi3hpb76d8yOBMQGIZtGZ0c0+dY+AhhB0FI7MrOqgOwU8QGxbmoaOlV0VJihaMDqzA6uXFbQDSG7cpVm948dgSlDgDt/nr40KqWO7xTFdu2fy6etvIJ/sJJWVJBr6WrKxQbZcmR31WG6TbmWHvsGBz+EZnLL9rS02uONHye/04Lf58hWCTnmiSiqdgfFwU8fWOlBrqBULimR8IPqThILcC4DS2LFSPCSY8XZSHztFsD6KTg78fc1M/xpSTZYn9ZaZHL4bvT7Db9QoiVJOQ6jt1pnq/9GZ2akF/ROiRfzzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9CeHsaEtAOkAhLRdEiw3Q0F/FOB2h81MD/JVlUTLwo=;
 b=HuOjFTIRrd4ISBWRKtgvyCfMD1af1rFhIGRWQoYX+F/WVf4Ip1k3NC2xd+4lLeDHzHL9d12d8UYyXQD9SDwYcxK9flRKtfAC1z2xq1YTMYLY0/R9oqnxcvDekoH4OTy72Qjg26jH9DewxFjukpZWnqijpPa3xpFIJYs8aX5KjvqQlfHk+yx33Xvypltz7KpW3WojwsbcvVfqEMU3Y+mh4ADeNMqOu8Pt/B0xg5kGGj5Bl3ws7fYZfTjwnyT3Idq4vdbARNG1Xv+rFak6NeouwEkgo/9oDYG3N/HC+vHbxpsHdIUdSJ+YI3y5gMamFvbsWZ5f593sNcNyWKxUS3BmVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9CeHsaEtAOkAhLRdEiw3Q0F/FOB2h81MD/JVlUTLwo=;
 b=IC5cpvgCyukFqtHwb+pHwCFZUXa/gfqscJhvFpB7jg5mvRWNKV+a6LaLPSEQjcYGPh65Fp9UGe9WEmZADwEJ84nW3OFCfAv95QUZmn1DQdexqK+shbmvPkhXFG87Hv4f7JtvAHQZeN7zF4D6MKUpSPzrrF08as86AvTknetfJ8I=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by CY8PR10MB6635.namprd10.prod.outlook.com (2603:10b6:930:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 05:47:43 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::2c4d:7e24:3857:36d6]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::2c4d:7e24:3857:36d6%4]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 05:47:43 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: QEMU Devel Mailing List <qemu-devel@nongnu.org>
Subject: megasa regression in 7.1?
Thread-Topic: megasa regression in 7.1?
Thread-Index: AQHY6pDMdrjfk8egN0aH8V9T88aglw==
Date: Fri, 28 Oct 2022 05:47:43 +0000
Message-ID: <4A0D1260-DB8D-47CA-9369-6F3C0B7296C9@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR10MB3255:EE_|CY8PR10MB6635:EE_
x-ms-office365-filtering-correlation-id: c70d3b5c-dcfa-403e-22f5-08dab8a7ef19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I//WWOd8MI8Xh78nzDVZUh4B2nOAEZi1aputct1XpYTETTmAAuscx5PKM4HS+ScpdvK6JvLN8cAWLIxEFSitgwKeYivkBJea+X7k7S5uzv1ChjkZrD+w2LaAuMt28XbqzVzVc52meV58A3Vbx5jEMQ9PkY/erjuV0zuUl5hWGOEWH8jqLEllaPo1lJVbN8FLJ8ZjOtt3NN13OV0B13AodPMJG+vjG778Q4wbJ/h7se/Ubknqff+2cXz9hkgn7H2FeQsPHidJEVqy8j84CDmzmMX8kwtkeK88TaFSCGgNKxUiR7j8GzTPF6b/Fq/OTom1bKoY5z8FxCCOgErwJFME6MIBO6iqGRkXx5vA7XqWJ12UCr3Y8MbUM8y2bLDR2scW46Ve46gRqeAiWhWKwuJp+SLBYbKuukR3YEiUmFzDVT7hjWwRhoupV8B6dqO+cfZ6f6esXw0syvJYvfbSFqy3UvWOaW80OV+imWRPzZqpXx5qfXxjBDnW+qLn2/adW517Peaj9O0fGBUzPOYotuK9ATTPHBxgsfPZlYXILh4SqlTD4iNeunbi6wlDbLXvGhcEFNAIUxNbIU+UzXAvjrpZsYRI+nMQ3BzbmA+TNYi7bO/luYJFJp56WRu/naGvgUFNev0oc1zVB4fzued1567hydkaimqABHFWbdq9DlDQ0EbylEZ1gAYrTFjXoZFBsvh9lCL93ev5Vspzl9tut9tj5DzYeDjhNHLHWArLLeQ6P+5EVIMhupFbEsx5VPKDpQxAXhM+LN8hDG/33Wqpkq5lKxMKn8jIOMpvkQDX8GMi1Ai5hAFa+fE+pOUhVDi+bdRJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199015)(41300700001)(26005)(8676002)(33656002)(38070700005)(64756008)(66446008)(6506007)(7116003)(36756003)(6512007)(2616005)(66476007)(5660300002)(122000001)(8936002)(2906002)(38100700002)(186003)(66556008)(71200400001)(6486002)(478600001)(966005)(316002)(86362001)(6916009)(76116006)(66946007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjJseWd6c1hGZitDOHdncVFJUW1qYkZNTWVoUVQ3bWYzc29WeWxwSjhlWkpW?=
 =?utf-8?B?ZCtTckVXUGJ4MStwZUJJRU40Y2RCWVRpaEU0TzVad0RPNDFKTzJkcGRMVlVJ?=
 =?utf-8?B?S1lkZHVJTng3VXAvdTZwZkwvckFxTzlETXpGTkFOa2RNdUMySk1QSGJBT2do?=
 =?utf-8?B?OThpV0VTNi9RUHpWdDZ1SHluRDFSQS9IL1FYYlVVQXZ4ZE1iMmxhdzVFSzhj?=
 =?utf-8?B?aVRnK0V2ZlhGUEE3MS9hRUtXaWxMK0ttWmlLSy83UmdXUTFhbnNRMmxFeXd5?=
 =?utf-8?B?RmpyWDI5eGMwcERaV0FMczFQYWczM2F4YVgyOVhQNExWeEZsanJhdTRSVU1y?=
 =?utf-8?B?SnU0a09aZTVlL00yZHU2d0w5ZTdMdmtna3VwWC96ekljVXo3UWVPdVJ5M01L?=
 =?utf-8?B?VlBHY2hjemJDanpBdlI3RUxBRCsvYXJlc0V4V1VNdmd0WUZhT2dML290U0w1?=
 =?utf-8?B?aGV3RStpazBKWVEyZ3l1QUJoQTVQcnU3NVBabXg3WjF5V1lDeUg4cE5iWlF2?=
 =?utf-8?B?OWpxTVVnek81MjVOdHRsRXBUaUFXd2NGYmlYS2FHT0lMcHJPMXU1bWREeEEw?=
 =?utf-8?B?bnVLQnBhMXFsY1BScmJ3UzdSaERTMlB1WWRrZnVYdHNySk9uaU5pQ1ZZWktD?=
 =?utf-8?B?dzFnNEUvQmVOUlNoaW5QZ003cW1RS0JkY283aTBZQTZxWFZiKzUzTWFtLzE1?=
 =?utf-8?B?S1BGSjNuWFFxbUZnZ1I1VllFSW5ZeGFXRnZncHhDMENRaXNJY0FPZG1PazA5?=
 =?utf-8?B?eXAzK1hYQy9QZ3I4TEtZWXBITVhmdDNadGFOcTc4TEcxUXZXQ0F3aHF0dUw3?=
 =?utf-8?B?a1RQengxbmo2bUZHSnNKMWQ2OWt0VFZCamc4aUtqWGRwazZBUjBvZCthU0Vn?=
 =?utf-8?B?dUVyclNGb3NuSWN0dXJDaEc1Q2FRVkJyRnUxc2xCNk0xTUY2cFZBN05UTG1D?=
 =?utf-8?B?dGRMVkNUNVBDUmJ5VXR3dVNrNFEySGFNMENsR0I4aVd3N1dqaE53Q1VrWm1H?=
 =?utf-8?B?YVNaNjJqVmM2N1p4WjlyZjNQbUg5d20rR2hWTW1kYmUycmIwUElUMnhyUGlB?=
 =?utf-8?B?M0pnaFBKaFZremg0K0x6VGZoT1g2R3kwNDhCd3FIblBFeE0rQWNpVUxXcUdS?=
 =?utf-8?B?Nm9GZWgyTXlmejViNUorTnAwb1N6TTIxRWVvd0tjNUkzNVBGcGpUUmpaRm13?=
 =?utf-8?B?RlJyQnRST2srdlBsTlc2Mmt3YWFPM2tOS2JtNXplWjIvZEpCY29mTVBjNXUr?=
 =?utf-8?B?ZjJwRVBLcUV0TlVqN0tUaWhhOFcrcW45Tmx0bU5wU3NhZzl3a3V5anVLcUs0?=
 =?utf-8?B?REdTZ25jSXZjWDA3L2VzaS84dklvY1BiMjRBbTNoOVJ0THR1RExPMkIwNk9p?=
 =?utf-8?B?Q1dFUERMVWpoYXVFU1pLdzhSaExLYVlvYk13NSs5Ui9IWlR1a00wTVJUWnUx?=
 =?utf-8?B?UGl4RU5oL0RNRVBvdEVWVlV3djNJSGZUdW9sSEVyOElHMHh1QlYyU25QOEhY?=
 =?utf-8?B?RlpSYktKZmp6UEEyQnFIY0pWOWlNYkZ3Wkcwc01mWW1SVkZpZnN5OEFtclBV?=
 =?utf-8?B?bXp3dHJmWkx2TlBWajl6c0N0aEtvck5VeHlOckdRa2creklmOGdSVnZYZ3BL?=
 =?utf-8?B?UzlDQTJTYnkzTkV5a0hGZFh5WmxSRTh0aVJWaWRRQlg4b0VEMURXYWtEWU1p?=
 =?utf-8?B?cEw4Z2tBUS9PbURmaHd4SmJIVnlkYllMMFYyZjZUajdVaU1lb2IyU0NIYTRB?=
 =?utf-8?B?ZHpyOUZYL3lGSzU2L0dFOUVQUnUzYkJSQW9DcjF3MnM5QjNma3h5SUNxVXEr?=
 =?utf-8?B?OThyTTg5em5iUzhKRUxkUWF4MWgxVGZuTzZpOE9sVHJXQlgvQWF2emZzRnlU?=
 =?utf-8?B?QzViRkZpbjcwUzdVdlJwcFlwSU9rZUZQVVU2ZDlKMnVFZlA5eHhodVNKQ1Qx?=
 =?utf-8?B?OVpudEUxVGpubVM3YUdyVWo0WitQUFhOd0NGb1E0andLT3gvOGkzbDZxUXU3?=
 =?utf-8?B?dTFydEUwM25oUklqMG90cUtYdXREV0FEMVppNVNUcnZUeG5PekMxaUN3T2cx?=
 =?utf-8?B?MUhKR1hwbEpFdndHdjlZdzd1RlhuODBNVDRmUXJFR2VKaUlWa0RxVzk2QjVE?=
 =?utf-8?B?eGJyV1d4bmVQNGprMGI2Nkh0QXprM2VmZ21jYTFPTEdUWXd1SGphQ3phL040?=
 =?utf-8?B?UFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB23633708BBD74EB7FA120CEAAB1194@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c70d3b5c-dcfa-403e-22f5-08dab8a7ef19
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2022 05:47:43.6328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bx+D0dmQHx1d4Ds+5jSIxwhhPYF4FN+xCNpEf12NKCBhstvis8WkgaxawVzkKGJs8opj67OGXTnpcEgRdYJWffKRcQ54GcAnZUmNcQtJ6C0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6635
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_02,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2210280036
X-Proofpoint-GUID: WP98-Xd8aBz-oPpFwpgWchCBrCzC5rnV
X-Proofpoint-ORIG-GUID: WP98-Xd8aBz-oPpFwpgWchCBrCzC5rnV
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoJSSBwdWxsZWQgNy4xLCBhbmQgdGhlIG1lZ2FzYXMgZHJpdmVyIHN0b3BwZWQgYmVpbmcgYWJs
ZSB0byBkbyByZWFkcyBmcm9tIGEgZGlzay4NCkl0IGxvb2tzIHRvIGJlIHJlbGF0ZWQgdG8gdGhp
cyBjb21taXQ6DQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9xZW11L3FlbXUvY29tbWl0L2ZlOWQ4OTI3
ZTI2NWZkNzIzYTZkYzg3Y2Q2ZDIyMGY0Njc3ZGJlMWYjZGlmZmUzZjVmMzBlZmM1NDc0N2UwNjI0
ZGNhNjNlNWY1NWYwMDEyNzM2YzE4NzViNmU4NTUyNmIzNTE0ZTY5MTFiZTMNCg0Kd2hpY2ggYWRk
ZWQgc29tZSBjb21tYW5kIGJ1ZmZlciBib3VuZHMgY2hlY2tpbmcgdG8gdGhlIFNDU0kgc3Vic3lz
ZW0uICBVbmZvcnR1bmF0ZWx5LA0Kd2hlbiB0aGUgbWVnYXNhcyBRRU1VIGVtdWxhdGlvbiByZWNl
aXZlcyBhIGRpcmVjdCBJL08gY29tbWFuZCBmcm9tIHRoZSBkZXZpY2UgZHJpdmVyDQppbiBtZWdh
c2FzX2hhbmRsZV9pbygpLCBpdCBzeW50aGVzaXplcyBhIFNDU0kgY29tbWFuZCBmcm9tIGl0IGlu
IG1lZ2FzYXNfZW5jb2RlX2xiYSgpLA0KYnV0IHBhc3NlcyB0aGUgY29tbWFuZCBidWZmZXIgbGVu
Z3RoIGZyb20gdGhlIGRyaXZlciBmcmFtZSBpbnN0ZWFkIG9mIHRoZSBsZW5ndGggb2YgdGhlDQpi
dWZmZXIgaXQgc3ludGhlc2l6ZWQgdGhlIFNDU0kgY29tbWFuZCBpbi4gIFRoZSBkcml2ZXIgKGF0
IGxlYXN0IHRoZSBMaW51eCA0LjE0IHZlcnNpb24NCknigJltIHVzaW5nKSBkb2VzIG5vdCBmaWxs
IGluIHRoZSBjb21tYW5kIGJ1ZmZlciBsZW5ndGggaW4gZGlyZWN0IEkvTyBmcmFtZXMsIHNvDQpz
Y3NpX3JlcV9uZXcoKSBzZWVzIGEgMCBsZW5ndGggY29tbWFuZCBhbmQgZmFpbHMgaXQuDQoNCg0K
CUkgd29ya2VkIGFyb3VuZCB0aGlzIGlzc3VlIHdpdGg6DQoNCmRpZmYgLS1naXQgYS9ody9zY3Np
L21lZ2FzYXMuYyBiL2h3L3Njc2kvbWVnYXNhcy5jDQppbmRleCA3MDgyNDU2Li42ZTExNjA3IDEw
MDY0NA0KLS0tIGEvaHcvc2NzaS9tZWdhc2FzLmMNCisrKyBiL2h3L3Njc2kvbWVnYXNhcy5jDQpA
QCAtMTgyMyw3ICsxODIzLDcgQEAgc3RhdGljIGludCBtZWdhc2FzX2hhbmRsZV9pbyhNZWdhc2Fz
U3RhdGUgKnMsIE1lZ2FzYXNDbWQgKmNtZCwgaW50IGZyYW1lX2NtZCkNCiANCiAgICAgbWVnYXNh
c19lbmNvZGVfbGJhKGNkYiwgbGJhX3N0YXJ0LCBsYmFfY291bnQsIGlzX3dyaXRlKTsNCiAgICAg
Y21kLT5yZXEgPSBzY3NpX3JlcV9uZXcoc2RldiwgY21kLT5pbmRleCwNCi0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbHVuX2lkLCBjZGIsIGNkYl9sZW4sIGNtZCk7DQorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGx1bl9pZCwgY2RiLCBzaXplb2YgKGNkYiksIGNtZCk7DQogICAgIGlm
ICghY21kLT5yZXEpIHsNCiAgICAgICAgIHRyYWNlX21lZ2FzYXNfc2NzaV9yZXFfYWxsb2NfZmFp
bGVkKA0KICAgICAgICAgICAgIG1maV9mcmFtZV9kZXNjKGZyYW1lX2NtZCksIHRhcmdldF9pZCwg
bHVuX2lkKTsNCg0KYW5kIHRoZSBkcml2ZXIgY2FuIHJlYWQgdGhlIGRpc2sgYWdhaW4sIGJ1dCBJ
4oCZbSBub3Qgc3VyZSB0aGlzIGlzIHRoZSBjb3JyZWN0DQpmaXggc2luY2UgY2RiX2xlbiBpcyB1
c2VkIGZvciBib3VuZHMgY2hlY2tpbmcgZWxzZXdoZXJlIGluIG1lZ2Fnc2FzX2hhbmRsZV9pbygp
LA0KYWx0aG91Z2ggYSAwIHdvbuKAmXQgZmFpbCB0aGVyZS4NCg0KCUlzIHRoZXJlIGFueW9uZSB3
aXRoIG1lZ2FzYXMgZXhwZXJpZW5jZSB3aG8gY291bGQgY29tbWVudCBvbiB0aGlzPw0KVGhhbmtz
DQoNCgkJCQkJCQkJSkoNCg0K

