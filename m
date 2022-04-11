Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31D54FC250
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 18:28:39 +0200 (CEST)
Received: from localhost ([::1]:57696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndwu5-0000BU-1V
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 12:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1ndwpz-0007kB-VU
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:24:23 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:48698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1ndwpt-0007Rc-Eg
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:24:20 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23BF8cwT018804; 
 Mon, 11 Apr 2022 16:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=3P5+xZ9bq/Gyidl6+eoRZ6uex54iBMgkfLRx40pnkqE=;
 b=UdcAT4ctjpk2F4HYFPY1lDuTtKq2xclGThbWObrlpPMss9Ja5WBvEVjCnAMDnxYrIH7u
 M3SaAQuxayV7LN7dVzWxbx3YnxZBujqmEv2N9nHUV15aFL9VLhiAjoekrd9+34FgexZQ
 z4olMQf/SQ376Wfz5OQGg5kG3SpcjpJrDeMtG8pwi3Q0nJBhjObUxTgKvYYzQrSjvOa+
 Hg+LfwoQP0Ungs3UJpCLuZYp085m898GfuyQJZuAdKh/wSSfSSddzfMdbMd3pna3IX2C
 YMphxdDTYLj3eMS0HXEMlAztZPabjLL1RvoGTDmIkZdPZjihWOA8gZMHwbcJxOZZh9mu OA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3fb0r1c8d7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 16:24:00 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23BGAND2011944; Mon, 11 Apr 2022 16:23:59 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fck11sbna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 16:23:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSv6y3fBGVjCgjzWyltNbLKIszH4gYXNgPi4kkNviZ/n09DUnOfKgJJ9frNGRsrkeVFK3d3V+F7DqWya1P0qH+xh4AAc3g9O5ORgwSVAH4SfcFkdsoPjY1MH5sx0VR9b4uMA4O6P4Ra2xRMSVatGAxK+v75tK3ib7ytI36jhySD9qkZe0IGnt0XScJCdC5FcagCyI+/2YuPtXf3rDchvqHF3XMH0DXazowVgMetACo+Pxl1S2zyvXFtzgZa0sYDO6j0saAjmdxEAvKYbtHMe13k1KYnqglinlT4ZgvB8tEpAve0HpwWqJ58YAZZcpJGKBMxhlxIPj9fvRrhxnMdgEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3P5+xZ9bq/Gyidl6+eoRZ6uex54iBMgkfLRx40pnkqE=;
 b=AndxcTi1wi+Kb7TYN2oiUu9v1ITX5Dln84iCbxBGyX5pohAj69OC/ub5d4eFQhe8Q0o2hy4l4d8tAMehhigY+8VPZdnxu3jn9OdMcRwPXaqrN4qokkFjlDCeMNzGOOPirZ18y+08MsyqGH+zPHYPSRfwBTJUnSjUB4worSvBnhyl7WiRJePtxb40Dbiz/8qrFIOJfLu3N7Ql8VzfeL6l298aJU4te8tB9+S++OINWXJbUEPKPOHWlssVRHhMPGtg/0ZvcWGI5kamIqZUvXZtMiNgKiK7NfPMFdmNBTgGl8cMNceGQL2LD+g08ZG2ZnmBAgXlV+KmdkxmZS6aTHvfwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3P5+xZ9bq/Gyidl6+eoRZ6uex54iBMgkfLRx40pnkqE=;
 b=oDlBveLrOxaIAgcY+qSLlLIEWDJuxL6Q3fXrHMEfpVENe3rdTNk1djOTwfQl19nqfRyD4XbfQr48Em9gQzgGbCV5SQ5ET4ARJue/73uki+93dp+syOACODbkGReygsw9Bzs2ygLHio/cJaqjvANxGraSQqZ19yRIWRJNBFAhx7I=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SN6PR10MB2893.namprd10.prod.outlook.com (2603:10b6:805:d1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 16:23:57 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::853b:cb41:6d13:5075]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::853b:cb41:6d13:5075%7]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 16:23:56 +0000
Message-ID: <f18cf0e7-bb4f-1b43-ee2b-5e00c0c282d6@oracle.com>
Date: Mon, 11 Apr 2022 12:23:50 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V6 21/27] vfio-pci: cpr part 3 (intx)
Content-Language: en-US
To: Fam Zheng <fam.zheng@bytedance.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
 <1628286241-217457-22-git-send-email-steven.sistare@oracle.com>
 <20220329110326.GA447081@fam-dell>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20220329110326.GA447081@fam-dell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:8:56::16) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d3fe6e3-f815-460b-d59b-08da1bd7acd8
