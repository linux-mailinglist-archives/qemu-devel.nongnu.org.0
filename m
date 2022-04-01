Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA954EFCD3
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 00:33:56 +0200 (CEST)
Received: from localhost ([::1]:40546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naPq7-0006Qg-6u
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 18:33:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1naPof-0005dK-0p
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:32:25 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:24286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1naPob-00048v-KY
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:32:24 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 231JPYOG017622; 
 Fri, 1 Apr 2022 22:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=UkbechEZrrtq+mU0sBMr25BRGaZIldhi1iutyz5JKP8=;
 b=xBan1IVnNE3C2s1lJSsavAOZYRmtTKOQYOBDj1T5aOyyU9v71ahUUM7GPc9hNwZojM26
 j+VfgDxUrNRWlXmkUqmMGmnvUXpr5QbdnkyOKJZJYKXfdifLIdv/bds8O43k5qYbrd4O
 i1xQV10xYb/dEDgN6BmXibWr2FMhcy3BfFvlRGboHSbGhl/0tavlKvWwbStzYnaEZlVj
 vSOHbjBrc2Or+WHpPGlc1d7CueRU730fzmW+YNYhUELN6qj5GyMVhyYy/czyeOQMpzdJ
 LOMqwLGKNIWbgbjKK9i++L9jUYSTtaSEHpOA5iOzLb6nW7JYHYnv12VZbbeahN044lum Jg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1ucu0d35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 22:32:13 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 231MWCnr014636; Fri, 1 Apr 2022 22:32:12 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f1tg9nm9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 22:32:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MlaAwcjENn80g8Q3dg7VcYngIoH1oJWrq8Og3mTxC9vrHQBpElRNrHOlmtuSmmSDHJd40q886x9jllJ0ki6ZlP46M7hQrUmVu5WxAaHD4xuUAmxDCv4ZvTij1hqrJRkGKtZsRj/YD7hYJr/iclrjU5zapFZton2eROUd6GsMlmvVsQC2NYGa16ys/NzI+1FxBtK/7b2n+QUz4eCf2q8liwRcwk5iiKOenrr18rivIy4w4gPP1EH7FmQImYp576CaIj+3vfT7jbLbLWcwLeYcpbV0FLslyW9TRJvqrV1OaANUrs/kk8qZGR0rbqELQV0yGtthXp8pC1a3ciyBbML8ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkbechEZrrtq+mU0sBMr25BRGaZIldhi1iutyz5JKP8=;
 b=QxprlPL0CiWhAVBvVqoNqqU6ACvoiXRLIL/gMedl9oeWth3E0JQAqnWCL+eS6QLPFq7ZQgC/wqfM+mftDSK1mlqLkZgG6+CGDIF4jsfVE4fqmYEJrtlD/e8TwCJyoOv/8ivzNyq/kEDJh2SUfJr9OOKuP2cUvF5oxgfbnPmEPy/WbjpjxgiaFr8D25jQbOhoNqGUVFiO5qziMl+wvEN0lEvaVr6X3akZ54U1peAPXQK2duTFTVyznqogOnPIpf0ri5tuTvV2tocsz4lXJvA6nLjLT5ODWzBIEk0/znMDhl1mKRMcPNO1G8jUYKBfD5EiPY4cEc/dnoA/Sdzi0LHbPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkbechEZrrtq+mU0sBMr25BRGaZIldhi1iutyz5JKP8=;
 b=zWqS0L/68wW62nTyPQT9kNYH2hzYmsFOWGg3FKBqcTpFX5YV14RPCfb7jgXB3GI3F1CWqZ0E67rZ92+7OOiJhJdhNMsLTTme+vcVft+QjwIzbdsU/STQHohkfgkTMOOcosDAKLFDFFlao0w5o85Jm/72el/JIl3XubhU3sOX7W4=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CH0PR10MB5499.namprd10.prod.outlook.com (2603:10b6:610:110::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.28; Fri, 1 Apr
 2022 22:32:08 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::9d4f:2df4:8bd8:f468]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::9d4f:2df4:8bd8:f468%3]) with mapi id 15.20.5123.023; Fri, 1 Apr 2022
 22:32:08 +0000
