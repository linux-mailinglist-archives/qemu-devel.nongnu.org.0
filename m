Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F4268B51B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 06:11:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOtl0-0001cr-HF; Mon, 06 Feb 2023 00:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pOtkf-0001bj-0N
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 00:09:16 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pOtkd-0005Ar-1u
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 00:09:12 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3160MSW1013424; Mon, 6 Feb 2023 05:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=+HgIilpwh0NPoUukx7aXOtbw2eQAua+7a40XiQDnwJY=;
 b=oBji22rUtnaDIDO9r/LH7sLbajNGpCu5rx8iMvhdoudhfNXnApBjIC51vVw+bY6YzTt2
 HVsxvoyN+px9GhlBudTtvCj8bAABAofYTWSs33Zgoop3mDW7xRqPef6JAPgU/z18odsO
 ltG0LbKC/+R+DKLANZj5nDuK2B7pp/Pcp+KJgSgGIvnY2ypH+2IcV6AYqQQAfai6m34t
 9e+TCyrEVu8LTUDYNfi+8htpk1hVf3XqA1INQmnr7RilczQBAcp3l7eVgLFv/L2FhfL/
 hgvekr8RnbQl5QMN2VL0QDOCuwKK/PQb3p1f8GMXRsCDG2pb+hOMklG5xoevM5AFBJ1p tw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhdy121gn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Feb 2023 05:08:50 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3162TE1d037647; Mon, 6 Feb 2023 05:08:49 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdt9u6qm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Feb 2023 05:08:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cB9rOQiLZCZoSPPneYpswNBc88hJlarYLjLbgAcLXS4Y6tQahtJXeyw6HZsnh2dsHlguUPJq/QDKUvSzNzOBYiR4Y4wwL3tn/KFEo4pJClI7zoCjWBMpXfM9hMX9RTEQK8S7pv2iwt2qvfm2jqmYmT321Ti4iuV8D2n5/Fc3Am+x/ERjwfUeVv1g/pGpZMhp7q1J3v2FfcitUMpZ4bKvgNoIPysDBUDiPcm2Z1PyqhkYMhtmbg1HzaM423+k6/5pWJ1+lXKK9cfNqrVO3OqIwq3ahAizt7UlTm5QxQgNlZIcHNT8IcP8EWlzifpNLyy7tcWsuAhxTbZEC77B1hXWxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HgIilpwh0NPoUukx7aXOtbw2eQAua+7a40XiQDnwJY=;
 b=TC8XCN3NGY3ufqH1HMmW/M8aQn82WD5m8gyMj+ws+XfTHAQ0uzYnE24+2mjnaIy2rJD+CfNDETG4DL90ud5fSahhOawrZPlXQlyD1hELi0dhsxrRPetvacF9cSjhMFz5nz27B4ueuxnFsKbac3BhS6/n9yUa1s8/zBYsNw2xbGb7UhZFXUWkrJhmGxUmimtwLfqKmwfCYcbtUYKUZeH135WlKx5U0OZBCA37gbbGhwYfx6me7O2QDgx+BAGEIVTG0aw8L95cV1x+iAmQnLM5TI4Zlcm/5bFHo0/Qj7t/bnJwvGPC/EEQNhJNlYxPJjttJinW8QUj0wYLIGnlh4CVdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HgIilpwh0NPoUukx7aXOtbw2eQAua+7a40XiQDnwJY=;
 b=fjsYFvNehXVg7S3QhHwAgvqlHujSSgeAXrx1WDux5maVJyoIDcD2a7AiHSdpZvj3ISXju1X1bki2yELrE7gpawbLHBoRSPWE/x1FhYQArmH7ISUAvuODDSOvSRsHQGpU/aiWrmfI5odUXeiwqX1Yp7Jxbv59vp3ZFiiLSfB+Sns=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by CY8PR10MB7241.namprd10.prod.outlook.com (2603:10b6:930:72::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.15; Mon, 6 Feb
 2023 05:08:47 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::cd0e:bbf4:4b15:308b]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::cd0e:bbf4:4b15:308b%6]) with mapi id 15.20.6086.009; Mon, 6 Feb 2023
 05:08:46 +0000
