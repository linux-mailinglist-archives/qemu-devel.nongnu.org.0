Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C055676C8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 20:47:21 +0200 (CEST)
Received: from localhost ([::1]:38904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8nZw-0005wU-3z
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 14:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nGg-00032R-Ie
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:27:26 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:3760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nGe-0002Ue-Pe
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:27:26 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265HEmLl000560;
 Tue, 5 Jul 2022 18:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=x1zycGyah+EV8SHa/Y82KkadHj93WUODX22UTuPTL+s=;
 b=GIO3kiQqBV3vFRW7O64H6IJjsFjFePoMZpAFOliplJu1PXyhngogdoqkxbdg0eLtSr1u
 4v8DQmc+Dfjxrkl7PhDZwdvN2P3zjpwhWjy3afMUYhRVkV5lI2scZpw37AkwDM4WAdNH
 bge4MQOf5TI/t/PEWs6LDTVHnAvv11uZWGJY5tI++YuGHvTGHVu50bXMijFsn0wuaKEc
 t932j2aRqBsjwSgco7h8N/rnhA99XSjl/WgQXOFiIwzoNflimyTVCfARARIn5UeG96zL
 tOgK2FSy9ryTM8xZMs/H68BEmy9MrKhx9c7S4B0+fHblNSoCy+krlM6xwED/B/5w0w/I CA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h2dwaptwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:27:13 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 265IPqJW014388; Tue, 5 Jul 2022 18:27:12 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h2cf2ke8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:27:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjPkLSgzE3aZxoD8EruRIG7bu/ieZhPekX81gjyE0W3cWYjiUTo8Mt2ud/Dmz1HZOmpfVLi6B1mt5xCz4u4nx1Ucn08I3D1/ClmjTy4r25x1tKVEG/Mhkj43RqhQluR+xL48HSIKJi+u3TKMcB5/fHp4hRXSK8EECVab4cK7tWFhLE+mF/tLdIZWMuDP+OFVhNUFozXdMJzytLN+vVmRW8UmaOsMLkEpPVyjUzEgaxlEjuEITB3z88wm1EFSh5/j7JPHzJPcqZcbGUZKgd57WajuVtXjvL0sirol/yDZI9rESGjUz7drXPetWQbMzbwOrTvL0YNM/hSHWduFnflZyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1zycGyah+EV8SHa/Y82KkadHj93WUODX22UTuPTL+s=;
 b=KaiFz6XLcnBtj9pHtR/aIr75KZ02iN2meSeE0AN1xmkpBO1eBO6Q+RKE3L1EazvXF8FrO9ECgnM+M1kiwfgL/MucKNbLgSuXU0iFxInpO5ciI9cY3zleDyu4r0AVR42JD3A4QuX8TbgSwzbKTgjRR4Xg+UA4X5LiffZSXs+wI2BXsKz1K4U76ft/AfKOuf0SH/Fl60/hi7Av7SaZ666jJGTdhuCrnAhG4s2N73onci1qCb9TXEY4g6wUBrV7noZZsRAFBdVh+9bhQDxqXz9gaILiM6G30rwC9NMHR8UD0OQTx84kKOd1pb8+ggMbCUK4VloebovWkjOIFU37dC+lBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1zycGyah+EV8SHa/Y82KkadHj93WUODX22UTuPTL+s=;
 b=lN7sQMWfp9iCw9ENg4hj4APZ2gqc2FGIZT9dRf5wblPovH0SJaGGQeVEMvqkEdDWNH28nSH3lJCxQqNV/aAtZWXzWSBUnki+DhXFuyjUBxqRFoIvzeSDmgJh3Zm1/rAKNU/fmm1S1vd4H+7hgWIKKrU02YG7TnlLRm9aL9QJQtY=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by MW4PR10MB5809.namprd10.prod.outlook.com (2603:10b6:303:185::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 18:27:10 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9%6]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 18:27:10 +0000
Message-ID: <b20e9dce-896b-d4ee-2999-51e9fcada97f@oracle.com>
Date: Tue, 5 Jul 2022 14:27:04 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V8 13/39] oslib: qemu_clear_cloexec
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-14-git-send-email-steven.sistare@oracle.com>
 <YqtVN+xqdODJa7o0@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <YqtVN+xqdODJa7o0@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::17) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73c144b2-7599-4dcd-8be8-08da5eb3f91d
