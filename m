Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2FC398E76
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 17:21:24 +0200 (CEST)
Received: from localhost ([::1]:42756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loSgM-0000h5-Ig
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 11:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1loSeb-0007R0-Ux
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 11:19:34 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:32094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1loSeV-0008JE-UM
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 11:19:33 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 152FD7G0020972; Wed, 2 Jun 2021 15:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=droiDYS+gG1NjVd5K2NU99Mq54e6I6mBPJXkFd4HNvA=;
 b=dcBnyaJN5M+q8RwKWpYJhsp+35d/QBzPyQpHZuByYy0n8W9WHjBygCWlCzxwB7MD/fzM
 LRPKuxBrfLHyNYWUzw3+R3aSsAKZ50RRmJyoJ4wkVBRI9L1s2Qi3bthemd2BDm2ec816
 HoLFwSTsfiDRzfd8lB8lyNGsuk1o1VZ3P302BxtQigB0yvwtQlRPA9TmhFBGbaG0pXq5
 nB9424Lvki6mu+trZd2iNyM69DWDiUHTUjl2hYbDbLu5mK1PyzflFvNccuP6MiKJpfVh
 rC71Npzb5piwnuFDH+87xMnQ3RQfWF08MU743GXRTTTuLdfoUeucV1PiGvZxKpV6arIt 6A== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 38wr508e0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Jun 2021 15:19:19 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 152FJIID022794;
 Wed, 2 Jun 2021 15:19:18 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2046.outbound.protection.outlook.com [104.47.51.46])
 by userp3020.oracle.com with ESMTP id 38x1bd078v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Jun 2021 15:19:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUvl0IWm5+fukvDenBu2Y6MD+KynTfa1kyj4kJozPdS0vsv9bNQRpSMUupyrY0LwBRPPFGoG5NQ5X0/vILcI1y/ZXXi399E8PQ82SHW6hSA8ycDKpRfCOZEb0GjMyup05Q5qSDm+H09bTRAh1ptVE4LfNWjYXP7WpUE0MrNBnnSVn+PvGqic513LChkFRvvk66X9OPlrqRSDgiNANPJzxMZWs1bZAN2DR+E7TyOiMOhjRLOmbp/nnwFUJqVjRv65B9hF2gi0jz3IfUQI6CYvcazi+a+5fRPzzoeskWdJ78g1CxWZ4ZfyxbNEQTfWCuek8iP2/h4XQNRZ+bKJtVbINA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=droiDYS+gG1NjVd5K2NU99Mq54e6I6mBPJXkFd4HNvA=;
 b=S0BqNrwWMR1nQsrrP4GCLdEDRp920n5mG3mZ32vknaDd2jcHydwST5koqwZQ6+A6xe5fMim4PqoEi9XmjpHe6jjtgEoq6E6cd+fSKgnOdl6fcj3ySQWcgShDipsF6yP4DoPlW1MgQpsqwA1WJia9vzPZWT6amz7vGLpLcJBUl3QLmfiaSI4veECtvCuLf+hN/t0hrNxBkmoLhFfdtYIdga4EWhXBz++P2NFd6sEnUjnrHMiEgalYNbLtMPojyKy0nxKsrofuJhmm+gpuVGkHMV6Xum2+GEEXbJ3d7uGIfeWzEXwz4PtQV6rBxkOWewIK8ctL5A3A67a5dg9EdJqryA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=droiDYS+gG1NjVd5K2NU99Mq54e6I6mBPJXkFd4HNvA=;
 b=zyL6hJoRqfGyiWguZl/nqgbTMGSI/4Ag6JrJU6scB31UypLiYNRrKFmawYg+jQzPUyw5a0+tcgzQwfi5HvB1YSl7CVrk8lYpqe0YwYASQiDwzZBDFZO5L/lxL++2Bd02hcF6YbSWZay2zRizx3OqI6HUi1sVpav8QrrD6xzyYGQ=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4243.namprd10.prod.outlook.com (2603:10b6:a03:210::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 15:19:15 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 15:19:15 +0000
Subject: Re: [PATCH V3 00/22] Live Update
From: Steven Sistare <steven.sistare@oracle.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <5bcabed6-82cd-3b84-9999-dd5ab2198a14@oracle.com>
Organization: Oracle Corporation
Message-ID: <ca27f264-7aaf-a186-9c1b-5ee068b8268f@oracle.com>
Date: Wed, 2 Jun 2021 11:19:08 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <5bcabed6-82cd-3b84-9999-dd5ab2198a14@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SN4PR0501CA0151.namprd05.prod.outlook.com
 (2603:10b6:803:2c::29) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN4PR0501CA0151.namprd05.prod.outlook.com (2603:10b6:803:2c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.9 via Frontend
 Transport; Wed, 2 Jun 2021 15:19:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52159380-1de0-4558-bb4c-08d925d9c88a
X-MS-TrafficTypeDiagnostic: BY5PR10MB4243:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4243E8A89F9B085A7F4BB162F93D9@BY5PR10MB4243.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8GXQNxDV/8JnAXXYk2dFidHhzwPWi2hVBjwA4DDZwITJv8mmL9fgnY7erzsj/nkQAmw+ZDG+lYbiXCC6dbUeUMhSqgI3+5O5m+3Pj6AbdGWigvmahzzFdOT7G1z6rjpOWdGeRTUdmtCgYsWs2kiNYebzSrNBMYM3f+ObFuhE4eRuIeu2i3+cMD/6UMruDUZ1dPxSo+kdM/3hLq7G7qhfiJTJCryfdLHmhYA+vL5gfEpWgEVsI98qZae0NQd5xhoR+QqXOsFvgDn1LUDrJUkswTYzgpAQNhy5P1r9IFSKCGLl49A4CSqaxMWAvvBoKcXPvWEXrOsuX09PpAl8Z4XZy85J4QrXkH+TFdRgvyfJoNqfmzs8+IdrAGwvj8f22w8gpdIeFbB4cvE0sI8DDLruT+Q/mPIudRaY/jNMAv9C3ScumyhdrZmy55HRaFMNRaFm0inUcPFhq6SQoiQ2EqvgWjHDqyQ0E7gNpcKZFPiSTKnOnfnLRN56sUtS22IXKiCpAwe9uzpU1ymqEtqTmGj5voZPRPvCrgoDFOPumjoARQuOV/Ai9h8BtuVYuh5/0ha5bsYayoAOIGB6Vqh87vNt91LCpq8bmGxm/6zR3D1n1gwTpkJYQEVdcimgCSP95yEWh/8D86INZszkD0/1OX82TiuhKMbNqb1rQNXgiwVD1IiGj7rqywnhKHYatL7hA7mrRdabEQ3H4JhlFlw8hwXrHN7HSEiz0l4w91uEkgk0tlBgJI2uulPCRwQRCg0adc0ou77OliUWayrlsLo4+VQRjv8q0w2VRociYQH84q916O2HOTkMpgvn0dyfKdAao0Joutt4mDXnEPLyI+M6WB1pXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(136003)(346002)(376002)(39860400002)(16576012)(54906003)(15650500001)(186003)(31686004)(956004)(26005)(38100700002)(8676002)(2616005)(8936002)(2906002)(5660300002)(83380400001)(966005)(86362001)(316002)(66556008)(16526019)(7416002)(31696002)(4326008)(66946007)(53546011)(36916002)(36756003)(478600001)(6486002)(66476007)(44832011)(6666004)(107886003)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bHcrZUg5aHFJZ1NOaGVBSnVlN1lmMzZ0b1dmb3BvejRidldvUlFNTTJZNkpT?=
 =?utf-8?B?LzJMR051U0ZYRFUvQ2dteTlYcmU1aDY0TDZLM1c2NUllK201NzRwdmN3b2R3?=
 =?utf-8?B?MldubGwweVB6WXYwVXBpK2IxcWFxbXlDWGUrakF6dGgramxCbjF6VyszTWto?=
 =?utf-8?B?MXFxMW1yUnFFWE1HOWJaVGtNWTA0eldMNjNLaytLaW1yWnpGRUN1eU9ZNmZX?=
 =?utf-8?B?N3Q5OXo2MTlYZlptamppcnV5NGNMeGRiVW93V1gvU2EwY1h3K3BVVnBDNEFw?=
 =?utf-8?B?eVpqOHRYRm9jZDRNWmh0WUZOSVhBNllsR1pKWHlVcVQ3aXpQSWVVTzZQS1Jp?=
 =?utf-8?B?K0ZkRk5UUkZnOGRZK2VDTmpGMWpvanV6ZVYvZUJ0RkJidnV2NGZMOURqWFRI?=
 =?utf-8?B?QXdZOHdZYnduR244eUR3WlkvblhlanZDUXVRNGY5MmM3a3RzWGZXektHeW9I?=
 =?utf-8?B?M2VqRHpSU0RjYTRuUGxpRUYyQWZ2RjBhZnlwTzRqZE9wb0hjdzljY0RwVXdn?=
 =?utf-8?B?RG95ZlNrV3k4cnQ4TDNhN2h3ZFdhWHNuWCtoTjZ3eWN4N21FMnE3QnVleURO?=
 =?utf-8?B?bnRYT0JITlhMK0I2NUkrKzlNSThyMzMwSHBUUEdvM1g4WHV5UmZXY0hOSTZL?=
 =?utf-8?B?Qi9TcTVQazBYNkNHQjRIYVM1OHE3aXNIMGZJWmpRdlpsckNwM3ZXVnUxeW9q?=
 =?utf-8?B?VzF1cFdaaUR0cTU3c09KQTNETFZnNEdWWk8rSzRZWWJlSENoN0ZRWElNaWh1?=
 =?utf-8?B?Sk1UUTBrUWlaVWMxOTdmRVkvdHF1c0dBRDBMS0tyZGtoaWFPekxId2hDRFZK?=
 =?utf-8?B?QlZGTTVKMTZMZldEdjk5L3M4NlkrUnE0eDhzajZhRHlVRkI1UDF3STBxVVRX?=
 =?utf-8?B?TVBmUFI4SW8xQk9lN0NrUHEzaTM5MDRBSXAwTmVUalNXN1NKM2JNSXR4a2hy?=
 =?utf-8?B?RXJaNGgram9vUWNGQzN3V3JwOU1EcjFoVjJzVDFYRXFYSWlhYjBCbFVvNUN4?=
 =?utf-8?B?MTNaYnUvK2oyTnRIbm82cFo5NE55WFEyR0R2Y0tBS3VkbDFEQ2hUTzVQMWJ3?=
 =?utf-8?B?SGpLNEdQa1VlZkRTdS9FTWxMTlVQdnhxSlJiVDFtWnByOW1jYjBzWi8yZnUy?=
 =?utf-8?B?R1JTYVBZU0FRWi9CZTZKMnFBbG02UTY2M29KVTNzT09ESHBBTFZsRlczSUg2?=
 =?utf-8?B?YkRlcGh3M0w0WlBCaDVVU3J3TGwxRzBUL24rR1NBU3R0dGdPWU1WNHZLbVhG?=
 =?utf-8?B?RFRqejJ5TysvRDJXSTdVZDlQa1dkdVZqSzdxUERVUWUxZmhVUlVYbWpabThG?=
 =?utf-8?B?TEJuWTFndDFibGkvL2puVnRMV3hQSVoxb1NpVmNwODIrWHNKeTdTL0xOQmNm?=
 =?utf-8?B?M1NRQVVnZUcrSGxSUmtUSkRrRlVoNWNFNW52Q0RLbEpPSmcxSDIyQXBEcFdm?=
 =?utf-8?B?RUgvMy9UdWhPTE9tZGtaK3daY1d5YXROU1NoMlBrcmlsdjIwZ2U2SXFaV0l5?=
 =?utf-8?B?OEUyQ1BxdWFiZ3pKa3k4eVdNandrcEFKak9wL0w3WGkra1VKV1I3dkZpcmIy?=
 =?utf-8?B?S0RlQ1BuUjNacVZXWFNUQUcyYnBQYStnYlNoV3hzbGJEOFBIanZLTisxTzU0?=
 =?utf-8?B?VldvY1pqNHdlNHpKdlNGR2JmL2s2ZndGYUphaWtXRVZxY0lVdzludVIrSGgw?=
 =?utf-8?B?OHdoU0J2VHNkcHMyalpvOVRreC9WYnJYUGFjL01GU1lqZ3hOYWpPNWM0WlNu?=
 =?utf-8?Q?zLIRV7fuHA0a7hcMz5wlpgrxFZ3KTnJrGZ9hjSZ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52159380-1de0-4558-bb4c-08d925d9c88a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 15:19:15.6299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5h77Psej9ja+3EO5RhOgEti6kbYSeolcAqFuN1kvClyhUzXaW053QFunXooVnHx6AitZTKRNBo6mpR7kUUC8LRxzIpFAAe1CwEkZuE14rI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4243
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10003
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106020098
X-Proofpoint-ORIG-GUID: b-Y9DPoZESPH4d5cKqsukyRN3yfh-Da0
X-Proofpoint-GUID: b-Y9DPoZESPH4d5cKqsukyRN3yfh-Da0
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7,
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
 Juan Quintela <quintela@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,
  Alex has reviewed the vfio-pci patches.  If you could give me a thumbs-up or a 
needs-work on "pci: export functions for cpr", I would appreciate it.  Thanks!

[PATCH V3 10/22] pci: export functions for cpr
https://lore.kernel.org/qemu-devel/1620390320-301716-11-git-send-email-steven.sistare@oracle.com

- Steve

On 5/19/2021 12:43 PM, Steven Sistare wrote:
> Hi Michael, Marcel,
>   I hope you have time to review the pci and vfio-pci related patches in this
> series.  They are an essential part of the live update functionality.  The
> first 2 patches are straightforward, just exposing functions for use in vfio.
> The last 2 patches are more substantial.
> 
>   - pci: export functions for cpr
>   - vfio-pci: refactor for cpr
>   - vfio-pci: cpr part 1
>   - vfio-pci: cpr part 2
> 
> - Steve
> 
> On 5/7/2021 8:24 AM, Steve Sistare wrote:
>> Provide the cprsave and cprload commands for live update.  These save and
>> restore VM state, with minimal guest pause time, so that qemu may be updated
>> to a new version in between.
>>
>> cprsave stops the VM and saves vmstate to an ordinary file.  It supports two
>> modes: restart and reboot.  For restart, cprsave exec's the qemu binary (or
>> /usr/bin/qemu-exec if it exists) with the same argv.  qemu restarts in a
>> paused state and waits for the cprload command.
>>
>> To use the restart mode, qemu must be started with the memfd-alloc option,
>> which allocates guest ram using memfd_create.  The memfd's are saved to
>> the environment and kept open across exec, after which they are found from
>> the environment and re-mmap'd.  Hence guest ram is preserved in place,
>> albeit with new virtual addresses in the qemu process.  The caller resumes
>> the guest by calling cprload, which loads state from the file.  If the VM
>> was running at cprsave time, then VM execution resumes.  cprsave supports
>> any type of guest image and block device, but the caller must not modify
>> guest block devices between cprsave and cprload.
>>
>> The restart mode supports vfio devices by preserving the vfio container,
>> group, device, and event descriptors across the qemu re-exec, and by
>> updating DMA mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_VADDR and
>> VFIO_DMA_MAP_FLAG_VADDR as defined in https://lore.kernel.org/kvm/1611939252-7240-1-git-send-email-steven.sistare@oracle.com/
>> and integrated in Linux kernel 5.12.
>>
>> For the reboot mode, cprsave saves state and exits qemu, and the caller is
>> allowed to update the host kernel and system software and reboot.  The
>> caller resumes the guest by running qemu with the same arguments as the
>> original process and calling cprload.  To use this mode, guest ram must be
>> mapped to a persistent shared memory file such as /dev/dax0.0, or /dev/shm
>> PKRAM as proposed in https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-anthony.yznaga@oracle.com.
>>
>> The reboot mode supports vfio devices if the caller suspends the guest
>> instead of stopping the VM, such as by issuing guest-suspend-ram to the
>> qemu guest agent.  The guest drivers' suspend methods flush outstanding
>> requests and re-initialize the devices, and thus there is no device state
>> to save and restore.
>>
>> The first patches add helper functions:
>>
>>   - as_flat_walk
>>   - qemu_ram_volatile
>>   - oslib: qemu_clr_cloexec
>>   - util: env var helpers
>>   - machine: memfd-alloc option
>>   - vl: add helper to request re-exec
>>
>> The next patches implement cprsave and cprload:
>>
>>   - cpr
>>   - cpr: QMP interfaces
>>   - cpr: HMP interfaces
>>
>> The next patches add vfio support for the restart mode:
>>
>>   - pci: export functions for cpr
>>   - vfio-pci: refactor for cpr
>>   - vfio-pci: cpr part 1
>>   - vfio-pci: cpr part 2
>>
>> The next patches preserve various descriptor-based backend devices across
>> a cprsave restart:
>>
>>   - vhost: reset vhost devices upon cprsave
>>   - hostmem-memfd: cpr support
>>   - chardev: cpr framework
>>   - chardev: cpr for simple devices
>>   - chardev: cpr for pty
>>   - chardev: cpr for sockets
>>   - cpr: only-cpr-capable option
>>   - cpr: maintainers
>>   - simplify savevm
>>
>> Here is an example of updating qemu from v4.2.0 to v4.2.1 using 
>> "cprload restart".  The software update is performed while the guest is
>> running to minimize downtime.
>>
>> window 1				| window 2
>> 					|
>> # qemu-system-x86_64 ... 		|
>> QEMU 4.2.0 monitor - type 'help' ...	|
>> (qemu) info status			|
>> VM status: running			|
>> 					| # yum update qemu
>> (qemu) cprsave /tmp/qemu.sav restart	|
>> QEMU 4.2.1 monitor - type 'help' ...	|
>> (qemu) info status			|
>> VM status: paused (prelaunch)		|
>> (qemu) cprload /tmp/qemu.sav		|
>> (qemu) info status			|
>> VM status: running			|
>>
>>
>> Here is an example of updating the host kernel using "cprload reboot"
>>
>> window 1					| window 2
>> 						|
>> # qemu-system-x86_64 ...mem-path=/dev/dax0.0 ...|
>> QEMU 4.2.1 monitor - type 'help' ...		|
>> (qemu) info status				|
>> VM status: running				|
>> 						| # yum update kernel-uek
>> (qemu) cprsave /tmp/qemu.sav restart		|
>> 						|
>> # systemctl kexec				|
>> kexec_core: Starting new kernel			|
>> ...						|
>> 						|
>> # qemu-system-x86_64 ...mem-path=/dev/dax0.0 ...|
>> QEMU 4.2.1 monitor - type 'help' ...		|
>> (qemu) info status				|
>> VM status: paused (prelaunch)			|
>> (qemu) cprload /tmp/qemu.sav			|
>> (qemu) info status				|
>> VM status: running				|
>>
>> Changes from V1 to V2:
>>   - revert vmstate infrastructure changes
>>   - refactor cpr functions into new files
>>   - delete MADV_DOEXEC and use memfd + VFIO_DMA_UNMAP_FLAG_SUSPEND to 
>>     preserve memory.
>>   - add framework to filter chardev's that support cpr
>>   - save and restore vfio eventfd's
>>   - modify cprinfo QMP interface
>>   - incorporate misc review feedback
>>   - remove unrelated and unneeded patches
>>   - refactor all patches into a shorter and easier to review series
>>
>> Changes from V2 to V3:
>>   - rebase to qemu 6.0.0
>>   - use final definition of vfio ioctls (VFIO_DMA_UNMAP_FLAG_VADDR etc)
>>   - change memfd-alloc to a machine option
>>   - use existing channel socket function instead of defining new ones
>>   - close monitor socket during cpr
>>   - support memory-backend-memfd
>>   - fix a few unreported bugs
>>
>> Steve Sistare (18):
>>   as_flat_walk
>>   qemu_ram_volatile
>>   oslib: qemu_clr_cloexec
>>   util: env var helpers
>>   machine: memfd-alloc option
>>   vl: add helper to request re-exec
>>   cpr
>>   pci: export functions for cpr
>>   vfio-pci: refactor for cpr
>>   vfio-pci: cpr part 1
>>   vfio-pci: cpr part 2
>>   hostmem-memfd: cpr support
>>   chardev: cpr framework
>>   chardev: cpr for simple devices
>>   chardev: cpr for pty
>>   cpr: only-cpr-capable option
>>   cpr: maintainers
>>   simplify savevm
>>
>> Mark Kanda, Steve Sistare (4):
>>   cpr: QMP interfaces
>>   cpr: HMP interfaces
>>   vhost: reset vhost devices upon cprsave
>>   chardev: cpr for sockets
>>
>>  MAINTAINERS                   |  11 +++
>>  backends/hostmem-memfd.c      |  21 +++--
>>  chardev/char-mux.c            |   1 +
>>  chardev/char-null.c           |   1 +
>>  chardev/char-pty.c            |  15 ++-
>>  chardev/char-serial.c         |   1 +
>>  chardev/char-socket.c         |  35 +++++++
>>  chardev/char-stdio.c          |   8 ++
>>  chardev/char.c                |  41 +++++++-
>>  gdbstub.c                     |   1 +
>>  hmp-commands.hx               |  44 +++++++++
>>  hw/core/machine.c             |  19 ++++
>>  hw/pci/msi.c                  |   4 +
>>  hw/pci/msix.c                 |  20 ++--
>>  hw/pci/pci.c                  |   7 +-
>>  hw/vfio/common.c              |  68 +++++++++++++-
>>  hw/vfio/cpr.c                 | 131 ++++++++++++++++++++++++++
>>  hw/vfio/meson.build           |   1 +
>>  hw/vfio/pci.c                 | 214 ++++++++++++++++++++++++++++++++++++++----
>>  hw/vfio/trace-events          |   1 +
>>  hw/virtio/vhost.c             |  11 +++
>>  include/chardev/char.h        |   6 ++
>>  include/exec/memory.h         |  25 +++++
>>  include/hw/boards.h           |   1 +
>>  include/hw/pci/msix.h         |   5 +
>>  include/hw/pci/pci.h          |   2 +
>>  include/hw/vfio/vfio-common.h |   8 ++
>>  include/hw/virtio/vhost.h     |   1 +
>>  include/migration/cpr.h       |  17 ++++
>>  include/monitor/hmp.h         |   3 +
>>  include/qemu/env.h            |  23 +++++
>>  include/qemu/osdep.h          |   1 +
>>  include/sysemu/runstate.h     |   2 +
>>  include/sysemu/sysemu.h       |   2 +
>>  linux-headers/linux/vfio.h    |  27 ++++++
>>  migration/cpr.c               | 200 +++++++++++++++++++++++++++++++++++++++
>>  migration/meson.build         |   1 +
>>  migration/migration.c         |   5 +
>>  migration/savevm.c            |  21 ++---
>>  migration/savevm.h            |   2 +
>>  monitor/hmp-cmds.c            |  48 ++++++++++
>>  monitor/hmp.c                 |   3 +
>>  monitor/qmp-cmds.c            |  31 ++++++
>>  monitor/qmp.c                 |   3 +
>>  qapi/char.json                |   5 +-
>>  qapi/cpr.json                 |  76 +++++++++++++++
>>  qapi/meson.build              |   1 +
>>  qapi/qapi-schema.json         |   1 +
>>  qemu-options.hx               |  39 +++++++-
>>  softmmu/globals.c             |   2 +
>>  softmmu/memory.c              |  48 ++++++++++
>>  softmmu/physmem.c             |  49 ++++++++--
>>  softmmu/runstate.c            |  49 +++++++++-
>>  softmmu/vl.c                  |  21 ++++-
>>  stubs/cpr.c                   |   3 +
>>  stubs/meson.build             |   1 +
>>  trace-events                  |   1 +
>>  util/env.c                    |  99 +++++++++++++++++++
>>  util/meson.build              |   1 +
>>  util/oslib-posix.c            |   9 ++
>>  util/oslib-win32.c            |   4 +
>>  util/qemu-config.c            |   4 +
>>  62 files changed, 1431 insertions(+), 74 deletions(-)
>>  create mode 100644 hw/vfio/cpr.c
>>  create mode 100644 include/migration/cpr.h
>>  create mode 100644 include/qemu/env.h
>>  create mode 100644 migration/cpr.c
>>  create mode 100644 qapi/cpr.json
>>  create mode 100644 stubs/cpr.c
>>  create mode 100644 util/env.c
>>

