Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23374BFE55
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:20:04 +0100 (CET)
Received: from localhost ([::1]:37734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXtT-0002d1-Oe
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:20:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nMXef-00035p-61
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 11:04:45 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:2748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nMXeZ-0003NO-PB
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 11:04:44 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21MFH83D032183; 
 Tue, 22 Feb 2022 16:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=85PKnHidU9sLJts/c47l3iqfAMpJLfy402HmiRmp1Dw=;
 b=QdnzN2kvhpeaTRSITq8g0TeRZ7ZfbZlHVNW2FGPZx2DCeb4QBOfl8mYttelTyrt0b6XZ
 L6Ahtjc5iy/bik1AJ0sp+b7j7IjfupfFWsdO0fEEge7xxIEHaUE0JnDs0dOosnz4C+FJ
 7os+fFuCPbSelHeC5/1p4d9ZMPu2D+sSHjuTg2a5nfYnAlK8MGFlW/JrtNGkqyI4mDkq
 Bzfhfi5zlXXwxtn5G7uDaKnKSlMOnXGalGx/E7rp5GpqxnN+bzkD8quvFmNa3w0mnEOj
 fUKhZsW8FrGVcfuNX8MhUIjPbkuFozXZ6W9mbwQOikrAPNTGqe0uBfDSGCsfEuao+SOz XQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ecv6esc10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Feb 2022 16:04:29 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21MG0T0i114944;
 Tue, 22 Feb 2022 16:04:28 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by aserp3020.oracle.com with ESMTP id 3eb4814suk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Feb 2022 16:04:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUTBYE67ebjcR/T30HMx0yaDqRmprXcTp1syJqFNR7SHW6KNqf9GDhiu8lS4mkvwkx+3T+4PDFnbdFXf3mHnHD8nKZiHgw905FLATCVsOhOjvy2jwIEPwr6Jz2NEQCv/IiBQtT/rc4ELcq/19cu7p/gPzbyQebT9anzYx6t34jrV8VbVS6h7JUgxBOWzWFgG8lcY/rl7ae2AQkK010y13iAwY7f1OWfuKw2sCLYjS9izVuhS+Tfk5WhOAMVm+HquQNSSkPorotfmigsdVDNw+PP4BZhcBZX19pWq4ultH0h3xYAOWyyy1jAazNDbtjPNWCaHxkZn8sPGvdXnw/dC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85PKnHidU9sLJts/c47l3iqfAMpJLfy402HmiRmp1Dw=;
 b=ACqONYla0gjTbDWOWy7pWCXg3etyr8tdQ1CaHCCbyNddaBJ4oKRzHZ5Ohl396Ev+JeZW2XU45xbL33YCpHn2BV8SPnIZsk+/2ij3FBz29DXqxQPwr3IfdxaMb3kBT0Iw9rtzbjRyb92UmpP93hFJKj4RmSfKeoWej3ZT1GeXBCUTi0blfLryBYT0XrBJIdidQZCBddjrftehhEOVTQjhjf/T/rTXT24n7O3QY4sSgBE3nh98iW0S/C2sgysHutIauLaqfpE8edGBcSPEp7GN7G5Jj9CMNXNbYFOQdPmIVUAw456vigsbaL3J8NE5kb47s1NDlmEuZ9Z59NIWcrrRFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85PKnHidU9sLJts/c47l3iqfAMpJLfy402HmiRmp1Dw=;
 b=wTsPmNUclg1yoDs3nVCz/Ai8YRF0zKECK/rpVgqB4mku4aSb/gQuBs6cBiUoK6k1Ye6YNQ+ssbOEaZd4lh5t7BziebTXI6J5uOjufMjiAgOscmsAt6tNY+jIVDZtRsEdLTpKmvIOQV1AQmqRbmrSjVFsKoxHhGnWM/YH1bOvYsQ=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by BN8PR10MB3235.namprd10.prod.outlook.com (2603:10b6:408:c3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 22 Feb
 2022 16:04:26 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716%8]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 16:04:26 +0000
Message-ID: <dcdbd9c6-6917-6c39-b125-4cfb3e20670c@oracle.com>
Date: Tue, 22 Feb 2022 10:04:20 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 0/4] vCPU hotunplug related memory leaks
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220126142946.667782-1-mark.kanda@oracle.com>
From: Mark Kanda <mark.kanda@oracle.com>
In-Reply-To: <20220126142946.667782-1-mark.kanda@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::15) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41c57a55-aed1-49b1-8eda-08d9f61cffe1
X-MS-TrafficTypeDiagnostic: BN8PR10MB3235:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB3235973650C9622D10CFF6FCF93B9@BN8PR10MB3235.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vt6fVdiKGgUceqCtMGm+5ceVzIdAFOFThb9QtGpbPVR37Nz6aihhjYX04VyWaAh3Y86Cr/172+rGDA4PH0f7t+flB/yQT7lsOKXyFl2EBVjZzL5OLSGCcrNoeiQ5J2ItiC5YagEWAQEoB9VMureXickA+jfdosM5bo+kwIdyROfhJ5z27Czpp7Li+xqWkJKlRmR2WP4TpBoJo9QzGgOqJN8EsKx8gJ1/fGq1Ja95R9YU2bHFwoaOdecU4JJ02/rtQrUFJyU9bBIUYFOAESBZaG1SMC5omum4IGEKnbvEQk8rvRKBPYQ9+PJ+/Ky8tdOuRhaeRTLEQGbCIEILXvm+luZzEUAmxceRQOVQnV7dpLdCBbv2fq1D/OAyMfHmczE4Qtddx/Z043occIQJdupLVrxUqV82/fnG/kW/wsifdTZDR96Uud71RdhFEYhPFJrt3DcANBH1P2okttj+vIVKaguM82oHym01A6ETlWIN/GJif+EgddBGP3MI7dZz/5OTuMp8jsTw4fU9DLz5P4hvHqSaNVbmosGczPU6OZFeqW3dDWE4sjptvEprv+SO9p0sUFlCJBQoxI6iEBeDMsq8RWlvFaUYOMX8GV9XTqEJQRL2KbPIaMXQukrnDAPO8EfciBYiJJMYQ/EJHIBUDmafEQt7YZnJjSOd0hr1bI2PlqKxbbw1tfHCKXKG2nVl77RJsGJa4cajpXKUFfVwzq8iWFY9g6+3PuwEEJR6zL+qpfc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(8676002)(66946007)(4326008)(66476007)(66556008)(26005)(31696002)(31686004)(186003)(6666004)(6512007)(6506007)(53546011)(2906002)(38100700002)(86362001)(316002)(6916009)(4744005)(8936002)(36756003)(6486002)(5660300002)(44832011)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjBJanZsUjMrVFdEWUNwT29PNHZhb2JWaVp0aDZEL29kbXJaVWdtRnV4amtL?=
 =?utf-8?B?UzhZU3I1RUhUN3N4QVVXWHVlRmYyaUlCR1BVUVhpTm1jTDd2Y2U2TFRZRlNu?=
 =?utf-8?B?d043L2hGRlZyQjgzZnNzNlJNQzNmNHQvSEQrZVhMNXdFc29OczZHdlNsVjkr?=
 =?utf-8?B?eXFHVmJlREVZTTJiVXRleklIVEkwT3NSUG5pZkM0czk0bmZieVhtRFMzKzVC?=
 =?utf-8?B?SngyYzFxL1lhVWZHdVgyeGJUN01vRTNZYVgzU1JEeTlhekFFc1dXak5KTzRs?=
 =?utf-8?B?RitQNmtzbGg2Mm1qT096bFBvSGlYT1FYT25UMEZPeHZPN0pSVlg3UzdkdGRT?=
 =?utf-8?B?RFc5S2R5UW1LRXZZb3krUDVuWE5TWktnN1NrbHhkaE11WWdyZFZYYzhxcmdz?=
 =?utf-8?B?V2FhK0ZJbkdueGlHUk9LeXBlc253WDQ1SkFUaXdLeU9RSkJtaE9YVVpIUmN6?=
 =?utf-8?B?L1ppL0FOV2thMUs2c3FZQlhUdXN6YjJETHFrcnczaDN2bFZJR2RhZk5CQWxs?=
 =?utf-8?B?cXFPQ3Y5UTc2ejZXOHFwZ2I0OFdnUWE1enF1d2laU1RxZjB3Vlpmd0RVNU1Y?=
 =?utf-8?B?ckU5UWVXdjRkMHA1cVI0SEQwNzBYbTZNMmVPR3ZqOXp6ckV3bXdrSDdPcFN0?=
 =?utf-8?B?cjU0SVJ2dGFaSjhhdGVrR0FObjhLU3V2elJlZW1pcGIrYWFLalJrTmdVK2xG?=
 =?utf-8?B?RGtzSU5FazB2N2VQYjdYbS9WYVlvNHFOL2tNUkNHRHNxa2dGNVpmbFY2SlFO?=
 =?utf-8?B?SGZUNSt1Q0FENFBnWjBvZUNNc1c1N2piN0trOUxKUXl1K3lMRmI0eXBrTkl0?=
 =?utf-8?B?QkUxYXgxRnVYODZWVzBmVHJZTjV5bzJMSjYwcmEwZFpXdkpKOExqaXAzTk9Y?=
 =?utf-8?B?RDEySGNFcmZJQXF1RFh6SUlxV0h5VTBXQXZ2Zy9BUVVRRzl0cjVvSHRBV2Jl?=
 =?utf-8?B?bEhQRVQ3amJiU0RQa0V5ak9PS0dkbExBdkVHSm1iZStEM2JYS3Rjb0k4Nm95?=
 =?utf-8?B?dUMraFVNUGo4MEIyV0k4NGRaMWU2YjVzTG53ZnRkdkQ1cEdwRndFUjFpcW5o?=
 =?utf-8?B?aGs2SXVxY25DMlZLZ0twd1VvYklWV1lzWkZIa1h0U1ZCRG5nMGJpeWdWNGdy?=
 =?utf-8?B?bkVHUmVzbFpGMzZhRnBzOVpxVVpnKzFjejAvdnlnbmVLV3lTdTVaVW43N08x?=
 =?utf-8?B?VlJKeWcySEo3TkNJVnVxMmg2ZGRaOWwrdzlTc2tiRE03UmltQXJnRG9mSHlm?=
 =?utf-8?B?VlkreFhyRFFpRUFYSUYwNnk2ejQwdytJZnFYbkV3L1dRR0MwNEJQY3E3VEVI?=
 =?utf-8?B?SE1UUFIwcmN3ZFE3UEFQSWY1VEhlNVdSeitzQkNlYjlQYTBMbGdsbEtVb2pT?=
 =?utf-8?B?NnpweENXN3k4aS9aTi9aV2MyRjJZZVBYUG5VempNLy9mMThCaTMxQ1dGQUVl?=
 =?utf-8?B?SmswQ09ZbE5ZTHFOdEVPTC8zbWxucmhYYlNVdXVkRG56dm5sUFVkMmpQS1BT?=
 =?utf-8?B?cWVDbzNkL2pZcVc0enNCTlR2ZjJpclVTVzVYTE94dkx1Sm94VTRYd1FwNXVH?=
 =?utf-8?B?MEx5SWMzRFcxZjVIbnZHdDVOM1FsUUtIMElLRGkrK09HVkg1NFJMelhTNEs0?=
 =?utf-8?B?QnBYeGtpbWp5NUVtbjhsUVM3Y0JNZysxRTU1Y2svazJZNWVhY1kyNWsyRHVI?=
 =?utf-8?B?RXByOURnUDF0NDVuK3NlLy9TSG9xWWNxRVBxb0VrZU44TUh3OHJxaHA3allU?=
 =?utf-8?B?c0xXajVZK3A4RU1OUis3K1hiZHpOYjNpRlV2TGJEODZDMmxiOEVxTE91aU1J?=
 =?utf-8?B?WjRrWUpscHJHVWYxSWU3OHNxdVVJSVVVUDFZTURWeDU5Z09sS01TbE5Ea3pQ?=
 =?utf-8?B?K1NROGJrcDBObGpqblFUUlVwRkpQRjZWdVkrcWc0U2Q3My8rdGxzZ0RQUkJZ?=
 =?utf-8?B?NmtHQ3hNSnpic2pxMFhUNkx2ZlAzNkR2QzRydEpiRklmNy9CMXEwWTlWbTdl?=
 =?utf-8?B?UHJ5N05vSTJERFNNQ0ZNcktYR254MUxObCtpZE1ITEJzbTVnSGFBNTRmbkxt?=
 =?utf-8?B?NzlJL1RyWFlsd0tQYTQyUlpCc2F6VkZEbUlhMFUwQ1VhNitVVmdySG5ZR2Fs?=
 =?utf-8?B?QVlmSlptMVVhWDM1L2F5aldqYzUwbEhNM3J2Y1NMM2hVbWdBcWFMMzN6Umcz?=
 =?utf-8?Q?WxE12lvH3hNwsxvcLNoiTMA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c57a55-aed1-49b1-8eda-08d9f61cffe1
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 16:04:26.3687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wi/uj7X2nWWQQaokGnl+8p4B63AR+yqJGzLo1jQXaPtPjl89D2aFSPdl2GUpkyvBOdHIMMIDivK4xR9RJNNMyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3235
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10266
 signatures=677939
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202220099
X-Proofpoint-GUID: 4a9OT2kcXpWNhmBziHRGQXP8cAVGH-U2
X-Proofpoint-ORIG-GUID: 4a9OT2kcXpWNhmBziHRGQXP8cAVGH-U2
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gentle ping - any thoughts on this series?

Thanks/regards,
-Mark

On 1/26/2022 8:29 AM, Mark Kanda wrote:
> This series addresses a few vCPU hotunplug related leaks (found with Valgrind).
>
> Mark Kanda (4):
>    softmmu/cpus: Free cpu->thread in cpu_remove_sync()
>    softmmu/cpus: Free cpu->halt_cond in cpu_remove_sync()
>    cpu: Free cpu->cpu_ases in cpu_exec_unrealizefn()
>    i386/cpu: Free env->xsave_buf in x86_cpu_unrealizefn()
>
>   cpu.c             | 1 +
>   softmmu/cpus.c    | 2 ++
>   target/i386/cpu.c | 2 ++
>   3 files changed, 5 insertions(+)
>