X-MS-TrafficTypeDiagnostic: MW4PR10MB5809:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2rAay9O4m0kL8yK6k/05JIu2oyGMuxo1aYnIM0bC9QAkdiahZSFpy03iyQ6+21GhdQRRN3mtoSsgAkR/FOFCudN/CIsMQhW9fn9VI1kKskP7waUi5qCVpKKhIsD6sbKVQuSFFppPQh+P7S8PuH4UTDzOeNQvqBQ8zDUr+ro3qxaEx6jGip08iu/ZUP36NG1GZoK3fnn2ayYb+HnTuZdRazAUM5tctYivj67TjJ4kAkMlINug2vkOAnBw3fRWCc0wxmMDZxepF5bH4wonMZUH4XTn6sm/l1izhSzTjpmlHu8+fe2e00R+sOxBCsbsJTE2aJE8r1sHvgq58FxS5NwvBbbigSkoIlR+DG0417+fL8S7aj5hQMgFH2YroTjN+tEynWYIZKeHdo4X95TH1eGE7ia8cZK7XHN4B9+lWunwi2M5pi3TMCQ0Ik0j4ibOkoNwEdrbsFGvL5uSucSwm9wMshjzROY7SDtFtlvoC67JKKapQBZTLbCihGA55fdENTh90AU+munzSkrfNWkIQlMbooG+PuQDfY45vuxWGI/cFucUQtkPbmSxUHIJ4QOhzQW9ub+1Bg46TyXLX93rPnbl/+2vZGjkWFKmz5JiYlWMpoSP1ML2EV0GOaaXOSQmthbf/3mBXqNB+ZaCJk3I+RIbYCAbvIzkmN31RUIFClp435ci6AzJJYUThhu8fOTbL0hKER8ZLMzbD8QEX1YHg1jKWtsdNVlz6STqI/4RO/9fN07rpFEHnu4Y1EwSjB3Jrfnmo/U0i4dHWBiD8JM4q3vVlb438gFFQNpCdCrBXdnYsM50QPtu9NlOCcipq5zLNpUyjxU0VLPlRx1crBa5M91few==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(39860400002)(366004)(376002)(396003)(38100700002)(66556008)(8676002)(66476007)(4326008)(54906003)(66946007)(316002)(86362001)(31696002)(2616005)(6916009)(31686004)(6486002)(41300700001)(6666004)(2906002)(478600001)(36916002)(8936002)(6506007)(44832011)(186003)(53546011)(26005)(83380400001)(5660300002)(6512007)(36756003)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkxOcEd2SXFmRGhxOTN4TnRhdng3YWlKaTdZL01jZFozNXkwR2VCZEw2ZVZ5?=
 =?utf-8?B?TDZDbm1vS2wwa1ZCSFJ6WTVSTFNKTVNPY0ZOemxmQnk1ckJrOTJ0c2cwNkRt?=
 =?utf-8?B?TFFUUkVLYnB4d0pUaTNZVVkxbUg5S3k5S0lyM2JFVzI1RlI2Z29hNjhwU2F2?=
 =?utf-8?B?OVJ1cHJtSUZFeXgwcC9uMDZwKzRkQ0RBMDV4bk04NUtYWUtsVFVkNU5id1gr?=
 =?utf-8?B?VGNwSXQ0SmgzbnQ2TlB6VlpJQTZPOU9qKyt5SmV2ZTJ0dFdMbWVGMWY2anJQ?=
 =?utf-8?B?S0t0Tit4eVNiaTBpSE9HYmg2RmZ1WTNlYlVmYkhpRkNwUHliaVYzVnhMUTdm?=
 =?utf-8?B?WnNEUCs0QWxtYUlVbkQvbWpFcnlrc2s4Ny9QazF5ZWZrUlE3STFJL3lXclhI?=
 =?utf-8?B?VmRiM2VGNzdMWGdUUDNUbUZGL3FHeFVGdk1xVDc5MlliajFkcnNVdWNQajIy?=
 =?utf-8?B?S015RHd5bDdtKzhLaVdia1lQSzBMRHUxeVBxZ0Q4cHRaMHVkWTNoMXpKbFF6?=
 =?utf-8?B?LzhsQkFINFd3QjJobTdTWEo1UG5SZzZka2FubzJaQmJNSGhRdmJjZkdqK0lj?=
 =?utf-8?B?eEF0V3JwbXVxTkM3R0RnWXdTdGV1ekNQVkJJYk5qYUl3V2VsdnFjRVhIRXVt?=
 =?utf-8?B?QU5xYkx6bTVJZEE0ZWw3cktYemN5cXQ0NkhnY2Yya3hxQ3hUZGYvbE9aQUJX?=
 =?utf-8?B?d25oL2daZWtrdThWbk1DT29IeURaa3hMeEprRU1LSElxQUNLMlpKc0xJclJM?=
 =?utf-8?B?OFErT0V0Q0xiR1NnbW9tVTRwbHgwc3ZJQk9TdXhxcmNOUktnZ0Q4b2dxamhJ?=
 =?utf-8?B?K0szV0JvbjNtNzFFVGZnQXdSZU9TbXg1Q2NVYlA2RUdWaHdQellHaDdIa0NT?=
 =?utf-8?B?N2plWUl0RXprRndCVG5EOHRqdkZHNVovOWI5YXR2Z3lsRzVCZ3I1YzM5d2pK?=
 =?utf-8?B?NlZWanRmc24xMHJ4REpCcWtNRHBZdkJKZ3lPSWxiSnFwTXV1dGNsek5ZZjk1?=
 =?utf-8?B?WEF2MkVCTndBdm1sWko2dTNUNjE5WVF1WkYxZFdYeVpXa3FaUVc4YU5OVmUr?=
 =?utf-8?B?TWVyRS9lMjhsbVViQXFLWHA2ellucExRR3pmU0JvSDlQSkxsOTYxdnFNRG0x?=
 =?utf-8?B?dEtENFZaZjZxVDIyK3JjVDBKQThWTXVSVERVTEdpOTFIaVJmNUdWazV1MUNE?=
 =?utf-8?B?WEJrQ0Z5NjBxUTliczhUbmI0VWYybkpXYk91OEkwajlaa3JLUGhjMUlRVlJE?=
 =?utf-8?B?T09pbGZzc0JVTzRKa2QzQkc0bTBGam1oVzdRWkZ0Q3NneEU5QkhPd3Q3YURT?=
 =?utf-8?B?aXptUWlxbk4xazhCQkM2a0tPVmUrS1ZmaHg3aVprYzZ2QWx6azViYW9paUFD?=
 =?utf-8?B?Zkw0bDNZTm1YTlVOaTFVcHNiNmhIbU5QM2RFSlhjcndIOGhXcGlTN0JTYVkw?=
 =?utf-8?B?Q3VERDcyL0QzUmhFcHJhbUhrWjBYOUQ3TzJCQitsajhLSndPZzlZT1craEpa?=
 =?utf-8?B?K3BiM1lkMG5hWGRkNFhqbE4wR2pscEtpUmVUOVNPcW1RTDgrSmRQRXBaOHdQ?=
 =?utf-8?B?WWpId1FsRWdMazM2d0pLUitBVkJYdlRVbUs3bjljM3RadUpTVDVLaFEvZzg1?=
 =?utf-8?B?VFRTUW5leGlCRzFTU2JDdlBuc3RFeFZNcDd1bEJaaGdSeUFPQmo0QkpiR24w?=
 =?utf-8?B?WVB6STNSa1FOU0QxN1pLcE13aGhLSytwWVlNVVlNQUFQNnR3UWZuZUowdnp5?=
 =?utf-8?B?d2FvcmljVFFoUlBWTmtkQXA5M1dhNlQwdks4a0QrekR3REYxNjZ5L1RHbkdR?=
 =?utf-8?B?aXdWZU5UNXZzbGJhQ0RhcVo0b3VOdXA4K3lRYUZZUExycHJCYVBYWXNibGFp?=
 =?utf-8?B?SjhiWXBIMWV3ZWc5K1VHSGdXZzRPUHYybmtJckZFcVpXdGcrWmNKd2VFb2hH?=
 =?utf-8?B?enQySU5UZVNNOVI5anB6K2lCTXBGYmIxZGk0Ly9yQUZFZy95RGM2MFVxSlg2?=
 =?utf-8?B?Sy9YSEF2N2FialNsVDZ2eWxHbUdMeTJPYmxTTk13L1ZvSVVMcDRYU0xxaFZw?=
 =?utf-8?B?dVB6c2M0cEEzcnhvYmFPZTNSTHRiTkEweS9lS0pSTm1vcTEvYmNmbWJHQW1o?=
 =?utf-8?B?MmtJeFlCL3dFMno2NFVSU3lQWFQrR0tOSlVURWFWQW4wN0ZDZWZCN3lnUzVU?=
 =?utf-8?B?aUE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c144b2-7599-4dcd-8be8-08da5eb3f91d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 18:27:10.0935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: srodEvYD5R1FYygeM46R1tCXhD8dsnzaHuPkNxQ597cC8xdLrVNJxaI1PbvxcYoFtgUQZgqMBUpN0ao1leZCBhFiQC9JWyv+AdRokQc2L88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5809
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-05_15:2022-06-28,
 2022-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207050079
