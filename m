Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD55D473738
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 23:05:51 +0100 (CET)
Received: from localhost ([::1]:37586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwtSA-0003yA-Fz
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 17:05:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mwtPC-0002jF-FR
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 17:02:48 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:33736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mwtP7-0005nU-Kf
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 17:02:45 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BDLHvPv004117; 
 Mon, 13 Dec 2021 22:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=1R2Zxqdhl6JC4bpP+2jW82PajHuHnMr8wHrE/zbLNhY=;
 b=EVhwC+YnjRGPvjMzcF+nAr3TNWqZGcwMx6CLVorqoli6HG9P0V8cOTtou6vzz9B0tBwk
 XyajU/pzIvOz2Ng8XCbW+15hjffeh2HN1KwqrJ/NJ1HYOxpsdfkyWkIfBX1XnTa8sTgf
 nqk9SnA87V5RxF/HmL5imWXr4AEgVAd9K5byPY9WvC9TqJJLlWmwu59TH2S4vzAcfSpB
 yCRmsvvAXiavKVTw+Zny6FkaJ1OPgmqR+yK2qfXai5zNe5DHBQ0ZuK7Vi1z+yklUWMsG
 xYU7Y0bxwHmCCsGmfDz+vxM0miYFzr9irorO3us0AT7ZcSrMFXgjFwE8aJCY1rwlZN+u nw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx3py239d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Dec 2021 22:02:34 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BDLtmMk148107;
 Mon, 13 Dec 2021 22:02:33 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by aserp3030.oracle.com with ESMTP id 3cvj1cwbaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Dec 2021 22:02:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aB0qDM4AuiVmfer/kdArRZmfo1ow6GvN2BnVOyBSex/OIHCBZ20UlKcv5fwzqDABK/sM6dVExT7AWFwRME1z8HpsFr6BQdjFw8H/aFehbOSyncGR6QcGFsuSIPpQcE5YiNUWP2gsJazwZQEGksqfEO0ZjoTPWBR0rL/pyMLRFGauQvrZIWRNGPEXZHeGwd2MggD8JkYOLETq5N7o4Ah9ECSdMUK1wLWSMPFh2Rg/w9bOLbFeb4l9z1Ozxh7Zd1j9WeiR4TKQjWQiu8cjUGDTt/96dAQbsxlhEAamXQqtu63eOqW0EeWaKeponeYxy/K0WmOtbt9NT67gDj2Seb3CSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1R2Zxqdhl6JC4bpP+2jW82PajHuHnMr8wHrE/zbLNhY=;
 b=KlUFpTxUm7ohm80nSvf2kiJV8TeIEeS7QD8OHf4o9qWzWB1kjcVZmxW7fKZY/LYBHmyBgDQtTie9PWpqhzcjUh+Lj3iQg+se+SRvooMwBZB/2C5Rn3bdVMqhA+3uabpfJy8n2rQR2RYaZIPozHP7G7wyhtekKBJnyD5RvXpnQTiR4F4VhCEhfElb2Z3/lpxGZDIQkYv0rcfWP3aepMSZbbLUGYotdLzBQ6ONIy1CMCB2tr6P5cYO+U7HuTxgjE2Tay0/sXpf64xPKO4K3CRwftata5leQTMJBNsttqal5HHnV2JRRutZn6fz8BRFdvNj381RlDfVwKpsedd5mTjlug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1R2Zxqdhl6JC4bpP+2jW82PajHuHnMr8wHrE/zbLNhY=;
 b=iozaLCDlP0lz6vuYlzYw6AtCm0sW/fxPofjER7uLR15dHb3fkHdpMzQNu1YhgUUuSEI4QM6rRpogrZasCqJpIvGQrJo6BcsFm7KjZPUET3ObO9U4Btk7fxnviw7/sYhZKBwwOyZWoOr8hnsDqzJU5nB/Y6hWE8Y/gG8qZ+iqq2o=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5652.namprd10.prod.outlook.com (2603:10b6:303:14f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Mon, 13 Dec
 2021 22:02:30 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4778.018; Mon, 13 Dec 2021
 22:02:30 +0000
Message-ID: <21c92605-8039-974b-7f62-fb1d22e4a206@oracle.com>
Date: Mon, 13 Dec 2021 16:02:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v10 06/10] ACPI ERST: build the ACPI ERST table
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
 <1639072655-19271-7-git-send-email-eric.devolder@oracle.com>
 <20211212173145-mutt-send-email-mst@kernel.org>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20211212173145-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0055.namprd08.prod.outlook.com
 (2603:10b6:a03:117::32) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1708cfee-387e-4505-7efc-08d9be84423d
X-MS-TrafficTypeDiagnostic: CO6PR10MB5652:EE_
X-Microsoft-Antispam-PRVS: <CO6PR10MB5652407FD20E45E06BA3A2A197749@CO6PR10MB5652.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GxvzFoOkn86kjs5mRzAQNUqH9OJZtvlq6jtmO4RtRRld/FPt6iiIqNF+/BZFZSINPZtiWAZpVI1iMmbcIrz1D0+2KU9GYRraS7D6izQ6RxHHhbQozBL23MJgnd+ItIA6bkrKwxr0wcGB5PC/EsrL6Lv4wSwzoFSke2ltdfRD4sKNKrfqowIY2V6+xzz89e15PWI/LXb+n7MeX3Fi6MlwVwLPsJgd6dHyVJsjXYJ843IusjVh9sbPrrgOtfcB2WogBnTiXOja2IuSO3qPKp1ZeG0oTLD6C4hi5jLFFgJA/NEYCHJquP2eXTFnLwhw5NNFflngNW+UwJKI6SG/qCux9EVJsfw29BivUfhcykGX/NtbsqTr4RmTr771rv7f0bWNhlT+3yLfXsJJ5CI3Juy2C50jzWyKA61edm9lyzh1LZosz1lX2yj2e32nWpXj6rcIOdaGI8PWBm5B5f7G8FZJmBCyUbdj94Jxtf3Yje3efhjxpXasjHG7lnA3abNI5cqtTjnCEohAEX2nv5j5F6JCseHvOMSSgQtdgmyr3W7S0URkGrcCIhgABujMXgD1H3lHaLRgN7dqobS/yX54dRz+JK8RhjksLUbD/x2SOxuUClMhGq/8xaaEkxpT8DoS7ZgANo4XFfgzB3MCcktnszsx3IOrakXKEPmwe1ujbTATEqMFyjVdD+5XuQOcZk4Zzmlg+qjGfefZsIbuP+vmNmzGISKUkh9IcQT9u0QP/UxIpUR387/FFPh6TYvIZonQgHMC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(508600001)(2616005)(36756003)(31696002)(8676002)(30864003)(2906002)(6916009)(186003)(316002)(6512007)(53546011)(38100700002)(107886003)(4326008)(86362001)(5660300002)(83380400001)(6506007)(66476007)(66556008)(6666004)(31686004)(6486002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czlKR0JocDNHWjhaN2xraDdVYnJlaUNYTU9icU9sWDFMeldPSlg1a2tqVDZS?=
 =?utf-8?B?a3NGQjNRK01KbitwaHBxTXg2RXpzaU41L2t4NUJWN3lRakFqUHFGckFEMDBa?=
 =?utf-8?B?c2dGN0kwV2ZYZ3puVHY0WVFWNk91cENoMStTQmt6WTZ4OU5GQTlrVUJ2bGxZ?=
 =?utf-8?B?cTlpQ1VSRW43ZmlMZ2t1d3pjN3Q5L1NGQitONnF0OHpNTUVzSitNVU9qbFFO?=
 =?utf-8?B?Y29hRnFQcmN5bDZzRlBIK2s4QldHbG13c1lCcUorQ24zamxNTEpHNFBRNXkv?=
 =?utf-8?B?YlBDL2xGdjA4bm4yeFhFUG5oeEdCbU1jMGtLUWxkSzRUVVhLTEdWaCtZSWdk?=
 =?utf-8?B?M0RLaXJFa2lIZjBoa2ZqLzh0bENtbVRoUTdkYmhZN0U0dysxcTlVNjU1Z2k2?=
 =?utf-8?B?YVA0WGtTYVpvaVorZ1NrNEQ2Lyt2Vkhzd0c4bjV6QXJVdXVvSTFHZ29SY0pB?=
 =?utf-8?B?ZTNpU1dINXFTVm1qK2htcVVIMnYxVmQxMXZDWTJYaVEzNy9BbDFsSDBWVytl?=
 =?utf-8?B?TkdNQWo3SFdpNk5KTEdhNVdndTlJaGdNSWxTWkhQSk4rSVMvbmlZdEowYXZM?=
 =?utf-8?B?TE9PdWkxQXoxNU40anpVbEpjeWxzRFBEWEloc0ZMczN5Z29McXVneGsrYyts?=
 =?utf-8?B?S2tXMzJLb3VTaWVuYjdUNW5wQjFlY3RPSmV6UVZnVUVlT3pLTWpnWDIvM1E2?=
 =?utf-8?B?M3pjT0FEUFBLZWg2c005KzJJUCtTVmxOcmhIZ3FNRXZ1OUZoSmdIbURoU21B?=
 =?utf-8?B?Y3VMYk95OFZCMUhFUC9XSjk1UzUybFdIY3dUNU5aTnluaFp4UjVRdWtJTGtq?=
 =?utf-8?B?TTRCQUx0eHZ6RmxZZm14N2NhYXVOdGhkU2RuWjRTTk1FR0Y3ajgyVlJvOXFO?=
 =?utf-8?B?QzdzeUxKQXpjVDF2U1lNdFlMNVlJdWQ2OERnVHhGSFpla3VwZXhsUE5ZQXk2?=
 =?utf-8?B?VGJ1K2FPbHMxOGlIdDduSjBXZGE0cjFCVFJJYjVXQ0U4WG5qSzM3VmJ3Um9l?=
 =?utf-8?B?UHpiOHBSWFdpRHdodUdEZDlvRkpuUlZRV21DNURlWUpwRjV1NjRPY0VZRWhN?=
 =?utf-8?B?V1VSYWJDVEpBZ29uNE9IVHNsN3JzR3ZsNEpJUHc0WkY5K2M5OWd2aHdjYVk1?=
 =?utf-8?B?cVd0aVFYVzkvRWwyK3NaU0ZySTN4VlhDUmRoUWdvcE1HV2tQSFhzc3pFQ3FG?=
 =?utf-8?B?clJoUnhUdDBDZ3YycXRKMkM1RlJua0VJTE5TK1VLeGErVDNpSzE0SnYyL1hR?=
 =?utf-8?B?V04rNUhGS3VlRTBwNVZNUWNoZHprSEFZV3pUQVd3MkRsZ3ZKVTBlSnpMb216?=
 =?utf-8?B?WjlseUwvdVhiTE1rdGdYeUlTTDBOaGl6ZngwTUsycmY2RzFPOWhheXRMc0hY?=
 =?utf-8?B?RWZSQUtKR21Sb2lJbE42N0pROE0vY20rM1IvcXlOVlRVc0hUUFNkeENoQ3Mr?=
 =?utf-8?B?R0p0QU9HSENleVNNWjdwZWh4S2tuN1Q5RnJHKzgxamFGYi9GNlRYNVVSVTM2?=
 =?utf-8?B?cjFMbFR3MTZiM3pUS3RQNEJiMTZkb1o5NU9TWStUMXR1cjBUdWUrdmllcGZR?=
 =?utf-8?B?eUtkZDdoS0JHSlpXMmQzL3Zhc2JiVFNPUXlvMmdna1Y3a3B1UUhaZWxiKys4?=
 =?utf-8?B?ZGJmaWFpSGhKUDZOeThsQTdGdTBzZHAvbXhqVDRKNFg4RFhBTmJvTEgvR2dv?=
 =?utf-8?B?Y0trUm5wTm1wWnRKVGF4MUVPRUdpb2czakZ2UHFNMS94dXN1Y1hpR1cvTmNr?=
 =?utf-8?B?MFBacHRJbEQzS0JkTWZ4L1FZclhFV3poek1TdEFFREs2endlSElmR3YxYVR3?=
 =?utf-8?B?dklCbkxESENVbzhQbndLYzVrY1ZmNkt5YmZNbXRrVmlqVHhEb1UyVDhnNWJ0?=
 =?utf-8?B?Y1ptcDM4MTk0bWw3MWVzd3ZsL0FXREQzMEE4K2FCaHg0c1E4S0F2WDFuUXBx?=
 =?utf-8?B?OFBJQWttYVc3OEZub0FQNGRsa0VaTW56c1owaVdtTEVsYTdLemcyb3VBbER4?=
 =?utf-8?B?TDhQdEhjaHpVeTJwbzMrY0R1YmFFQ3dibUk0SjdQTGF4SGM1UmsxNzBlZE5q?=
 =?utf-8?B?aXQvQUJyMEJEV09YOXlUSzMyeWFCMExITmRQK2VOZEZjM2NYR3NrMUVvUEk5?=
 =?utf-8?B?RFMxaVp0VnVvcG5FMkhJUzVFY0k2ZkNHcXZSWkdhR294L3M2bTE0OEtMVDc2?=
 =?utf-8?B?Q25qNXBIRWRpb2U2ZWpTZWtNS0Fxc0VJblFudDV2WlFneXhmODB1VGlRVTRu?=
 =?utf-8?B?WlVVV2ZEVXNMLzcxZ0lYbGhvaFljYlVmejJMRFg4dFlrUitRelVaYS95Nm42?=
 =?utf-8?Q?FGIid8YeE9cwvF8bqC?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1708cfee-387e-4505-7efc-08d9be84423d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 22:02:30.8422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0f06UljO04vJDnM/OGLgf7zJEPz0Ug/sb5YBVKsfrzTXDul3iIRaQ4XC2mo7WAG/9okdTr0ICqMV42Uvf0/n4XDXSC8vpipgTCs1xzXrEMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5652
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10197
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112130128
X-Proofpoint-ORIG-GUID: 3nNDR75MvIl8uFWafFUSKUt3VvMBlbmO
X-Proofpoint-GUID: 3nNDR75MvIl8uFWafFUSKUt3VvMBlbmO
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Michael,
Thanks for reviewing! Inline responses below.
eric

On 12/12/21 16:56, Michael S. Tsirkin wrote:
> On Thu, Dec 09, 2021 at 12:57:31PM -0500, Eric DeVolder wrote:
>> This builds the ACPI ERST table to inform OSPM how to communicate
>> with the acpi-erst device.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   hw/acpi/erst.c | 241 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 241 insertions(+)
>>
>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>> index 81f5435..753425a 100644
>> --- a/hw/acpi/erst.c
>> +++ b/hw/acpi/erst.c
>> @@ -711,6 +711,247 @@ static const MemoryRegionOps erst_reg_ops = {
>>       .endianness = DEVICE_NATIVE_ENDIAN,
>>   };
>>   
>> +
>> +/*******************************************************************/
>> +/*******************************************************************/
>> +
>> +/* ACPI 4.0: Table 17-19 Serialization Instructions */
>> +#define INST_READ_REGISTER                 0x00
>> +#define INST_READ_REGISTER_VALUE           0x01
>> +#define INST_WRITE_REGISTER                0x02
>> +#define INST_WRITE_REGISTER_VALUE          0x03
>> +#define INST_NOOP                          0x04
>> +#define INST_LOAD_VAR1                     0x05
>> +#define INST_LOAD_VAR2                     0x06
>> +#define INST_STORE_VAR1                    0x07
>> +#define INST_ADD                           0x08
>> +#define INST_SUBTRACT                      0x09
>> +#define INST_ADD_VALUE                     0x0A
>> +#define INST_SUBTRACT_VALUE                0x0B
>> +#define INST_STALL                         0x0C
>> +#define INST_STALL_WHILE_TRUE              0x0D
>> +#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
>> +#define INST_GOTO                          0x0F
>> +#define INST_SET_SRC_ADDRESS_BASE          0x10
>> +#define INST_SET_DST_ADDRESS_BASE          0x11
>> +#define INST_MOVE_DATA                     0x12
>> +
> 
> I would create wrappers for the specific uses that we do have. Leave the
> rest alone.
> You just use 4 of these right? And a bunch of parameters are
> always the same. E.g. flags always 0, address always same.

If I understand correctly, I think you are suggesting making wrappers for the 4 in use (ie WRITE, 
WRITE_VALUE, READ, READ_VALUE). in an effort to simplify/hide the underlying call to 
build_serialization_instruction_entry(). OK, I'll do that.

> 
>> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
>> +static void build_serialization_instruction_entry(GArray *table_data,
>> +    uint8_t serialization_action,
>> +    uint8_t instruction,
>> +    uint8_t flags,
>> +    uint8_t register_bit_width,
> 
> maybe make it width in bytes, then you do not need a switch.

I can make it bytes, but the switch is still needed as the corresponding field is an encoding (ie 
1,2,3,4 vs 1, 2, 4, 8).

> 
>> +    uint64_t register_address,
>> +    uint64_t value,
>> +    uint64_t mask)
>> +{
>> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
>> +    struct AcpiGenericAddress gas;
>> +
>> +    /* Serialization Action */
>> +    build_append_int_noprefix(table_data, serialization_action, 1);
>> +    /* Instruction */
>> +    build_append_int_noprefix(table_data, instruction         , 1);
>> +    /* Flags */
>> +    build_append_int_noprefix(table_data, flags               , 1);
>> +    /* Reserved */
>> +    build_append_int_noprefix(table_data, 0                   , 1);
>> +    /* Register Region */
>> +    gas.space_id = AML_SYSTEM_MEMORY;
>> +    gas.bit_width = register_bit_width;
>> +    gas.bit_offset = 0;
>> +    switch (register_bit_width) {
>> +    case 8:
>> +        gas.access_width = 1;
>> +        break;
>> +    case 16:
>> +        gas.access_width = 2;
>> +        break;
>> +    case 32:
>> +        gas.access_width = 3;
>> +        break;
>> +    case 64:
>> +        gas.access_width = 4;
>> +        break;
>> +    default:
>> +        gas.access_width = 0;
>> +        break;
> 
> does this default actually work?
I actually have no idea. But given that this is driven by code in this file, I'll set an assert 
there instead; this should never happen.

> 
>> +    }
>> +    gas.address = register_address;
>> +    build_append_gas_from_struct(table_data, &gas);
>> +    /* Value */
>> +    build_append_int_noprefix(table_data, value  , 8);
>> +    /* Mask */
>> +    build_append_int_noprefix(table_data, mask   , 8);
>> +}
>> +
>> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
>> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
>> +    const char *oem_id, const char *oem_table_id)
>> +{
>> +    GArray *table_instruction_data;
>> +    unsigned action;
>> +    pcibus_t bar0, bar1;
>> +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
>> +                        .oem_table_id = oem_table_id };
>> +
>> +    bar0 = (pcibus_t)pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
>> +    trace_acpi_erst_pci_bar_0(bar0);
>> +    bar1 = (pcibus_t)pci_get_bar_addr(PCI_DEVICE(erst_dev), 1);
> 
> why do we need the cast here?
> Also assignment at declaration point will be cleaner, won't it?
Corrected; cast removed and assigned at declaration.
> 
>> +    trace_acpi_erst_pci_bar_1(bar1);
> 
> bar1 seems unused ... why do we bother with it just for trace?
Corrected; bar1 not needed.

> 
>> +
>> +#define MASK8  0x00000000000000FFUL
>> +#define MASK16 0x000000000000FFFFUL
>> +#define MASK32 0x00000000FFFFFFFFUL
>> +#define MASK64 0xFFFFFFFFFFFFFFFFUL
> 
> 
> can't we just pass # of bytes?
I could, but then I'd need a switch statement to convert to one of these masks. The full mask is 
embedded in the generic address structure.

Perhaps in the wrapper I can use width in bytes and the switch statement can producing the encoding 
and the mask...
> 
>> +
>> +    /*
>> +     * Serialization Action Table
>> +     * The serialization action table must be generated first
>> +     * so that its size can be known in order to populate the
>> +     * Instruction Entry Count field.
>> +     */
>> +    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
>> +
>> +    /* Serialization Instruction Entries */
>> +    action = ACTION_BEGIN_WRITE_OPERATION;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_BEGIN_READ_OPERATION;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_BEGIN_CLEAR_OPERATION;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_END_OPERATION;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_SET_RECORD_OFFSET;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER      , 0, 32,
>> +        bar0 + ERST_VALUE_OFFSET , 0, MASK32);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_EXECUTE_OPERATION;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_VALUE_OFFSET , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_CHECK_BUSY_STATUS;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER_VALUE , 0, 32,
>> +        bar0 + ERST_VALUE_OFFSET, 0x01, MASK8);
>> +
>> +    action = ACTION_GET_COMMAND_STATUS;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 32,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK8);
>> +
>> +    action = ACTION_GET_RECORD_IDENTIFIER;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 64,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
>> +
>> +    action = ACTION_SET_RECORD_IDENTIFIER;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER      , 0, 64,
>> +        bar0 + ERST_VALUE_OFFSET , 0, MASK64);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_GET_RECORD_COUNT;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 32,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
>> +
>> +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 64,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 64,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 32,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
>> +
>> +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
>> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
>> +    build_serialization_instruction_entry(table_instruction_data,
>> +        action, INST_READ_REGISTER       , 0, 64,
>> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
>> +
>> +    /* Serialization Header */
>> +    acpi_table_begin(&table, table_data);
>> +
>> +    /* Serialization Header Size */
>> +    build_append_int_noprefix(table_data, 48, 4);
>> +
>> +    /* Reserved */
>> +    build_append_int_noprefix(table_data,  0, 4);
>> +
>> +    /*
>> +     * Instruction Entry Count
>> +     * Each instruction entry is 32 bytes
>> +     */
> 
> assert that it's a multiple of 32 maybe
done!

> 
>> +    build_append_int_noprefix(table_data,
>> +        (table_instruction_data->len / 32), 4);
>> +
>> +    /* Serialization Instruction Entries */
>> +    g_array_append_vals(table_data, table_instruction_data->data,
>> +        table_instruction_data->len);
>> +    g_array_free(table_instruction_data, TRUE);
>> +
>> +    acpi_table_end(linker, &table);
>> +}
>> +
>>   /*******************************************************************/
>>   /*******************************************************************/
>>   static int erst_post_load(void *opaque, int version_id)
>> -- 
>> 1.8.3.1
> 

