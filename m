Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD6439E63D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 20:10:10 +0200 (CEST)
Received: from localhost ([::1]:58346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJhR-00036q-Nv
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 14:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lqJfx-0001L6-Vw
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 14:08:38 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:55486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lqJfv-0005v7-UA
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 14:08:37 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 157I2Y0U015041; Mon, 7 Jun 2021 18:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=hHTpPZUMLh++4iFsz/mQ9OobWCy0pl35Tyvu+Gfy6BI=;
 b=jBKMZzrKPuNundND8KPTDpy+5wlPuSLb3sgr5wAcrI/ZnO69+H9LDhUfiHYV9XZGtzV0
 XIIdkYFr6+FgTymvYv1lXu4qn5rcx4ODz3SgVYH3u8xQRTRvvpcASi93rkQELqfMBYJE
 zctW/oqSU3pPDF4etItLIIkb94je3WnIOVwOVdpg6r7zg26exgm7fKeYE+tCQdlhy4JP
 gmVLn8vVN1da+sPwYvwosfYxQCyZtg/aaMDnq4uwkXtC1690NLyaI8Qx2Bimbvw/bvRk
 uiuJlP/JG0lNYfSA4f67Tk55KGbcD4nvzpR0S+vKa1I4tblpmSiuW8uwBMUpbRBq8++4 yQ== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3917d4gb30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Jun 2021 18:08:32 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 157I5wv6056235;
 Mon, 7 Jun 2021 18:08:31 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by userp3030.oracle.com with ESMTP id 38yxcu2pa4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Jun 2021 18:08:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTH2/uAm0VuPesWC9jQpz+bSemgeBcJiwwsqWQlWku7zNYiqHRQeR+qUzBP7tX6W1RvspomNI6BbuUUWfYkPkAv43Z/F5ZUB2ASbx++z+xqgiLa1JmPrJSWH5xZaoRn7kkTBQqlBj0bUIdg9Jslwzrh4bBgFT3tu9032kAilfWtLlkTvi0oQhGxJgD2Ywf9XFSJ7BuI1faO+j9vXjzw3PCfUpCGIT/MgjQwwAOaux+Y/Jw19FbRkEDIcC1jUaGho5PNvXvCve7fRDTpf+xLKvY2QG3u8m0Wd/OC8FCmFwxNjj74wnTmZ8lTlz2mSNPN5rqz4nxBT5T1jURrK2uMD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHTpPZUMLh++4iFsz/mQ9OobWCy0pl35Tyvu+Gfy6BI=;
 b=i7kbZRnHxkgVmvrVx5lKS68e/DFirnWODKYsdjvJXmR3YEaYBqZsBw1zb5bD/MhRMwZkdIekqFg2zo/ID62XKu9zxOiu747h5RsFUGETLg04p35Gxxxo57FlcqyYZu24CNbyADe1T5oJOjn7Hboapay5qpRmfY1BbCjVGl+yLL0Orwk1mnusI+CdHVT5ROQeWj/WeIJMHlciRlN/7nvEg2g6li/u5oZHqCLiR+GjLQ8lffzDsygvTVq9T9Lgtqu4yNXtG1yVKYrAAE0kpWwSvaBFpfydhtCKS7gtSlBcWpvp19UTElyt1uP6jLnJJu4qaCpi+hdRBhJ/L0W0JOpzjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHTpPZUMLh++4iFsz/mQ9OobWCy0pl35Tyvu+Gfy6BI=;
 b=uBxnpqhlG2nDZf2tl/h3DTcoTGmFH8LGpI1v3o7MHV3TIarN+tvMeXB8yk+EkBHTj+iAIWwXxfnEpiZz5+417fuljR6mQpmLaNgeIFEInvtqwnuMNGSKtPtqW6QivSN5FNjkRsDM7q30t5YpgR8izIgsiMX28mQkXg4/+sHxnbo=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4638.namprd10.prod.outlook.com (2603:10b6:a03:2d8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 18:08:29 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 18:08:29 +0000
Subject: Re: [PATCH V3 00/22] Live Update [restart] : code replication
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
 <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com> <YKOPnkefxgRZ8PoQ@work-vm>
 <a1d3dfea-d15e-35a3-a216-3ce65600f2d6@oracle.com> <YKQULUn5F+x1wrYI@work-vm>
 <38dc91ab-b96b-1cc3-bf8b-84ff77b334fd@oracle.com> <YKZgZELudL9HobEe@work-vm>
 <37713c98-5f2a-6cff-d3c4-9e1c60cc4107@oracle.com> <YKuCbujlfOCEYUP3@work-vm>
 <9a1564dd-bed9-8518-8d5b-3ca9f0243643@oracle.com> <YLkvShM1MMLh6NpG@work-vm>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <be32e595-914c-214c-8c59-f0a9dbea4e07@oracle.com>
Date: Mon, 7 Jun 2021 14:08:25 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <YLkvShM1MMLh6NpG@work-vm>
Content-Type: multipart/mixed; boundary="------------C7C6E4DC62B79E21EAA76730"
Content-Language: en-US
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SA9PR11CA0003.namprd11.prod.outlook.com
 (2603:10b6:806:6e::8) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SA9PR11CA0003.namprd11.prod.outlook.com (2603:10b6:806:6e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.24 via Frontend Transport; Mon, 7 Jun 2021 18:08:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd65ae5d-edc7-481a-324c-08d929df40c0
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4638:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB463840FB614ABA4E7F51A357F9389@SJ0PR10MB4638.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hEEyTR7w11Qic6fh+hEH0ZGVVA4EeV0g2aMBIEOBfGjr18kmG0oLYyCSuOEG1GqNjUM8d0TPF5hg1N3OCyU5u6ChNq2dbQiit09Wn9KfTQBi1jWay/p8CDL2ioExCRBFhnVzMP6sXUPNUcUUL+IC1Vz3dRi9PH2xxOydjzKQsK4shfHk9nfp+kAV79dQlC7R3+JAzZDJFsQppWUGCYkJQQiswrWhXd+MvXongEPoz17TIjaGkVLT9DbYzMIWItPN8cKUJ0mnwS5YZUIjmTFCZvtEhVY3IWW+95A/XVZoT/13Syn5dSfnSlj4L/+6DR/0BQBdTxYaMX5Neep23qAmpWpmOmE8CRdqBZn6vWhcoLHpSP1DixsOrkXdfYlmXmW69w67gmCzbWJ1lczgeav14yiUjRbGci5ozIz9dqUuUmJm0PFtI7zF2oAF9NoDwN12I2i/JvHzCKZ8KCNfTsQRsJ/vCn9A9tD2/OKXua7vS+oWG7wG5Uf5IDFImZUrWGE3PqURNwp1fv5qkPIZ/orl3s3FqCOXx+XqNsm0kX7pCwgVpkn3tdDoYrIR54CUXpzMTfA45gxWNSixiYbOyWpaiRo2U9l+AsK4aZBXPMp5PFvZfBDiywW4uw0FT1ybZwu+Yj7dovD8m3XC8+xmm/Ap4sZcNmo/ITmtH54EcRDJfynrA6TbiW6mUi660fNO7Lif
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(376002)(396003)(366004)(136003)(33964004)(6916009)(4326008)(107886003)(83380400001)(66476007)(66616009)(36916002)(8676002)(16526019)(66556008)(31686004)(186003)(66946007)(478600001)(53546011)(31696002)(26005)(86362001)(54906003)(44832011)(8936002)(956004)(235185007)(316002)(2616005)(38100700002)(16576012)(2906002)(7416002)(21480400003)(5660300002)(6486002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c01zdUpUdXFaeDE1bEFubkdOVjZPRDY2M2Z2a3hHZjRxL3BaSzhQQUdLRFlw?=
 =?utf-8?B?V1FEY0dtNVdWZ2tHQXR4VC9YMTdVOW1ORW1xQXV0ckZMcktUZnNHK0pzZG1y?=
 =?utf-8?B?a3NwVTdDZU10U0lSR3hSci9vM2QwdTJ1QzJIVHIzWUYreWtYOFp4WC9Ba2xl?=
 =?utf-8?B?b2VJMTBnNlF3bm1wL3FXd0tUUmlLcWVOMjkyOFhLZjU0TVhqd0Nxcm9WZ2Rw?=
 =?utf-8?B?bVl5QlV2c0hTMXBHREZlZGc0TFhuRDY0dmVzVWxGVzJwSnpLVzFxdTd5YUZR?=
 =?utf-8?B?aUpqWFNxbE9LcUJUcDNpT1pyeHZrUHhWeWNlaFN4cEZvMCtNc3Q4azY5UDJY?=
 =?utf-8?B?dkRRUUt3bFN0bUJ4RTRaY0RXWmpaMFllNHpqL1BVN3ZvQXl5RG5CRXRZOXNj?=
 =?utf-8?B?TVNoaW9zanZqbXk5SjIzcEVLcUltcGxYS3ZNR01HV2xEMVFuOWswVWU5RzJ6?=
 =?utf-8?B?eHBUUUYzUkRJcUVIOS9zOXVVbVhTWW8wNjBZV2ZFVDRoN0p1M05NZnJoOU41?=
 =?utf-8?B?Wjh0THMya0YzM0FDVCtmQUE1WG5WT2NpN2JZMHZWZ0hUWFVJT2l1V0dFTndL?=
 =?utf-8?B?OCtRaEkxOE9tdjJQK1BCaUVDa0JmYXNIL2JpNE5WQmp1TzZIaGo5U3Y1aERH?=
 =?utf-8?B?aEtFV05sRmV3UDBTcWlML21IczFFTTY3c3pEckZRTnliMkRJQVRacm9VcGs0?=
 =?utf-8?B?ZW9yRHd0b2h0dTdQRm5nNEVnQk4vanpZcVRHd3R6UHhtbUh2RjNNREpiQkJl?=
 =?utf-8?B?WjNVS3ZKZVJRNTdUMFBpYjk2TDdzZFpua1ZOMno4SzRaSFdpRE5FaExvMU9p?=
 =?utf-8?B?Y1NXenRhaFlSSk9BRTRERW5HMWZTR0VEQW8zWU5ZUmtaUS94WmdtRDA3bzZB?=
 =?utf-8?B?WG13dW9md1BDWldyVDJ2YlZERkVGTEZoTG5oU3R3WlZwSGM4QmQ0UkJPTFZt?=
 =?utf-8?B?aG1RWlNTT0htV0VqaWRVaDd5VXVxSFM3dzM4bnVPYUYvdHlGQW04OHliY3Yr?=
 =?utf-8?B?RmtuVHZ1bXpQaklhTzRaZWpuVWVjSWFjeHJEdlp3TXpvblI0MldrcGtuMWYy?=
 =?utf-8?B?WnlDQm9lYjNtS1lZaVR5UDNLQW5CM29yMGltVVlqMzVXdk13OFNPSjUzalZW?=
 =?utf-8?B?aHpUZndhM2JqR1pTWFBURlVWYkd0TkJPZW5nSkptZ2VsWjA1S2RVd1diNDFp?=
 =?utf-8?B?RWNGQjNQdTlOcWF6bFdoTnJMakpRUTE1SzQvNlJPNjk0b1p5REZZa1J1OUoz?=
 =?utf-8?B?M2w3OW5OREhGdkR4WWdoU01HNStOYVNBaGxsNnpmK3R2akcxYXVKYzZNUVlu?=
 =?utf-8?B?WnlNSjJONWE3RHRpYnZiVTV1ODAwM0VpTlpQVm12UDIyTUN5MWJ5enNLSERK?=
 =?utf-8?B?VUVxeE1FbFpwcTBldlU3b1BEY0dLYTIvUHlSS2tacVBna2FGQ1FnRjgwMGxU?=
 =?utf-8?B?cVJMOFc5aHhXS1V3R0JuM3U1eUpyT0tkNlNzTFRScDZQc3pNZHR3UDhVaTlj?=
 =?utf-8?B?Ulh1VU9JUXlmbHUvSWxvUHdPaCtjQWVhYlh3YldkSk9PK3k1RXVnSHlSOVFa?=
 =?utf-8?B?ZnFhK1p1NzBsanpmOWk3alRiQ2JjVEF6alVlSXN5dVJleGVtOXVibFNOak5o?=
 =?utf-8?B?TlRyNnJhQVhrMzBFbEN1VVc0RnRNOU1SakdsRldSWkRXd09PWTBONG5NSUJU?=
 =?utf-8?B?dUxsWHdTNFR4UWFHWjdnRHdKK0M3Q3RmUVhjMlZQOHhFeUlUUE1jcllvTCt2?=
 =?utf-8?Q?/MTDpq1yLza6B4FL0/iU+AvFnXo/XACVfQ5NhdP?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd65ae5d-edc7-481a-324c-08d929df40c0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 18:08:29.1708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIvJCxwEdl6qXqHN8gU+NebRfaLpVzYlfaD6zHVxnkUgJx+KH9dJh5Zh/E+fbgFzciffO4lwjZuEoWHjEazaSfhD3842TeTonb2Ljw8chxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4638
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10008
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106070125
X-Proofpoint-ORIG-GUID: oZi35HypqLKUY1E6Xg2IteUtMjfWzCZE
X-Proofpoint-GUID: oZi35HypqLKUY1E6Xg2IteUtMjfWzCZE
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------C7C6E4DC62B79E21EAA76730
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 6/3/2021 3:36 PM, Dr. David Alan Gilbert wrote:
> * Steven Sistare (steven.sistare@oracle.com) wrote:
>> On 5/24/2021 6:39 AM, Dr. David Alan Gilbert wrote:
>>> * Steven Sistare (steven.sistare@oracle.com) wrote:
>>>> On 5/20/2021 9:13 AM, Dr. David Alan Gilbert wrote:
>>>>> On the 'restart' branch of questions; can you explain,
>>>>> other than the passing of the fd's, why the outgoing side of
>>>>> qemu's 'migrate exec:' doesn't work for you?
>>>>
>>>> I'm not sure what I should describe.  Can you be more specific?
>>>> Do you mean: can we add the cpr specific bits to the migrate exec code?
>>>
>>> Yes; if possible I'd prefer to just keep the one exec mechanism.
>>> It has an advantage of letting you specify the new command line; that
>>> avoids the problems I'd pointed out with needing to change the command
>>> line if a hotplug had happened.  It also means we only need one chunk of
>>> exec code.
>>
>> [...]
> 
> I'm not quite sure what I want in the incoming there, but that is
> already the source execing the destination qemu - although I think we'd
> probably need to check if that's actually via an intermediary.
> 
>> We could shoehorn cpr restart into the migrate exec path by defining a new migration 
>> capability that the client would set before issuing the migrate command.  However, the
>> implementation code would be sprinkled with conditionals to suppress migrate-only bits
>> and call cpr-only bits.  IMO that would be less maintainable than having a separate
>> cprsave function.  Currently cprsave does not duplicate any migration functionality.
>> cprsave calls qemu_save_device_state() which is used by xen.
> 
> To me it feels like cprsave in particular is replicating more code. 

In the attached file I annotated lines of code that have some overlap
with migration code actions.  They include vm control, global_state_store,
and vmstate save, and cover 18 lines of 78 total.  I did not include the
body of qf_file_open because it is also called by xen.

The migration code adds capabilities, parameters, state, status, info,
precopy, postcopy, dirty bitmap, events, notifiers, 6 channel types,
blockers, pause+resume, return path, request-reply commands, throttling, colo,
blocks, phases, iteration, and threading, implemented by 20000+ lines of code.
To me it seems wrong to throw cpr into that mix to avoid adding tens of lines 
of similar code.

- Steve

--------------C7C6E4DC62B79E21EAA76730
Content-Type: text/plain; charset=UTF-8;
 name="cprsave.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="cprsave.txt"

ICB2b2lkIGNwcnNhdmUoY29uc3QgY2hhciAqZmlsZSwgQ3ByTW9kZSBtb2RlLCBFcnJvciAqKmVy
cnApCiAgewogICAgICBpbnQgcmV0ID0gMDsKKiogICAgUUVNVUZpbGUgKmY7CioqICAgIGludCBz
YXZlZF92bV9ydW5uaW5nID0gcnVuc3RhdGVfaXNfcnVubmluZygpOwogICAgICBib29sIHJlc3Rh
cnQgPSAobW9kZSA9PSBDUFJfTU9ERV9SRVNUQVJUKTsKICAgICAgYm9vbCByZWJvb3QgPSAobW9k
ZSA9PSBDUFJfTU9ERV9SRUJPT1QpOwogIAogICAgICBpZiAocmVib290ICYmIHFlbXVfcmFtX3Zv
bGF0aWxlKGVycnApKSB7CiAgICAgICAgICByZXR1cm47CiAgICAgIH0KICAKICAgICAgaWYgKHJl
c3RhcnQgJiYgeGVuX2VuYWJsZWQoKSkgewogICAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAieGVu
IGRvZXMgbm90IHN1cHBvcnQgY3Byc2F2ZSByZXN0YXJ0Iik7CiAgICAgICAgICByZXR1cm47CiAg
ICAgIH0KICAKICAgICAgaWYgKG1pZ3JhdGVfY29sb19lbmFibGVkKCkpIHsKICAgICAgICAgIGVy
cm9yX3NldGcoZXJycCwgImVycm9yOiBjcHJzYXZlIGRvZXMgbm90IHN1cHBvcnQgeC1jb2xvIik7
CiAgICAgICAgICByZXR1cm47CiAgICAgIH0KICAKICAgICAgaWYgKHJlcGxheV9tb2RlICE9IFJF
UExBWV9NT0RFX05PTkUpIHsKICAgICAgICAgIGVycm9yX3NldGcoZXJycCwgImVycm9yOiBjcHJz
YXZlIGRvZXMgbm90IHN1cHBvcnQgcmVwbGF5Iik7CiAgICAgICAgICByZXR1cm47CiAgICAgIH0K
ICAKICAgICAgZiA9IHFmX2ZpbGVfb3BlbihmaWxlLCBPX0NSRUFUIHwgT19XUk9OTFkgfCBPX1RS
VU5DLCAwNjAwLCAiY3Byc2F2ZSIsIGVycnApOwogICAgICBpZiAoIWYpIHsKICAgICAgICAgIHJl
dHVybjsKICAgICAgfQogIAoqKiAgICByZXQgPSBnbG9iYWxfc3RhdGVfc3RvcmUoKTsKKiogICAg
aWYgKHJldCkgewoqKiAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAiRXJyb3Igc2F2aW5nIGdsb2Jh
bCBzdGF0ZSIpOwoqKiAgICAgICAgcWVtdV9mY2xvc2UoZik7CioqICAgICAgICByZXR1cm47Cioq
ICAgIH0KICAgICAgaWYgKHJ1bnN0YXRlX2NoZWNrKFJVTl9TVEFURV9TVVNQRU5ERUQpKSB7CiAg
ICAgICAgICAvKiBVcGRhdGUgdGltZXJzX3N0YXRlIGJlZm9yZSBzYXZpbmcuICBTdXNwZW5kIGRp
ZCBub3Qgc28gZG8uICovCiAgICAgICAgICBjcHVfZGlzYWJsZV90aWNrcygpOwogICAgICB9Cioq
ICAgIHZtX3N0b3AoUlVOX1NUQVRFX1NBVkVfVk0pOwogIAogICAgICBjcHJfaXNfYWN0aXZlID0g
dHJ1ZTsKKiogICAgcmV0ID0gcWVtdV9zYXZlX2RldmljZV9zdGF0ZShmKTsKKiogICAgcWVtdV9m
Y2xvc2UoZik7CioqICAgIGlmIChyZXQgPCAwKSB7CioqICAgICAgICBlcnJvcl9zZXRnKGVycnAs
ICJFcnJvciAlZCB3aGlsZSBzYXZpbmcgVk0gc3RhdGUiLCByZXQpOwoqKiAgICAgICAgZ290byBl
cnI7CioqICAgIH0KICAKICAgICAgaWYgKHJlYm9vdCkgewogICAgICAgICAgc2h1dGRvd25fYWN0
aW9uID0gU0hVVERPV05fQUNUSU9OX1BPV0VST0ZGOwogICAgICAgICAgcWVtdV9zeXN0ZW1fc2h1
dGRvd25fcmVxdWVzdChTSFVURE9XTl9DQVVTRV9HVUVTVF9TSFVURE9XTik7CiAgICAgIH0gZWxz
ZSBpZiAocmVzdGFydCkgewogICAgICAgICAgaWYgKCFxZW11X2Nocl9jcHJfY2FwYWJsZShlcnJw
KSkgewogICAgICAgICAgICAgIGdvdG8gZXJyOwogICAgICAgICAgfQogICAgICAgICAgaWYgKHZm
aW9fY3Byc2F2ZShlcnJwKSkgewogICAgICAgICAgICAgIGdvdG8gZXJyOwogICAgICAgICAgfQog
ICAgICAgICAgd2Fsa2VudihGRF9QUkVGSVgsIHByZXNlcnZlX2ZkLCAwKTsKICAgICAgICAgIHZo
b3N0X2Rldl9yZXNldF9hbGwoKTsKICAgICAgICAgIHFlbXVfdGVybV9leGl0KCk7CiAgICAgICAg
ICBzZXRlbnYoIlFFTVVfU1RBUlRfRlJFRVpFIiwgIiIsIDEpOwogICAgICAgICAgcWVtdV9zeXN0
ZW1fZXhlY19yZXF1ZXN0KCk7CiAgICAgIH0KICAgICAgZ290byBkb25lOwogIAogIGVycjoKKiog
ICAgaWYgKHNhdmVkX3ZtX3J1bm5pbmcpIHsKKiogICAgICAgIHZtX3N0YXJ0KCk7CioqICAgIH0K
ICBkb25lOgogICAgICBjcHJfaXNfYWN0aXZlID0gZmFsc2U7CiAgICAgIHJldHVybjsKICB9Cg==

--------------C7C6E4DC62B79E21EAA76730--

