Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6DC4D01B0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:45:27 +0100 (CET)
Received: from localhost ([::1]:50028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nREc1-0003IU-Th
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:45:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nREZ8-0001Pi-4s
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:42:26 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:11470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nREZ5-000289-Id
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:42:25 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227Btvsn028756; 
 Mon, 7 Mar 2022 14:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 from : subject : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=krwm4JYLOa59Q9Rsa+JaMEqVX9LQMDuOeGY1wAjXRQg=;
 b=Bd/EDrgLDC/BjNIGmWTINFne8DUiSoASCl3IAY8XHdwbFOLsPe0mYVtc8cDGYYcZto0n
 QRgcPABcvfwU/nfDSnnlCOktNkabeS6gX88+VBonqPpXH2L2JsFmXj9n7lbP5tWrdEwF
 5eO7UVYNFG9+f9tjdjMiKeJ4Syra2peydD7bvdebTTLXiiB8olsB93GjDQb91gcbagsG
 ZV3UMGcnokEmbbA+bIIh/6wAWMsv2EqRGBWjjN51HU/FpTEVIMHfv2d0xWBXgfnb2KXl
 x+LwhdznoJJ36Yke/hlNo7azXB60RS5xLtybq6MldWxIeLzpgH6EnGJMSyIGglEqUfEg IA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekyfsbxgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 14:42:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227Ef6gh085729;
 Mon, 7 Mar 2022 14:42:10 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2174.outbound.protection.outlook.com [104.47.73.174])
 by aserp3020.oracle.com with ESMTP id 3ekyp17ey8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 14:42:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k85AAX8eiXjTIm1XfFTLlFiV4v/q7Dz4sszqXRlSqC1nH1io1kBjkrYGkO15qmA71MIBhROhtC6/59lwe9gHzbhumZZgC+x/PrnvQyQbViTkDgNuHtxqz+2U1gERltbF1aDfB06m3iL3wITQqzI5nQQa7qav8k5LoDg6fszEQAzSBouPywVKaEoDl0KcVFvpQNaa3lCK66QQcwhm5gdMZat0r0iiVo8/p5Kx8LyJmcn+N6wWLZWIYNQ7JoK73JSNT4tgl0flvlqnk7MioOyWSZukjJ4P3CHrkjCLHfLj6A1895kKrOv9i8qazvId5JJCBix6XxN1HTfF9d/l4nAFrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krwm4JYLOa59Q9Rsa+JaMEqVX9LQMDuOeGY1wAjXRQg=;
 b=IUvZeOoD8MH9/EssqhvmfBAwCFcLXmfD/7oDQufso6YHVaIlRrE7FNWsaQEK6moEPZlkWqHZ15Z+we0+YjmDmN3qzqmmpfRMTTbuPmMovR9uWPTBp0Tv+2rzmbjRqc7lm0VyVSqsNQVfxKbiSve7H7ZVcQ3Fe4q2/S7hUvEdYgDfS7Nuu3GCMz29YHNzOSamu0+LyZF0LGfHjLO8Ty5dlMG0wSp+KWqNRd4RXxXsJ6kCLWNee9f/gSVPJWif4+uhsmZsNuPFPsSJSgK92++Dwf2Kt4coYPLZioFhqfHw64fbdYRsJuQR60aLEWTqR2BokapCGRbsNLjVxhrBVte9eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krwm4JYLOa59Q9Rsa+JaMEqVX9LQMDuOeGY1wAjXRQg=;
 b=ezInucEJrsFkjFJadMby4EJqEljbEnwM7oMMB/ae/XcBbgYNgMLjNYD2OgQcZmYy79Hv2SEDSGV29a223/xLbpi5Uu/fEpVlgfO2UjF7ugUVr9gbjsdxkKrDGeHUMqglTH4oAvezRA1n9a8bC5ZIFxP/p7SLoE45Wpt4BdyHcjU=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BN6PR1001MB2100.namprd10.prod.outlook.com (2603:10b6:405:35::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 14:42:06 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 14:42:06 +0000
Message-ID: <4ec62e57-87d2-dfc3-f408-83b9a51b3b62@oracle.com>
Date: Mon, 7 Mar 2022 09:42:01 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
From: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V7 08/29] memory: flat section iterator
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 qemu-devel@nongnu.org
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-9-git-send-email-steven.sistare@oracle.com>
 <d87b6338-d1ea-3e9b-ffc0-fc822d98d26f@gmail.com>
