Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2834C4D92
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 19:23:00 +0100 (CET)
Received: from localhost ([::1]:46600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNfF4-0001UD-0p
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 13:22:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNeaO-0005FN-J8
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:40:57 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:40140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNeaB-0001oV-MI
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:40:48 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21PH6L4o008217; 
 Fri, 25 Feb 2022 17:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=e2wsVnYFL0GNS5haR6U2WizfXceeZcQ8dktpjZC+xQc=;
 b=gxDBoQsCRt19rRMSrFXUED6BfG9mQiQ6A2RJoS8ydzMrmuCES3PhBy1P61RQUSMqCdas
 s8xZf2A5epUwfVXmWhx3CK6JOxklPSc5P9LHVPK9Ay0HbQTThUnceiczX+WV5aoTkN4P
 lwsbnHLuP7HSWtNaY4qcnWejsvLTmUBLuIcdqj2RQdHvzuUmxJnKvOWm9F+zxmamWRWo
 1GgDvoUw6tIjqJ3xQH9PLljl1I6YcwB4wYbxi3ax3bTNl9VDBLyr084KgabpEGwkYjqA
 jeSO7Y64iNtPiQ+i4pt0suIXt/k/qBts01nKmwQhK5Wjj4JgN/6hXwsroy1+ZEx2YY+D AQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ef09pruej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 17:40:39 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21PHeaja040134;
 Fri, 25 Feb 2022 17:40:38 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by aserp3020.oracle.com with ESMTP id 3eb48527g4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 17:40:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFUBX6fWq5L9jolWaW5ZvX5bB9nv9b4hPcgEIpEyRfMeiSeHKpDorkXEoap0THD24w0fIkgHwST3lVArNEu7vnYLDHe0kQQlOCrfdbKKFolbf/oGYbn4rhIqwLdZEiv4/U20g/o+jp7bkbCTLZ2N+2IQ9srKoKp+czAxDt0jPbkSUgGaAxUtW6pSwVqOf38M97I60b4ndxvM7HU5/XmcVsASBmi21cfx1Haz5oYgnOGXjNONG0mO6SzmndkD2mUK8kwrcxjV/YpEpIBeHHOLSGVDAiq2j7dkEleGwY9OvJkMNrsfLAWIE3dlOqNRrkKghAOOKs8QRxPpsq42C/g8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2wsVnYFL0GNS5haR6U2WizfXceeZcQ8dktpjZC+xQc=;
 b=Fr0VbcfFhWyJba+cyyGZ67XzLscBJzKsjqezhlA20WhuzK0nYlEfeJGP2vuD0Pv69w4+N4wsETPacxdjfbmEz8PiKIAICvVPh00u0jeZN1Snd3TQ14ZmrTORNvmZepvKPwjAw3gwQ5YbKyYsrJpdhKQ5wWjprWgJTVHy9iSY7bzFOyGYIFo+VgvU38o04yN6A+IiPLxc7Ai8k3dkmitLs3ZWSfft1J/SXbp46JQeWowTQmdvmD0TOZwTcdgp4oXaTBYaXdQKkWw1eZck1rNjxKJ8XQivLDyJkcOJcy8jQIA8V/qgxyibcWg3DXouEgxBGFLBqq6khPltiq9aYeIAeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2wsVnYFL0GNS5haR6U2WizfXceeZcQ8dktpjZC+xQc=;
 b=RCYVfeVDfFcaiD+0ogv5LDpSBqS47TtkWGYl3VIGTzbW+AbUJNOFhEdA14MHYJYfmKh/js6JGMBS3bHqwLEymWOHoeavEMX/eRtb1QyQDpmMpbHLlrk7RrSA31u8s8w4/yUxDephlQx+/yuk1Hy3uoPD4DNNz2dd5KVYEyYGPnc=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN7PR10MB2706.namprd10.prod.outlook.com (2603:10b6:406:c5::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Fri, 25 Feb
 2022 17:40:35 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.026; Fri, 25 Feb 2022
 17:40:35 +0000
Message-ID: <c66b38cf-f803-a2ca-e64e-46600dfa2846@oracle.com>
Date: Fri, 25 Feb 2022 17:40:26 +0000
Subject: Re: [PATCH v3 4/6] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220224122146-mutt-send-email-mst@kernel.org>
 <7afb8caf-5c98-d6db-d3e5-6e08b2832d57@oracle.com>
 <20220224131607-mutt-send-email-mst@kernel.org>
 <f19dd8be-f923-fd7d-c54d-a54fd775dcc5@oracle.com>
 <20220224144800-mutt-send-email-mst@kernel.org>
 <37df5f3a-283a-a016-311f-8281bbacda19@oracle.com>
 <20220224150626-mutt-send-email-mst@kernel.org>
 <5cae0afc-df3e-5dc6-d11b-2f7d931ba5e6@oracle.com>
 <20220224144053.3fbe234d.alex.williamson@redhat.com>
 <eb699dff-09d3-e9ba-2c35-3c91966efa13@oracle.com>
 <20220225074024-mutt-send-email-mst@kernel.org>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220225074024-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0080.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::13) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af5787f9-0056-4772-df1b-08d9f885edba
X-MS-TrafficTypeDiagnostic: BN7PR10MB2706:EE_
X-Microsoft-Antispam-PRVS: <BN7PR10MB270617C2FDE0BA1729D4F7CCBB3E9@BN7PR10MB2706.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0YIqby1w8hitqWBm9qbo7Bahj2H/QBNVhAt3cKVtey0Lv5IHMbtl1nowNWLVxvG9AwRbxFSMdSI8yjPgN+k14MG+YV3P6OWQtk4LsUCjGbI2qnkUWp0ciwYRx4aLCLi2RS0MppTYCS62Qc9yJ1pF4WS1XFzjkG1y69RdZLTKNk2B8TWA6cy7vDbt3ZJnhR5Y4RoHUjuWIJ3sgzgHfSLDD6L4ZfAuL2o/4YyaEPJjW14SjnvKxvnfblppKENNVsDV/joykbX3n2Xh8IuNJE/+5ZIGW1t2ifN5GsQJvpoIwfBmiQ9rf2vuh1aRVMFWG6VKMApXQj9ZYbhV5dSb8NkEduuit3oTWZCUyIcBM39zRxvlv7q2s+85GeZcqnQ3IEih7ZElQw2/g/EG/Yu/P9JXEKf+IwIkUBIKC0RR0ye/mUozDb2GkbycsEC7dZSPyQyPMXbPtMXEMLBQ08pq684Q7+C3g+dmSh6gOVIKZbRsgTlK+Ezf9mhDuIZ+lyQFf6m33WwwjRXKurmH6xz/BcJeE0pjKZ2uAeDeSB/zwBZrwG5sVHiBfdIPq8AwfWkQhhQDt75hZ10GjgvecTcfrSagrzkcG9qAjYm+VuOJsKANb6lW2WTF8EhE+zcLk3LmjTjgccS1qORFSuCJYbmKdb413wHrtmohPJcIeEvkCOGVlGypO/PBvR0751BR9yQyFSNO4JS7AlnavMMpOWnAX+h8Dg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(8936002)(53546011)(2616005)(6486002)(6512007)(7416002)(66556008)(8676002)(4326008)(66946007)(6506007)(2906002)(66476007)(54906003)(186003)(6916009)(5660300002)(26005)(86362001)(31696002)(36756003)(38100700002)(508600001)(83380400001)(316002)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3dUSlpnQm80Mmw0SVRpT284cXdHTFlvY2hnZnE3NlBvQTJQUG4vQURaNGhz?=
 =?utf-8?B?Q09hMlR3bkZ4UGttbDRTZjFuYmM4Y0FOWlUzOVVVYUg4Z3UxWmNsQ3FNVk94?=
 =?utf-8?B?RGJqSGFsWFZCUnRqTkNWV29kOS9SOFRFcTJXaVEvRm1DR1RjN1NhYUhCZ2dX?=
 =?utf-8?B?SEZ2MWV6MU1vcFptQmY3UnlSYnhZQ1dRczh5ZVJxU0ZjR0JGL0NQYVFnUmN0?=
 =?utf-8?B?czAyQnVxR3Z6Yi9WQll4azZXNW5XRkQzT0NIK1VJSGF3dG9nNWpzdzllUlph?=
 =?utf-8?B?eXF0Qm9FK1B3R1BSN1dPREllZGU3YTh3QU0xTENIQU56ZFUwYVlFMVVvZUJy?=
 =?utf-8?B?TWx6L0pOamdIMUlVbHR4WFl2c25xUXdrc1VZeVIwMnhBMUFDazVrZUlZUnBK?=
 =?utf-8?B?YkNtN2xUdEZJUWFKbE44ZURqZ1pJWmdNQ0RmaEhrZXZkNFltVXNONEJkbndr?=
 =?utf-8?B?SVRvNTF5aGRCa3lEZzFiVkRkQVYxYUVuWlJrbjVoVDZCWkFCT2EybmdMVGln?=
 =?utf-8?B?WE5jdHZ2cDhUNEV4VDF6MFo1ZVJyY28yNDVVQ1BpNFhjYzd6UHNoekl2YkVC?=
 =?utf-8?B?WnBDTEtvK2U4WXZBcUxweklLeTBnWmU3VHdvRFVkVHltQ2NhWnlKYWhEaFVN?=
 =?utf-8?B?VlFaOWJDYmRMY0dPQVYxdDFiWHdRcDRjZ3QxUENSTzBwTmhJU29CK2ZQeldr?=
 =?utf-8?B?blE1Z0c2a2lMUndzd2YzZHYyRkh1Y1oxK21manBZSzJGcjBnS1ZmVEFta0FJ?=
 =?utf-8?B?bFQ2SXA2Y01iQVNWRzgyRUcvaDM1ZzlOWmVCbWQxME04UzZwM080c09ndmRs?=
 =?utf-8?B?UDg1d3cxUS8yb3ZCWHQ3OFBwb0V1LzExbVZsRjZSZks5bzVMcDFMMkEyVUw0?=
 =?utf-8?B?c1dzczZvSGtKVlFFcElDV3UzS2l1NTZtVW9SVWU1V3JvN1RLL1hmcDV5dk4z?=
 =?utf-8?B?Y2R0Yk9uQTZvaEtydEpWcUpMajNYRmlrT0V1R09Fd1ltK1Y4MG1WSWpLTGta?=
 =?utf-8?B?V0ZlNFF5Vy9jTzgzMWFFeC9lWHo5aTA5REh6UlI2S3pqeFRMdVhLTFd4Wktq?=
 =?utf-8?B?ZGZsREZqWTE0WWhBWWMyOWJxK0JrSHJsYUY3Mk53cVdPbzBCTXBKMTJFTDF3?=
 =?utf-8?B?ZzZSZnZXbzRpNG9KSm55QytVU091K01TSXZjdmFPb2ZZQnVMOUY1c3FUMkZx?=
 =?utf-8?B?VC9hVVJTU3p0b3NUc0xQbTk5aHM1WkV3bVJDcHEyYnpjZDIrUzNXdGNTQmxJ?=
 =?utf-8?B?UWptcmkvbXRiNGgwWW5XWjViSUowYU1ySVpMbS9XcVV3TEdtTml5QnF3M2Nu?=
 =?utf-8?B?WDRmbyt1T2VwdncyVlVHZmVxTUpZeUVPQmFrRWxVS2s5SUdmL1ZJNEttdEZo?=
 =?utf-8?B?VlZ5M05xUDRqR1pzVzJPdzZUMzkzUVZrdTZseTM3MS96ZFhUSlNoclFEVkR4?=
 =?utf-8?B?T3d3OTY3RWc3OWxuL0UyRTVpOUNIUTZYeGhaWHl6eThWOVNxNVRQeklVdWtD?=
 =?utf-8?B?aDVSOGhWS0c4THFaY2pFQWdIT1pCV3UzSEZWNTRlY0pFeDZBTk9jMVYybnRY?=
 =?utf-8?B?L1MwTjgyS0lreTdFbmp0Zm9icm43ZnFKekxHVlk0Z1lWbmdLb0tsbVFXYWU4?=
 =?utf-8?B?c3pvU295Y3ZzVjJlbkorK09INS9ueDdzTms1VlRYdkVzbGZCcjJ2S3FpZWl4?=
 =?utf-8?B?eEdWSWsyZDNMNDhSY0QzMWZqWmlldU5pYWd1dkZpU1E4S25PQUR0NlVWbnVN?=
 =?utf-8?B?TXUrc3hCQUlTczErZE9Xc1V1bElLYjhCa0FNdVRkazRIOVlIWGt6c2JkRzJU?=
 =?utf-8?B?YVR5a1RHbHhHZGpzRVdWbk0zSHlsbGZ3SzQ5K1JzWUZ3ajlla3J0aHVFQVpV?=
 =?utf-8?B?cFlSNnVDNGsrMVFIenhxMCt4SGRqNXlmOHc4clJXTEZ4WjhIREMzOG1KdHBQ?=
 =?utf-8?B?dnExZUpmd1UrYWhOcGgyRGV6UVJPMitReEpOVDhKQ25iZDlMaCtyRmloVitB?=
 =?utf-8?B?ZElPL1c1TUhaQXQ4TFFEcE9HanIvc0x5V3pmeDd0R1BFUDdpd2RNMjZvd3pW?=
 =?utf-8?B?ekx6dXNjczRlSDJMV3VJOXN0bVRPMUtnZW9wWkRpcmtyZlROajVGYTk2bHFT?=
 =?utf-8?B?Q3NWVTJSZUVIMHFPemFIaU9TOVRZSmhSb1BSREtJbEViUnRjcHBYUHlGTmpz?=
 =?utf-8?B?TGh6ZU5jci9rMkxZWUlJUXBzQTFCSkFrYnEvWE8wZVNiY2tHdVA4NmY5Q0hB?=
 =?utf-8?B?RTh4bmNvUDZwRWo4MlNBQmRwMUNRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af5787f9-0056-4772-df1b-08d9f885edba
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 17:40:35.7889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlfHUCOGJI5fA6a+teXyoZQJMftcIVKsvEFqEAkOPZoGYXrY/AzxyGqsaCvAPtXJOdthD/Xj6qft9qRoxrL+nD2l+vbhK0yyGN44K79BNIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2706
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10268
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202250101
X-Proofpoint-ORIG-GUID: Y-QyLJ_ESUsQ7DYNFInbe7l6dyJNHzP_
X-Proofpoint-GUID: Y-QyLJ_ESUsQ7DYNFInbe7l6dyJNHzP_
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/22 12:49, Michael S. Tsirkin wrote:
> On Fri, Feb 25, 2022 at 12:36:24PM +0000, Joao Martins wrote:
>> I am trying to approach this iteratively and starting by fixing AMD 1T+ guests
>> with something that hopefully is less painful to bear and unbreaks users doing
>> multi-TB guests on kernels >= 5.4. While for < 5.4 it would not wrongly be
>> DMA mapping bad IOVAs that may lead guests own spurious failures.
>> For the longterm, qemu would need some sort of handling of configurable sparse
>> map of all guest RAM which currently does not exist (and it's stuffed inside on a
>> per-machine basis as you're aware). What I am unsure is the churn associated
>> with it (compat, migration, mem-hotplug, nvdimms, memory-backends) versus benefit
>> if it's "just" one class of x86 platforms (Intel not affected) -- which is what I find
>> attractive with the past 2 revisions via smaller change.
> 
> Right. I pondered this for a while and I wonder whether you considered
> making this depend on the guest cpu vendor and max phys bits. 

Hmmm, I am considering phys-bits already (or +host-phys-bits) but not
max_host_phys_bits. But I am not sure the latter is relevant for this case.
phys-bits is what we need to gate as that's what's ultimately exposed to
the guest based on the various -cpu options. I can bring back to like v2
and prior to consider relocating if phys-bits aren't enough and bail out.

> Things
> are easier to debug if the memory map is the same whatever the host. The
> guest vendor typically matches the host cpu vendor after all, and there
> just could be guests avoiding the reserved memory ranges on principle.
> 
Regarding guest cpu vendor, if we gate to guest CPU vendor alone this actually
increases the span of guests it might affect to, compared to just checking
host AMD IOMMU existence. The checking of AMD IOMMU would exclude no-host-IOMMU
1T AMD guests which do not need to consider this HT reserved range.

I can restrict this to guest CPU being AMD solely (assuming
-cpu host is covered too), if folks have mixed feelings towards checking
host amd IOMMU.

To be clear checking guest CPU vendor alone, would not capture the case of
using a -cpu {Skylake,...} on a AMD host, so the failure would occur just
the same. I assume you're OK with that.

> We'll need a bunch of code comments explaining all this hackery, as well
> as machine type compat things, but that is par for the course.
> 
> Additionally, we could have a host check and then fail to init vdpa and
> vfio devices if the memory map will make some memory inaccessible.
> 
> Does this sound reasonable to others? Alex? Joao?
> 
Sounds reasonable the earlier part.

Regarding device init failure logic I think the only one that might need checking
is vDPA as vfio already validates that sort of thing (on >= 5.4). Albeit given
how agnostic this is to the -devices this passes the memory map gets adjusted
to make it work for vfio/vdpa (should this be solely on guest AMD vendor or amd
host iommu existence) ... then I am not sure this is needed.

