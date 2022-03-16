Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCDD4DB799
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 18:51:33 +0100 (CET)
Received: from localhost ([::1]:59698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUXo3-0000FI-SK
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 13:51:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nUXl6-0007bV-Is
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 13:48:29 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:38314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nUXl1-0007WF-R7
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 13:48:25 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22GHCANe009585; 
 Wed, 16 Mar 2022 17:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=vYM4/SV1Katlt0ZqE50wOAxsDVt9xdST1TrQtVT/7uQ=;
 b=GLP3DmOxRSwisBNYZfqla6UTMRIXHHdTnY96zjSnXEqJz7fxhQYIaL8hKwwPmUbxxcX+
 zUwa/YlV3HZljdeik6k+b8Z/xGT42SGPt6qLFK/6qqAlUBsSc2qh2I8+zM8WxOcEjGrJ
 vJqiuUmZDDIhWq0XBD5CVjz4/aO4xVLMKGSJW+DMnJLTmDP9YnEHBWEUCp8CT0jpPqTE
 71OLF2kZAdcqjl2/IKGulmnK5ur8pmBH25TcAq+SpgT991ocwc2QEz/oJOlI2o17t/qU
 O8B05Ow7/nPhuXEnXHhEcdL7hWmaaJcM1Z23V/US+LPuzR40FmcFYcJ9xXRT27TADcpL Iw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80] (may
 be forged)) by mx0b-00069f02.pphosted.com with ESMTP id 3et60rq27p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Mar 2022 17:48:14 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22GHkufL132752;
 Wed, 16 Mar 2022 17:48:12 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by userp3030.oracle.com with ESMTP id 3et65q0cuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Mar 2022 17:48:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNukeyICjrlWPogXXnZiCv+VaccpE5ZITGYDgOq98m64FDMFVpDTtI+q1TxbxD1mgqK4u4AMgwpH8PgBWPLMYb87WqyVUAYI6p2rAONGvuhtNSNstZ7ZjzcnUVItqN6cI4ocKNGTPLW3+Wlw9iK1Coz5Q6YZTi5375B3QeRdPuJ1kIb+Pwwe+ADlsL51wS4FLuI0yltmr28h6WECg/ePWvnLzITUtKLi1Nmj2pfOka85aQgUgpBSKQQAG2kXev5fQ+opXOgx+foTyyi8jIMwznQC9LnMv0AlY0aD+kYjnzW1k4hF7pJbio3eABDpYYz55RJwfDxWZcMqWPwXbwZX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYM4/SV1Katlt0ZqE50wOAxsDVt9xdST1TrQtVT/7uQ=;
 b=mpZyG3mCSUMBA4KCpE3QNtq5U8vTB+1DZDvQZ9i7boyI0kTBMzXS2UiCpGblqiHQddNms3EnpYsH5Wu218kHUXfY47bMH3F2f78iomPwHEeP5ib0dj3I04Iv0TzaTEfA5dLvm3u+6WTG/u3wcy5lFfp/ZdVA9myym8kpvbOOXJ6B3L/JTn7yAF+/9V/txhEbpn7v7NTLDu3c71tIP9hIokYDWpZR6CE0OfTfVmwN01DhysFJNj7G7OWN0hV7Otljhl4LCHtxDlQ5o5vDn611FpaejqO+J1owZaNoj+xA/m96jxeo8TLBWvrCKNdy7ItkGlU9g32OFZKgsJEx1OCWOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYM4/SV1Katlt0ZqE50wOAxsDVt9xdST1TrQtVT/7uQ=;
 b=qpwqkXcuAGREcQlgswa1HreqeSfGWGdJ0GlHhY9RLOGcQCed7+NMCkDmlPa9yg/mO5VPJhwtdXdyfejr2Hqdn4VASPPOC3sx6n74BsD//uXIWepMHHzz8Wlu4PCVaIcXrM4U7TWMBThxdhayZDMXwAfJ8MsaU4YwbUiUzQPdtJI=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by DM5PR1001MB2108.namprd10.prod.outlook.com (2603:10b6:4:36::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Wed, 16 Mar
 2022 17:48:10 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9%8]) with mapi id 15.20.5081.014; Wed, 16 Mar 2022
 17:48:10 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PULL 15/22] x86: Grant AMX permission for guest