X-MS-TrafficTypeDiagnostic: SN6PR10MB2893:EE_
X-Microsoft-Antispam-PRVS: <SN6PR10MB2893BE096FED7E2DAF4AC598F9EA9@SN6PR10MB2893.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RfGHRKvErReE5IQkk3grJuvqNFENv1+npe4R6QTAF1/Qg9zSMoOSfUa75kB/cWybUEgUtXUs5auqEMxSCYRfZk+6OqPfjko5+1Q6CpGzvrMRnk7g9Z8r5PKx+xTtFpUxfpNeIYw0EBLQSPwlT9ipNjCmlBHdnU3Vv+HG2Twlnsf1bfQQlca6d3M63hR4ak2fRmwGan6doguLR59zUVb/jhY2OQ1N83EjZF+/eBuk734ALDyCD/zQTSYjCW4HcvcKmOKL18R9SGdGbLsyRcN9jxMpRIOD7uydZ0RYj20kWaJHWQa3nyjpjl+ylVTDEvaRcdQD3E0xhyOUiVabqIWnkJKpfuv/2UWGAeHDC4/WhNo7qeS1RasZQFzmF+x/8OSsQs9YcWjJlaZta/OFSJ6I2xgory4Pg1jZ6NGoMQguCs5T2lOoTfgPcSie9HhKBPwoXm4V2xHHomBuHinbEa3+7z2fgEqFibt/ivBsw7XPJNo6dFF3CQK8ehVR90C5ZBQUTswpk9uuVUTr42SFzYg7tOJ46Ndzm+Ll8CwPfAE7TbbFUAkWVkWVQCicQKY9QAdgaFpU3ZeFQZMhoR3fZfOznmxHxsM3b45ESlvG17FdTI2gOBIXdGrl0SgY7JCEn4Qt+s66iZVLJrIQS9u9ZEUKgHgcQGPA0akYonUJEWcqKQ+JCRn8+fvB2kb6Lc/wj1w3VV0qEoc6gDBLDh4ntM1b0XMPVqb1HbQnd19MqvVL0MM7y8UuCI+wWyLSpag8OXiC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(36916002)(8936002)(6916009)(316002)(83380400001)(31686004)(36756003)(6666004)(53546011)(44832011)(66556008)(66476007)(66946007)(6506007)(7416002)(6486002)(5660300002)(186003)(2906002)(38100700002)(2616005)(8676002)(31696002)(26005)(6512007)(4326008)(86362001)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3EwN3MydWZNdHlFbFhMWExqOXE4SjdWejQyemN3UzNBTlc1MGZiNThoZTRM?=
 =?utf-8?B?Q3RDcUFFNzNMSTdqM1RMTjhRV1Y0TFVBcmFaQlM2bVFjREdhRVd6R0RkM000?=
 =?utf-8?B?US9uQnp5NXNnYzl6aENTMk9nN3YwWE1IZER4Wm9VZ2w5ejcwWWVXa3FwK3RU?=
 =?utf-8?B?YUp4b3ZXRGI1ekVzbnFEanAwQ3kzZktxWStsUjF1YTZtd0NYeDhQTUxpQmYw?=
 =?utf-8?B?YnNOa0N4OGFIQzRlZE9sbUNZMFd4UHlrSi9pR3dCQnNnampybmF5dFU5V2tS?=
 =?utf-8?B?bWlyUXN3WitXZFgrOCs2b0s2UzF4eFRwd1gxVGdlUm1MS1pCaE5LZjQ4bUl3?=
 =?utf-8?B?eldGaTBwNkJzYzl4bElBSVdUWjhtMXpKcVliZVVLNXRXeDNaejRCa1lSQ2Vy?=
 =?utf-8?B?WEUybGx4enpZdzJEVmxjMmpUMlRJdzRLN3phZVlrQkNsK202dW5nQTRPNWdZ?=
 =?utf-8?B?a2JRY1ZDUlFFSUVBS1pyQy9lZExDV0tCbGVlOGF3L1RLL3Rjb2c3bFU5NGIw?=
 =?utf-8?B?NG83dzY4UE40S0NMRjFJRkp4cHJ1MUdjbVVwV2p6TXM1cUNrOWF6TDdvZjhw?=
 =?utf-8?B?S3lPdVVPRWw5UUw2VTZIeXV0ck95c3IrQUtUcHhram9CUnFHbzB1NWRpV0Y4?=
 =?utf-8?B?azV3UmlYRjMzZmFKOEFwV1Vtc0MyZUU5N3hQbmt4QlRCTktWVzIra3BuZXZM?=
 =?utf-8?B?VmRITFNLL0F4WGpRcm5TOHhKc2pldXlET2ZxR1ZibmdpZDZsSDFIVEVrNCs2?=
 =?utf-8?B?cUVQS0tNek5vNTRyZlRzbHJYOVNHMU9GY1VyK0ZuN2RTcjFUUWRqWTZYS3NI?=
 =?utf-8?B?TTk5M1N1c2l5R1pPWDNHLzc0ZVVJdW5vQVhoVDkzM0lZUklIaEx2WVdlZW9k?=
 =?utf-8?B?MzRmWVpITHFSVG4yazRtcy9nZ1gvK2hkQlFBLzJVVlNCMEdpeitEWkd4S1N4?=
 =?utf-8?B?a3NwTW5DVHZIYVU4N096RFhxVDF2cHhRaDN3VFlXN0U5UmxIbWZKUEJYdGlv?=
 =?utf-8?B?OUZLd2lkdW1LMUlZOHlKanF3REllY2o4NmhreUNxUkF5VVAvVWVzSjRsS05C?=
 =?utf-8?B?WUhZdVhTbGdnQ3RoOXNkREI3NkdINlNZdHRSR0liZUNMS085amY2VzRCSFZl?=
 =?utf-8?B?SER1eDhmOHN6cnh6MHIyMkFpcXRjMTZpTFROQ1hEQS9YalZxSitHRmlrUWpi?=
 =?utf-8?B?c1NVbk1BV2EvU2NtZjlQblVsU0ZIT1pxUzlrS0V5eVJSTC96a0JmK2N6MHMz?=
 =?utf-8?B?RldJRVUwQ1A1ZUxtV3V5a3hReWFQK1J3L05kdEVaRW1qQWYyKzNqQ1VTNzd1?=
 =?utf-8?B?VjZDTFhETWx0SS9nN1hvSjBkMmlkOUxjbG0rclJRTlg4cmwwVTlpT1Eyc1Np?=
 =?utf-8?B?bUI2Nkt5QjVhaHRXamtMWlZiUUllbVRjS25hYXJGalNaNHluWTV2SzBMWU9O?=
 =?utf-8?B?Mml5eUJXUEU3QkdTS2JlcUViSnRhZ09GT3pJaUJFeUJ1VlJ1Kyt2dk5pU0x0?=
 =?utf-8?B?NDlNamFIZHFhTWU3aVFGdGtvNnhhUk16QlBCMTU0YmpVNUZIanFkSDRnL052?=
 =?utf-8?B?T2gzaUZPREY1Ump5c2JLaEhWSzFmQWNRdS9zeHpnc3RJWXhobG1qUS80Tzhv?=
 =?utf-8?B?cWZSemNuWGdxeGZqcGU3Rkdwa05qOGdOUFdOMUdkeXRNSEtlbFo2eDVJTXJE?=
 =?utf-8?B?Y0pMWjlFL0ZLcVFLdUE2Z1o2NnErekttQkdIUCt4Qk9taEREem1VQVM0RG9X?=
 =?utf-8?B?ZE5QVzh2c2RvR3lBQ0hRWFEwMFRHeGsyMnlXcU1rSWs4QlpleFB2WlFIblNX?=
 =?utf-8?B?U3RzZ25lcUt5L0pNS1I5aFlXTXQyRDZVSE1BL2FlQlh4SkhrOWN3cUJPbUM2?=
 =?utf-8?B?aytzQVFuQlVlRW13clQxcWFzWVR6ZFdrcVZYdkRMTFJsU2YxTHF5ZmtHVXA0?=
 =?utf-8?B?akpMZ0J1cGVnZEMyN2dpRUU0ZTRmMUFHcE9LbTNZSXB5WUhlcWc4RFlHQStl?=
 =?utf-8?B?VjVEUWVReVdMbUFlWjlETklWbTV0S1h0WDIrNldLeGlpOEFjQTU3MkNzditZ?=
 =?utf-8?B?UWJZelhiUWFzVlhsWElwdTZWNGZQZHZ1eFlwdWR0SlVTTktsekwwRm8rUk9Y?=
 =?utf-8?B?RHpWeFQrZmFteDZNcjdXUlovbVJKaC9TbndBS2NyeFh5Q0JGM3VZNnVTVzl1?=
 =?utf-8?B?RTh6ME5ZRnJSRXJUenFMeUliM0dzYnZSemVldEdKTjYyTHd0RlFidjVQUFo3?=
 =?utf-8?B?elltdG0wWDdjdDBsVTkwckVBTWtsWVlzcm1GbmloWkdobUUrYXRwcDU5N0lJ?=
 =?utf-8?B?WkMvMDVVcTBtaS9JTEovbCtpbmtPRmsvMU9jVGVKSGpPRmZjNzB4a0FEbEF1?=
 =?utf-8?Q?dzfzsSqRk4OxisL8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3fe6e3-f815-460b-d59b-08da1bd7acd8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 16:23:56.7999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NecNQZ/Hzl2+Ci+Wk65s+HCp1Sw0GJVClemcnZRZzajP7btEu5h/6IC6PtXHqe4l9pCXaLINv8oBfDO0eV9VdPUpc3nAeDjWDyyUFqx561w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2893
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.858
 definitions=2022-04-11_06:2022-04-11,
 2022-04-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204110090
