Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC984C7917
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 20:57:46 +0100 (CET)
Received: from localhost ([::1]:54290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOm9Q-0001Ra-RH
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 14:57:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nOm6f-0008Iw-5m
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:54:56 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:9130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nOm6b-0003fE-IK
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:54:51 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SIJHVj010129; 
 Mon, 28 Feb 2022 19:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=fnvPUS2tPwG6s+4DCiEqGLYIb9OFB5Wr7OGVNpsMTYg=;
 b=vH116IyHDFLzMtkn4m4AaidxLWzchueEGtAPLfImIXSeDP+XLdYKSS3MqRL10fwhGDrw
 owBbcu8Ecdlx/aoae6j1XDpTdDBYwfy3YHLXjPrK5zziw+G5rr+0JQze7nZRnVRi5Ufc
 aq5jfnjfdX9ubHG7gVnpLzHFZizU3OO35hxucEfBE/zbFcr1R8jwgVlcvt1ECBhfuQG6
 qq/fQZDnWNVGaY5LaWfV7P8tEUWYb8fY2Xq1tmuPpE3jn5rXFGZQTLTcdgwZdFovEtVb
 ekccVlQwm+qQIOq6kaMyl7bV81EU92mPGlZDE++emExVATOUkou0Lejis3JdZR3X/T3s 2Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eh1k40pvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 19:54:42 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21SJkkmb076500;
 Mon, 28 Feb 2022 19:54:41 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by aserp3020.oracle.com with ESMTP id 3efc13e4ud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 19:54:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzAVgZXce4WVYU/Z0ZhR+3dMtYekliAtOQciZZnbamkHhEq+h0/p4ktbTIGkZSTK1HX7q5LDchdkXDFX1Em7bRKiCQW+j+DbyKpBIvEnFDTDotJNmy/S6X3si7cJs8709OWBCG0S8uKRQPMiNjdUdxEWrDK+SXqDdfQqlbhSWUhrvYsNpf75hK+6zeSm2tN3k+PjsL7qlTx+tlnjiWpt7L908wV7DHrVI9tb+UNBxZ72c4Pdyr8IOq361waQzERlqAKY/LOUY/rizgqLRTxdaBA2uMc5fuKpamcSZNL0xpcXMaPEBO71k14VngZR/xUsDDsnDR6IF6i9TcUP0Bu49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnvPUS2tPwG6s+4DCiEqGLYIb9OFB5Wr7OGVNpsMTYg=;
 b=PHsh8vl4k0oxDuIyLg61duUbov9gxPwFhQnrlKdLpcjQQJklIxi/8CGGjtdPPi4eK2nNIC4SKIgf5nCN81kFspjsn4SFYyVSxbQsE/T1GylXRDWV64UJxZ4FmqJw7eXvqK6AVsbDc6RFL8tDckzUpUZP7Lr+5/FAjthhMrnashOyPByXXa+PwKYWLIhlliz5rWrBQalnKX7DR7FNl4FpeiXNVeCQkJaPFrDI+N4h3GPs4WL/yOR+lgBRCBZ7st++OHSqWTZ+bnTFngWAOkhBf8+lo8x9g2kuACbHWshE+KtERlO+KcRwikHrC0iirOY1BDPKO9Te9EGB3MwoudG/Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnvPUS2tPwG6s+4DCiEqGLYIb9OFB5Wr7OGVNpsMTYg=;
 b=WCJvrimot+BK4hMR/BcZMOvFcNJx45eVmMyTxdlNvVtsfLBq2ASwvnNCJK+TDw1MmS6m0oTOuKZnDp27CpRoeB2bFXmhIMK8R7fJfWyEEVurPZe2btRvv6obmTE5whQwZ5kFe6jgzXBeUGZzzBI9diiBJP4xKr0fO7nFeX1h8lg=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR1001MB2416.namprd10.prod.outlook.com (2603:10b6:301:33::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Mon, 28 Feb
 2022 19:54:38 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 19:54:38 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v6 12/19] vfio-user: IOMMU support for remote device
Thread-Topic: [PATCH v6 12/19] vfio-user: IOMMU support for remote device
Thread-Index: AQHYI8rp1f9mHlzmeEK/icjoK3hvXqyfaYEAgAoI8IA=
Date: Mon, 28 Feb 2022 19:54:38 +0000
Message-ID: <208904A4-1F80-4102-8B00-C106121475A1@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <f6dc62f6957a6ae2d289a5810d48c717eefff861.1645079934.git.jag.raman@oracle.com>
 <YhS9gvErGeGVPcwk@stefanha-x1.localdomain>
In-Reply-To: <YhS9gvErGeGVPcwk@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc421e08-64d5-4014-e98d-08d9faf4274f
x-ms-traffictypediagnostic: MWHPR1001MB2416:EE_
x-microsoft-antispam-prvs: <MWHPR1001MB2416161C48B412CC0CE9E51D90019@MWHPR1001MB2416.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gfCotG9MhfeqwPI4GhemHhtqghyTVXIVvSbQmM1u6667lsvdVKwQ0YKe6uAq/b3/rlvycCfoPedU9CYt24987C0XF+EcZtWUaerNimkmkKKt6dnHFQ1xHoJMWRIidj+JyKMRfk7BLPn1QOI14+QfjtQoLmJ/Bl6ClsJcbxiDgTKOKwqfolMKcLVfV9Psj0FGof1PXc029epkOyTWusNs6b9sB2Yg46vaRbYzQ4YPK2jKZt68uYwgGF0Xei1YkxOUXdTlHgTvPtKMWfo5zNkfiRZcZ21Qd/NqdOEniSsq7qVatT+zzYCOtOE1UME31zQKBR5/yTFNd9oGF6qmaFDFuWzLTbbGTdPmArJt8bAZcyEOJGisgQQYGrQU/nqO0VqUI/2ux9JBygCZ5ogLb0pRNDo/Zn14I8W1ze7t4G9q7tQc+i7TNAViCNf3pZo4ROUgv7/VVKPmq+8FVdca7XS1BynzV0DME3i/GcDcKVKlPqizyixPzEbEQXIMYF70/bs5ed6fOAmU2a0CEJnM8FAJPJnFSIH0SX4jEWjpsGywsC0+0tUEHIgeSykyNI0poeq0jghV57GxiGwlZW1GudrAe0kDDdUi0ksH2P7SmTGbuG2pKNAbcob0SpAtrg1YOT1IcxWvFhs8ukFfQZAsVCIf7jy6+q4SaIS5cp3A/RzIDCFnsl3COPDXrm1wvGwx8lKocMt8UNVuj135LClZl3I1Aen9BRwI5pqx8D0N5SJEA6k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(316002)(6506007)(7416002)(6512007)(86362001)(44832011)(38100700002)(54906003)(38070700005)(6916009)(8936002)(53546011)(64756008)(186003)(33656002)(76116006)(83380400001)(66946007)(6486002)(66476007)(66556008)(4326008)(2906002)(508600001)(66446008)(71200400001)(2616005)(8676002)(107886003)(122000001)(5660300002)(91956017)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODM5ekJGclN4MGZtMzJ5Y1BZSVpSQXIzYnozWXlSRHVJVldBUEJTdDNYOSt6?=
 =?utf-8?B?clo5UXB6M2dwMkh2MVF4bzlWQTVqa0MyeUNFUlhRWGtxTklwRHNhelpUYkNK?=
 =?utf-8?B?bGJsOVdsVmxXQzhQa1g1NUJJNXhPbkZUL0VMM2VSbUloT2gzZWliVGFQV2lq?=
 =?utf-8?B?UlV6aUlwRS9LVHlndmZ2RDY3eS8vbCsrNi9PakFESDV6M1Q0S2VGbGNKNHJP?=
 =?utf-8?B?VExROUJ0QWxkRkNES1c1VzF6NXBITWR0N25jd2E0OVYwL05LMlZxeXdOM0J6?=
 =?utf-8?B?QmtQTTZYYmdzL25NV3V5TFVYeUxMUUEwR05iYSt1NEU3S2VoS1pkTEozQVlI?=
 =?utf-8?B?RGFIQUhaQVgyZnc1bkpMdjRWR0pMZFBZSXJPbElOenZBaFIvUUpKQk9iTXRr?=
 =?utf-8?B?cElpU05kU3p2ZGJYajN5R1o1dFFQUHNtZ3ZIVFhMOWpqajFaSlhwR1BPL0ty?=
 =?utf-8?B?YUJqZ2dZb3VWRDJrUmJNVDJhTmpFamdBZm52blhUS09qRVdaeEQ0SlNEelNa?=
 =?utf-8?B?eW5sN1hNa2xyeTJlN244SHd0aVhTOUtLUFptSVJKTERPZy9BZE1qS2xqais3?=
 =?utf-8?B?N3BSTmxLZllmc3Z3WXdpZlNZUExvdEovWGFid0I3SzZseXZWSllVbzJ5Ym9q?=
 =?utf-8?B?TVpIY3dvK0x5cTIxYnI3VW5hUXlSQy9vU1BrZ1ZYdlVidXV0eGZyc1FDbVBl?=
 =?utf-8?B?TTVZTWxvS1FXUkhkcjdZZ09ORmpNTTFTMEc5azI5RXlWcU1ZMmFIaG55cXZ5?=
 =?utf-8?B?b2hEdEM5SlB1M3BUZlV2ZEtwMGxoZUE3MlNyT01iRHNFalBaeVVITWI0S1Vu?=
 =?utf-8?B?WnJ2eTE1OG5XdEtrOGFKUnh3VzV2eURScnYxUU13Q01kMjg4eWJMZ3hZQmpN?=
 =?utf-8?B?K3NCNXRZWm8zV0pKTkZFNk5FdnNUNDJSUDlINjAxWExOSHR2UkRUUXdpU21j?=
 =?utf-8?B?ek1nbTRMMGJNUjdpakt2YmtpQm1WbytFVFB0d3l4ZkJZOWEza0ttdDUvUGZX?=
 =?utf-8?B?NWFpSFdLNUtCR2IycDl1bG11aGxKRmRES3ZLaG9QZkJqaWxSTUdJUHQxRDB1?=
 =?utf-8?B?TUxnOE9BNGJnNjVXR0YvUTNQL3J1Y2U2cktKUmZMS3dNME8rYWsrcHc3eU43?=
 =?utf-8?B?dU5kaVF1Wk9XVmhqdXI2QlE3eE9UcXpOZHQ5d0U4S1podEhyWDBSS0krT0pt?=
 =?utf-8?B?TVJhZDl1cXhIT3U3c2dzdXFWc3lMdGZVV3lSWm93em12US9TQjNhTVphTzRF?=
 =?utf-8?B?amgwdXNUeldTWUNYK0U2L0dKWnpweXFMeFlEcTdNWjdrMDRiZjBxUVAweTNC?=
 =?utf-8?B?U0VvN3FXaEppNG1EWVZqOVFvVXUvcmp6dFU1UC82enZjS2NnTHZXK2ZZSnFp?=
 =?utf-8?B?L1hRL1hnUVVaRUZZWlJ0b1dPY2tkWmcrMXo1MFF5RjIycGFYMWExbEtNMzJH?=
 =?utf-8?B?Q3BIL1A5UTR2UFpBbXNEU3Q3d0t2RTVJdUtGY21PTG1YT1lla21sMlF0MjVa?=
 =?utf-8?B?NzdsTVRSbTVGWTJoNk9sdDIrYzJOd2dXU2QrNmJMcGF3TjhrM2xyUDJsZ00y?=
 =?utf-8?B?dWtNV3BLREpIU3BINFBUSTRRS01HbWhIZldmMHcvSUtpVXBWdGlDNTJTWjNu?=
 =?utf-8?B?dk9SenlXQU5kRjZ4Q1BVUEZvT0xKS1RLRW1tSXFXemp4TGtIT2F6K29ZTVI4?=
 =?utf-8?B?M3hDVWRSVDBYcnhjWFViRTRybnNURlBjZU40LzIrSHJ2SnhQZW5JVU56K2VZ?=
 =?utf-8?B?TUt0REJhaXFLdFl6UzZId0ZqUGdNVWtWbldpTUxtNFZLL1Q4R2F5SXJLS2xJ?=
 =?utf-8?B?bmR6d1BTMTk4a090UHJFbFVjR3A5M09KY0JXZHcvNUNJSG9sOEpyOE1vUU5j?=
 =?utf-8?B?bjlzYmZYUjY1dEx3dm1SWEs2b2VCdTdpU0ZHY1RXSDlTU2ZxcmsyZ2svYXF0?=
 =?utf-8?B?UzJNYVpGTzhUTFJlM2cvdEpiaGc0bXJhQklIRjlFd2pNMGNsdUI1aFBZTUFQ?=
 =?utf-8?B?eUdscGRhbWVyTnZIUWh0alB3dGVwRjEzaHAwZlVTdDh2QXNOQWJLdHdqaDZu?=
 =?utf-8?B?OUJhQkM5anh0aFFRS0paNkJTTVRVam1rN1Z6NmhQVVBWUFhFeXNEL0h4RXZQ?=
 =?utf-8?B?TTNwSmxyN1MyUFNqdGw5RnVXNVY0TVpORDdTVDlXbnpZVFhDVnlkaVpSd2dq?=
 =?utf-8?B?U3lqTDcxdy9LdGV2dW54K3g0eXphQ2RwdzJZak90dDJmbjdKL2hvVlFCditt?=
 =?utf-8?B?QWhLcjVYbnNEeE4wUWs4N29vSXVRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D88C835DE6975A4FB6E5EABD8405E942@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc421e08-64d5-4014-e98d-08d9faf4274f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 19:54:38.4711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S14kHdJiTgtSNL4jW8PSUGxvVFs6y/WaEb3tDAD0Xl7p54apy74d3ssomUWA8Ga6gRurQarikHtuhA0KehNSUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2416
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10272
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202280097
X-Proofpoint-ORIG-GUID: kavMgkweb9jhF4x-sdCfuz020ce1RmIh
X-Proofpoint-GUID: kavMgkweb9jhF4x-sdCfuz020ce1RmIh
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDIyLCAyMDIyLCBhdCA1OjQwIEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gVGh1LCBGZWIgMTcsIDIwMjIgYXQgMDI6
NDg6NTlBTSAtMDUwMCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+PiArc3RydWN0IFJlbW90
ZUlvbW11RWxlbSB7DQo+PiArICAgIEFkZHJlc3NTcGFjZSAgYXM7DQo+PiArICAgIE1lbW9yeVJl
Z2lvbiAgbXI7DQo+PiArfTsNCj4+ICsNCj4+ICtHSGFzaFRhYmxlICpyZW1vdGVfaW9tbXVfZWxl
bV9ieV9iZGY7DQo+IA0KPiBBIG11dGFibGUgZ2xvYmFsIGhhc2ggdGFibGUgcmVxdWlyZXMgc3lu
Y2hyb25pemF0aW9uIHdoZW4gZGV2aWNlDQo+IGVtdWxhdGlvbiBydW5zIGluIG11bHRpcGxlIHRo
cmVhZHMuDQo+IA0KPiBJIHN1Z2dlc3QgdXNpbmcgcGNpX3NldHVwX2lvbW11KCkncyBpb21tdV9v
cGFxdWUgYXJndW1lbnQgdG8gYXZvaWQgdGhlDQo+IGdsb2JhbC4gSWYgdGhlcmUgaXMgb25seSAx
IGRldmljZSBwZXIgcmVtb3RlIFBDSSBidXMsIHRoZW4gdGhlcmUgYXJlIG5vDQo+IGZ1cnRoZXIg
c3luY2hyb25pemF0aW9uIGNvbmNlcm5zLg0KDQpPSywgd2lsbCBhdm9pZCB0aGUgZ2xvYmFsLiBX
ZSB3b3VsZCBuZWVkIHRvIGFjY2VzcyB0aGUgaGFzaCB0YWJsZQ0KY29uY3VycmVudGx5IHNpbmNl
IHRoZXJlIGNvdWxkIGJlIG1vcmUgdGhhbiBvbmUgZGV2aWNlIGluIHRoZQ0Kc2FtZSBidXMgLSBz
byBhIG11dGV4IHdvdWxkIGJlIG5lZWRlZCBoZXJlLg0KDQo+IA0KPj4gKw0KPj4gKyNkZWZpbmUg
SU5UMlZPSURQKGkpICh2b2lkICopKHVpbnRwdHJfdCkoaSkNCj4+ICsNCj4+ICtzdGF0aWMgQWRk
cmVzc1NwYWNlICpyZW1vdGVfaW9tbXVfZmluZF9hZGRfYXMoUENJQnVzICpwY2lfYnVzLA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpvcGFx
dWUsIGludCBkZXZmbikNCj4+ICt7DQo+PiArICAgIHN0cnVjdCBSZW1vdGVJb21tdUVsZW0gKmVs
ZW0gPSBOVUxMOw0KPj4gKyAgICBpbnQgcGNpX2JkZiA9IFBDSV9CVUlMRF9CREYocGNpX2J1c19u
dW0ocGNpX2J1cyksIGRldmZuKTsNCj4+ICsNCj4+ICsgICAgaWYgKCFyZW1vdGVfaW9tbXVfZWxl
bV9ieV9iZGYpIHsNCj4+ICsgICAgICAgIHJldHVybiAmYWRkcmVzc19zcGFjZV9tZW1vcnk7DQo+
PiArICAgIH0NCj4gDQo+IFdoZW4gY2FuIHRoaXMgaGFwcGVuPyByZW1vdGVfY29uZmlndXJlX2lv
bW11KCkgYWxsb2NhdGVzDQo+IHJlbW90ZV9pb21tdV9lbGVtX2J5X2JkZiBzbyBpdCBzaG91bGQg
YWx3YXlzIGJlIG5vbi1OVUxMLg0KDQpJIHRoaW5rIHdlIHdvbuKAmXQgaGl0IHRoaXMgY2FzZS4g
Z19oYXNoX3RhYmxlX25ld19mdWxsKCkgd291bGQgYWx3YXlzIHN1Y2NlZWQuDQoNClRoYW5rIHlv
dSENCi0tDQpKYWcNCg0K