References: <20220308113445.859669-1-pbonzini@redhat.com>
 <20220308113445.859669-16-pbonzini@redhat.com>
 <YjII86LKWTe0mVED@angien.pipo.sk> <YjIKrSZGcvh3/Aq7@redhat.com>
Date: Wed, 16 Mar 2022 17:48:04 +0000
In-Reply-To: <YjIKrSZGcvh3/Aq7@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 16 Mar 2022 16:05:01 +0000")
Message-ID: <cunilsdvlez.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P265CA0280.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::28) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fa8844e-d5ae-4b8a-0ab5-08da07752287
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2108:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB210855FCC88975C53F28F1CA88119@DM5PR1001MB2108.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fvkzJjUNyPw1KTqCeymWOJJwnfv0HVtwh/4celUZU6o1ToRgvaRKpyDYNHAAH8Uw8ScQzP7rWaf1VppGtdEyxsYdYFCccFFiNfZ4PedLJrB/F1MUJy0X9Z7FuZ/04L44SX45NaCeLItuxUU4wYfULRp2qfczlwxdqh98gc167dgTqpuSc2qbIIMCHL+ioTRqZceR58kXGmsODdJuwtUu3E/m0oi3jy5cwdQ9JwGDO8nWgEtwT/L9rQvE6Td/qJOBTIIRWxTzsqTUraiog6+zanjvJGw1Wav1NgfASXM8zvu9eULmY5LSxRyXi7uVuERwg5GuEHOdCQpziIDdC57HkpLqh5GPTooBvxsWa/5d0RZCKkW8sN1L9CRwSQdJsheukKPF1hH5ieNIWYVUSZgLW5t+XaHn2Ay0y+T272GxRguNdkJ9rrCMfzjmU4yBvQsiqoAv2xxCI4iq/9IPzU27EMOmdHjZVUPnRM5zupVXfRhLZrvErfZ3ebTODdt+PUUBRqNZHtqdoZucPnws8n4xQ23oPKtLtG/UBhyOmGfagduSFU2vboD8Xgy7PUf6VAWTzZLp+0iQUTsE+/lZBX8+cRS2CkStufwHouNwpROVONrH7IZPNYQ77pif4I1aldNlV3tMhaiSUMCxJ3E7AcKAjAGmZvQfUK0XWAs362f5RtunYBqqfuZY5P8c0b5eCP9kWk+xXRvR+bQrcpckvtjh6VTqyyDvAhNpZDnGKthUwECs+cJ4NxwnlMvmSvVyExoosP/duPU8cAIwaGO8zbUB2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(316002)(44832011)(8936002)(6512007)(54906003)(508600001)(5660300002)(186003)(2616005)(6916009)(966005)(6486002)(52116002)(6666004)(6506007)(53546011)(4326008)(38100700002)(83380400001)(86362001)(66556008)(66946007)(66476007)(8676002)(36756003)(4226005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHlWd0RSQWJBYUJnWmFRR0xHcE10RDNaTVFqNTRXbWRnVisyVmFYY2xFdC9U?=
 =?utf-8?B?SlRLNjdJVC9QMmE0ZGNFcG1xSVZ6ME5kS1IxZVFPcUpUcVFMVU5QZ1NibWM1?=
 =?utf-8?B?dm5nbisvczF4cG1sZjBYMEtXdnNNZ05aUUtlK29DWGtlMEhZbklwd2tPSkpL?=
 =?utf-8?B?ZTU0bjZpQm5wcWJPdVovUFFpenRwSHRFTXV2c0x6a0VHWFJXUXY3SkZ2NnR3?=
 =?utf-8?B?RnJUTmt1aUoyK0JGSjFDdTFHaFVOUk1NUGhMcnpDYm4rdmJ5amQ0alg0eHRL?=
 =?utf-8?B?OHRlVFBtRU9XeG0vYXBhb01RTzZndGovbmQyRVpYTG8rZFcyZFQxMVFiZ2pv?=
 =?utf-8?B?Y0tqT2EzZmdST2pwdFJZMWlnQWJGSDhGRWtkbFpJTWlZbHF5ekQzR2prMHE4?=
 =?utf-8?B?VVk2a1JENHUzMUJodGo5dk1DK2o1UW9id2V6OTloZ2JYNnIwRFdMZnBCbFlp?=
 =?utf-8?B?YzB1RmRpYUh0YWZoNllFaXpjbGxEVXNtYkk5a3pWQ0lNbTVUQkt5QUVjSUhn?=
 =?utf-8?B?anhtVmozWEp6eGFtMDVlMVNGM1FObGRwa3Z6Y0tzQUorVWR0Nzg2SG9aaSs2?=
 =?utf-8?B?Y1hNU3hXZ25vUVJoaDM5NElJS0QrbkxNWHZsQzh4NmNXaWExWVY3bldSRE1r?=
 =?utf-8?B?WS9lblMwQlYzbUd0UXI2aUUxWE9Gb3hjV3QrSGhLM0xsdUVSTGtFa1JhUkVR?=
 =?utf-8?B?YU9DYVZFZ3loTXpaNEVVc05ERW9xSUwvTE1WN3ZlVTlwTG9Ra1l1R1F0QzFp?=
 =?utf-8?B?U21aMktzM0E5OWw2aTM4VUhrSTh6V2xLNndhTlBOQmNvOE5veU5Tcm15dnFt?=
 =?utf-8?B?WjdPMWFMZTNXN1pTUkkxRjJURkRIaGZYcTF1NWJ4TThZVFNqVDNxZHc5cStJ?=
 =?utf-8?B?V21GSDRZb2h6MWs1c3JEdmRYbVB4MGtwSWpRYklDZjFGSmUzUXVOamZtTnBH?=
 =?utf-8?B?dC9Ua1IyYWo0WDZ3eXgwYVd6dCtlQlpKc1cxdEQvbkM4Q2JCODVZMlhFOTNI?=
 =?utf-8?B?bmRMcEtIUDREUGlJTUs1OUxacVpJZFMvQnRJTkhlMm50WFBEWlE5SHhPeUJX?=
 =?utf-8?B?d0E0L0JucDQyR2NVR21ML3BsUUJSN3ZQQk1MVkhYdWVtN0ZHcFh2WlkxWXRq?=
 =?utf-8?B?aVMraXZ6VW1EZWpISUIrT2RoS0ZXN2tCMFJZNWJhZEUweGxKQjdPaWtKS0c3?=
 =?utf-8?B?UHZnOFg5RkdTaThnTUlCbDNQcy9sZkpmQ2NKQkRlYTJDTzM0SjdMQzBiQXQ5?=
 =?utf-8?B?S0pNSG1zempMaFdpN0FvSCt3NW1jdERwR2diOU9NeVE4V1hpcUtiYjV1UmJ4?=
 =?utf-8?B?SGlyMEdDVXIwOGR4NGZaM3RGTFFjR0ROV2IxTFQzTk44QU5mTUl1TG1UeFBs?=
 =?utf-8?B?RGRYYVlLQ0VlUGduc3h6K3RoQ3BRZGlCSnV2Q2hzZlhEeWVvejFnamkvUHRi?=
 =?utf-8?B?US9naG5KK0RQV1dxdWxJT1dzYnc0N0hDS29tYml5bDNoK0dIYU1ITXhaaFFN?=
 =?utf-8?B?bXhQMlNoRUcxOFZBUmt5MHphNTl5R1ExOTU2RncxTkxsZmdXdUZOK2poTkJZ?=
 =?utf-8?B?bGlLaitMVUVuTERuM3JERlc2WnRodFcvT01WVHJMUnJFWitQdTdvTDFVcW5Z?=
 =?utf-8?B?MnVGSS9zMytOKzhEbTQzbDBwOEx4UGJpN3dzZStMbXRTRVFlSEFJOXo0bG50?=
 =?utf-8?B?Nk1ORU1ycWppdHFIS2lXS3o5OUR2NmlKL3FIRFlyVlNYL0VCMmhwZDJPL1FQ?=
 =?utf-8?B?NXBWbTVyS0d4cmhGbk9rZjRFM1h0SVNHQ3ZRdGRHVkxDcDNOblBGazJpRlZE?=
 =?utf-8?B?MnIrN0xERG8zanM4T1F1cmljdEh0N1djMmp0Qk13YjFLYWNSZ0VmeGs5R2xI?=
 =?utf-8?B?MjhyRUpDZjQyOExIZ0FZSHVYNWFGYWVLNldMRFV0M1dwZTRGdnppMmxud3ZJ?=
 =?utf-8?B?SEJCQWdiRzNBMTZicVg4MnBGa1NBYjk3RzZWTThtMCswTitWYmtsMjZ4eVBZ?=
 =?utf-8?B?S25MNWdnVjQ3Yzlrck1VNWw4eWxsU29ETEdjZlFiNjMwaVZDVFpQdUUxWE10?=
 =?utf-8?Q?yLfufc?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa8844e-d5ae-4b8a-0ab5-08da07752287
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 17:48:10.0220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7MicoOpoxTaFxh73e7dglolT725cXHYS2ggyNJpMnVi0QavBPsNcDuIakoBaHoLQ7ymxuheDvTfz2EEz58YeUk1umLGTAOV8Fqal634tUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2108
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10288
 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203160105
X-Proofpoint-ORIG-GUID: ycW3t2LBmQadNXdte46IKoNWBeJlsF8J
X-Proofpoint-GUID: ycW3t2LBmQadNXdte46IKoNWBeJlsF8J
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: Yang Zhong <yang.zhong@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org,
 Jing Liu <jing2.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2022-03-16 at 16:05:01 GMT, Daniel P. Berrang=C3=A9 wrote:

> On Wed, Mar 16, 2022 at 04:57:39PM +0100, Peter Krempa wrote:
>> On Tue, Mar 08, 2022 at 12:34:38 +0100, Paolo Bonzini wrote:
>> > From: Yang Zhong <yang.zhong@intel.com>
>> >=20
>> > Kernel allocates 4K xstate buffer by default. For XSAVE features
>> > which require large state component (e.g. AMX), Linux kernel
>> > dynamically expands the xstate buffer only after the process has
>> > acquired the necessary permissions. Those are called dynamically-
>> > enabled XSAVE features (or dynamic xfeatures).
>> >=20
>> > There are separate permissions for native tasks and guests.
>> >=20
>> > Qemu should request the guest permissions for dynamic xfeatures
>> > which will be exposed to the guest. This only needs to be done
>> > once before the first vcpu is created.
>> >=20
>> > KVM implemented one new ARCH_GET_XCOMP_SUPP system attribute API to
>> > get host side supported_xcr0 and Qemu can decide if it can request
>> > dynamically enabled XSAVE features permission.
>> > https://lore.kernel.org/all/20220126152210.3044876-1-pbonzini@redhat.c=
om/
>> >=20
>> > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
>> > Signed-off-by: Jing Liu <jing2.liu@intel.com>
>> > Message-Id: <20220217060434.52460-4-yang.zhong@intel.com>
>> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> > ---
>> >  target/i386/cpu.c          |  7 +++++
>> >  target/i386/cpu.h          |  4 +++
>> >  target/i386/kvm/kvm-cpu.c  | 12 ++++----
>> >  target/i386/kvm/kvm.c      | 57 +++++++++++++++++++++++++++++++++++++=
+
>> >  target/i386/kvm/kvm_i386.h |  1 +
>> >  5 files changed, 75 insertions(+), 6 deletions(-)
>>=20
>> With this commit qemu crashes for me when invoking the following
>> QMP command:
>
> It is way worse than that even. If you remove '-S' you get an
> immediate kaboom on startup on AMD hosts

Which AMD CPU is in this host?

> $ ./build/qemu-system-x86_64 -accel kvm
> Unable to init server: Could not connect: Connection refused
> qemu-system-x86_64: ../target/i386/kvm/kvm-cpu.c:105: kvm_cpu_xsave_init:=
 Assertion `esa->size =3D=3D eax' failed.
> Aborted (core dumped)
>
> With regards,
> Daniel

dme.
--=20
My girl Friday, she no square.

