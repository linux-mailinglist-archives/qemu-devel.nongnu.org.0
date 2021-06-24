Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B97F23B3248
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 17:07:16 +0200 (CEST)
Received: from localhost ([::1]:52988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwQwl-0005eD-Hl
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 11:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lwQvG-00044q-7i
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 11:05:42 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:58646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lwQvD-0004uE-HY
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 11:05:41 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15OEvJOW031247; Thu, 24 Jun 2021 15:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=XGc6mzqPggWS6m+RUkGVW75N1QxABBr6S39j07nmeqY=;
 b=QTiXOfAjDX37I87ziz76N7v5gB8cj0ITo4WzG6P6a5uakfkufk6uYv+V8Mo+sZvD64WY
 3/1dXMZP++1Gn/9o1nB7GIlm0Pl7dBdj2tewEVc+F/I+2gm9m3UEq+mKUf0H4HKhFBPp
 XaA1BDpGwcHvV8HP/rbvaviI/nDcQzYu7acHCHEXdm4tDwOoCxAvNgg0eaLxKNSckGkh
 zAe4HYqfLhYSnygGEUdViMHc3OExYl+2Tx6jqelzZm66iuhrZLino02UhHQtQVLr/wyZ
 zNt+i0Rr0alPZ/Ak/Ze+M8Y2aeXMMYzEwaUvrkv37CA71D6bV/3VHw7hQUnKr3UV8TAg 9g== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39c2wnk8kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 15:05:31 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15OF5UTk178854;
 Thu, 24 Jun 2021 15:05:30 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by userp3020.oracle.com with ESMTP id 399tbw50ua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 15:05:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOBNSllKRwPqLrvSIj+lpQ5gmLT3uMKeHgcQUTwdIj68j6sg/cSPdIY4UUoDgulBi7cLRlPcWYDZuERFqTEW1VPBxYmDDF5elIwcm4lpD/TrB6qU291USwnYpzqdbpqTUoZj4EBc57HCbinuwqsprN9nlQqaYC4t6kc0UapmfFS0i6WfH/eOsvn9C33NS0a/+Kup1ipWZ3SpGxWc06WY9efqTQjcNLXVSe6x9SGAJJ2pjwnlwU9XVCV37vw13e7yc11MPN0cCncNwxftOk2aQsZqIdJ1M5JRIYQGzNuZrQ4s3khnQypMRVEArFNzL8Ued6P2NCBbbRNPlSldcCXHIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGc6mzqPggWS6m+RUkGVW75N1QxABBr6S39j07nmeqY=;
 b=Y6JY8AlGrcqHxKlgLq5WrfjgSyeadimGIBkFdEr0RPYSYZFhq/H+01Gv9JB577FVj3SH/Vcb/HxEQiwDB8BDJqoj9/av1wvSUp8yBnaTYOAmJfakcZ2FhRYnLsuZJpWA4iWILuNyaNLDlxLQrzyXaQFpsvzoNTebJBEdEI5X8fvTKQt/xlo9Egg/fX7FFqZPxoc/ZNa6Bpx3yW9s2PypBHggE3WaC0gpAtTMGLWW2b6rjrY3QlQoazsHlxfswh3rHM9ogz1bCQ9MkDIDS3LsGldkPnN29OdlEJYwAtZVn7v1udLBy58TvHw3LD6KqW2us4XRu1VkbeevrfzuesOLlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGc6mzqPggWS6m+RUkGVW75N1QxABBr6S39j07nmeqY=;
 b=D4o6MT59hEOU/L1oBiTTee7a1+JNfG6yJy+Jqbo3OXWg8TCsYn/+Xe984G/SyAOqNLn7TC+LYUdcjxFavtWnVLddxbqvm4BI/VkwYKmj40e/XF8LWGh5wK2IPQ3j48pAZ4ipNb8KKvwwJOo7/wp9e5+cXmilUWMwZMc07uqpto4=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2807.namprd10.prod.outlook.com (2603:10b6:a03:8e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Thu, 24 Jun
 2021 15:05:28 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4242.023; Thu, 24 Jun 2021
 15:05:28 +0000
Subject: Re: [PATCH V3 00/22] Live Update [reboot]
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <YJwFkhlYISA9INwO@stefanha-x1.localdomain>
 <4d3dd5ff-5180-16df-ab48-11de610dd396@oracle.com>
 <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
 <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com> <YKOPnkefxgRZ8PoQ@work-vm>
 <a1d3dfea-d15e-35a3-a216-3ce65600f2d6@oracle.com> <YKQULUn5F+x1wrYI@work-vm>
 <38dc91ab-b96b-1cc3-bf8b-84ff77b334fd@oracle.com> <YKZdcSt0ltCBqVsz@work-vm>
 <5dc94efc-cb95-d7ff-cad3-391c90b3264f@oracle.com> <YMj8Fh2FAYJ5Pb/c@work-vm>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <879d3412-8918-45fc-55dd-2e0db956e089@oracle.com>
Date: Thu, 24 Jun 2021 11:05:22 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YMj8Fh2FAYJ5Pb/c@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SN2PR01CA0079.prod.exchangelabs.com (2603:10b6:800::47) To
 BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN2PR01CA0079.prod.exchangelabs.com (2603:10b6:800::47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 15:05:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56864c83-227a-4529-5784-08d93721806a
X-MS-TrafficTypeDiagnostic: BYAPR10MB2807:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2807DCF5A42ADA90D6B5E9D4F9079@BYAPR10MB2807.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nVyPkdzYlwNXyPSMkMbFPKwqkHhyLLzRgFobFpMtfnEtir6GA8vxGV6VGVASvbDHvQ66zjNlIuN/ek3OEHfzHgfjgs2RN/dvHFEMA4RnqBxTODqCX31rtbNix53QgB6JE0MaW8ep4mf+jKKCzJ/9j1rwpQlKW2pVH7qOwpr0Fm0sfLlVTi9qX7798iU5L7XXh+qBes4h64lUUM3zaWHqt0sPGGL9JRhzMZarBs8jgo2QL9JlW7LZ9aozDydjY9j266Xd4J/eSurUNcwUs76XbPth7ru8ygnHhdnj/7KZyEk71T2DkExH5wyTSxMfvw7XWJ3L7W7Om05ntlwHcNpwBE8e3KNXJooi8mzZnaV5VPwEmrHbIPHdO5H3A0yd6jI2SUWz9YZKrjEjwnvAJsDWli2fQxWlVgKvYzyXOdLme7Lpaend7sPADXDt9ZuczcLQGlPR/ijsKRgqzkR6kAz8W/oUurKvBMdv4yqQ/BqSweKeafVSEW6hP1WEzMqWRonI1BqJ4UBAa0XwTJiu4nxDiyLMeHglkjwbZoPsg3H1EgurRZT2sQRkfUaUISerwKrMAbeCzWD5myqkldOe1Ya6kaMWNAKXDsMgCBGFiEWfBcAqR+8svycOx1xn4bXLt76Xb6ffaqAuI1LaEUuqmcLy2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(396003)(136003)(346002)(39860400002)(86362001)(83380400001)(36756003)(478600001)(8676002)(6486002)(66476007)(31686004)(66946007)(8936002)(4326008)(31696002)(66556008)(107886003)(6666004)(53546011)(16576012)(54906003)(5660300002)(6916009)(316002)(7416002)(16526019)(186003)(38100700002)(2616005)(956004)(36916002)(26005)(44832011)(15650500001)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlF1TW9oMjBVRXFPRFcxVjNXcm5oM2JpNW80ejFyanJralpid2dBenhYbmZD?=
 =?utf-8?B?M3dXa0hBdGNLNDA0cGtKUHhhSzZuZkFHd2Vwd3h3Z2VKUXhRU3RQalFHNzZJ?=
 =?utf-8?B?TzhxTDgvK3ZTMU4yN0plTGZKVnhZSk1TQjB1Y0FhSVplMVZHV2gyT2V2ZlN6?=
 =?utf-8?B?VFVWMXg2SnpZM0YvRlQyZUYvT2FINFF1V3ZCR1paS3d3WVo5Z3E4RDIwWEMz?=
 =?utf-8?B?NkVnWGZ5Zm0xSkJjMVdrcGRUek1HaHB6Y0xRTEhUL0ZpL2luenhvWmJqNFRU?=
 =?utf-8?B?eExhUU1zcEY2VW8veHpvWHREQklOc1Q4OWkrRUVzUG0rb0UvUEJvQ1hiOVVv?=
 =?utf-8?B?T2ZUV3pwMklKT3pSWnZZbUdiL05nUWllUVQ0WUNkbFZ3VmxMY3RzMWhQK1ov?=
 =?utf-8?B?cmovZ3MxbFFMMTZNZzMrdFVmcXAxcUFpWGpZK3loZXVpQTd3c0JkU2toK3Nr?=
 =?utf-8?B?cGR3K0FPOGlBN1Y0Tkc3cmtRRUJ0cldkR2lTT1FTTjZka1ExR1phTTBnTXll?=
 =?utf-8?B?VzJjdU9RcjVwQjNab2xobmI5UDU3NU5xL1hCc3ZlVjRRaFp6RHpmeEFGVjF4?=
 =?utf-8?B?ek9CRnc0bncrbVhmZDdVWUJOSkx0SVlEQ25pRCtHaWpsYW9MMVpxM0Y1aWVL?=
 =?utf-8?B?dld3RVJzWUZUYWVObWtiSy9JZzZ0ZmEyb2JnZGhnYU0rSUM4NGp0elZRNVoz?=
 =?utf-8?B?Wm5PMm9ma3F0eTJsMS9PMWNiUWlTMWJEZmM4U1RpczkzVk1LOHpralNhQjcx?=
 =?utf-8?B?N29WNE5jeGllUkVrSjVCYnlqYU9oc2pXUDlmZzdDdDNpeFY0dnB6d3NkeW1G?=
 =?utf-8?B?K3lzME1nY0NKTTZ0V0VuZUZpN3dZODlzbmtFbU1zb3I4c000YTh4RWJVVzNa?=
 =?utf-8?B?RXFiMU54MTJpNGdXd0VkeVZ6NjFlWDFMTTY3RVYzc1g3ZlFCdTd3SXZxOTlr?=
 =?utf-8?B?Z1pkaE05dkd4UUs2bHpaV3QxZTRGUDIySkRCYTduUkhHUGZsTG54amdjeWhR?=
 =?utf-8?B?SHZtLzAzTzVib24yZTJBUE91MzlGNkRkVTc2SStQQXJuNjY2T2Z5ZUlDQmpx?=
 =?utf-8?B?Uzh4d1JUNHdMaklQZmp6RWNtTkxNeVFtRlFxbTFVUFZCTWQ4UkJYMEVIcmJ5?=
 =?utf-8?B?bndBZlVUK2szWGtCeVhCd0oweE9KK3pDSktuaXpiYkdPbGNOMTBSOVB6b0J5?=
 =?utf-8?B?Y0dtZHZpdEV2di9mNnVWWFA3NkN5emJJNThFTStncE1lMzV6RFdaVnNnTE1p?=
 =?utf-8?B?aFY4ZEtwN3VqWDZqUWhyWlByTXowS2YzUnMyc3dEUkwyUERPbUxULzBLZHFK?=
 =?utf-8?B?dXZka1BXMFJaRG51aldCMDBqcmptcmRmT1ovWVFyT3BNaHpnUmtVSXppVjdW?=
 =?utf-8?B?cC9Xdlp3OEtNYmVUT3N2M0thc1pyRTBvMWNZYnM0MUVGd25ZNllPTHFVWVJk?=
 =?utf-8?B?ZHRXM1oydndhaUhKUTF3b1Rtejd1RWhXeXdycU9WdW1SWmltK1VxczNhcU54?=
 =?utf-8?B?WkRSTFcyZjRiNmtXazRYSUdJRENqMmVONEd6bE1GRURKRFluNFlVZWZhT201?=
 =?utf-8?B?NGhTeHlWcHE2d3R0UVVRVmhiL0VYcVk3WnE2THlUbjRjTHp2MVdMbDJDWFBa?=
 =?utf-8?B?dld6MFpCcytLMGVFMnJsR3RhUHFsbXNxK3NaTkhTbEFvS3lhYTJDb2pTOU95?=
 =?utf-8?B?WVdqcnNSNWR4RGFXWXNBdzNCNm4vVUY0YjNXRVorTEV2T1dFaW5kc01WaXhF?=
 =?utf-8?Q?ce0Lh4E2j+drc7RBU33CDljOaUAXfd5cxT00aM/?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56864c83-227a-4529-5784-08d93721806a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 15:05:28.0275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U9hWIrz0ahG1aq26B9f95vGeQQBw7M+sKfVb2LOrn5xCnh8/Ox9OEhgUHF3DWb5OIucFmFuMfNrKJI7QyqyBEIKvDxQIzvm/K6S5mOKpfpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2807
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10025
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106240083
X-Proofpoint-GUID: g0uiFRHTvffnoWYMIXK0C9P1f0EUpPLK
X-Proofpoint-ORIG-GUID: g0uiFRHTvffnoWYMIXK0C9P1f0EUpPLK
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/2021 3:14 PM, Dr. David Alan Gilbert wrote:
> * Steven Sistare (steven.sistare@oracle.com) wrote:
>> On 5/20/2021 9:00 AM, Dr. David Alan Gilbert wrote:
>>> Hi Steven,
>>>   I'd like to split the discussion into reboot and restart,
>>> so I can make sure I understand them individually.
>>>
>>> So reboot mode;
>>> Can you explain which parts of this series are needed for reboot mode;
>>> I've managed to do a kexec based reboot on qemu with the current qemu -
>>> albeit with no vfio devices, my current understanding is that for doing
>>> reboot with vfio we just need some way of getting migrate to send the
>>> metadata associated with vfio devices if the guest is in S3.
>>>
>>> Is there something I'm missing and which you have in this series?
>>
>> You are correct, this series has little special code for reboot mode, but it does allow
>> reboot and restart to be handled similarly, which simplifies the management layer because 
>> the same calls are performed for each mode. 
>>
>> For vfio in reboot mode, prior to sending cprload, the manager sends the guest-suspend-ram
>> command to the qemu guest agent. This flushes requests and brings the guest device to a 
>> reset state, so there is no vfio metadata to save.  Reboot mode does not call vfio_cprsave.
>>
>> There are a few unique patches to support reboot mode.  One is qemu_ram_volatile, which
>> is a sanity check that the writable ram blocks are backed by some form of shared memory.
>> Plus there are a few fragments in the "cpr" patch that handle the suspended state that
>> is induced by guest-suspend-ram.  See qemu_system_start_on_wake_request() and instances
>> of RUN_STATE_SUSPENDED in migration/cpr.c
> 
> Could you split the 'reboot' part of separately, then we can review
> that and perhaps get it in first? It should be a relatively small patch
> set - it'll get things moving in the right direction.
> 
> The guest-suspend-ram stuff seems reasonable as an idea; lets just try
> and avoid doing it all via environment variables though; make it proper
> command line options.

How about I delete reboot mode and the mode argument instead.  Having two modes is causing no 
end of confusion, and my primary business need is for restart mode.

- Steve