Message-ID: <78695d89-287b-aac8-9c6c-b4ef31759a27@oracle.com>
Date: Sun, 5 Feb 2023 21:08:43 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC v2 12/13] vdpa: preemptive kick at enable
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Zhu, Lingshan" <lingshan.zhu@intel.com>, qemu-devel@nongnu.org,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-13-eperezma@redhat.com>
 <CACGkMEt8cMM1UxVzxb0eHeaWSpR0ApvGzaF901vrM4m-uGMiPA@mail.gmail.com>
 <7438853f-8d5e-33fb-1e53-b4a0036f0b7d@intel.com>
 <CACGkMEtwcjExouCbnMrQ3TcAkXJH4mv63ud-ROEUu6mH+53C6Q@mail.gmail.com>
 <CAJaqyWfijv2doQ8OAiiWdYvrWtmLPwJcnFtO+aUuoTa0jSL73A@mail.gmail.com>
 <a7367dec-2f96-c748-8f62-7bd03c3de263@oracle.com>
 <CAJaqyWe3d0i85DS2+yS9nZ6dZkcXyOEmYng-vKVk=6G3Ty-mfg@mail.gmail.com>
 <fbb445f5-05c5-dea4-b694-9b001e342091@oracle.com>
 <20230205045833-mutt-send-email-mst@kernel.org>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20230205045833-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::8) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|CY8PR10MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: 23dcc533-2cbe-46bc-215b-08db08003996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ns8gnz7ETy1fVBJFHMqiF3j6LEslDvpgHb62vWo5qHsaX66QlUDrF4vDeb8QhUko6HIvgPSsQyivc6++RPMqzCTShMjDNv823JnJsgzxkkQF5LL3HSh0XqbdMiAiF/KOIC70vjyzZ3fA25I+AjT3gtPV9gyddYkyfGX8HMQmgL0JWxTVicgJnMSLNRQnNjqdLaCzMuOUahJKPOMqY0YqZYwSPhztmpGluzVcga2p/XKPg9grFDIYCVqCaAPvEO5q/n4uHYmdZsO8C7fqi+xEH5QniNDLbtS0Q0GWuD8iGwSMGwTrHj0KkkCBvMrVYuHjB2FSKMOhugP32mabet+LterVt/DOFyAign5NTwe4PkwwPSTBZ87GM3XZkOvlrSA+rc/augBp63Zxl25ak++j+YgxIzotDZiXWtNIC9KkYQ8yqyATEvQzlSNyAedOTm7/WV2ThAoXrYHVmGIyZIoHy7gznZAPgY7KQqx3x1TPxDMMPrAw9FTMKfkBT6YYV8jGmh8tOmhnG+LdooEi9I5ATYl07oLai/mdcw+LHCOSzlrk4WZ/1vwuJ63oAsnM5nmtU7AJV5vtHsPg7gRlMHsEwY4HMgBNffp67oZMf9at0GV7qUjRoQarmZh096cYn4EnCgKRaRycUtNsjTxsNqsLalheqJ8BL+VMsbgFrr3QAgiiRk42C60vFsPVPjnJxqzFSjdnlMEf3xkdGE3LII81eve9dc/TXTkBrWB2Ux5rketh1YSS8amKHTgoYPa3xVpd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199018)(31686004)(316002)(54906003)(4326008)(66946007)(66556008)(66476007)(8676002)(6916009)(41300700001)(8936002)(38100700002)(31696002)(86362001)(36756003)(6666004)(53546011)(6512007)(966005)(186003)(26005)(6506007)(2906002)(7416002)(5660300002)(6486002)(36916002)(83380400001)(478600001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVNoSTM5UThmUitqdDEzUC90anhXN1hEbjRTbVVJYUhFWktHZUVBYjdkNlJQ?=
 =?utf-8?B?YWx5alJLM0pqQkN2Y2R1UmV4M1Rjb2V2NGhJOXlrVkppZGRYYjhNZnhlU1hn?=
 =?utf-8?B?ZllKUXR2M0NqRUhLSTNkZnQvU2NNLy9adktEd2NwaVgxZExqUm9EZlRTWWFr?=
 =?utf-8?B?VGpvVVRjKzR4UWxRTnc5S3kvMUlkSjhST00vcDVLaWFCZ1BvU3J1bnBpMkY2?=
 =?utf-8?B?bkZ6bjExMU03UGV2akhMbnlnd2JlbkVReFRrQTI2eFdobWpuUmNHM29uSnhy?=
 =?utf-8?B?aVZMdDBZTmxuRnJkZ2xzTFZ1ck5kZVNlVE1ZVFh3WE5FNmdiY2crVkRTUlZ2?=
 =?utf-8?B?cmRWbFdrT0lEcDdtakNIWmVWTXFQTW1neVJib3k4eklNOGUzM0N6OFZTaG0y?=
 =?utf-8?B?M0J1Q2VCT1AwNVVuZFJjUnpDaDc2MGs3Z29GbDNtaDFuUWtiNzF2QUZ2NDlh?=
 =?utf-8?B?QmNRTmcycW9SMlN0RUM4Q1YrQkRDTVI0eHg2R1lMV05qZXQxM2NCYS9Ja3JH?=
 =?utf-8?B?VTNzcHJiRkltejh4S3N5QTZHek1XMzlLRHNJN245SXFUdVVDTGxWSHhtcnlK?=
 =?utf-8?B?enkrcmVtWlRQbHVJNlhxQ0dTa2NIZFVpSThBWmUzYVNlS3BHSGpDVEpjNGFw?=
 =?utf-8?B?aS9vZkxuWEY3R1AwR2tkVmltaFlsMkFKemdvUFlhT25ONWtkZ1Ztc0hoVlVL?=
 =?utf-8?B?TkprVVdIVk11K2trNXZKeXBSem94dWt3S0N1NzltSCt1cm5lbVduNXFQK3dz?=
 =?utf-8?B?M3ppMW1NWmZxZDBHUXdkMDd2TlU1WWE1ZGxkNTJ2NU1JMmljbUk2V3FFMjhI?=
 =?utf-8?B?UWdXRk82MWRjRldOVm93NmJFdy92UWxDS3BLMEZhZU5ENks1TDRHd0l0YXgx?=
 =?utf-8?B?SW04Rmt6U1pMbEIzb0o2bExYb2NXakNWcWxSbGY4cEhBR29SZFVTaDNIOG1S?=
 =?utf-8?B?ZVZyWjdGT2JqYzcxQm1BZW10WnpPL1hZOTMvODJVSW83S3p2SDRrNG1WVnNM?=
 =?utf-8?B?aGpTZVNUWndBdmw3L2VJQllSWjBWL1lJNWVldDhOa3NMWWlFRkNxamxNakl6?=
 =?utf-8?B?K0NyNWg5R1BPNVJRZEFQeFZsSHQwYU16b0FWakFDUzArakZLR0tLY0RYRVhw?=
 =?utf-8?B?Q3l4anorYVN4cFhwNS9SZU1XOS9oRXo1STkrZW5raGZhamVpaVNGb1JmV3RI?=
 =?utf-8?B?S01HVThmNjhqZC9RaE9ySFlBNmVIckJOYThtcWlBVEMrbE5MMS9LaS9xcnZw?=
 =?utf-8?B?a3NWd1IvbEE4cWVreGE4bS92UnpSY2UvSG5reFhIVjQyZ0Y5WE1hQ0NMQjZp?=
 =?utf-8?B?bTMrSmFsWVlycnNNR0o3R00xSzdGM3JIT04vcG5hcGRDY3Iyc2Z4YVJVUnY2?=
 =?utf-8?B?a2JWMDVzbXFub2ROQnJTMnBNcEl3SW9rNXJOTG1ub29KWFU3elNVNDhuVitp?=
 =?utf-8?B?ZDh2UlFFc1RsanRBUStsMnJGZFNsV2Z2MUhyaVBISGlLMFRZMjY0WXp6UzFR?=
 =?utf-8?B?clh5K1lSd2FMNVRVa3pKVEplcUxpc0hURjFaUHBsdzl4M1d2dGQ0U0o0ZXFX?=
 =?utf-8?B?TVlkaUo5eXdZL3lNY1RpeVVOaFBtVG5EMkQ2MHdZS3lWNnJlVUltUGxjZXg5?=
 =?utf-8?B?TGlyalVjQ2JqMWpQN29QTUMxbllaMlBTNDRIT1h0T1h2REtzVk1ZNDI3QVkv?=
 =?utf-8?B?dHR1MXd5KzM0V0VnQldFVXdIN0QrcUYxY0dXdW9IaFFJWkk2ckFiUUpwTnJ3?=
 =?utf-8?B?TGJ4TloweHBsb2ZUSStNK0g4OE0xd3ZjL1M1ZmJkdmVqOTJ5cHVnUTFtYTBY?=
 =?utf-8?B?d0RCTFVmdnVMSzg3QmxaR1NwMFltVXRqTForSnorQVB1YVk1RmhoM1pBeG1j?=
 =?utf-8?B?N0V4NjVaWVBLY0tyV0ZWYXRIN3NXbk9OOWJnZnFIU2FHSzJtREFuV3lnSTFH?=
 =?utf-8?B?QTdCeHVzY0JGRnlrUm9KYjQ0TXhlRmU1d0FJUm5UYm51SXRsekc4MUVLcWlx?=
 =?utf-8?B?RzRWSjBrdlN4NW1XOGxmZlg1QTNaVXUvNmxwcDk3Y2l5M2lFSGx2WktaaFhG?=
 =?utf-8?B?enFMR0Q0bnhOWnYvZ2s3bmNMYloyc3gwNFdzeEtUZTBXc0tQNjdaNE0rWW05?=
 =?utf-8?Q?0GymQp5gpRHs/iu+n/b2gJZ46?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?ZURWZkJXMlc3RXFMdG5rNnVWbEc3L0RxYzBTNlkzMW1OZHJSUUYzNFFWMkNE?=
 =?utf-8?B?anhYWmtoMlg2Slg2WDZFQ1hDVUpOMkNha0JNTU1yWGk5UTRtTTVZTWp4S2FK?=
 =?utf-8?B?MElrNzNHRE0zQ1kxV0xZWndBbkdLeTEwT25CUFd4QWU4U3ozbU9hUzR6bkdQ?=
 =?utf-8?B?VW4vRldRdkVZVURsNUViaXlKRVVYc2NVemQ3VE9pWExnVXI4NW04L3JyR0c0?=
 =?utf-8?B?RFlxZGZ3MGhOcVlzUENqYWg0dEFLellzY1dmMm1mSktCbk8xYlJEVElDR1Qx?=
 =?utf-8?B?c2tSR1FXWE8yUGtYVk1lTyt2VVZjMkRlL1psTUI1M3ljeWxqT3h4MVZVdFli?=
 =?utf-8?B?UlpsWmF4cHU5aFlXK3dlYmYwTWFCSmpFMlVXWXF3RmUzdDBXQTU0ZlFRbG5h?=
 =?utf-8?B?SnY4bEJORUhlVlZEQXViUEVMMTM0NitiZUVWZE1TcnZEaWxQclRmMGVqVm14?=
 =?utf-8?B?eUZUVnhnR0lmNVhpMHY0NTdCNDl3MXRJRjlhWkdXSzdXREpUU3p1SHMvSGg4?=
 =?utf-8?B?VHpSYlJUZFBsb05pQmFDbDFTS0J4eXRPUEozNEkvZXk4WC9qS0s3Q3R5TEpl?=
 =?utf-8?B?NS9qbURsNitNY0orRWdFQ3hiVFRDWXl1ZC9tNjN5cUZLQUVXQ1NoTXVUM3d1?=
 =?utf-8?B?cnhsM1JaS08rbjFUdGQrWHFYTkVOV0grbG96RzJwM0lSVldRRUxUOWhIUHAw?=
 =?utf-8?B?UEJHL1lIbFdFSTArL1lsYzRkY1hmUzZabVVmcnBTeG1FQW90eEZGYzFlV2Vr?=
 =?utf-8?B?SmUwalovM2VKQjdIQ2hSazI0UkJCTG9SUGZ2UEMrdndPRHEwSEhzUEdqVjla?=
 =?utf-8?B?eGFXZkl1V3Y5Q1ZhZEdWaXdKcVJMdkl4a0dzZjhxV0dOczJic0twMnlralNj?=
 =?utf-8?B?V2JYNHM1a1JWcVdRNlkzUEZwdVh0cDUwaHRObVAva2VTYTRJRWpVdTE5VGFm?=
 =?utf-8?B?SHJCdEtMbVpHSTdXcnhpeVc4Vk8vdTgrNktmY1Q0Z05NTStMTE1TTFVWOVlj?=
 =?utf-8?B?SEhYQjNyS2NaQW1teVEySDNYWXJoOUZ5TWFTMnhqVkM0RUhiZlRoSVpVbHJs?=
 =?utf-8?B?aWNSTlY4YjBKdTYvaUZMZXNVSGg1Q0RneDBjNzdrMFFLVWxhUXhKQVkvTnZv?=
 =?utf-8?B?dDR0QjNicm5ZaUtVeU5WVER2ZXpXYXIrOERqaEF1MkdDbEVPNE9oVmN3Z0NG?=
 =?utf-8?B?bjBtRTBkeVZ3RDErREYvTnJWM0pPR3kwUHdmV2dTV1E1dmMvWGZGTHM4WGkx?=
 =?utf-8?B?TjFQVGdVOFBPdnVnZnNPbVZpRkR0eTA1anFORnR3WXI5dUxIQT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23dcc533-2cbe-46bc-215b-08db08003996
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 05:08:46.3470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: we70r72nvh4AHwPHUja0bqfKCkuwE5/qzhdonrkpqfocT9SJV2wHwQDyJv2f+pC9Rqd86hV0LWEp0XM0YXdDCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7241
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_02,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 adultscore=0
 malwarescore=0 mlxscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302060045
X-Proofpoint-GUID: RWcSAZEd973esSFtybXIh8yoCGO5JtJD
X-Proofpoint-ORIG-GUID: RWcSAZEd973esSFtybXIh8yoCGO5JtJD
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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



On 2/5/2023 2:00 AM, Michael S. Tsirkin wrote:
> On Sat, Feb 04, 2023 at 03:04:02AM -0800, Si-Wei Liu wrote:
>> For network hardware device, I thought suspend
>> just needs to wait until the completion of ongoing Tx/Rx DMA transaction
>> already in the flight, rather than to drain all the upcoming packets until
>> avail_idx.
> It depends I guess but if device expects to recover all state from just
> ring state in memory then at least it has to drain until some index
> value.
Yes, that's the general requirement for other devices than networking 
device. For e.g., if a storage device had posted request before 
suspending and there's no way to replay those requests from destination, 
it needs to drain until all posted requests are completed. For network 
device, this requirement can be lifted up somehow, as network (Ethernet) 
usually is tolerant to packet drops. Jason and I once had a long 
discussion about the expectation for {get,set}_vq_state() driver API and 
we came to conclusion that this is something networking device can stand 
up to:

https://lore.kernel.org/lkml/b2d18964-8cd6-6bb1-1995-5b966207046d@redhat.com/

-Siwei