Message-ID: <293bb948-f3f1-22bb-ee8b-30656f7620b5@oracle.com>
Date: Fri, 1 Apr 2022 15:32:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/7] virtio-net: align ctrl_vq index for non-mq guest for
 vhost_vdpa
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-2-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEv=bhGFHqv=Mi7FSnwvDZU4GAvFw564piP6nr3CHD+-Wg@mail.gmail.com>
 <2e9ec844-952d-b43c-7ed3-499eeac6b7cb@oracle.com>
 <CACGkMEsQMk9Tbk76HLnKXF=YQ04K8T3tysk927wt_prkPw8ONQ@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEsQMk9Tbk76HLnKXF=YQ04K8T3tysk927wt_prkPw8ONQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR07CA0064.namprd07.prod.outlook.com
 (2603:10b6:5:74::41) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 830b378b-0de6-451b-fa8b-08da142f749e
X-MS-TrafficTypeDiagnostic: CH0PR10MB5499:EE_
X-Microsoft-Antispam-PRVS: <CH0PR10MB54998508E8F21226EA275673B1E09@CH0PR10MB5499.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VgIDO339t65xSDQRL7DPUby1szPVUc2u0B828gJvXiUe1JjILfzold0LdUTM4fsZV3Wfo8T9anIH2O1LWm2e7oniGh5kDylI02bJI0bXeD44aApJRkSbV7AHmjTUTO83D3V+5AZYu+QE3kN+4Rw50N7KVUsIWX2c4QDNc6ut+TyCB2fGl42GUZC/BLIe5UWD94XXze/dfwh4pGdfnu8iVNNJi7jqtLgRoHkvlCM5ec2JIDqND2Zx56OKF/kfSQiruk+VuaLFLvxb1oEMfXyJaF+jiQQC7p4Uemt221l6KEUoFS50C8GmMhveQIkjr9efNU8n0ja6FnhrDKFZBGDD1VEkSKPooQFvsUj5Dc4jp17k22k2bom9974awgzPpKdpP4jaxuqgVE2kvAIsjHPk4m9aQezgDp2NIB4xohuYFRawvUeToXuYloRe+vl34ntgWnlJdGLZ+9iZZGtNyOJSXwe/IiFvYoqk6sgGn3Hj+CbS/c0ra87g44sCUO7FL8GmhVxCBHBI/62hHD5k8dUYtPZ/cQbqsOAll/gdj2BmNrpcKa4LOL7ja7jkZatKHPIL/SFo81gGlobHAUDKpel/fgI99ayMOMhnJlE5zxfo3Zcha555gJLdmdMPzEqht0qjYOtwJEIy093T9G2xYN37Ic83cUoE/Jnb0uEb2O6wmfyO5Tg3OhGEnw0sUXirkq1n/dmRC0dksjCjfqiFMbPER1y4BXDbVdzIq6weYqoPYYc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(38100700002)(6916009)(2616005)(31686004)(316002)(83380400001)(2906002)(6512007)(36756003)(36916002)(53546011)(6506007)(4326008)(8676002)(6666004)(6486002)(31696002)(186003)(26005)(8936002)(508600001)(66476007)(66946007)(86362001)(66556008)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVNvZGdiRDZoLzdTWmxVNGRQZkUwVDJ3aFY3OEJCZ1dWMDJrOW1zOEZWbTcr?=
 =?utf-8?B?YzRlcWkxcU9JT0wvK2FCMXozVWg0UGFtWXpoOUZNYjFkMHk1ZnFXYjVXOWE4?=
 =?utf-8?B?MmpRK3ZUWGhHQjFwMnh5QWpDVndNYUVzSStVVHlvOHFFTE52RmpaU1R2NUZh?=
 =?utf-8?B?eU1GT0xqYm9DU1pLdDc0RldYa25GSjdWaE5FQ3pWdW93dmZFcTg5VXRBU0lx?=
 =?utf-8?B?RG1OY2E4M0FOVTlmOEtnM0Y5R3pqMHVFRUdMdHp2L20za3JqczVOaG02UXh4?=
 =?utf-8?B?M1RwMGZaSUVsYXYwY0tjOXc1SXZKSnpML0hXVisyRDg1UFZPejNvQ2NUL3BO?=
 =?utf-8?B?UWlWOG11cmVhY20vWEJWc1YweGsvbzgyYzBBVmRNb0l2QTJ5ZDZza2FPR3Uw?=
 =?utf-8?B?WE1kRG41MEl3NGlKUUhaZGVVY3E1a1dxN1JlYkxEWUtTNmRGTHhwQ1JkL0tv?=
 =?utf-8?B?NW5OVFVwUkV1bDRjMDNkK1pkeG9GbkRwQXBkeEFKbW1WdXByUmtIUkxjWWdT?=
 =?utf-8?B?RlJUczZnOW1ES1FDQ29NV3NtSS9QZEJNa092UXR5UFZXRnNMQXFPRjNXOGVM?=
 =?utf-8?B?WDlvRXcwRGRtcmlybmIyaEtKRXhwN0FJV2dxYWVWcVBWSkdONVVqblNTbFZp?=
 =?utf-8?B?MHBvYkdXY3FqTWZ6c21QdWJtajJtc1RITjhoY1BjS0t0VkFuU0ptcUpsbmI4?=
 =?utf-8?B?Nm5JWXFxQWwxU2YxYklRN01PZWEwdmtLQ1BMamIvcTVTanZ3aVBRaFdwNzcw?=
 =?utf-8?B?QitzVDBNeWxWaUJnc3ZRT1k4QzBDYVRKQ3RiWU9DUjVHdmpZaUtUaEtyTmRJ?=
 =?utf-8?B?S3d4QTEyeGR1L0hnck4yYkNMSi9qQllONkRVZFkrUG5mcUdCZnB3SFU1Qnkw?=
 =?utf-8?B?OFhmaXVxd09vZlpkNmd4aElpWXBCdGx6dHNxaWdmWm9FVVA3T25xdlRqQVFh?=
 =?utf-8?B?NklrQUcwZmxVVWpuYkgvUm5kdktuNXVOWHNmOHJZWEZKN2NVMS8vOURTcGpt?=
 =?utf-8?B?alYyU0JNTmlkUWNudG43ZjJCdWhmL05OY1N4QTZOenhLSkgvb0NmN0s1dTBp?=
 =?utf-8?B?clZTQWZEYTNEQ280ZkdYZTJLUmNTL05YOWZ5OHp4VU5nSU5XVWJmUVlhUG5J?=
 =?utf-8?B?RGFvRDhjOHNKMnZUVHU0ZzdMNEQxRGhQNmZBVDYxYk5RT05RN25vTDRzMFhz?=
 =?utf-8?B?eEUxM0hoM2FDQzdSVnEwY0Y5aDhEZElaVGo4QmVwc3BONzNGUFhDM0o3L0Iv?=
 =?utf-8?B?TUZ6U0sxeVpyTkhVMG1RUjB1bjNyWm9zUENDYVk4RW9YdGFtVndlK2lzTm1t?=
 =?utf-8?B?ck12azZ5bUFwYlpVYTBLY0tabHkvVmp4bk83QVJkMWhlOE5aVlpiazRrckph?=
 =?utf-8?B?SlJ6czdzNVNMQUhrSGpXS0tRelltRmpnOTNYRTBNUFhKTGk3VVBGWXVCeGhC?=
 =?utf-8?B?SlIwOHZEUS84UnBmaGRESVhuRnFjUWExS2tKMEFHbzhNNkUyTUJDblg5ZEd4?=
 =?utf-8?B?MnFXb0orclZVaGk4Mk04S2FMd2syeDFUQjRZa0ZySHdoR3NWcFVLTVRkRm0r?=
 =?utf-8?B?UGZ2TUJUS0M0eEZlWFU5Q1pSblBUS0QzNVFsWVZ0eFA1R21SNDB2cnlLZWxv?=
 =?utf-8?B?VktzcFM0V241Z3VSelpyT01zbUZ3SXptOTR5czVKeXB4bGFCZnBWbzArYlRr?=
 =?utf-8?B?dUlSalIrQWlnVVpKQTZlRG11ejIzOXlkVTVNN0FIa0tuVStQZkZwejZ4V3k3?=
 =?utf-8?B?bUM2LzFBNVRzcmpDMWpwV2ZxMytBYURnYitROTg3ei9IbVJjUWY2RDhSc1Mr?=
 =?utf-8?B?OHFmMFRTY2k0dVc2bFZjS1NORmVydXhSOXF0VVZiL1VpVE5CVUJFN0ZmL2RY?=
 =?utf-8?B?akNEZlRtcFQ5QVZsU1BEbW9WKzdKWTVrT2FRdFN4S1Z2ak84R21ZcG1neW5B?=
 =?utf-8?B?RlFoMmM4OHlWS3dhUjVEV3BIS0gwUUdSck1la0NNZExNNmUwbmdsbXFSVTly?=
 =?utf-8?B?QkQ3TzRSekdVZHFvcEVVV294MUdlTnVDV2gwcWQ1SzF2UmttL1B1M0crWHBP?=
 =?utf-8?B?NmdkSFlaRUJ2TkY3YkFURkZ0aUp0OE0yVk5MMWs0ckxjRGFWQ0FPeTBmd29a?=
 =?utf-8?B?U21QckoxOUhXYmJScHQ3SGtNazlrM3JUVE5tSUJHUENqdG41R0w1RVNRWlFx?=
 =?utf-8?B?SXduTVpSeVBFK3RXdWp2L1lBdDJmbTJiTjEyYkFsbG1KZUZTSi9MVTNWNTZO?=
 =?utf-8?B?L3c4SFF0cFR3TjRVdE1qbm1DVFdYRXBYT0R0UTVHU242TXZyNXk0cEY5MWcz?=
 =?utf-8?B?M0pFY29ic1o2aTZ3MWEyK1JWc0RuTTFmQmk4RUtqcWdJYjZlY0FMQT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 830b378b-0de6-451b-fa8b-08da142f749e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 22:32:08.5971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALjn/aUSvu/voBZ1nBXy+0Bnoz2IU5cYCe9mYJ4TB01xPQEfmO5fEvcp5tmTswnGhuc19k+16GtoO/WSRkQMMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5499
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-01_08:2022-03-30,
 2022-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 mlxscore=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204010108
