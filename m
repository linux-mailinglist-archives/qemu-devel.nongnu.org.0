Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F183A6919
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:34:52 +0200 (CEST)
Received: from localhost ([::1]:60276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnfv-0006mZ-Hh
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lsneq-00061p-P2
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:33:44 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:31572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lsneo-0007Zl-SF
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:33:44 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15EEXHnZ006392; Mon, 14 Jun 2021 14:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=ncZhjMN2H1PA3VebPw0ZY/5YzPBh2851EzBz/vg6hbI=;
 b=sDu8ratDSlPPz/YK0nDHwtAIgZxOhSRUp6UO7F8yB6B/Gg+EUUUKr9TgBWkAl3q60xE4
 gYe4GUIWz4pPHLbD2dzUv2sw64w2Qq5LCuxhFrlOuOLCnZs53WMNTOh4ZixiDPcaJftG
 C5fGe1MjgU8CzhkB/JYCvcYDlFK3MNAwWf+M75/tgSYi1MkAsXjcPe2ZlIOeDGF5FcE1
 KvZRqBLA0CZQN0cFj19HuTw4KYl4qbVQqeRP0lCaPg4HGxAO5BK57W2+Xu984tx4LplJ
 iFwCc5YuVQAqoJWJ1sCznENwcX4v7AUW7ayVr1ox7+Ah3AELb1MVTEPynilsHBzy5BpC KA== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 395y1kr648-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 14:33:39 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15EEXcgc189068;
 Mon, 14 Jun 2021 14:33:38 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by aserp3020.oracle.com with ESMTP id 394mr6mp8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 14:33:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0JP4v35Jpumieb0wJrFxEG33JRj5j47Yfizyo3QEMlGidHaKjuGTyEoyGESRynGhjpPRfvZqEDhjchyzqbEmWeit3Ra6HS2JygsEAuSUrBDZeWM44XATVZ+wqgdg6ud7E9vp5GUt4wy8U+hd9CTZzdtbvPF0xliEEf9jLTnF6t20Rnre8IRXzJOq2Cmp6K0iDzu07ETPebWeo2NbtWMtblDWil9X/vzPV9IBgk6XHvNGw05da1KICwNjVir3c0FjyJUl2oYOl6Cfe2w2uc5rTDEuW0GCkHoSy+T3SAR5DD2my0S2kxocCyMTKRlWaqKpARJ7EtBD9IZfG89GqIyBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncZhjMN2H1PA3VebPw0ZY/5YzPBh2851EzBz/vg6hbI=;
 b=ofOEd3r5HdMuO2MqdiOESfs3VR2fXMj11M9K94CBHvCYQdKfKp0RMWy8F96Uc5mJDnbnHiUDCCT9rpbSZVwb5AZh4GqyaXGO8ttZtOgVPsmLgntUBPVzKTAWrFvezeaOGTZxcPkRfWr2u8icd16I3wjrXOTKC+nMJdJMgx/rnKTX3YhnFrGgY57FPD3sAV6qXlfymTexiIallJHKpW9TNNiB9lDIRuMYjyaKRjAG6dsIEPpJDxFZXbXldQ2DNA0Vu3I+NNpKW1HQBSIw6HFj38+LTy/OCGbbApJiwl8jcctZ0ZcEIgGX4XQ0JHhE3S0YYzvYGpj5/vtxe8qcBJEZWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncZhjMN2H1PA3VebPw0ZY/5YzPBh2851EzBz/vg6hbI=;
 b=le3iAFzGdkMs8m2akdQ0PGNPr0iOp2YhVNCkBCHalEPgcj+PyauqTxGhxVKEkQ6Goj9NcFsOnBf8+cAP/KAbk+untbHwkdL+laipAQ6UR+wy/b73mkROMnzwPwcMhU8Y10ziEZ9ZfFQiDFx+vBbQlZ44TiPZGLXx7TpImEZ+HRY=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB3748.namprd10.prod.outlook.com (2603:10b6:a03:1b6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 14:33:35 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 14:33:35 +0000
Subject: Re: [PATCH V3 00/22] Live Update [restart] : code replication
From: Steven Sistare <steven.sistare@oracle.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
 <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com> <YKOPnkefxgRZ8PoQ@work-vm>
 <a1d3dfea-d15e-35a3-a216-3ce65600f2d6@oracle.com> <YKQULUn5F+x1wrYI@work-vm>
 <38dc91ab-b96b-1cc3-bf8b-84ff77b334fd@oracle.com> <YKZgZELudL9HobEe@work-vm>
 <37713c98-5f2a-6cff-d3c4-9e1c60cc4107@oracle.com> <YKuCbujlfOCEYUP3@work-vm>
 <9a1564dd-bed9-8518-8d5b-3ca9f0243643@oracle.com> <YLkvShM1MMLh6NpG@work-vm>
 <be32e595-914c-214c-8c59-f0a9dbea4e07@oracle.com>
Organization: Oracle Corporation
Message-ID: <6c765414-7a77-472d-6d07-6c3f63c2942d@oracle.com>
Date: Mon, 14 Jun 2021 10:33:31 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <be32e595-914c-214c-8c59-f0a9dbea4e07@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SA9PR13CA0166.namprd13.prod.outlook.com
 (2603:10b6:806:28::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SA9PR13CA0166.namprd13.prod.outlook.com (2603:10b6:806:28::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Mon, 14 Jun 2021 14:33:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03051ca9-1a75-4afb-a7af-08d92f416484
X-MS-TrafficTypeDiagnostic: BY5PR10MB3748:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB37489EA3AD3F4C40B8AA58B8F9319@BY5PR10MB3748.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QhuVXI8oB2JGrxr7zdnpbzcm4z/vLGn6BlT9q191Ujrtk9ovNRHFrDqfsjMXn/4ZMIctbv4/VUZCzaYNlAMsA14VdgHkolan62KJLSoDZ9xsK5X20MP2V8a7xyIkRIdHH/jJPmhH/s0QAKhZnjl+/ZzVp6y+lmD1SfvD/rgX1kJZ9/aGPRR/2GUuhEMGr0ws2vJo192VJQGeU3zymgtK3htjFhlnLhx9V9ujp7sZWUO5AEfCMMqJzqXILVC8MT+Qx9HfuhpsBLSGrhZOlgeE6rNeGQw4Z5U40lcYLVoXQoN9BVklCJM2074BZiBrg7xuV//E2v6xeo0Ov0sFpTAG2UxyRP1nfEtESXTcqKe3BsBxcZd71TucV6TcFZ344zzG+3yryJ55IGLvv/7ysD4fAK1y7Q/+Z5b3qV8iUdzWvuNtJvWZQFuPKtXE7b89B8r+jiHDiOnkV7Og6BZ+2EUtqCFhfUiDL2UElSBkeLV09tfuf98zHM6pmo5BMPJ111Rs/96SMNbaz7uTC890E+o8m1mSNnzC/7pMVt4gjXuCvNDq+wsKVb14NVqJ1UnzC8Y352Z9aeUdY2VzGGURLvZRkJ64mVj0k7ko6klb/UVg/3DYRF7n0fk35xgVSDTQTOxKxC2m09iwnunIeWhGQiN4+ebUd1WwqiPaFITafvB99DaT2IPtnBB+A3tDnNw9hzri
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(39860400002)(366004)(376002)(396003)(4326008)(2906002)(5660300002)(8676002)(186003)(8936002)(6486002)(83380400001)(16526019)(7416002)(54906003)(26005)(44832011)(31696002)(2616005)(956004)(31686004)(38100700002)(53546011)(66476007)(66556008)(36756003)(478600001)(16576012)(107886003)(66946007)(316002)(86362001)(6916009)(36916002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjJqUVl6a0FFQi9ucE5NZXIvWTgzY01Hc0ptUXArZEZxdXM0M1BCQ1ZBSTYx?=
 =?utf-8?B?Z2tISWdqVjA0cDFET3pnRDRldGtxblRsOENJbTdRclRxUFh3VkQ3VCtIZGsz?=
 =?utf-8?B?L2o0Q21qdlliZS9VUXp0OVhrd3dJYUE0OElVck9uQVVGVnAyRXFwZ3d4bDA3?=
 =?utf-8?B?UXFoLzF1WXpMVEZRR01ScEcrdFRGMmQvWmorVlJGa09uRnZ2dUNrSUE0Y0oy?=
 =?utf-8?B?czZ2Qko0OUkwem9PdXg5b2dDWHZuS2tQelFaSGpMTnFlS3gyb2Fqemt1THFL?=
 =?utf-8?B?TEdjRXFwSlJaVyt0NVdrQkptNVdKQ3FvdW5VMWNUbXNiRnd6ZDhtektRWldr?=
 =?utf-8?B?OVpDWklrL3JkS0xObkdHTWFXeXNvTXBZV3o3dDdYODZCL0lHSE8xaFBQb1hJ?=
 =?utf-8?B?bG1SQmt5M1dJdWo0SzF4SzBVb2pWZERwcjBSdVB3M3htSFpiVmRVaUd0QzFm?=
 =?utf-8?B?cUp2UkIwRm4wb2FQUitBZGQ1TjNUb3RoMkhPK0w2QU1la042V0V1SGR5Nm5D?=
 =?utf-8?B?MDZVZHNkUlJjbWg0dFRCTGJJZWxtZEsxMStWVTBFVHlXMkIrdFNabUs2MWor?=
 =?utf-8?B?YndWdGJ1c3VkN2Y4OHczYmxiNmE2NjZmSUx3dVJiRXlUV0EwcGc1MzhCQkFC?=
 =?utf-8?B?Z2VtZk85S3FUNmhQbUxEdGdPRFYyL2R6TGxPOUJuTGZuSjhmU0ZqMzlMeTJ2?=
 =?utf-8?B?R0JDMDROS3BVOGpNZmxMd1dEUnNNNGdndm1oV1l3eDhWdk01TXdWUnZHSzZM?=
 =?utf-8?B?anczdEs4TnU5V29pNk9ybFVobC9QYzdSRkN1Vllvd3E5RUgrcU41eWVMNCt1?=
 =?utf-8?B?bUs4UVdPRmYrWkNYUXN5VXdJaCt5NVF3R3RPSzJuM3BjZzV0VkF0WTIrWG5a?=
 =?utf-8?B?OUtTc1hrcEx4SzZha3RpRFdkQ3k0SFJwTDExQjNBemJleWpxQWNLS253dHdR?=
 =?utf-8?B?VHVRbmZEN1lBTGdsdzFES1dSVmV2TlJUUjZ2Z05nN05TSE5MWnEvWCsyeCtW?=
 =?utf-8?B?NUQxWk4yNnFESFJJUFE0ZHN4Y3g5RGNlMU5jL0t4cDJwV3VtTGdGaWtOWFVI?=
 =?utf-8?B?QTBZSFZBVjhyV2pkeW5iWkdsYzBpczdBMXc3R1Q0djVUc0Y0WDdVd3hWU3pI?=
 =?utf-8?B?Z01ZT2VlbDROYVZmSUM5cE5maFRpRlFOWkFIWXRJNk52NDR2VWlNVHVacm5u?=
 =?utf-8?B?R0xzVVpPWGMzOU1reWxNdjNSRkJDd3FGemE1N0dpb1FPd1A5OTZ5eW1CaWsx?=
 =?utf-8?B?MTdmc2VpOThDQTM4dHJucjRkV3dCdG9jeFhTVEgxRytuUmxzbjZqODRONWxw?=
 =?utf-8?B?Nmc2emVCWGNBWngxQXllc1p2ZE1vc0xCRXF0cHZ0NW9TSEhqdFNtdDdlSFVC?=
 =?utf-8?B?SFhHSzEyUW5abS9waTVhVlZyQ2tlUE5vTEQ4ZTBYQ2lqY216VnppN0dzNlBF?=
 =?utf-8?B?QjFQaEpTTThJTUt3bnlGb0p4N0R6WUpBWjR0YU9ISWZqSWZMci9YdEFGcmIy?=
 =?utf-8?B?N3RLL3VhVENDUmR0Z1B1Y1gwdTEwQVE3cCtlRUNDdkIvUXRCRWZhZkY5NitC?=
 =?utf-8?B?NmsvUnpQRDkrQ2hCTzM5TGpqQ1VuWWNJTTRPcE5OckJTMkdhTjhZdFltNktN?=
 =?utf-8?B?MEpaQ2w2bU9qU0gxNGV5eEpvOHVZd3BnT0ZZYlo1MFRnQ2RObXJWK1pmTXdl?=
 =?utf-8?B?NlZydnY4Z0RhWUNLZlB1QzVjNmVROUpKRklZcW5rT2U2a29VQmlGSnBIR1pz?=
 =?utf-8?Q?tJcFyQIo/wqUSsWri72T+NqCqzeejm3+ik8CEny?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03051ca9-1a75-4afb-a7af-08d92f416484
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 14:33:35.6530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gljBUOUge6VD3jZzSO4Q0693XGhLqs0oFRzbc9yySbc7zWlgmaH94vxkBj+mHy/prgZLxd1BgvDsfReMI7/bwDraSRmeG/nt7AL3eC9B6wg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3748
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10015
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 mlxscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106140095
X-Proofpoint-ORIG-GUID: lrFlHX3ppC5eD9yLm8H2KsTPGZvYbPnA
X-Proofpoint-GUID: lrFlHX3ppC5eD9yLm8H2KsTPGZvYbPnA
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7,
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

On 6/7/2021 2:08 PM, Steven Sistare wrote:
> On 6/3/2021 3:36 PM, Dr. David Alan Gilbert wrote:
>> * Steven Sistare (steven.sistare@oracle.com) wrote:
>>> On 5/24/2021 6:39 AM, Dr. David Alan Gilbert wrote:
>>>> * Steven Sistare (steven.sistare@oracle.com) wrote:
>>>>> On 5/20/2021 9:13 AM, Dr. David Alan Gilbert wrote:
>>>>>> On the 'restart' branch of questions; can you explain,
>>>>>> other than the passing of the fd's, why the outgoing side of
>>>>>> qemu's 'migrate exec:' doesn't work for you?
>>>>>
>>>>> I'm not sure what I should describe.  Can you be more specific?
>>>>> Do you mean: can we add the cpr specific bits to the migrate exec code?
>>>>
>>>> Yes; if possible I'd prefer to just keep the one exec mechanism.
>>>> It has an advantage of letting you specify the new command line; that
>>>> avoids the problems I'd pointed out with needing to change the command
>>>> line if a hotplug had happened.  It also means we only need one chunk of
>>>> exec code.
>>>
>>> [...]
>>
>> I'm not quite sure what I want in the incoming there, but that is
>> already the source execing the destination qemu - although I think we'd
>> probably need to check if that's actually via an intermediary.
>>
>>> We could shoehorn cpr restart into the migrate exec path by defining a new migration 
>>> capability that the client would set before issuing the migrate command.  However, the
>>> implementation code would be sprinkled with conditionals to suppress migrate-only bits
>>> and call cpr-only bits.  IMO that would be less maintainable than having a separate
>>> cprsave function.  Currently cprsave does not duplicate any migration functionality.
>>> cprsave calls qemu_save_device_state() which is used by xen.
>>
>> To me it feels like cprsave in particular is replicating more code. 
> 
> In the attached file I annotated lines of code that have some overlap
> with migration code actions.  They include vm control, global_state_store,
> and vmstate save, and cover 18 lines of 78 total.  I did not include the
> body of qf_file_open because it is also called by xen.
> 
> The migration code adds capabilities, parameters, state, status, info,
> precopy, postcopy, dirty bitmap, events, notifiers, 6 channel types,
> blockers, pause+resume, return path, request-reply commands, throttling, colo,
> blocks, phases, iteration, and threading, implemented by 20000+ lines of code.
> To me it seems wrong to throw cpr into that mix to avoid adding tens of lines 
> of similar code.

Hi David, what is your decision, will you accept separate cpr commands?
One last point is that Xen made a similar choice, adding the xen-save-devices-state
command which calls qemu_save_device_state instead of migration_thread.

- Steve