X-Proofpoint-ORIG-GUID: 4AOI1ulU6nLTOyi4wv3UuE2IbMfsbQH_
X-Proofpoint-GUID: 4AOI1ulU6nLTOyi4wv3UuE2IbMfsbQH_
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/2022 12:07 PM, Daniel P. Berrangé wrote:
> On Wed, Jun 15, 2022 at 07:52:00AM -0700, Steve Sistare wrote:
>> Define qemu_clear_cloexec, analogous to qemu_set_cloexec.
>>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  include/qemu/osdep.h | 1 +
>>  util/oslib-posix.c   | 9 +++++++++
>>  util/oslib-win32.c   | 4 ++++
>>  3 files changed, 14 insertions(+)
>>
>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>> index b1c161c..e916f3b 100644
>> --- a/include/qemu/osdep.h
>> +++ b/include/qemu/osdep.h
>> @@ -548,6 +548,7 @@ ssize_t qemu_write_full(int fd, const void *buf, size_t count)
>>      G_GNUC_WARN_UNUSED_RESULT;
>>  
>>  void qemu_set_cloexec(int fd);
>> +void qemu_clear_cloexec(int fd);
> 
> I'm a little wary of adding this helper without any accompanying
> comment.
> 
> It is almost never correct to use this new method in a threaded
> program like QEMU, unless you have strong confidence that all
> the other threads are idle and not liable to perform a fork+exec
> for any other reason.
> 
> IIUC, this can be satisfied by the CPR code because it will be
> used only immediately before exec'ing the updated QEMU binary,
> and it has suspended any other CPUs and not other monitor
> commands are concurrently running.
> 
> IOW, I just ask that you put a comment with a big warning that
> essentially no one should use this method, except CPR code.
> 
> With regards,
> Daniel

Sure thing, will do - Steve

