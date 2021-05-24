Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681A638F30C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:33:41 +0200 (CEST)
Received: from localhost ([::1]:37974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llFOW-0000Sz-Fy
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1llFME-00065e-RC
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:31:19 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1llFMC-0001SL-8o
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:31:18 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14OHqpK5015080; Mon, 24 May 2021 18:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=UlbGheDLIxdY+HfDx/9dWA9tCEEYnANkccDqeSxULfI=;
 b=VPHSNw50bs6lAaYVkUaeOhoLI0a/C8jfmHLaTWXfDDVkl7iwlMxEFi6EWjWIwH9Q121j
 IfViBi05V74X0A1WRybvdWEPbOh4mCyOw2JZvhlu4opJFF8ACoydvoJkEykZN18XwiYO
 Nu79kXCpUeC38yALVX41j/X2HNXBdo0p4u7Oep61tGj+Lzu+J7KFCDa9fYQY2xt8jxkB
 kqWQCllP1/buYGPdwIhzz8Vzr6eayfwCRosHBVDG55EKlZjgmOlvO2/EgFnYN+MdkR/f
 4uk7+W9g+gYGX8TNRgzEZWH+jOIPWu7UgjeSBvIk1A0YffDWcP5cunk/pYhYSrqyKvpf kA== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 38r7wer720-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 18:31:10 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14OIV87f164377;
 Mon, 24 May 2021 18:31:08 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by userp3020.oracle.com with ESMTP id 38qbqrf4es-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 18:31:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDa2l+WD/YHMDWZ9CCAy2RNGrN7p+kO1SI1x4XfVxWd/yrRmlRrvi+aKeD8rzPyWzjs+QB/3P9KanRfvRPjzxDs4UJfLQvhczn6jz5rTm83QY5b3K0Akj2cZuOvILVWmWZuPKtLw0pMmAa4nScxVkjzgbPYgdEY/XbMvPUavS4tvDDLJBe4kATr3eDSV8+g4Ux6f21By06SBX9J0NPCCwRLUeQW9pOlXVnwmRgGUfpJD7TYG+dYi+ASjqjcq2BSZ+i1sVYbhSg9ZE13qcX23lYezu1roE8GG7d+otFWyaqGV+uMvi0skZOaWdrTKwMBRTq6zNJHy2thYfIrlymqoyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlbGheDLIxdY+HfDx/9dWA9tCEEYnANkccDqeSxULfI=;
 b=P/uTSRFFj2npI2BR4tUznRwdLP2AYLk6yhj0/ldMeOG3bx7GaMu5TobFXs2wWheRP2pTOjNTtO03g0VGClaMM2LK5TRvWWQbCSeSLHfznHJ1Z4K/Kvl0qN1pJRFtdeLpiufNfxV/0W2XCAJWnG12u0p43RnBchwWGoX3Qko8x0SfdtiWLNUemtZIXSBs54xaQQKAC+/XF4CwgMsOPhJ5NF0X/RAM77L0hDy3ys/gzjbNeidmsIXWXltpBIvDczmBnNM6dsqMvRDs9xFuGUIhCnXvsnYyEYhCHa8c/Dts3QqsZMU0wQD9L38fCd9jDW12sOLExcK0tWdv7WwyKH0lRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlbGheDLIxdY+HfDx/9dWA9tCEEYnANkccDqeSxULfI=;
 b=ke9emkj4oWB0sJDvRIFPjRhOS5eoOWnMLTEfk7Zy/Gv133BzjtxnpoATh7maTH1U3p94c6phzJ6yxchhJ4JgV1dX+bz/OzgiUTu9ShQLr3pR3QnbLDVRog0f0VuyTNlDtW3pRRIW+dUy8FBVK7QJVDp+eZQYm81NnR+RUwKGa3Q=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4543.namprd10.prod.outlook.com (2603:10b6:a03:2d9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 18:31:06 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 18:31:06 +0000
Subject: Re: [PATCH V3 13/22] vfio-pci: cpr part 2
To: Alex Williamson <alex.williamson@redhat.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-14-git-send-email-steven.sistare@oracle.com>
 <20210521162448.65ec5f58.alex.williamson@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <4bc66f61-b7b8-3c7e-3c87-d0573edab2c9@oracle.com>
Date: Mon, 24 May 2021 14:31:01 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210521162448.65ec5f58.alex.williamson@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SJ0PR13CA0125.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::10) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SJ0PR13CA0125.namprd13.prod.outlook.com (2603:10b6:a03:2c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.12 via Frontend
 Transport; Mon, 24 May 2021 18:31:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6615d99-71d1-4ecc-f906-08d91ee21811
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4543:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB45431C78C4D88BF7DBC49146F9269@SJ0PR10MB4543.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zXw8hD01tlvbmCgQdXlzb3lTZ2Fm9U6KusgCYKwYncoOxmoOW2osfaU3IYaGDCRR8r6o/R8aUMdxlHBohvs399VGeZA99NfjTfMorhSAlemL3w8Pa6aJ9wJeENSj9zmlERvJbTva4jj5X/v4625DPP43AjxO+mVWYtfD2UTLyfNSDL4YkwW2MftUzba8oXPDD9810f/NtkjKqwhRPQJlLc3wASz7d3BhY/gJiosMuRVdHc+bPqczrqXQaEB/w3daBcn1SCU1dEg40FRy53VQViMyXJjD7mxxHxh8fKqti42aiKAUKa7vRl/meCfZAVFqxZkN4F0OCXJSgtHBmbFJR+hX8v8jtuPjUrnJNJNEWcY8ZAJlKuECKAqDar1RU33EzwU1p+XQYU8I3dQBvJbT0YWj+jWOzsOv9aGkRJaxqbY6zkb3TbKb3Gx/mDDbMa5canLu/oxTJ5/0w3LTqWxeVkk3dN+8ahe1PjQwTeBxzTA5Y1f1rnxH+AGnob24DsJ6DklbyKknd93F80jASmpHQ9AUpu8d4Fgi4gZoQrwGlu4XxWCOiRc/bi821mc8bYZcHpfUFoT17D8mfvYnjTcilaj+l9geCGVM6hrGO1UuOy4ITA+5jiEcbIsm3AWRAOoKRgdy7div6xbU3oYVuxQPrEyRl1+CjYQyGcz8XGFNNM/PJUR2AHneUZhA3GU6lH+S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(39860400002)(346002)(366004)(396003)(8676002)(31686004)(36916002)(66556008)(66476007)(478600001)(36756003)(53546011)(66946007)(83380400001)(107886003)(26005)(7416002)(5660300002)(16576012)(956004)(31696002)(2906002)(16526019)(54906003)(2616005)(4326008)(186003)(6666004)(86362001)(6486002)(316002)(44832011)(38100700002)(8936002)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bWU2Y0JNYm5TK05MR3A0ZzNmdU9RenZYMlB1SEtNeFdHS3RpMCtBVWthR0tE?=
 =?utf-8?B?Q1dLU3N1bDh0U2JuN3dPTzdoMGQ4cEMyclA3MFBMK2ZhMXU0cmV1eGZ3Zk9o?=
 =?utf-8?B?WVUvZ3BqenQ5ZEdYejFXb0t1UFRlSXp6VlUwVGZaOVBpdFROUVVSSVNBQkIw?=
 =?utf-8?B?N1B5b3JkWVF0RGNHNVFZZ0dmWTB4RFU4TXhRYVdKQUhINklucGs4ME1DWjEv?=
 =?utf-8?B?ZW9lS2wyVEhxMFNNcThWR2pqUWFjVEJsdDFqQWNRcTBtMVJQTTR6NjlsVVMx?=
 =?utf-8?B?Zis0OFU4U050S0U2a1Y0Y2JQczVCcGlXRFp3aXo3U2o0QkxDaDNwL3phM1lr?=
 =?utf-8?B?VmE2Slh2VXBJMGkybk5lbk1Bbko3RUF0cCtpWm9wYlIrdWZ6RSt6WW10WTBM?=
 =?utf-8?B?dUE0MmlzUU5IK0Y4NmtHNjAxZEE5NEtlalY0empDbnBJYjFMVXozVGRWWnNJ?=
 =?utf-8?B?YktkbDNLSFZlSittQXlmUkhpMkJQTUxTcXNGTXFQdEpndjZvdzRUNEk0QXgw?=
 =?utf-8?B?SmVRMGlDaHlnd0JRYzF0cExFTjJLZnJ6bkxUZmRFb3ZCZWl0YzV6VGNiUENs?=
 =?utf-8?B?bVpYbEdKMFdTM1JCYzVWYUJINUJpcmg3UGt4cm5yVm5XUGk0V3F1cmNTaDF4?=
 =?utf-8?B?M0JqVGpiT1RudEduWGlIenpwUy9YcmcrMXUra0FpdXJoajBTMUVMTjhacnR1?=
 =?utf-8?B?TWFIT1Z2cS9LN1Zkd3JIUU13TXAvYnpqNmpIZld1Z2ZKMEVrUkwrMnVpWFE3?=
 =?utf-8?B?T0tjU3ZUZ0xlSTM5Q3prN05NR3NENjBCU3lKa1VBbjlQZVFoZG92bmxraU9v?=
 =?utf-8?B?QkpvNGtWdHV0UWtRaXlSMllkOUtveiszdkJMZk02azd3Q0EvK3RNZGNSajN5?=
 =?utf-8?B?aFRqbjBjSXh2ZHV1b2pPZUNWb1FkQzc2YjBjM0toVysrdUxkd2pRemt1SDB4?=
 =?utf-8?B?eU1tZUtqSnNyVUtiSC9BdkZhczFlK212T09lNWtvRVZwaWtPNVQ3M3d1Z2hT?=
 =?utf-8?B?aVpGV1pCWHAwTU5rMXdsN01ETmh5SHcrd09hY0pJRFlYei9HTEM1ZEU3UEUy?=
 =?utf-8?B?K3BSc3h2MHFlMHA2T3ZuazNPZDR3N1hRYjJ1aWFIbXFydEY1aStqTlE2V2tD?=
 =?utf-8?B?Zm1ZUkxtS05URFEzZ3UxNUpUdk5waVhmR3BjaE9yTHlOY2RENFRUbDh3NDBx?=
 =?utf-8?B?eHpiOW9NVTZFdVgrMHNlb2JMZGpvb2dXVXpIQy8wemsvR2VsQTJ1M3dTNFFs?=
 =?utf-8?B?WGIzT0tUY3U1aHlPNVZFYzZqL01DQTM4VCtEQTg3bEwvNlUxaUNCZkE5UDI3?=
 =?utf-8?B?cndPUURsZmpGZFVZT1VXcWtvVnlnV1VtdjAwTGhTZjhKYUxUT3NGbk5zTlBv?=
 =?utf-8?B?YWpQL3BjMHZUU21vM25FYm9hNThZS2s1dzZkN2daemFhT0tKTlg1MFAvQVhI?=
 =?utf-8?B?dHRXU0FlVm03R282Nk9iWnJsUElBNFJiU0g5d3RXbXJTUG9YRW9WNWpFckg0?=
 =?utf-8?B?dEZYZXIrM0NoaldrNlc5ZmRYZ3NMa25DYytHZzZEa1VraExxc0I2NzNrTDE5?=
 =?utf-8?B?SXQ5cGVSZ1FaZFNWaTEvUDgvVVhOZmFhQ3ZmNmJISm15NSsxck5xdE9vWGxY?=
 =?utf-8?B?QysxUjhlRmFQZGpvOEpiS3plMlo3TG5ZUlc0QWQ5M2JtNDFBU2FCMHJwU3Z5?=
 =?utf-8?B?SWpWb0J3Y1pyOHFZVlg0Y2M3cDRzWEtlUFB4UUxMZFdWbDkrUlg1TVZzOWxX?=
 =?utf-8?Q?79HLOxvpzBsXHqWIiFChGhctjHpvgQCy+LJ+z6Z?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6615d99-71d1-4ecc-f906-08d91ee21811
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 18:31:06.6138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3NfzQ3XSfl4e3ARohgEa5jfzorJ7ArNGmTsE/V359b5HtyaI5HORJqtNy/+VL7Y8j9b6q824DKPeUr/kSP1n3jpnvPHT87hDkB8bkFbMfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4543
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9993
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105240104
X-Proofpoint-ORIG-GUID: hhO3ix7y_QzsaDXoZUO5RvukTlXOlgzi
X-Proofpoint-GUID: hhO3ix7y_QzsaDXoZUO5RvukTlXOlgzi
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/2021 6:24 PM, Alex Williamson wrote:
> On Fri,  7 May 2021 05:25:11 -0700
> Steve Sistare <steven.sistare@oracle.com> wrote:
> 
>> Finish cpr for vfio-pci by preserving eventfd's and vector state.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  hw/vfio/pci.c | 110 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 108 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index f7ac9f03..e983db4 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -2661,6 +2661,27 @@ static void vfio_put_device(VFIOPCIDevice *vdev)
>>      vfio_put_base_device(&vdev->vbasedev);
>>  }
>>  
>> +static void setenv_event_fd(VFIOPCIDevice *vdev, int nr, const char *name,
>> +                            EventNotifier *ev)
>> +{
>> +    char envname[256];
>> +    int fd = event_notifier_get_fd(ev);
>> +    const char *vfname = vdev->vbasedev.name;
>> +
>> +    if (fd >= 0) {
>> +        snprintf(envname, sizeof(envname), "%s_%s_%d", vfname, name, nr);
>> +        setenv_fd(envname, fd);
>> +    }
>> +}
>> +
>> +static int getenv_event_fd(VFIOPCIDevice *vdev, int nr, const char *name)
>> +{
>> +    char envname[256];
>> +    const char *vfname = vdev->vbasedev.name;
>> +    snprintf(envname, sizeof(envname), "%s_%s_%d", vfname, name, nr);
>> +    return getenv_fd(envname);
>> +}
>> +
>>  static void vfio_err_notifier_handler(void *opaque)
>>  {
>>      VFIOPCIDevice *vdev = opaque;
>> @@ -2692,7 +2713,13 @@ static void vfio_err_notifier_handler(void *opaque)
>>  static void vfio_register_err_notifier(VFIOPCIDevice *vdev)
>>  {
>>      Error *err = NULL;
>> -    int32_t fd;
>> +    int32_t fd = getenv_event_fd(vdev, 0, "err");
> 
> Arg order should match the actual env names, device name, interrupt
> name, interrupt number.

I am happy to swap interrupt name and interrupt order, here and in setenv_event_fd().
However, I pass vdev so the getenv_event_fd() caller does not need to generate the env 
var name, and the details of the name are confined to {get,set}_event_fd.  I could pass 
the vdev name instead, but IMO it would be uglier at every call site, eg:

    fd = getenv_event_fd(vdev->vbasedev.name, "err", 0);
vs
    fd = getenv_event_fd(vdev, "err", 0);

I could rename the functions so they do not imply argument similarity with getenv_fd:
  getenv_event_fd --> save_event_fd
  setenv_event_fd --> load_event_fd

>> +    if (fd >= 0) {
>> +        event_notifier_init_fd(&vdev->err_notifier, fd);
>> +        qemu_set_fd_handler(fd, vfio_err_notifier_handler, NULL, vdev);
>> +        return;
>> +    }
>>  
>>      if (!vdev->pci_aer) {
>>          return;
>> @@ -2753,7 +2780,14 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
>>      struct vfio_irq_info irq_info = { .argsz = sizeof(irq_info),
>>                                        .index = VFIO_PCI_REQ_IRQ_INDEX };
>>      Error *err = NULL;
>> -    int32_t fd;
>> +    int32_t fd = getenv_event_fd(vdev, 0, "req");
>> +
>> +    if (fd >= 0) {
>> +        event_notifier_init_fd(&vdev->req_notifier, fd);
>> +        qemu_set_fd_handler(fd, vfio_req_notifier_handler, NULL, vdev);
>> +        vdev->req_enabled = true;
>> +        return;
>> +    }
>>  
>>      if (!(vdev->features & VFIO_FEATURE_ENABLE_REQ)) {
>>          return;
>> @@ -3286,12 +3320,82 @@ static Property vfio_pci_dev_properties[] = {
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>  
>> +static int vfio_pci_pre_save(void *opaque)
>> +{
>> +    VFIOPCIDevice *vdev = opaque;
>> +    int i;
>> +
>> +    for (i = 0; i < vdev->nr_vectors; i++) {
>> +        VFIOMSIVector *vector = &vdev->msi_vectors[i];
>> +        if (vector->use) {
>> +            setenv_event_fd(vdev, i, "interrupt", &vector->interrupt);
>> +            if (vector->virq >= 0) {
>> +                setenv_event_fd(vdev, i, "kvm_interrupt",
>> +                                &vector->kvm_interrupt);
>> +            }
>> +        }
>> +    }
>> +    setenv_event_fd(vdev, 0, "err", &vdev->err_notifier);
>> +    setenv_event_fd(vdev, 0, "req", &vdev->req_notifier);
>> +    return 0;
>> +}
>> +
>> +static void vfio_claim_vectors(VFIOPCIDevice *vdev, int nr_vectors, bool msix)
>> +{
>> +    int i, fd;
>> +    bool pending = false;
>> +    PCIDevice *pdev = &vdev->pdev;
>> +
>> +    vdev->nr_vectors = nr_vectors;
>> +    vdev->msi_vectors = g_new0(VFIOMSIVector, nr_vectors);
>> +    vdev->interrupt = msix ? VFIO_INT_MSIX : VFIO_INT_MSI;
>> +
>> +    for (i = 0; i < nr_vectors; i++) {
>> +        VFIOMSIVector *vector = &vdev->msi_vectors[i];
>> +
>> +        fd = getenv_event_fd(vdev, i, "interrupt");
>> +        if (fd >= 0) {
>> +            vfio_vector_init(vdev, i, fd);
>> +            qemu_set_fd_handler(fd, vfio_msi_interrupt, NULL, vector);
>> +        }
>> +
>> +        fd = getenv_event_fd(vdev, i, "kvm_interrupt");
>> +        if (fd >= 0) {
>> +            vfio_add_kvm_msi_virq(vdev, vector, i, msix, fd);
>> +        }
>> +
>> +        if (msix && msix_is_pending(pdev, i) && msix_is_masked(pdev, i)) {
>> +            set_bit(i, vdev->msix->pending);
>> +            pending = true;
>> +        }
>> +    }
>> +
>> +    if (msix) {
>> +        memory_region_set_enabled(&pdev->msix_pba_mmio, pending);
>> +    }
>> +}
>> +
>>  static int vfio_pci_post_load(void *opaque, int version_id)
>>  {
>>      VFIOPCIDevice *vdev = opaque;
>>      PCIDevice *pdev = &vdev->pdev;
>> +    int nr_vectors;
>>      bool enabled;
>>  
>> +    if (msix_enabled(pdev)) {
>> +        nr_vectors = vdev->msix->entries;
>> +        vfio_claim_vectors(vdev, nr_vectors, true);
>> +        msix_init_vector_notifiers(pdev, vfio_msix_vector_use,
>> +                                   vfio_msix_vector_release, NULL);
>> +
>> +    } else if (msi_enabled(pdev)) {
>> +        nr_vectors = msi_nr_vectors_allocated(pdev);
>> +        vfio_claim_vectors(vdev, nr_vectors, false);
>> +
>> +    } else if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
>> +        error_report("vfio_pci_post_load does not support INTX");
>> +    }
> 
> Why?  Is post-load where we really want to find this out?  Thanks,

This is also checked at VM creation time if only-cpr-capable is specified.
I could also check it in vfio_pci_pre_save.

- Steve

>> +
>>      pdev->reused = false;
>>      enabled = pci_get_word(pdev->config + PCI_COMMAND) & PCI_COMMAND_MASTER;
>>      memory_region_set_enabled(&pdev->bus_master_enable_region, enabled);
>> @@ -3310,8 +3414,10 @@ static const VMStateDescription vfio_pci_vmstate = {
>>      .version_id = 0,
>>      .minimum_version_id = 0,
>>      .post_load = vfio_pci_post_load,
>> +    .pre_save = vfio_pci_pre_save,
>>      .needed = vfio_pci_needed,
>>      .fields = (VMStateField[]) {
>> +        VMSTATE_MSIX(pdev, VFIOPCIDevice),
>>          VMSTATE_END_OF_LIST()
>>      }
>>  };
> 