Content-Language: en-US
Organization: Oracle Corporation
In-Reply-To: <d87b6338-d1ea-3e9b-ffc0-fc822d98d26f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM5PR07CA0034.namprd07.prod.outlook.com
 (2603:10b6:3:16::20) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b724eb3-e398-41e8-f66f-08da0048a6fa
X-MS-TrafficTypeDiagnostic: BN6PR1001MB2100:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1001MB2100B6D2C2FA50BBFE5533DEF9089@BN6PR1001MB2100.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xxYafDtNImDhy8nZV4lZPSuH1Dr5d6O5+FqEaNHaxdANy0bSEptpygltUK7ISrOGmxfR8tfp9A6C4jeflLzU8rYPwfEt9EZ8UjgHKOZYaPbARGt0AphCKDqOvQSwVnI890Q5oMjEnc05upri+TyuGEVZK9iQTnTMdYq7RnIY1tg2khBLTnEeTeYrKp8/mc11AsrMsqRZtXt0HEE7L3O+eQm2XYC6Pj8enu2qrc5/8KWUY5cdbFUn/qQLjmM/Mp7QOlo2Ut3Gl8SqQLqH9x5Doeq/S9Eynj2qdorpRBbluHuxcUXQwiW6NshogdSmBTRjcLXQdTI3nhJAgBzlJWwhGBZIrc1X1o0QEv8d3tyy7a+qVLLGL1+gOG/3SSLwO94E2ICFsUyJpu5X2BZYMV0xWmfQpi0iqjDtSnMNi0gHlekjy19tShrdTyRgUmXbML6e6Oz8tIT0nNk1X7EzK/UaDedUmexYUkuw7Wm8wuFQ3NAkIYGArM9SUq2t2ANCSIVhqjBONCBIvHDdUlvHXDlpYhGRY6PuWnps+QROKYU1C3Uk6fuDwHE2EbZXA/yxoVwfZojL+/HVGJFRqz6k5nZMJP9TbHc2MXR8j9jCH/+B1ku89EIz6VskApZ9zYSsx6oA3matANM8K+7IkTANwo1h7WO9jQW5PsXsEQvBr1MZNef51ViJ0er95l4fRz6k7xuENq4LvnYkj70iaskztuMgB4cLNccsVxWVCA7kapsEWIIANqpL/jvnkoIcvdeOmfdL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(44832011)(508600001)(36916002)(6506007)(53546011)(8936002)(66946007)(7416002)(86362001)(5660300002)(6666004)(6486002)(2906002)(6512007)(26005)(186003)(8676002)(4326008)(31696002)(66476007)(66556008)(2616005)(38100700002)(316002)(31686004)(54906003)(36756003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFpmMFpMSS9ZcVh6STh2Yko2TGlzTlQyK3kwYlhQRThLdFR2MFJuellKOVdN?=
 =?utf-8?B?T2hjL05YQkZsU1ZKUjAxcmFsbTFIRVpmczhJcWlKY0R0R25zaU1DOHNROHFx?=
 =?utf-8?B?UGUzTmNGRUhjVVZmSkptc25STWJUK3RwNGxYYTVsNldQU3p0a0JnNlVqb2pp?=
 =?utf-8?B?QlVxTkMwS3RQSUhYaDh6MEFxeHJZaFk1TTc5RzRXL29RWVZ5dlJxWk8yaWJY?=
 =?utf-8?B?ZUlHZVVJOUY2MEM5Z1FuMmNOSFlQUzlyNHpqRXU3endkNzFZS05nYlZOUml5?=
 =?utf-8?B?YUdqUkxzeXpwbjdSWnlVS3VXd0ludituMTd6MlhDMTEwcGZPR0x5WGk5ZW9Y?=
 =?utf-8?B?MjN5OFZJSTEzTERHYnhGU2M1Ymg3aGlaN29zUlB0TXMzbEV0MHR0UDBDTHB2?=
 =?utf-8?B?QW9uSU1DNXQ4Zm1IQThySU54UVlscFNuU05GTjlIK0RnWUZGbmxudEYxbjZ1?=
 =?utf-8?B?Y3ZXU3UzcVRja3lQNjUyZ2ZYdHo4Z3phdnR4QXNEM05pY1ljY2NoQWF6ZDg2?=
 =?utf-8?B?QUN0ajBDWU1LaDEwcmdpWWZOZXM0RkM0ZnE4cDRMR2xMSDJ5b1NZR3FpUE41?=
 =?utf-8?B?a2xtQWhKdm54dFphdzd1aHhKNUZTWnBQTUhubFRMY2x4UDFrODAvMWs2RHll?=
 =?utf-8?B?VTFCNmVteVljUVhLTHdLdndiemZKNEV4K0hUK2MxVHRWdUVLMHB2OGRZT29E?=
 =?utf-8?B?bXpyYlY1YnNBSlFobGEyUXZoZjQ1bGRVOVU1b2ZmRnVpKzJRcE9GSzM5RCs0?=
 =?utf-8?B?elFFSnFkK0dnYkFjNElIeGw0VlF5dEVCWmVXKzgvcktSMjlDQXVCNG5EMnds?=
 =?utf-8?B?cEhKME5kWXhrb0p4clJVSG50Q0g0V29KcE16SlR5WlhhdWxEQUthL2pnL3ZD?=
 =?utf-8?B?WGFPb1JaRU5iRkExQVZhUXAwOGcrSTlkalRucHRtc3VXL3QvdVhUQytTL3Zi?=
 =?utf-8?B?K2gvYVM3MHYzY3dOQ3g4ZkdpUzJacHhPNWx3aDY3REI1dmhkL1BHVVdSaWRW?=
 =?utf-8?B?cVZ1VVhick5qYjlzV1lMa2J6Nkw2N2ZMbVpycEtBVmltSzc0M1Rna25wcTh2?=
 =?utf-8?B?SHE4TDRzN2JqVS9aOExqVjFpeElLbFgwdzdVMjFITEZLYlNOS0FVY3VpRlEz?=
 =?utf-8?B?VVBtWFZVNi9WamNBY1dFeU9FcmRGdGZBajhxWDRjTWx6M1gvSFBNeXFnQjNE?=
 =?utf-8?B?eFFYQ2VtbEUzZ2NlQXRPZkVmNXpDQml3Z0s3eE15dDIzcVlJU1V2WCtySEk3?=
 =?utf-8?B?UjdKYm0wMHJxUm1uQ3FLdC9UcU9iMjJEdk5maEJVTXFMMHBLejBST0JPMkZL?=
 =?utf-8?B?YWx3VWJkTGtJS29ZN3ZFeHNnTVJtbnI5aHM0UmQ1NDdUMDFxeVZ4MG9pUzhq?=
 =?utf-8?B?bE9ucnZ3L1F5Mlc0Y1VyaXdOeE5sc1JHRWhSUzhOZFd0MVpHWVdYL2x0SGNP?=
 =?utf-8?B?TVNxRHpIeStyV2VJSmRhR09LeGpQSWFFdzF3eDVvMnhqV0ppNU5ZVStoOXY5?=
 =?utf-8?B?bHhBcTA2SE9CSWpMa0Q0UXlXYmVIdkhvZ1lKb1hGRVhHSVpEaHYvVk0ydStN?=
 =?utf-8?B?ZDNuY2c0OGs2Nnc2NTVxYVIvTTdyS3l0VnpLUkpoalczSVBNV2VpTGlKR0J2?=
 =?utf-8?B?SHk4bmxuZ0JGRlllMzVVb1lja1NPNEtBQUg2OGdLZzFZRHpZNXVsemczUjh2?=
 =?utf-8?B?NWc0MmkrU29XdXJ5OUpSVmF0NHJNQ2NOUCtETGQwM0IrYzNsQ3hqMEwzVG1X?=
 =?utf-8?B?MmV2clhUNTRWM3NhOUNYZnZ1d1JsYnJITnBHSno2cjE1RVZkQWhMaGFmVURC?=
 =?utf-8?B?NUppQmlLNGZTYUp4d2VXMC80RUdFYVBZMUkrQkdjdjNIZkI5T2JQSUg2SjJQ?=
 =?utf-8?B?akhCZ0p2T09NVGJOenJPdkJvRUZYU2NOMWgwcDhQM0tRWmM1d3hUWUFVclBB?=
 =?utf-8?B?ek9rd3lmQjZ0RHg2d282V09uNUJLbnpUMFR2SENQQkJCSHNZV3VTclFmS1ZF?=
 =?utf-8?B?UHoyYjQycGhSUUV4TWh6OTMyd3Z1TkxwVWo5UlRWd1hzWll3dmNZRlZkdjFH?=
 =?utf-8?B?Ylc3NDZoOXJlU2s3d0VEc2dRQytGdTJGOW5oQ2s3aHFLcEdmVzcvTTgvT0xm?=
 =?utf-8?B?bENuNkFqK21MRm0xclVYdVlMTENQaFdXTXY3RXRib2krL3BKVDF2dmMrTjRY?=
 =?utf-8?B?QTUrNkxDeTRNeHRHWHRVWmtXMUpvTUdCY1Bxcmc3TDg4c3crbFRpKzN1Yzlv?=
 =?utf-8?B?TTl5V1ZPdDBFNTJWRk1JR0ZUSUNRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b724eb3-e398-41e8-f66f-08da0048a6fa
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:42:06.7331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6D+WLJcKYaLIrcameYJpDJASS19cIF1lo0Z6G/eBqHpMK/yMyiqyMIvGu7f16UQR5/dbQg5gXuyzaP7aZtFNcvpgBD825BCMD5HTQzvrkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2100
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203070085
X-Proofpoint-GUID: mGQpK15J-ReY-el6A0LSq0VdT99DwFBC
X-Proofpoint-ORIG-GUID: mGQpK15J-ReY-el6A0LSq0VdT99DwFBC
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/2022 7:48 AM, Philippe Mathieu-Daudé wrote:
> On 22/12/21 20:05, Steve Sistare wrote:
>> Add an iterator over the sections of a flattened address space.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>   include/exec/memory.h | 31 +++++++++++++++++++++++++++++++
>>   softmmu/memory.c      | 20 ++++++++++++++++++++
>>   2 files changed, 51 insertions(+)
>>
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index 137f5f3..9660475 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -2338,6 +2338,37 @@ void memory_region_set_ram_discard_manager(MemoryRegion *mr,
>>                                              RamDiscardManager *rdm);
>>     /**
>> + * memory_region_section_cb: callback for address_space_flat_for_each_section()
>> + *
>> + * @s: MemoryRegionSection of the range
> 
> Nitpicking, can we name this @mrs?

Sure thing - Steve

>> + * @opaque: data pointer passed to address_space_flat_for_each_section()
>> + * @errp: error message, returned to the address_space_flat_for_each_section
>> + *        caller.
>> + *
>> + * Returns: non-zero to stop the iteration, and 0 to continue.  The same
>> + * non-zero value is returned to the address_space_flat_for_each_section caller.
>> + */
>> +
>> +typedef int (*memory_region_section_cb)(MemoryRegionSection *s,
>> +                                        void *opaque,
>> +                                        Error **errp);