X-Proofpoint-GUID: K8RyLpzPTIEfXP8fOBcefCkq0NsHm5sh
X-Proofpoint-ORIG-GUID: K8RyLpzPTIEfXP8fOBcefCkq0NsHm5sh
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/29/2022 7:03 AM, Fam Zheng wrote:
> On 2021-08-06 14:43, Steve Sistare wrote:
>> Preserve vfio INTX state across cpr restart.  Preserve VFIOINTx fields as
>> follows:
>>   pin : Recover this from the vfio config in kernel space
>>   interrupt : Preserve its eventfd descriptor across exec.
>>   unmask : Ditto
>>   route.irq : This could perhaps be recovered in vfio_pci_post_load by
>>     calling pci_device_route_intx_to_irq(pin), whose implementation reads
>>     config space for a bridge device such as ich9.  However, there is no
>>     guarantee that the bridge vmstate is read before vfio vmstate.  Rather
>>     than fiddling with MigrationPriority for vmstate handlers, explicitly
>>     save route.irq in vfio vmstate.
>>   pending : save in vfio vmstate.
>>   mmap_timeout, mmap_timer : Re-initialize
>>   bool kvm_accel : Re-initialize
>>
>> In vfio_realize, defer calling vfio_intx_enable until the vmstate
>> is available, in vfio_pci_post_load.  Modify vfio_intx_enable and
>> vfio_intx_kvm_enable to skip vfio initialization, but still perform
>> kvm initialization.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> 
> Hi Steve,
> 
> Not directly related to this patch, but since the context is close: it looks
> like this series only takes care of exec restart mode of vfio-pci, have you had
> any thoughts on kexec reboot mode with vfio-pci?
> 
> The general idea is if DMAR context is not lost during kexec, we should be able
> to set up irqfds again and things will just work?
> 
> Fam