X-Proofpoint-ORIG-GUID: VJv6J0A_eXNbfzQWR3OTIpY2u8U2iiNz
X-Proofpoint-GUID: VJv6J0A_eXNbfzQWR3OTIpY2u8U2iiNz
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: eperezma <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/31/2022 1:39 AM, Jason Wang wrote:
> On Wed, Mar 30, 2022 at 11:48 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 3/30/2022 2:00 AM, Jason Wang wrote:
>>> On Wed, Mar 30, 2022 at 2:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>> With MQ enabled vdpa device and non-MQ supporting guest e.g.
>>>> booting vdpa with mq=on over OVMF of single vqp, below assert
>>>> failure is seen:
>>>>
>>>> ../hw/virtio/vhost-vdpa.c:560: vhost_vdpa_get_vq_index: Assertion `idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs' failed.
>>>>
>>>> 0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
>>>> 1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
>>>> 2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
>>>> 3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
>>>> 4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
>>>> 5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
>>>> 6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=0x558f55c01800, vdev=0x558f568f91f0, n=2, mask=<optimized out>) at ../hw/virtio/vhost.c:1557
>>>> 7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier (d=d@entry=0x558f568f0f60, n=n@entry=2, assign=assign@entry=true, with_irqfd=with_irqfd@entry=false)
>>>>      at ../hw/virtio/virtio-pci.c:974
>>>> 8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers (d=0x558f568f0f60, nvqs=3, assign=true) at ../hw/virtio/virtio-pci.c:1019
>>>> 9  0x0000558f52bf091d in vhost_net_start (dev=dev@entry=0x558f568f91f0, ncs=0x558f56937cd0, data_queue_pairs=data_queue_pairs@entry=1, cvq=cvq@entry=1)
>>>>      at ../hw/net/vhost_net.c:361
>>>> 10 0x0000558f52d4e5e7 in virtio_net_set_status (status=<optimized out>, n=0x558f568f91f0) at ../hw/net/virtio-net.c:289
>>>> 11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=0x558f568f91f0, status=15 '\017') at ../hw/net/virtio-net.c:370
>>>> 12 0x0000558f52d6c4b2 in virtio_set_status (vdev=vdev@entry=0x558f568f91f0, val=val@entry=15 '\017') at ../hw/virtio/virtio.c:1945
>>>> 13 0x0000558f52c69eff in virtio_pci_common_write (opaque=0x558f568f0f60, addr=<optimized out>, val=<optimized out>, size=<optimized out>) at ../hw/virtio/virtio-pci.c:1292
>>>> 14 0x0000558f52d15d6e in memory_region_write_accessor (mr=0x558f568f19d0, addr=20, value=<optimized out>, size=1, shift=<optimized out>, mask=<optimized out>, attrs=...)
>>>>      at ../softmmu/memory.c:492
>>>> 15 0x0000558f52d127de in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f8cdbffe748, size=size@entry=1, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x558f52d15cf0 <memory_region_write_accessor>, mr=0x558f568f19d0, attrs=...) at ../softmmu/memory.c:554
>>>> 16 0x0000558f52d157ef in memory_region_dispatch_write (mr=mr@entry=0x558f568f19d0, addr=20, data=<optimized out>, op=<optimized out>, attrs=attrs@entry=...)
>>>>      at ../softmmu/memory.c:1504
>>>> 17 0x0000558f52d078e7 in flatview_write_continue (fv=fv@entry=0x7f8accbc3b90, addr=addr@entry=103079215124, attrs=..., ptr=ptr@entry=0x7f8ce6300028, len=len@entry=1, addr1=<optimized out>, l=<optimized out>, mr=0x558f568f19d0) at /home/opc/qemu-upstream/include/qemu/host-utils.h:165
>>>> 18 0x0000558f52d07b06 in flatview_write (fv=0x7f8accbc3b90, addr=103079215124, attrs=..., buf=0x7f8ce6300028, len=1) at ../softmmu/physmem.c:2822
>>>> 19 0x0000558f52d0b36b in address_space_write (as=<optimized out>, addr=<optimized out>, attrs=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>)
>>>>      at ../softmmu/physmem.c:2914
>>>> 20 0x0000558f52d0b3da in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=...,
>>>>      attrs@entry=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>, is_write=<optimized out>) at ../softmmu/physmem.c:2924
>>>> 21 0x0000558f52dced09 in kvm_cpu_exec (cpu=cpu@entry=0x558f55c2da60) at ../accel/kvm/kvm-all.c:2903
>>>> 22 0x0000558f52dcfabd in kvm_vcpu_thread_fn (arg=arg@entry=0x558f55c2da60) at ../accel/kvm/kvm-accel-ops.c:49
>>>> 23 0x0000558f52f9f04a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:556
>>>> 24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
>>>> 25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6
>>>>
>>>> The cause for the assert failure is due to that the vhost_dev index
>>>> for the ctrl vq was not aligned with actual one in use by the guest.
>>>> Upon multiqueue feature negotiation in virtio_net_set_multiqueue(),
>>>> if guest doesn't support multiqueue, the guest vq layout would shrink
>>>> to a single queue pair, consisting of 3 vqs in total (rx, tx and ctrl).
>>>> This results in ctrl_vq taking a different vhost_dev group index than
>>>> the default. We can map vq to the correct vhost_dev group by checking
>>>> if MQ is supported by guest and successfully negotiated. Since the
>>>> MQ feature is only present along with CTRL_VQ, we make sure the index
>>>> 2 is only meant for the control vq while MQ is not supported by guest.
>>>>
>>>> Be noted if QEMU or guest doesn't support control vq, there's no bother
>>>> exposing vhost_dev and guest notifier for the control vq. Since
>>>> vhost_net_start/stop implies DRIVER_OK is set in device status, feature
>>>> negotiation should be completed when reaching virtio_net_vhost_status().
>>>>
>>>> Fixes: 22288fe ("virtio-net: vhost control virtqueue support")
>>>> Suggested-by: Jason Wang <jasowang@redhat.com>
>>>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>>>> ---
>>>>    hw/net/virtio-net.c | 19 ++++++++++++++++---
>>>>    1 file changed, 16 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>>> index 1067e72..484b215 100644
>>>> --- a/hw/net/virtio-net.c
>>>> +++ b/hw/net/virtio-net.c
>>>> @@ -245,7 +245,8 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
>>>>        VirtIODevice *vdev = VIRTIO_DEVICE(n);
>>>>        NetClientState *nc = qemu_get_queue(n->nic);
>>>>        int queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
>>>> -    int cvq = n->max_ncs - n->max_queue_pairs;
>>>> +    int cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
>>>> +              n->max_ncs - n->max_queue_pairs : 0;
>>> Let's use a separate patch for this.
>> Yes, I can do that. Then the new patch will become a requisite for this
>> patch.
>>
>>>>        if (!get_vhost_net(nc->peer)) {
>>>>            return;
>>>> @@ -3170,8 +3171,14 @@ static NetClientInfo net_virtio_info = {
>>>>    static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
>>>>    {
>>>>        VirtIONet *n = VIRTIO_NET(vdev);
>>>> -    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
>>>> +    NetClientState *nc;
>>>>        assert(n->vhost_started);
>>>> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
>>>> +        assert(virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ));
>>> This assert seems guest trigger-able. If yes, I would remove this or
>>> replace it with log_guest_error.
>> This assert actually is relevant to the cvq change in
>> virtio_net_vhost_status(). Since the same check on VIRTIO_NET_F_CTRL_VQ
>> has been done earlier, it is assured that CTRL_VQ is negotiated when
>> getting here.
>> Noted the vhost_started is asserted in the same function, which in turn
>> implies DRIVER_OK is set meaning feature negotiation is complete. I
>> can't easily think of a scenario which guest may inadvertently or
>> purposely trigger the assert?
> So the code can be triggered like e.g unmasking:
>
> virtio_pci_vq_vector_unmask()
>          k->guest_notifier_pending()
Hmmm, are you concerned more about idx being invalid, or 
VIRTIO_NET_F_CTRL_VQ getting cleared?

virtio_pci_vector_unmask() has validation through virtio_queue_get_num() 
that ensures the vq index is valid. While it doesn't seem possible for 
VIRTIO_NET_F_CTRL_VQ to be cleared without device reset first, during 
which the pending event left over on guest notifier eventfd should have 
been completed within virtio_pci_set_guest_notifiers(false) before 
vhost_net_stop() returns. If I am not missing something here, I guess 
we're probably fine?

-Siwei

>
> Thanks
>
>
>> -Siwei
>>
>>>> +        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
>>>> +    } else {
>>>> +        nc = qemu_get_subqueue(n->nic, vq2q(idx));
>>>> +    }
>>>>        return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
>>>>    }
>>>>
>>>> @@ -3179,8 +3186,14 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
>>>>                                               bool mask)
>>>>    {
>>>>        VirtIONet *n = VIRTIO_NET(vdev);
>>>> -    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
>>>> +    NetClientState *nc;
>>>>        assert(n->vhost_started);
>>>> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
>>>> +        assert(virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ));
>>> And this.
>>>
>>> Thanks
>>>
>>>
>>>> +        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
>>>> +    } else {
>>>> +        nc = qemu_get_subqueue(n->nic, vq2q(idx));
>>>> +    }
>>>>        vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
>>>>                                 vdev, idx, mask);
>>>>    }
>>>> --
>>>> 1.8.3.1
>>>>


