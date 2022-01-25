Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E4549B706
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:57:52 +0100 (CET)
Received: from localhost ([::1]:36496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCNGZ-0002U2-8c
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:57:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCMCf-0003ST-4n
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:49:45 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCMCc-0001Qz-FU
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:49:44 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PAx85G026528; 
 Tue, 25 Jan 2022 13:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Wcp/YbmoRz9QeMsP5m4pREOIK4kVoIUV2PJVbiNIkRE=;
 b=kpzlET6fKEeZY/1fBMdyw8xqKup1FQD/mBG5vXvk40wsBQ61dg7A4dSfYH4sigiJIJPX
 4AsQ789eg7KxwznSbi4dwJ9X081doHYV/fXJl8agl1sibz7ldRtL7LqtWrczvKUztpML
 CPAmQgCfzDIDFiRn9WsDPC60uVv6KvHyHc6nB/2L9CJEhRsudRPrlFzievozt4stGv+D
 6QDwWTssBESyQoHtuxvNBowLZzDYXAsqpatgxTysvnbCNsXMCEHEblHHgJwZsKilXeaT
 UlImb1moL9TtAk+Oawdk7X+VdSBPIWjk87283Mmc/TLrEFNF0jtLWrk2/D+g/AeIudMw Rg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsvmjbkhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 13:49:28 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20PDkQtK103577;
 Tue, 25 Jan 2022 13:49:27 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2040.outbound.protection.outlook.com [104.47.51.40])
 by userp3020.oracle.com with ESMTP id 3drbcnxc7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 13:49:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGW0lJeeG12kLzyL0RB7EeW8xjiQedKR8qeUXCUsDE7+6E4bLnEHODqbp8PbTPp9mY3eHlmvFVZyzk44eYoo+HZgGhdWXN393zxxp+05ABJ3JnXnrQpkfsMbghfGMV+/dPWDdcI7Jbz0nx4TOnleq+9XPaYlZrAyQfSo3CjD6p2vFIwWzrbrmvCYmevsn+RjKlwR2STwQzWgDlQyD1Zx+FHGRbEvej/kBh29SD3fdE2uWW47LT1TlMfgFchIoEA4vBWvPaF11W+N2Bygfv34pPXFyJIyoxD2v7Nio2rRN+nXHY5RHRvo4l7Zbclk5xx0qm+/1tu0Qy7H8ZuTOBXtyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wcp/YbmoRz9QeMsP5m4pREOIK4kVoIUV2PJVbiNIkRE=;
 b=Atk+R4/BkVAjIn9kYxSqB4jE8v8M9SklF1xq5mZOp4YVpFolPQFNsGdia42L6S+kQpQbb6mZK32rh8A+BUGD5GZbWIODNq2VhdXLxmh6iNgXzSzcwjc6U0q5tqKUOfj7bOLD+5z+Oy3hoifkqQUIn/R2FZFquiiV80i7P0iDyvj7UiiF3OYcWzPzlSM8dZ4u9lgTVtZS8t09/uDqkpMQtKA96Q/t9v4ASGq4oWGxz3eEQn2CycUOCbnn8Po3wrB0mNp00iinW5FrtDWeB6lxDL7VFADxe6zPmXi32KAIizb6miQqSt7mx2TH8l2PLmA6T48s2wePBFfYGaig8gAFiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wcp/YbmoRz9QeMsP5m4pREOIK4kVoIUV2PJVbiNIkRE=;
 b=eSOtSqI4haVk6YXXcO0dD1sTwKGwNncVWxf4kvXHECU+8UroCeKzM61KNxN9g3uIfxbc0BtNhyWNFVaLe/s0qzRbU/MilXC0wpYteEq+ZW4JCQrGG6k3PLT1HeLPFR4nWTN6EHtmrz5/DoE3k9sbmD3Sx5jzyNzTE/rx6kWVQ40=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1872.namprd10.prod.outlook.com (2603:10b6:300:10b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Tue, 25 Jan
 2022 13:49:23 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 13:49:23 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Thread-Topic: [PATCH v5 03/18] pci: isolated address space for PCI bus
Thread-Index: AQHYDX1z2h/nyOzV1UqlYAx4HMB2U6xziJYAgABBJ4A=
Date: Tue, 25 Jan 2022 13:49:23 +0000
Message-ID: <34FCB9A6-4E69-47C4-BBE9-3D92216908D6@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
 <Ye/JPI6yJ0zOce5e@stefanha-x1.localdomain>
In-Reply-To: <Ye/JPI6yJ0zOce5e@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25b51e01-43e1-4598-ecc6-08d9e0097edc
x-ms-traffictypediagnostic: MWHPR10MB1872:EE_
x-microsoft-antispam-prvs: <MWHPR10MB18725336BF1DD505F2B65A69905F9@MWHPR10MB1872.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rrSITiApctvDH1fYSCvAsiXms3nGtEfhEmNXje7ukuPE83GinPhDzjOmmHoidRT6rY3LzbTLv7eypgcjz5ASxSsXXIQn5mhtPzmEJ9HwOnEQq2K7/L9UJT4zRGubnoLkzC/8pNvlhJ1cfX9jVY1OUiradLCLla84cLVnm/yMg7R5jIX4OoJVQzYesitwJSwBIUO3oGKFv44Jp5VmprqBSiZ6ybMW+3I1CfI7BDYvjpdPtC88uIlq3yu4wtGupKnQJJNhPv2jLt7ePXUQOefj4id2yIUp2sJsJQKQDKrDLssgOsdIiNCxYv4nIC8Q1fm8YyoRLZz51bPFvmLljPHuRRit84imy+K7U1nlVK6IMmFmRozbil7IaCvv4WMq2Iv5lxoV1gp7TDGWrzG8p/1lcx1bvnU93bLlEztKQHf9ApFQWD+L653FBERyGwTOPX+71Rdp0LtiwSWLyGEOPV1N3j5wzdVgIJgV3LWEGgyYsuGuWXusH4aCFMOqhTfEZ8h4AE1/5FwDXUTpO0q39tWBtd4kqL6tJxkrnVvxMe7ycCUff2Qcc3CLVDHty8PL6cXfXGjHV+Q6HiVUW1UohXRHlJoxuED/Cwlan22Ylzt8W5Idso0XTKP7+MjDzhszxRRENj4xJgr2AFiLOxFhiz2T+DN+H0DUI4PomhNRMeqICl9M99mA4CIPvAh82gUSsoHWtpPL/KQ8mu7mXU+292PZRZVArt8bbDa4wJ27oRRRjQA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(6506007)(44832011)(36756003)(86362001)(64756008)(186003)(33656002)(8676002)(76116006)(66476007)(83380400001)(316002)(6486002)(66446008)(5660300002)(6512007)(66556008)(38100700002)(122000001)(53546011)(38070700005)(91956017)(4326008)(6916009)(54906003)(71200400001)(2616005)(2906002)(7416002)(107886003)(508600001)(8936002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDRJbHk5d3ZtamN2UGluQUlFWUdvdVIyNDYyQkNIc25VMjI1a0J6a0M0NDd0?=
 =?utf-8?B?OTBhczZ5SWRoR3U4TTNCRnJzeVQ3elpINEJWRXV3cmlpQ01DaWIyYUJVZFRF?=
 =?utf-8?B?OUhHWlZ6WUlWVExmTzlIazlxMVh1S0txZGlzTm9IZnZtRm44MXhSd0hHcHk5?=
 =?utf-8?B?UkZ4MDN6WFVGVk5NMzF4TURPV3VnNHlpYTNaSmlKS3JuWk5xWlRrVXVHMkxM?=
 =?utf-8?B?d0FaalV2Q0l4TlFueTRpb1ZCbnk1NlBweUtPaXlBVVNQbGlRK3VkR25Gdk9t?=
 =?utf-8?B?dE5FQlMxK2VpbitpRnRzRXozbUpJV1FaMENhUll0cXlUeWd3QUQvV1pxeGsz?=
 =?utf-8?B?NXpCbEEyWXZLOE1pYVdrUjhNUmJUWDFzZ0xVanhWc25ETkViQjZKR1J3QmV2?=
 =?utf-8?B?cjlHdHhXTFlTYnEvOVVDdlcwcGpPbC9UYnFOUEZLTFJMekJ4c3NBQm5wY3oy?=
 =?utf-8?B?UkFDYVBoZlBTUnUzQkQ5V1MrS29jbDJiRTI0VGwyYUQyU2NuVVB2dVNKOVRu?=
 =?utf-8?B?QXlMZjhoZ242SnQrNVhPVmFaREtEd1VvcGNvOHYwaVhYY2NqTGtGMDB0ZW96?=
 =?utf-8?B?Q2VFWmpDZStDQlB5cUhPNSsrR1RvNmVZTENYUDgzaTVMdGlTaXV5ZDh3Vk1L?=
 =?utf-8?B?aWVocDYyNTA0VmFzeGxpaURvR3ZVTWdyTGkyM3JObnBNQXlIY29LQlVPR3Mz?=
 =?utf-8?B?SnhzcVdNQVllbk5BQTFyQ3czQ2VPdU1TTHZ5SE5rSDFtZExYRFFpT0ZadHR6?=
 =?utf-8?B?UFlkSWpuNkVoeTBNWWFrNS9MV3pKaURDRExscXNLVjVWTnRsbHcvY3UrdTZa?=
 =?utf-8?B?NVBYV2d5RUV5Ry9kTTdIZjRZaFlLaC9RYlRNditVUnZsTmU1MzVaRDFpUEkv?=
 =?utf-8?B?N3p3VndIZXF6L204NkNISHJtZXBMTXhzRzY0aGVoSktEdkF1R0FyTjFhUkg2?=
 =?utf-8?B?cXBMSEVsbW5mNC93RC82Q0JtNmVOekFENXhrbmdNbmRwNitGdnQyYnAxUkdp?=
 =?utf-8?B?M3hrRHZ2QVpvRnFNeENJMXZUamFwSVBRbERVdkJXS1NET3RxejcvTVR4am1Y?=
 =?utf-8?B?a0VrajVCM3RUaGxNR2hPL1J5eHNDM29tNmFpTnpIaHRwYWpxNFhVOVpETHJV?=
 =?utf-8?B?dkpsM29wcWYyZXJZaHF3TG5naVUwU25iZGJOQi96eU50cVIwaTV0Q3FYZ1Z6?=
 =?utf-8?B?OFJic0ZXRnJLOUJlZWRLdEliSjZINUUyVGtUci96WXRnby9oUlVHSlVjTXpY?=
 =?utf-8?B?TTl1d2RHaDEwTTYzb3A5TjlDQXZTRGIrcVhhZVlJM1J6VGFsOGd6NFV2MnFR?=
 =?utf-8?B?WC8zNkQ0Z1lUSHlwbjR0aFEySDMzdDVFZVJKZ3BTZjZ1T0RRN3VWMEJDZEpp?=
 =?utf-8?B?a1pPTEZFeUdpK01YaFBJWVJhWjVuSFZLVU4wTGRZd2gwdWxTUFNtL0pnYXdM?=
 =?utf-8?B?Y2ErUkI0dzZPUFRpWnVDWlBudzQ5NTVXWEcyU0p2L25XdFN3ZnNhNmowTXpK?=
 =?utf-8?B?SDE0RlFaU1JZa2lyZVYvSW5CeW5MVG5OU3RyRmtscEpEUGJhcVc0WkRZcHps?=
 =?utf-8?B?eVAxdko2cU10dy9jWEJ0ZmFOUmNmQXN3VUNmd2Y1L2d5QUc0WG9WZ3NvL0ZE?=
 =?utf-8?B?c1VkelY3a05YWkN3WndjYU9uam1TTFd5a3A5RHc1NlFkMjhESUtrY1hzVDVE?=
 =?utf-8?B?a3p5MkRJUHlIclE4S3dFUERZQ3V0a3gvemNzSDUxajV4TmJ1NUtWeFh2TGlZ?=
 =?utf-8?B?ZkJMVWxmeWVjSU5rMElOZU9mTTBRY0Z1TTdMRldUcUZOS251UVQ3VmtDekI0?=
 =?utf-8?B?cWhmK1BETFNIMldBNHkvT0N3UmFnWUdrLzRCN3RPWlF0aEM2U3pDbEpGVFFs?=
 =?utf-8?B?QlZCZ0FxdFFueUtlYlJGREdnRFhxTG9JeFMvRktOR2dtY1RJN0JVSEdDZGt0?=
 =?utf-8?B?MW9lWmU0YlBlU1crSmFIQUI0ZHpsSHVtSTRuUkc5NkxGaHBIaG96QnJiS1h3?=
 =?utf-8?B?QlF5aFFQMHlEQ0RjVmg4WTluaklSK00zSWk2eFBqZ01kbitIeWc5U2xrdzZN?=
 =?utf-8?B?OG5Xc1gwOVFuN0FkbzZrVDdqYi9sZlljc1UvYjJVZzgzdDVDWnFIZ3E4cmNL?=
 =?utf-8?B?azQvUVEwUGRyR3lUSVJ5QjRzek1RT3I3dnhySFNDdHFtblc3ZzRmeWVKbXZr?=
 =?utf-8?B?VTdDZGI4YkFra3gyNkdTVEVJM3JtVjNwdy9jRGp5ZVM1NjNKREhPSDRsWk1H?=
 =?utf-8?B?YUdEclZZVXhQd1BVeFdPaEZYWjVRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD40F444D885914FB3EEC9C0F8793AB5@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b51e01-43e1-4598-ecc6-08d9e0097edc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2022 13:49:23.6121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4IUrNZlBZbD6UmurkG3n5XOUOzxeuo3WyvXy7Eh021w5wYkjUw2Bhj6J+ROFBhOoBIeGEqDVqMw4Kd2JQBbsPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1872
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10237
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201250089
X-Proofpoint-GUID: SjaU0iAf2iGYrzVsrGPoCSRC2uT23POZ
X-Proofpoint-ORIG-GUID: SjaU0iAf2iGYrzVsrGPoCSRC2uT23POZ
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSmFuIDI1LCAyMDIyLCBhdCA0OjU2IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBKYW4gMTksIDIwMjIgYXQgMDQ6
NDE6NTJQTSAtMDUwMCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+PiBBbGxvdyBQQ0kgYnVz
ZXMgdG8gYmUgcGFydCBvZiBpc29sYXRlZCBDUFUgYWRkcmVzcyBzcGFjZXMuIFRoaXMgaGFzIGEN
Cj4+IG5pY2hlIHVzYWdlLg0KPj4gDQo+PiBUWVBFX1JFTU9URV9NQUNISU5FIGFsbG93cyBtdWx0
aXBsZSBWTXMgdG8gaG91c2UgdGhlaXIgUENJIGRldmljZXMgaW4NCj4+IHRoZSBzYW1lIG1hY2hp
bmUvc2VydmVyLiBUaGlzIHdvdWxkIGNhdXNlIGFkZHJlc3Mgc3BhY2UgY29sbGlzaW9uIGFzDQo+
PiB3ZWxsIGFzIGJlIGEgc2VjdXJpdHkgdnVsbmVyYWJpbGl0eS4gSGF2aW5nIHNlcGFyYXRlIGFk
ZHJlc3Mgc3BhY2VzIGZvcg0KPj4gZWFjaCBQQ0kgYnVzIHdvdWxkIHNvbHZlIHRoaXMgcHJvYmxl
bS4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogRWxlbmEgVWZpbXRzZXZhIDxlbGVuYS51ZmltdHNl
dmFAb3JhY2xlLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEpvaG4gRyBKb2huc29uIDxqb2huLmcu
am9obnNvbkBvcmFjbGUuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSmFnYW5uYXRoYW4gUmFtYW4g
PGphZy5yYW1hbkBvcmFjbGUuY29tPg0KPj4gLS0tDQo+PiBpbmNsdWRlL2h3L3BjaS9wY2kuaCAg
ICAgfCAgMiArKw0KPj4gaW5jbHVkZS9ody9wY2kvcGNpX2J1cy5oIHwgMTcgKysrKysrKysrKysr
KysrKysNCj4+IGh3L3BjaS9wY2kuYyAgICAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKysr
DQo+PiBody9wY2kvcGNpX2JyaWRnZS5jICAgICAgfCAgNSArKysrKw0KPj4gNCBmaWxlcyBjaGFu
Z2VkLCA0MSBpbnNlcnRpb25zKCspDQo+PiANCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3Bj
aS9wY2kuaCBiL2luY2x1ZGUvaHcvcGNpL3BjaS5oDQo+PiBpbmRleCAwMjNhYmMwZjc5Li45YmI0
NDcyYWJjIDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9ody9wY2kvcGNpLmgNCj4+ICsrKyBiL2lu
Y2x1ZGUvaHcvcGNpL3BjaS5oDQo+PiBAQCAtMzg3LDYgKzM4Nyw4IEBAIHZvaWQgcGNpX2Rldmlj
ZV9zYXZlKFBDSURldmljZSAqcywgUUVNVUZpbGUgKmYpOw0KPj4gaW50IHBjaV9kZXZpY2VfbG9h
ZChQQ0lEZXZpY2UgKnMsIFFFTVVGaWxlICpmKTsNCj4+IE1lbW9yeVJlZ2lvbiAqcGNpX2FkZHJl
c3Nfc3BhY2UoUENJRGV2aWNlICpkZXYpOw0KPj4gTWVtb3J5UmVnaW9uICpwY2lfYWRkcmVzc19z
cGFjZV9pbyhQQ0lEZXZpY2UgKmRldik7DQo+PiArQWRkcmVzc1NwYWNlICpwY2lfaXNvbF9hc19t
ZW0oUENJRGV2aWNlICpkZXYpOw0KPj4gK0FkZHJlc3NTcGFjZSAqcGNpX2lzb2xfYXNfaW8oUENJ
RGV2aWNlICpkZXYpOw0KPj4gDQo+PiAvKg0KPj4gICogU2hvdWxkIG5vdCBub3JtYWxseSBiZSB1
c2VkIGJ5IGRldmljZXMuIEZvciB1c2UgYnkgc1BBUFIgdGFyZ2V0DQo+PiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9ody9wY2kvcGNpX2J1cy5oIGIvaW5jbHVkZS9ody9wY2kvcGNpX2J1cy5oDQo+PiBp
bmRleCAzNDc0NDBkNDJjLi5kNzgyNThlNzllIDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9ody9w
Y2kvcGNpX2J1cy5oDQo+PiArKysgYi9pbmNsdWRlL2h3L3BjaS9wY2lfYnVzLmgNCj4+IEBAIC0z
OSw5ICszOSwyNiBAQCBzdHJ1Y3QgUENJQnVzIHsNCj4+ICAgICB2b2lkICppcnFfb3BhcXVlOw0K
Pj4gICAgIFBDSURldmljZSAqZGV2aWNlc1tQQ0lfU0xPVF9NQVggKiBQQ0lfRlVOQ19NQVhdOw0K
Pj4gICAgIFBDSURldmljZSAqcGFyZW50X2RldjsNCj4+ICsNCj4+ICAgICBNZW1vcnlSZWdpb24g
KmFkZHJlc3Nfc3BhY2VfbWVtOw0KPj4gICAgIE1lbW9yeVJlZ2lvbiAqYWRkcmVzc19zcGFjZV9p
bzsNCj4gDQo+IFRoaXMgc2VlbXMgbGlrZSBhIGdvb2QgcG9pbnQgdG8gcmVuYW1lIGFkZHJlc3Nf
c3BhY2VfbWVtLA0KPiBhZGRyZXNzX3NwYWNlX2lvLCBhcyB3ZWxsIGFzIFBDSUlPUmVnaW9uLT5h
ZGRyZXNzX3NwYWNlIHNpbmNlIHRoZXkgYXJlDQo+IGFsbCBNZW1vcnlSZWdpb25zIGFuZCBub3Qg
QWRkcmVzc1NwYWNlcy4gTmFtZXMgY291bGQgYmUNCj4gbWVtX3NwYWNlX21yL2lvX3NwYWNlX21y
IGFuZCBQQ0lJT1JlZ2lvbi0+Y29udGFpbmVyX21yLiBUaGlzIGF2b2lkcw0KPiBjb25mdXNpb24g
d2l0aCB0aGUgYWN0dWFsIEFkZHJlc3NTcGFjZXMgdGhhdCBhcmUgaW50cm9kdWNlZCBpbiB0aGlz
DQo+IHBhdGNoLg0KDQpBcmUgeW91IHJlZmVycmluZyB0byByZW5hbWluZyBhZGRyZXNzX3NwYWNl
X21lbSwgYWRkcmVzc19zcGFjZV9pbyBhbmQNClBDSUlPUmVnaW9uLT5hZGRyZXNzX3NwYWNlIGFs
b25lPyBJ4oCZbSBhc2tpbmcgYmVjYXVzZSB0aGVyZSBhcmUgbWFueQ0Kb3RoZXIgc3ltYm9scyBp
biB0aGUgY29kZSB3aGljaCBhcmUgbmFtZWQgc2ltaWxhcmx5Lg0KDQo+IA0KPj4gDQo+PiArICAg
IC8qKg0KPj4gKyAgICAgKiBJc29sYXRlZCBhZGRyZXNzIHNwYWNlcyAtIHRoZXNlIGFsbG93IHRo
ZSBQQ0kgYnVzIHRvIGJlIHBhcnQNCj4+ICsgICAgICogb2YgYW4gaXNvbGF0ZWQgYWRkcmVzcyBz
cGFjZSBhcyBvcHBvc2VkIHRvIHRoZSBnbG9iYWwNCj4+ICsgICAgICogYWRkcmVzc19zcGFjZV9t
ZW1vcnkgJiBhZGRyZXNzX3NwYWNlX2lvLiBUaGlzIGFsbG93cyB0aGUNCj4+ICsgICAgICogYnVz
IHRvIGJlIGF0dGFjaGVkIHRvIENQVXMgZnJvbSBkaWZmZXJlbnQgbWFjaGluZXMuIFRoZQ0KPj4g
KyAgICAgKiBmb2xsb3dpbmcgaXMgbm90IHVzZWQgdXNlZCBjb21tb25seS4NCj4+ICsgICAgICoN
Cj4+ICsgICAgICogVFlQRV9SRU1PVEVfTUFDSElORSBhbGxvd3MgZW11bGF0aW5nIGRldmljZXMg
ZnJvbSBtdWx0aXBsZQ0KPj4gKyAgICAgKiBWTSBjbGllbnRzLCBhcyBzdWNoIGl0IG5lZWRzIHRo
ZSBQQ0kgYnVzZXMgaW4gdGhlIHNhbWUgbWFjaGluZQ0KPj4gKyAgICAgKiB0byBiZSBwYXJ0IG9m
IGRpZmZlcmVudCBDUFUgYWRkcmVzcyBzcGFjZXMuIFRoZSBmb2xsb3dpbmcgaXMNCj4+ICsgICAg
ICogdXNlZnVsIGluIHRoYXQgc2NlbmFyaW8uDQo+PiArICAgICAqDQo+PiArICAgICAqLw0KPj4g
KyAgICBBZGRyZXNzU3BhY2UgKmlzb2xfYXNfbWVtOw0KPj4gKyAgICBBZGRyZXNzU3BhY2UgKmlz
b2xfYXNfaW87DQo+IA0KPiBPciB1c2UgdGhlIHBvaW50ZXJzIHVuY29uZGl0aW9uYWxseSBhbmQg
aW5pdGlhbGl6ZSB0aGVtIHRvIHRoZSBnbG9iYWwNCj4gYWRkcmVzc19zcGFjZV9tZW1vcnkvYWRk
cmVzc19zcGFjZV9pbz8gVGhhdCBtaWdodCBzaW1wbGlmeSB0aGUgY29kZSBzbw0KPiBpc29sYXRl
ZCBhZGRyZXNzIHNwYWNlcyBpcyBubyBsb25nZXIgYSBzcGVjaWFsIGNhc2UuDQoNCkkgZGlkIHN0
YXJ0IG9mZiB3aXRoIHVzaW5nIHRoZXNlIHBvaW50ZXJzIHVuY29uZGl0aW9uYWxseSAtIGJ1dCBh
ZG9wdGVkIGFuIG9wdGlvbmFsDQppc29sYXRlZCBhZGRyZXNzIHNwYWNlIGZvciB0aGUgZm9sbG93
aW5nIHJlYXNvbnM6DQogIC0gVGhlcmUgaXMgYSBwb3RlbnRpYWwgZm9yIHJlZ3Jlc3Npb24NCiAg
LSBDUFUgYWRkcmVzcyBzcGFjZSBwZXIgYnVzIGlzIG5vdCBhIGNvbW1vbiBzY2VuYXJpby4gSW4g
bW9zdCBjYXNlLCBhbGwgUENJDQogICAgYnVzZXMgYXJlIGF0dGFjaGVkIHRvIENQVSBzaGFyaW5n
IHRoZSBzYW1lIGFkZHJlc3Mgc3BhY2UuIFRoZXJlZm9yZSwgYW4NCiAgICBvcHRpb25hbCBhZGRy
ZXNzIHNwYWNlIG1hZGUgc2Vuc2UgZm9yIHRoaXMgc3BlY2lhbCBzY2VuYXJpbw0KDQpXZSBjYW4g
YWxzbyBzZXQgaXQgdW5jb25kaXRpb25hbGx5IGlmIHlvdSBwcmVmZXIsIGtpbmRseSBjb25maXJt
Lg0KDQo+IA0KPiBpc29sX2FzX2lvIGlzbid0IHVzZWQgYnkgdGhpcyBwYXRjaD8NCg0KVGhpcyBw
YXRjaCBpbnRyb2R1Y2VzIHRoZXNlIHZhcmlhYmxlcywgZGVmaW5lcyBpdHMgZ2V0dGVycyBhbmQg
c2V0cyB0aGVtIHRvIE5VTEwgaW4NCnBsYWNlcyB3aGVyZSBuZXcgUENJIGJ1c2VzIGFyZSBwcmVz
ZW50bHkgY3JlYXRlZC4gVGhlIGZvbGxvd2luZyBwYXRjaCBjcmVhdGVzIGENCnNlcGFyYXRlIGlz
b2xhdGVkIGFkZHJlc3Mgc3BhY2U6DQpbUEFUQ0ggdjUgMDQvMThdIHBjaTogY3JlYXRlIGFuZCBm
cmVlIGlzb2xhdGVkIFBDSSBidXNlcw0KDQpJIGNvdWxkIG1lcmdlIHRoZXNlIHBhdGNoZXMgaWYg
eW91IHByZWZlci4NCg0KLS0NCkphZw0KDQo+IA0KPj4gKw0KPj4gICAgIFFMSVNUX0hFQUQoLCBQ
Q0lCdXMpIGNoaWxkOyAvKiB0aGlzIHdpbGwgYmUgcmVwbGFjZWQgYnkgcWRldiBsYXRlciAqLw0K
Pj4gICAgIFFMSVNUX0VOVFJZKFBDSUJ1cykgc2libGluZzsvKiB0aGlzIHdpbGwgYmUgcmVwbGFj
ZWQgYnkgcWRldiBsYXRlciAqLw0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvaHcvcGNpL3BjaS5jIGIv
aHcvcGNpL3BjaS5jDQo+PiBpbmRleCA1ZDMwZjljYTYwLi5kNWYxYzZjNDIxIDEwMDY0NA0KPj4g
LS0tIGEvaHcvcGNpL3BjaS5jDQo+PiArKysgYi9ody9wY2kvcGNpLmMNCj4+IEBAIC00NDIsNiAr
NDQyLDggQEAgc3RhdGljIHZvaWQgcGNpX3Jvb3RfYnVzX2ludGVybmFsX2luaXQoUENJQnVzICpi
dXMsIERldmljZVN0YXRlICpwYXJlbnQsDQo+PiAgICAgYnVzLT5zbG90X3Jlc2VydmVkX21hc2sg
PSAweDA7DQo+PiAgICAgYnVzLT5hZGRyZXNzX3NwYWNlX21lbSA9IGFkZHJlc3Nfc3BhY2VfbWVt
Ow0KPj4gICAgIGJ1cy0+YWRkcmVzc19zcGFjZV9pbyA9IGFkZHJlc3Nfc3BhY2VfaW87DQo+PiAr
ICAgIGJ1cy0+aXNvbF9hc19tZW0gPSBOVUxMOw0KPj4gKyAgICBidXMtPmlzb2xfYXNfaW8gPSBO
VUxMOw0KPj4gICAgIGJ1cy0+ZmxhZ3MgfD0gUENJX0JVU19JU19ST09UOw0KPj4gDQo+PiAgICAg
LyogaG9zdCBicmlkZ2UgKi8NCj4+IEBAIC0yNjc2LDYgKzI2NzgsMTYgQEAgTWVtb3J5UmVnaW9u
ICpwY2lfYWRkcmVzc19zcGFjZV9pbyhQQ0lEZXZpY2UgKmRldikNCj4+ICAgICByZXR1cm4gcGNp
X2dldF9idXMoZGV2KS0+YWRkcmVzc19zcGFjZV9pbzsNCj4+IH0NCj4+IA0KPj4gK0FkZHJlc3NT
cGFjZSAqcGNpX2lzb2xfYXNfbWVtKFBDSURldmljZSAqZGV2KQ0KPj4gK3sNCj4+ICsgICAgcmV0
dXJuIHBjaV9nZXRfYnVzKGRldiktPmlzb2xfYXNfbWVtOw0KPj4gK30NCj4+ICsNCj4+ICtBZGRy
ZXNzU3BhY2UgKnBjaV9pc29sX2FzX2lvKFBDSURldmljZSAqZGV2KQ0KPj4gK3sNCj4+ICsgICAg
cmV0dXJuIHBjaV9nZXRfYnVzKGRldiktPmlzb2xfYXNfaW87DQo+PiArfQ0KPj4gKw0KPj4gc3Rh
dGljIHZvaWQgcGNpX2RldmljZV9jbGFzc19pbml0KE9iamVjdENsYXNzICprbGFzcywgdm9pZCAq
ZGF0YSkNCj4+IHsNCj4+ICAgICBEZXZpY2VDbGFzcyAqayA9IERFVklDRV9DTEFTUyhrbGFzcyk7
DQo+PiBAQCAtMjY5OSw2ICsyNzExLDcgQEAgc3RhdGljIHZvaWQgcGNpX2RldmljZV9jbGFzc19i
YXNlX2luaXQoT2JqZWN0Q2xhc3MgKmtsYXNzLCB2b2lkICpkYXRhKQ0KPj4gDQo+PiBBZGRyZXNz
U3BhY2UgKnBjaV9kZXZpY2VfaW9tbXVfYWRkcmVzc19zcGFjZShQQ0lEZXZpY2UgKmRldikNCj4+
IHsNCj4+ICsgICAgQWRkcmVzc1NwYWNlICppb21tdV9hcyA9IE5VTEw7DQo+PiAgICAgUENJQnVz
ICpidXMgPSBwY2lfZ2V0X2J1cyhkZXYpOw0KPj4gICAgIFBDSUJ1cyAqaW9tbXVfYnVzID0gYnVz
Ow0KPj4gICAgIHVpbnQ4X3QgZGV2Zm4gPSBkZXYtPmRldmZuOw0KPj4gQEAgLTI3NDUsNiArMjc1
OCwxMCBAQCBBZGRyZXNzU3BhY2UgKnBjaV9kZXZpY2VfaW9tbXVfYWRkcmVzc19zcGFjZShQQ0lE
ZXZpY2UgKmRldikNCj4+ICAgICBpZiAoIXBjaV9idXNfYnlwYXNzX2lvbW11KGJ1cykgJiYgaW9t
bXVfYnVzICYmIGlvbW11X2J1cy0+aW9tbXVfZm4pIHsNCj4+ICAgICAgICAgcmV0dXJuIGlvbW11
X2J1cy0+aW9tbXVfZm4oYnVzLCBpb21tdV9idXMtPmlvbW11X29wYXF1ZSwgZGV2Zm4pOw0KPj4g
ICAgIH0NCj4+ICsgICAgaW9tbXVfYXMgPSBwY2lfaXNvbF9hc19tZW0oZGV2KTsNCj4+ICsgICAg
aWYgKGlvbW11X2FzKSB7DQo+PiArICAgICAgICByZXR1cm4gaW9tbXVfYXM7DQo+PiArICAgIH0N
Cj4+ICAgICByZXR1cm4gJmFkZHJlc3Nfc3BhY2VfbWVtb3J5Ow0KPj4gfQ0KPj4gDQo+IA0KPj4g
ZGlmZiAtLWdpdCBhL2h3L3BjaS9wY2lfYnJpZGdlLmMgYi9ody9wY2kvcGNpX2JyaWRnZS5jDQo+
PiBpbmRleCBkYTM0YzhlYmNkLi45ODM2Njc2OGQyIDEwMDY0NA0KPj4gLS0tIGEvaHcvcGNpL3Bj
aV9icmlkZ2UuYw0KPj4gKysrIGIvaHcvcGNpL3BjaV9icmlkZ2UuYw0KPj4gQEAgLTM4Myw2ICsz
ODMsMTEgQEAgdm9pZCBwY2lfYnJpZGdlX2luaXRmbihQQ0lEZXZpY2UgKmRldiwgY29uc3QgY2hh
ciAqdHlwZW5hbWUpDQo+PiAgICAgc2VjX2J1cy0+YWRkcmVzc19zcGFjZV9pbyA9ICZici0+YWRk
cmVzc19zcGFjZV9pbzsNCj4+ICAgICBtZW1vcnlfcmVnaW9uX2luaXQoJmJyLT5hZGRyZXNzX3Nw
YWNlX2lvLCBPQkpFQ1QoYnIpLCAicGNpX2JyaWRnZV9pbyIsDQo+PiAgICAgICAgICAgICAgICAg
ICAgICAgIDQgKiBHaUIpOw0KPj4gKw0KPj4gKyAgICAvKiBUaGlzIFBDSSBicmlkZ2UgcHV0cyB0
aGUgc2VjX2J1cyBpbiBpdHMgcGFyZW50J3MgYWRkcmVzcyBzcGFjZSAqLw0KPj4gKyAgICBzZWNf
YnVzLT5pc29sX2FzX21lbSA9IHBjaV9pc29sX2FzX21lbShkZXYpOw0KPj4gKyAgICBzZWNfYnVz
LT5pc29sX2FzX2lvID0gcGNpX2lzb2xfYXNfaW8oZGV2KTsNCj4+ICsNCj4+ICAgICBici0+d2lu
ZG93cyA9IHBjaV9icmlkZ2VfcmVnaW9uX2luaXQoYnIpOw0KPj4gICAgIFFMSVNUX0lOSVQoJnNl
Y19idXMtPmNoaWxkKTsNCj4+ICAgICBRTElTVF9JTlNFUlRfSEVBRCgmcGFyZW50LT5jaGlsZCwg
c2VjX2J1cywgc2libGluZyk7DQo+PiAtLSANCj4+IDIuMjAuMQ0KPj4gDQoNCg==

