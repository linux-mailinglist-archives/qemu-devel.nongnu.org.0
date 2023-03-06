Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8A86AC9A1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 18:19:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZEUF-0003m4-9O; Mon, 06 Mar 2023 12:18:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZEU9-0003jg-Qt
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:18:56 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZEU7-0006fi-Au
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:18:53 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326Gwrlt018679; Mon, 6 Mar 2023 17:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=FPv0q/kOB4KSM9IPSbXse8UxbK7hdQ/DZPM5+XYKDJM=;
 b=BN0Q1QSTE5vSKo+3MUd0oytSll22h484XvdH8l+Oz7H3+Fb8pdj0maw9VFZ5dgSaTTDs
 hXYsfbohKpOtwXY9mqQOUff1C0Son01ABu779FYHV+JzF4AB2NFt3D74+cvnnEpl1Pbs
 fXmTHc7lrSd/F1Mx+fHMGkBxoctDjSpSCPzocXnyUW0V/N6o68UCfLmMVm9SUqXkHqsj
 bxKeyT270G30GVr8LVGgVlFvNjg0LIoyo67UbDpLWHso/fCP7iAftjQa5akmYAtkpwx2
 7DuknA0OnGwulvmo64dqRoH2NlT9lt0Ca8wD9pjqJCx5ln7borsdw30uKdOlwcEoaI4/ 7A== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p415hugr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 17:18:49 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 326HEbE8011493; Mon, 6 Mar 2023 17:18:48 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u2ghuyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 17:18:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZZVVLQraDA2r2O5aJoHUkyWuzBVX93+eTD6wFicr5+CMkvy4gnprB8a7tpJoGEoEdr+wbPEHiE6l0a03ChcL5vPKyaGv+LnVnPW6JNM9YAYHv+3puRv75cDS25Hf3y58ORFx20DckM/D50qFVsZT5GQWL5mx+eZDXg79VEtR1P9axNO3tVX6Rjl5g5qHPA/rqhcdUMpViqmgGz0ouo6cbobt+lml6ly0TZAO5XH3D9TAOJSl5EvtXqpv4TGXujCZQ41wwSEMqhksQ96X4ratiLhV9CICQ8ck2iTqZeyxITYmRGGI6NB/eAmefhiPU8Fqlj8ethblBZKHpjfdSoDWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPv0q/kOB4KSM9IPSbXse8UxbK7hdQ/DZPM5+XYKDJM=;
 b=S80+ABvqz8DcTAn8vAghhxzAZ2Qhlkr9TcflqbGH7C0yXFR9JfY7rGg7vIlk4ykDDdsxzTlMwXTcUcnThmmiU4SpSppDI+1bUk+3c7N6vwZOt7aOArQVLuvnXtihxwucTcio/KlhPV9rT5t1SoTk8kl/nf15YDNNgjm/Amr0jCq8fXQQJ2sm+sKj+4UklYIPsuQNqoNOtBhXDQQCgvxYGJ/sg+CFUFCw3LTjxez4MytRKIAwDABwn484W/vsrkpjnUDoFlUUkNSY3C6YmHnhhhUVOjgUSJackH9huGgiGCg/K3LtG/ttbQLnv1sQ0V0JYmV8R/9oCoW5wcKDMB9ncA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPv0q/kOB4KSM9IPSbXse8UxbK7hdQ/DZPM5+XYKDJM=;
 b=GPlwXnZrym2cDrDQONxw7UV/B9KdB5MkidR4sBSGi+dozBIfT/ebkaOrws3gUBRIPN8PQpSK3hlrvLwdpoOL+6SrnnmwSy/o2QUyF7rRxoaFmJTx9S3rI2Mxqc3xLOyfBbkoVzh4ugvWO3LA0161HvBWcAXcBfPRS0CD8Kt2buc=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SJ0PR10MB5858.namprd10.prod.outlook.com (2603:10b6:a03:421::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 17:18:46 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 17:18:46 +0000
Message-ID: <58e2daab-d8da-a572-6297-807cecc2852c@oracle.com>
Date: Mon, 6 Mar 2023 17:18:40 +0000
Subject: Re: [PATCH v3 13/13] docs/devel: Document VFIO device dirty page
 tracking
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-14-joao.m.martins@oracle.com>
 <6ac284df-144d-a71d-5d65-6b14969fdf7b@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <6ac284df-144d-a71d-5d65-6b14969fdf7b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0049.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::9) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|SJ0PR10MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: d50255cd-ba4c-4585-5800-08db1e66d7d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MmgRfc/bpuYNR0ZyWAmhLUZYD+9lxB/zh+w6vTSO8BbYrvJ9x0kT0NQvoRkhMCX90FtfRPRxmhiuwGT9XUMLXz/vHsoHAu51f9IO1O1uzN26HMX8nVsGd3Zm3/JXxKTrehSW2EWRczEJ//tfHM2WwVli4VZfgZs7MWL4urD9k7qH7bdFlJcB2wMqfcuRskUZKcw8vnClygQMtZAV2io4eWROr1NSavjnnf5jEAScNcYpYz7B7vhFXAxVtoosTMXMciotF9UJJp2qJkRYbSAbZhedf9VmzxzHFshhYeFKL06UEMVfzA+8ceQyML4Iq9BP432X6eB8IGje3Y9vO6ypScUNMvWHFySn1ISMlY6aCzTNbkGLuUaOfOcm6ptmoYZxgfXSG3CWVD9i7CbcfMjB7D+jvYS1yo40M/b2UpWnGzPwzIuLVFAGRFTh28rMnu+MkChq5ryhz/TRH6IBINOP0ESGJOH4e5mCNHF4bR3jFFpelExxmYh489+Qp3JDYI4N5/6dEvVEEgIgnUGh3q9an2rxMCSzWf9Ianw7WG68uy5qnZoVU8hgBa3lnLIPTdOyVokCM0cYmzMMD9U1rVBaZjZgLK8SaW3IRmcaRg+yokThQ01FacyxE1C+7IXvQwhp6vIADhiHAwUdN/AG0/DiASnFbUZhFa7KphLRd0erDasmRbsLJRx/vTPAsHEygS5FYXBuzte+bmHAjnGFP29OQLGMqXS8qwPoUOXvdlmBG0c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199018)(186003)(26005)(31696002)(86362001)(36756003)(38100700002)(2616005)(83380400001)(316002)(66574015)(54906003)(53546011)(6512007)(6506007)(6666004)(6486002)(31686004)(478600001)(66946007)(4326008)(8676002)(5660300002)(66556008)(41300700001)(66476007)(8936002)(2906002)(14143004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1RLMy85K3htNXRNSVVHNE80bWFKMHQ4UW9kMDkyWW1sOXVVa1NXbFJJQ3FJ?=
 =?utf-8?B?Nms2K1BhTUN4SjB6cEpPVkRwbDUyZjQxMC93Zitmdk90WS9yajVaaUVhTHI2?=
 =?utf-8?B?VXN3Rzg2M05lMHN2UmxaM2ZGbng4dTlBcVlRb2wycld4R3F0cnNVWERaejIz?=
 =?utf-8?B?L25lUSt2NEF0QURMWXhTZElCb2NIYWVlZkVhMzhldkpMUnZ2WlBlVEQ0SHBx?=
 =?utf-8?B?UU82M09iamdyT0FhSHphamJHVXl3L3pMSnhBOGdZNHpSMVEwaWZHYXZzWUlv?=
 =?utf-8?B?eVRZZjZoeEZnMkMyWUM0NFRPc3E4b2F5UHVJZUxOTHZPbWNqL0lCZ01DRUdr?=
 =?utf-8?B?U21QQmVWWkg1VW4va0Ftdy9COStGWVV2RlZZRDVRT3R6VDBhc29VU3NtYVcv?=
 =?utf-8?B?TlZ0Ri9iODhCY3BrSEpVT1lwekRYc2t1WU1FVXp0cGR4dTRXb3hlOTVacFBO?=
 =?utf-8?B?TDB1SXkyK2FvOU9iVUo2RmpMN2w4M1gvN09yN1lhQmQySkcrUWdKN1lKUUlR?=
 =?utf-8?B?eDEyNENFaUdYaHNJQnpaaVdEc204UTJYc1lkQWM5V0VOcWE4RW1FZE43eWhy?=
 =?utf-8?B?L2dWQisyeTVDczd4anF1UmtmUUFWYjNEZDlROVB2ZGRmL2RZR3I1bTZla3B6?=
 =?utf-8?B?MFdISDI0QnpSUkJoUnRVS2p6K2Fndlc0bW1wWW1LSjZITU9lVWc0amNqOGN5?=
 =?utf-8?B?OWxiRGJ6Vzd5OE9zWjRHOTF1OCtJZ0luSG5EK0Fwa2JxYlRzZGk0YW5SNmpR?=
 =?utf-8?B?d3NlYU5KTTFJZGdSTU1oWlJFeC8yTXBROU5pb2tZR0tWTmx4TXBKUHdZYU5P?=
 =?utf-8?B?V2xoVEZBTFMvanZ1OE9nWlJEcTNYR2UrM3kyYmlhcVN0eW5DMG5YalBmWHhR?=
 =?utf-8?B?TitRVE1ldnpvSTJsaVpoMzl6RnpBVGdmcHJXbG1aNlJDK01EcC91VUZ3bWFs?=
 =?utf-8?B?K05PNEJPQjB6S0k0UXgzVVMrRFVhaHpwYXdjbVlmM2lBdnQ0Zk5md0MzUDM5?=
 =?utf-8?B?QTdCS0lOYnI2U0pVNEd1eDBYaithZ2F1YW45aWxOYjZEUjRVY0QwamgzQzFW?=
 =?utf-8?B?VFlLd3JFNTNvSy9WZWFHbGJuNEFodHZwNE54K3FEaGpOSFk0ZUdaUWxWTXdF?=
 =?utf-8?B?RE9STTZ1OVBXeG1XSDBIaHF0TjJUZVhxNFdmcVFhcUZwa0tBQWYveS9rWitR?=
 =?utf-8?B?K2JUZW5QdVBmR0pVeGYzeGE1b1d4ZnhmSm51c2ZJaTNXbUJORS82RTNRWDZk?=
 =?utf-8?B?bzc2bGZFYnhrQ1pOcTV3bXp1LzRwZlVzaTRoNXZqTmU5cmRuZGgrSSs2OEkx?=
 =?utf-8?B?alpNbTJPUmd1eVVoVmhxTGwxaGNKaXJOTzFWSlI0ZW1ZaElFbjVuVVhBV1Fw?=
 =?utf-8?B?VUpvWFZEMU9iS3NxM0pWYzBIbUs0UkZYc0NpL0FHK1k3ZDRncWUxRml0QlZa?=
 =?utf-8?B?dlBqNk91dXlpbXg0SWRBVTFSSC9YdGhGUFNrdENVd1NjeUF1SDd2Nmw2WlQy?=
 =?utf-8?B?ZjliZjBlSVF4Q0ZvWVcxVDlBWDI0T2hPUmFqTWppa2xuamZpMGdBTjNQRURW?=
 =?utf-8?B?VTBmcXBLLzBNRzVBKy9obWFhdFArVFE4L1RHd0s1bTVkdDNzZVpqZWFYWnJ6?=
 =?utf-8?B?TWlCWVpNQjlxWDBqWEZyZ1lwVkJrOFpYbWc2dldybUY3aVFMa3pOZkZUdnJ5?=
 =?utf-8?B?Z0pGU2E0Y2dUK3ZEblNiMjh0UVl3dFVxczRiaUNYT2lHRG5YbXpSRHFwQmNa?=
 =?utf-8?B?b2dCTFBBMkxpTDFMeHRGOTlPVlY1WEFiQng1OW1ndmc2MHIzaTg2em5rUVRR?=
 =?utf-8?B?Q2FuT1gzTG9mUC9QSFRRK2RQOEkzM0h6SVJGeS9YQll3SGp2ZnJzNlRjSHgv?=
 =?utf-8?B?YVVRQjFaNm5MMlBzSzFxOEEwR3l3clRnS0JwZ1oxY1lLZkFTZm5XUng2eEFj?=
 =?utf-8?B?WU5WaXY1dWlQK0FEd2g0b21STG1HWGI2TStlSkZsTlduU2xhOGZSemFCcU1C?=
 =?utf-8?B?bTZOWEdoMHFsdzlZNnVibUNnZUFyMXUybE9ubXA5K0xZcWNqdFBWT2FZOVFB?=
 =?utf-8?B?TVNuL3hjQm1oR3BlSjY2alA2d2ZabEh4V09xQUM3aUM0aVZFYnQ3VXZnaVo5?=
 =?utf-8?B?NXpqR0VSdVZidmkwNkpvVjdldFcxOXk1QlByeUNHWnNVNVBhMFphLzU5MmJS?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: iBBNhFjkUBM2/RZpfgRrIHO1kkF1ZaHn27p0/7Lc3ZW8jxYOuIlVO0HFdMEhP3DwintcQtJdfwPY+XUGlq/XRhJCz5XKgjzIk+uwjDMrm3UvFhiPFpsX8mTX64GF6FOTfur40JTV19gvcvcaUpzwLUobcU8fe97gWVKPzbmsk2TZyB3En71m/z1+RiSgOPG2/ieV6JVD2yH7qiuCVK1x4Zi+K9pORcVzlYv1duWHeFpwIkFCpbDqmYhfngtvu4SO954wBSWBdgL/jvEGV2SA1Q36GOgtlPjiaKpGwEI9Fwo0t04j50eGPNn5e5M27YcQ3HLxRPWXMxJDEpm9/QS5n/2NPvyh8P7Ecrp9no/8MJsqH2H0FdRMWtSlt0k6FGns/M5U3IWyxJWASjtKQcZFMMigXPVz70EUVpmZOMHQJNOh2BxRYdv19Ocj/Hd2ihDm4eMrWmE0r9UsInbM8KECBuxWEkUBehcPTQG1H1iRbGXgL/ZcYhuaiCNObMEumoIlpKLvYgQNeVAcVeU6+HWC/K2zIUbTJJDjjBkcMen0cvBLYQsGk97V/FrVhKIaUrJmRWZQBF3Qi8zHmM6J+W3qxmBH3yXs25ZxgFKgr4DpeD3E5BUiee7w9LbtyiEWojwKbVCH4bgvpYZG5m6eWU9ZBmw6d0OgBbv9Hbk5bqkFHHrr4MCg79T6eEbBmIk5XNAutefgsvmDuQHXkXmUoXju+9nS3CwDqYhDZF3fb8ZN5RlUGn4/OGGAySsZByujBjgHz+vYHMn5QPMOktwf1HPvP0qFl/P5KDRiLQYVCrwcbjI69/OvH9P0YOOF+xRYuXpT
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d50255cd-ba4c-4585-5800-08db1e66d7d0
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 17:18:46.0572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jdoCc6qPBcnfAJc+uD1ea3nvt8JBS292UtNvF4wBN4Uvu9tvXzJb/X+DAXaDRZ0m4yKeCFjweit7wJtHLj97t6v+StTHCmEge/G94L+BiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5858
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_10,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060153
X-Proofpoint-GUID: tf-MBTN8F5WDD4yPXxjhK93ROKq6YHXC
X-Proofpoint-ORIG-GUID: tf-MBTN8F5WDD4yPXxjhK93ROKq6YHXC
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 06/03/2023 17:15, Cédric Le Goater wrote:
> On 3/4/23 02:43, Joao Martins wrote:
>> From: Avihai Horon <avihaih@nvidia.com>
>>
>> Adjust the VFIO dirty page tracking documentation and add a section to
>> describe device dirty page tracking.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>   docs/devel/vfio-migration.rst | 46 +++++++++++++++++++++++------------
>>   1 file changed, 31 insertions(+), 15 deletions(-)
>>
>> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
>> index c214c73e2818..1b68ccf11529 100644
>> --- a/docs/devel/vfio-migration.rst
>> +++ b/docs/devel/vfio-migration.rst
>> @@ -59,22 +59,37 @@ System memory dirty pages tracking
>>   ----------------------------------
>>     A ``log_global_start`` and ``log_global_stop`` memory listener callback
>> informs
>> -the VFIO IOMMU module to start and stop dirty page tracking. A ``log_sync``
>> -memory listener callback marks those system memory pages as dirty which are
>> -used for DMA by the VFIO device. The dirty pages bitmap is queried per
>> -container. All pages pinned by the vendor driver through external APIs have to
>> -be marked as dirty during migration. When there are CPU writes, CPU dirty page
>> -tracking can identify dirtied pages, but any page pinned by the vendor driver
>> -can also be written by the device. There is currently no device or IOMMU
>> -support for dirty page tracking in hardware.
>> +the VFIO dirty tracking module to start and stop dirty page tracking. A
>> +``log_sync`` memory listener callback queries the dirty page bitmap from the
>> +dirty tracking module and marks system memory pages which were DMA-ed by the
>> +VFIO device as dirty. The dirty page bitmap is queried per container.
>> +
>> +Currently there are two ways dirty page tracking can be done:
>> +(1) Device dirty tracking:
>> +In this method the device is responsible to log and report its DMAs. This
>> +method can be used only if the device is capable of tracking its DMAs.
>> +Discovering device capability, starting and stopping dirty tracking, and
>> +syncing the dirty bitmaps from the device are done using the DMA logging uAPI.
>> +More info about the uAPI can be found in the comments of the
>> +``vfio_device_feature_dma_logging_control`` and
>> +``vfio_device_feature_dma_logging_report`` structures in the header file
>> +linux-headers/linux/vfio.h.
>> +
>> +(2) VFIO IOMMU module:
>> +In this method dirty tracking is done by IOMMU. However, there is currently no
>> +IOMMU support for dirty page tracking. For this reason, all pages are
>> +perpetually marked dirty, unless the device driver pins pages through external
>> +APIs in which case only those pinned pages are perpetually marked dirty.
>> +
>> +If the above two methods are not supported, all pages are perpetually marked
>> +dirty by QEMU.
>>     By default, dirty pages are tracked during pre-copy as well as stop-and-copy
>> -phase. So, a page pinned by the vendor driver will be copied to the destination
>> -in both phases. Copying dirty pages in pre-copy phase helps QEMU to predict if
>> -it can achieve its downtime tolerances. If QEMU during pre-copy phase keeps
>> -finding dirty pages continuously, then it understands that even in stop-and-copy
>> -phase, it is likely to find dirty pages and can predict the downtime
>> -accordingly.
>> +phase. So, a page marked as dirty will be copied to the destination in both
>> +phases. Copying dirty pages in pre-copy phase helps QEMU to predict if it can
>> +achieve its downtime tolerances. If QEMU during pre-copy phase keeps finding
>> +dirty pages continuously, then it understands that even in stop-and-copy phase,
>> +it is likely to find dirty pages and can predict the downtime accordingly.
>>     QEMU also provides a per device opt-out option
>> ``pre-copy-dirty-page-tracking``
>>   which disables querying the dirty bitmap during pre-copy phase. If it is set to
>> @@ -89,7 +104,8 @@ phase of migration. In that case, the unmap ioctl returns
>> any dirty pages in
>>   that range and QEMU reports corresponding guest physical pages dirty. During
>>   stop-and-copy phase, an IOMMU notifier is used to get a callback for mapped
>>   pages and then dirty pages bitmap is fetched from VFIO IOMMU modules for those
>> -mapped ranges.
>> +mapped ranges. If device dirty tracking is enabled with vIOMMU, live migration
>> +will be blocked.
> 
> There is a limitation with multiple devices also.
> 
I'm aware. I just didn't write it because the section I am changing is specific
to vIOMMU.

> Thanks,
> 
> C.
> 
>>     Flow of state changes during Live migration
>>   ===========================================
> 