Hi Fam,
  I have thought about that use case, but only in general terms.
IMO it best fits in the cpr framework as a new mode (rather than as 
a new -restore command line argument).  

In your code below, you would have fewer code changes if you set 
'reused = true' for the new mode, rather than testing both 'reused and restored' 
at multiple sites. Lastly, I cleaned up the vector handling somewhat from V6 
to V7, so you may want to try your code using V7 as a base.

- Steve

> PS some more info below:
> 
> I have some local kernel patches to kexec reboot most part of the host kernel
> while keeping IOMMU DMAR tables in a valid state; with that, not many extra
> things are needed in addition to restore it. A PoC is like below (I can share
> more details of the kernel changes if this patch makes any sense):
> 
> 
> commit f8951e58be86bd6e37f816394a9a73f28d8059fc
> Author: Fam Zheng <fam.zheng@bytedance.com>
> Date:   Mon Mar 21 13:19:49 2022 +0000
> 
>     cpr: Add live-update support to vfio-pci devices
>     
>     In cpr-save, always serialize the vfio-pci states.
>     
>     In cpr-load, add a '-restore' mode that will do
>     VFIO_GROUP_GET_DEVICE_FD_INTACT and skip DMAR setup, somewhat similar to
>     the current cpr exec mode.
>     
>     Signed-off-by: Fam Zheng <fam.zheng@bytedance.com>
> 
> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
> index 73f4259556..e36f0ef97d 100644
> --- a/hw/pci/msix.c
> +++ b/hw/pci/msix.c
> @@ -584,10 +584,15 @@ void msix_init_vector_notifiers(PCIDevice *dev,
>                                  MSIVectorReleaseNotifier release_notifier,
>                                  MSIVectorPollNotifier poll_notifier)
>  {
> +    int vector;
> +
>      assert(use_notifier && release_notifier);
>      dev->msix_vector_use_notifier = use_notifier;
>      dev->msix_vector_release_notifier = release_notifier;
>      dev->msix_vector_poll_notifier = poll_notifier;
> +    for (vector = 0; vector < dev->msix_entries_nr; ++vector) {
> +        msix_handle_mask_update(dev, vector, true);
> +    }
>  }
>  
>  int msix_set_vector_notifiers(PCIDevice *dev,
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 605ffbb5d0..f1240410a8 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -2066,6 +2066,9 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>      bool reused;
>      VFIOAddressSpace *space;
>  
> +    if (restore) {
> +        return 0;
> +    }
>      space = vfio_get_address_space(as);
>      fd = cpr_find_fd("vfio_container_for_group", group->groupid);
>      reused = (fd > 0);
> @@ -2486,7 +2489,8 @@ int vfio_get_device(VFIOGroup *group, const char *name,
>      fd = cpr_find_fd(name, 0);
>      reused = (fd >= 0);
>      if (!reused) {
> -        fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
> +        int op = restore ? VFIO_GROUP_GET_DEVICE_FD_INTACT : VFIO_GROUP_GET_DEVICE_FD;
> +        fd = ioctl(group->fd, op, name);
>      }
>  
>      if (fd < 0) {
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index e32513c668..9da5f93228 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -361,7 +361,7 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
>       * Do not alter interrupt state during vfio_realize and cpr-load.  The
>       * reused flag is cleared thereafter.
>       */
> -    if (!vdev->pdev.reused) {
> +    if (!vdev->pdev.reused && !restore) {
>          vfio_disable_interrupts(vdev);
>      }
>  
> @@ -388,7 +388,7 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
>      fd = event_notifier_get_fd(&vdev->intx.interrupt);
>      qemu_set_fd_handler(fd, vfio_intx_interrupt, NULL, vdev);
>  
> -    if (vdev->pdev.reused) {
> +    if (vdev->pdev.reused && !restore) {
>          vfio_intx_reenable_kvm(vdev, &err);
>          goto finish;
>      }
> @@ -2326,6 +2326,9 @@ static int vfio_pci_hot_reset(VFIOPCIDevice *vdev, bool single)
>      int ret, i, count;
>      bool multi = false;
>  
> +    if (restore) {
> +        return 0;
> +    }
>      trace_vfio_pci_hot_reset(vdev->vbasedev.name, single ? "one" : "multi");
>  
>      if (!single) {
> @@ -3185,7 +3188,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>          kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
>  
>          /* Wait until cpr-load reads intx routing data to enable */
> -        if (!pdev->reused) {
> +        if (!pdev->reused && !restore) {
>              ret = vfio_intx_enable(vdev, errp);
>              if (ret) {
>                  goto out_deregister;
> @@ -3295,7 +3298,7 @@ static void vfio_pci_reset(DeviceState *dev)
>      VFIOPCIDevice *vdev = VFIO_PCI(dev);
>  
>      /* Do not reset the device during qemu_system_reset prior to cpr-load */
> -    if (vdev->pdev.reused) {
> +    if (vdev->pdev.reused || restore) {
>          return;
>      }
>  
> @@ -3429,33 +3432,40 @@ static void vfio_merge_config(VFIOPCIDevice *vdev)
>  
>  static void vfio_claim_vectors(VFIOPCIDevice *vdev, int nr_vectors, bool msix)
>  {
> -    int i, fd;
> +    int i, fd, ret;
>      bool pending = false;
>      PCIDevice *pdev = &vdev->pdev;
>  
> +    pdev->msix_entries_nr = nr_vectors;
>      vdev->nr_vectors = nr_vectors;
>      vdev->msi_vectors = g_new0(VFIOMSIVector, nr_vectors);
>      vdev->interrupt = msix ? VFIO_INT_MSIX : VFIO_INT_MSI;
>  
> -    for (i = 0; i < nr_vectors; i++) {
> -        VFIOMSIVector *vector = &vdev->msi_vectors[i];
> -
> -        fd = load_event_fd(vdev, "interrupt", i);
> -        if (fd >= 0) {
> -            vfio_vector_init(vdev, i);
> -            qemu_set_fd_handler(fd, vfio_msi_interrupt, NULL, vector);
> +    if (restore) {
> +        ret = vfio_enable_vectors(vdev, true);
> +        if (ret) {
> +            error_report("vfio: failed to enable vectors, %d", ret);
>          }
> +    } else {
> +        for (i = 0; i < nr_vectors; i++) {
> +            VFIOMSIVector *vector = &vdev->msi_vectors[i];
>  
> -        if (load_event_fd(vdev, "kvm_interrupt", i) >= 0) {
> -            vfio_add_kvm_msi_virq(vdev, vector, i, msix);
> -        }
> +            fd = load_event_fd(vdev, "interrupt", i);
> +            if (fd >= 0) {
> +                vfio_vector_init(vdev, i);
> +                qemu_set_fd_handler(fd, vfio_msi_interrupt, NULL, vector);
> +            }
>  
> -        if (msix && msix_is_pending(pdev, i) && msix_is_masked(pdev, i)) {
> -            set_bit(i, vdev->msix->pending);
> -            pending = true;
> +            if (load_event_fd(vdev, "kvm_interrupt", i) >= 0) {
> +                vfio_add_kvm_msi_virq(vdev, vector, i, msix);
> +            }
> +
> +            if (msix && msix_is_pending(pdev, i) && msix_is_masked(pdev, i)) {
> +                set_bit(i, vdev->msix->pending);
> +                pending = true;
> +            }
>          }
>      }
> -
>      if (msix) {
>          memory_region_set_enabled(&pdev->msix_pba_mmio, pending);
>      }
> @@ -3534,7 +3544,7 @@ static const VMStateDescription vfio_intx_vmstate = {
>  
>  static bool vfio_pci_needed(void *opaque)
>  {
> -    return cpr_get_mode() == CPR_MODE_RESTART;
> +    return 1;
>  }
>  
>  static const VMStateDescription vfio_pci_vmstate = {
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 6241c20fb1..0179b0aa90 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -26,6 +26,7 @@ void configure_rtc(QemuOpts *opts);
>  void qemu_init_subsystems(void);
>  
>  extern int autostart;
> +extern int restore;
>  
>  typedef enum {
>      VGA_NONE, VGA_STD, VGA_CIRRUS, VGA_VMWARE, VGA_XENFB, VGA_QXL,
> diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
> index e680594f27..65c3bab074 100644
> --- a/linux-headers/linux/vfio.h
> +++ b/linux-headers/linux/vfio.h
> @@ -188,6 +188,8 @@ struct vfio_group_status {
>   */
>  #define VFIO_GROUP_GET_DEVICE_FD	_IO(VFIO_TYPE, VFIO_BASE + 6)
>  
> +#define VFIO_GROUP_GET_DEVICE_FD_INTACT	_IO(VFIO_TYPE, VFIO_BASE + 21)
> +
>  /* --------------- IOCTLs for DEVICE file descriptors --------------- */
>  
>  /**
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 8b90d04cb9..03666a59b3 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3984,6 +3984,10 @@ SRST
>      option is experimental.
>  ERST
>  
> +DEF("restore", 0, QEMU_OPTION_restore, \
> +    "-restore              restore mode",
> +    QEMU_ARCH_ALL)
> +
>  DEF("S", 0, QEMU_OPTION_S, \
>      "-S              freeze CPU at startup (use 'c' to start execution)\n",
>      QEMU_ARCH_ALL)
> diff --git a/softmmu/globals.c b/softmmu/globals.c
> index a18fd8dcf3..6fcb5846b4 100644
> --- a/softmmu/globals.c
> +++ b/softmmu/globals.c
> @@ -41,6 +41,7 @@ bool enable_cpu_pm;
>  int nb_nics;
>  NICInfo nd_table[MAX_NICS];
>  int autostart = 1;
> +int restore;
>  int vga_interface_type = VGA_NONE;
>  Chardev *parallel_hds[MAX_PARALLEL_PORTS];
>  int win2k_install_hack;
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index f14e29e622..fba6b577cb 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3088,6 +3088,9 @@ void qemu_init(int argc, char **argv, char **envp)
>              case QEMU_OPTION_S:
>                  autostart = 0;
>                  break;
> +            case QEMU_OPTION_restore:
> +                restore = 1;
> +                break;
>              case QEMU_OPTION_k:
>                  keyboard_layout = optarg;
>                  break;

