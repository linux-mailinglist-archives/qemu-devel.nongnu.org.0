Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A018C6ADCBE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:01:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZV4C-00079K-FT; Tue, 07 Mar 2023 06:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZV48-000797-QV
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:01:08 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZV43-0001EU-Eh
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:01:08 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32784MEA017687; Tue, 7 Mar 2023 11:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=Z31ymBDNuUWIjeVzPZKXaLpsNmVvA1oGXuU7Ok72anI=;
 b=oUrC0inADlJBo8BwqqmlfI1OcqAFFGvCcw7q3cEBxGIxfzjP6QmdEI8YJnlCAWtd1t1R
 H9wvka8siDqBHuOxlawwgCHBlHBrV7MgrXvjtbbn1zzRyeoWobS+11XMOyU4G7sPC9H0
 757sfqWBazTHRuRaOCpTZ13zuwCaJ1GTXvBeaVfq8FY6hasyatZnoM8EseTwMR7uacee
 magCkg3hX4SzLu8xoeIz/gs4BeHsLbkMqrE6w46JdyPibHfHuuD6R1xidTo/WL8R1rA1
 wvdixTEG9Ga0xghBFzyk73fBVnbjnYgjbDHIDH48sxdGDd3Q5yxg9nCxxbPH1ARDb0Dc bw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p417cd732-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 11:01:00 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 327A6xoF037259; Tue, 7 Mar 2023 11:01:00 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4txeb1wy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 11:00:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMACyvXAHWRPn2QORzxkggnxhmMFLyk4zZtyJZrenfxJr6wnth/Ve+Q0L3zXrzUdNicoHR6dWWClIPjf0MjXT9uOq62CpkKfYl7yNUWlR/bXqkZR+Pd1oNiKCWXEEh5GAonh2UBVB3FVnJipgIn44Bvw1YI5QhjRpc2gLqG38PI6o2rXa+HhQ/+fk9TRYOTsh6l4b0twRmqsjbX1Y14sHibfKxKkl5OYoJfgKHg6se8JftW1FsaIFmyBDOiSoM7iIN63TaChpp7M/PrVP4ajlmHQvkxvNr9Z50EDOldKo3rmkL3L9uif9Xvv+e1GibEVdbapPf+jlUQ2XUuoGHKoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z31ymBDNuUWIjeVzPZKXaLpsNmVvA1oGXuU7Ok72anI=;
 b=XRH8Aeonf+yPNQDOPThdQuNhwZfSaQCSBbRfpTVDYOEYL7RrqXAJJZcZg4A4aY+5kJI8khTmQtrSHuhKzbqllhknDDqwp1k3KhPibbeItgszwOj5tfoqApISa3JCZrLRiql+eKVdLNw/e0SfIbsYfdh157xY/Qj9wVqgfemdqPggYdQ9cnXXfMXkgMMQfXcnlJj8uaw1s4nJQVG3G90CuprG7zuJPeM+lzXP5cuX8B5o9Qv9YJqwtBp8HhyIn9s4UoX49+uTMW1QYauFqqtZbpuGKen6z4LodGVumG+TAlUgHxAk0apJZfbxTMyVq+1WSnBF4UbrZ+MV3pH1AuSj0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z31ymBDNuUWIjeVzPZKXaLpsNmVvA1oGXuU7Ok72anI=;
 b=tIeuDrYRJZ88XyKfMt9gh4OiuG0F3wKS11DCi6mrALQ50K8g8OPdyU6dObGwYsLw+nZXiHDqi47PXOS0b9uP0KANFp9hnE4kIO5J8RajL3Eek/YJn9xexvclPWz9BJQYEFx+DzgcHD6BzqNsr74yk30d40vjQWm7+iYu6dfpK/w=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SA3PR10MB7042.namprd10.prod.outlook.com (2603:10b6:806:317::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 11:00:57 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 11:00:57 +0000
Message-ID: <a7cfce4f-80a8-7af8-da29-1cea93d3ebbc@oracle.com>
Date: Tue, 7 Mar 2023 11:00:51 +0000
Subject: Re: [PATCH v4 06/14] vfio/common: Consolidate skip/invalid section
 into helper
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Avihai Horon <avihaih@nvidia.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, qemu-devel@nongnu.org,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-7-joao.m.martins@oracle.com>
 <8ef23f46-a5c7-2723-42e3-6f5efa7f993d@nvidia.com>
 <e9773720-77e5-4e93-3b24-e01dbbefc817@redhat.com>
 <4c6fad10-a71f-7b8f-87d5-09c57b0cfc70@oracle.com>
In-Reply-To: <4c6fad10-a71f-7b8f-87d5-09c57b0cfc70@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR03CA0077.eurprd03.prod.outlook.com
 (2603:10a6:208:69::18) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|SA3PR10MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: e3bc1f16-2bdf-4b54-db81-08db1efb3af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dPCqn59FSZ9wQwrdjpnalB8VcSSRuYIANQ2H4ZFKZY9Q0Up2QJZiDO3pRrthEdHLa2ZrnkRLEg15+E9YQvARLlnQdCA54PQIV2nckRw3ZAYC7iSLGJaEL/0gl23IICZRzdpIpE5YsCPw9Tsri5m7PS+jx5kn36sDD/kkSQNH/yGA5QmYKnKeFDvVgnIg/4pxiVCsXSnjEFeLOntnXuwQsoD/jrP1gF7yleLekRf/Giefaz3T+9UjDAWoNtD3/Fygr1WvKU0ousTehEF8lqRuKv4vklO432n6S88GpKDchMtQJycmIB8RXyJUMDXitp4nE9xbxnu0GxgjZ8ZKIjTWJj8H/E3ZrWUweQN9U30dxQeyPfprDiHqPn+sJztQZFLn/NJyW3wWsfyY0s4wRBlvJBci6XWcvgIgdLLIvGaMMzD2tgk1rovAEcQfS/PP+02M9Hyl7zvuzt9Dfh0xZL4hEVaJw/iwqCXTfcR9T7rLxC15yD+HDrXPDFCx/kGR78XO5zFYJQ9eMVH1NojVb28qnf7t3xOZSNgk/iUbo/BYfO1S661KOncpzDA0oVm1aHa3qhYusaLlq39W3+46qRz++n/U6QrjA88TmAhiok0TnA63CC+xw7y8icYL1FQNeZk3+uY3tCwcQ1EAQOECoLuLo8Pxk+oWEzQUPgXN57bsxfefU2ZKMCutq3DIF5EgIbhVffuRFeYEFVccYEZNZ/rqdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199018)(478600001)(5660300002)(86362001)(66574015)(36756003)(26005)(6486002)(31696002)(6512007)(6506007)(2616005)(53546011)(2906002)(186003)(31686004)(66476007)(66946007)(66556008)(4326008)(8676002)(38100700002)(6666004)(83380400001)(8936002)(316002)(54906003)(110136005)(41300700001)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3l1cUNZQ2hMdkVBU2xSZXJNNWZvK3c3OHkxM1B6bHhBTWVxUDZYNFpqT3BE?=
 =?utf-8?B?VHowMzRhOFhLbnZmOTlzbUJBc0RPZEM3WlI5eXpmdEtOQyt2ekhoTVNtbHlU?=
 =?utf-8?B?L2drdG5zVy9MZDJDWVFiSFltV2ZYWkxKTFRmUGl1OEw5MGtWcGFVMisxVmFZ?=
 =?utf-8?B?OFRoVWJOcWpjcXNRcG5WL05mTHJJRy9xTHVVMkFoeVREMzFxaDJlenFJSDdY?=
 =?utf-8?B?TnZyVW1jYmU0bWsxYklzNkZiVGpLb1E2SENkdG9BVDF6cXh0ZUNycG15cmJ2?=
 =?utf-8?B?bHBZNy9XS0ZQY0lGSHVCeENXaGZiY1VkVXJrM0dhclBGamJUZ2ZRRjJNOElq?=
 =?utf-8?B?R3NKSW9yOUFDR2Z1ayt5Q2JpVllaUG5VUG40ajZvTWo3N3hUOEhBWjZCUm8x?=
 =?utf-8?B?SzQ0a2Q5Nzc5SGlsTVpaUjZ4WS9Uc21DTXVveHZCMlJ1YXFFWnZlSTRvLzdT?=
 =?utf-8?B?R1JWTzlpdGd0S0N6d0Q2eVg3aG9tMUNOU2FJbEZBdmE0dGx1ek5lelRYVmRu?=
 =?utf-8?B?KzFDSUlRektUVVBSbmVPNHJzRDh5M2ZjTDMwa0hueTBKbktLRDRiekEyNERB?=
 =?utf-8?B?bHloNGdaZ1pJWUc2SXlZTGtHdnpUaGtvblh4bUN4Z3dxTVB0TXJMUFVzYm5w?=
 =?utf-8?B?M0VrZ2ZlOWNpbExJYnZqRi9QZ1Z6aHJ5UUNvMUhVYWZlZTJUc1RnRTEydHdW?=
 =?utf-8?B?bFRwV21IMSszcHFXcDFvV3IzaU1OUHV3dWczeHBFVnVhUk13T3hVeWJSMDJn?=
 =?utf-8?B?VVQxZmhtQXk0L053VlRXTmZ1bnQyLy9IeThWdGdUbElDWi95eWN3Z21McSt5?=
 =?utf-8?B?bzFQQWN4K1lJYS9BMEM2SFl0WHJNQzRwTWp3cWttZjhvcEZKakV2UVdNajFl?=
 =?utf-8?B?Ym1Nb3hnZTJZMVAxdmhnd0dxTXJiMjBEeFZBR1E1S09uTnkzZ1pyVVhoMFRM?=
 =?utf-8?B?MldhNDhiT29jL2RJNkYzaUZXM0xKTHZzRG82OG9OcjA4RHEwQmdTWlk5WHl1?=
 =?utf-8?B?bldUTUtTRDNwRCtLVW9nZU5LT1ZSdnhpMEg5WElFbHg4aWh3M3hWUU5BZ2lt?=
 =?utf-8?B?MDBtSTc4dHRycWp0eEtuM1huclpSVWg3NEZHUzJzQjRnR0ExVURtZEI0UFhI?=
 =?utf-8?B?QVNYRkg5Q0FUdkVpcmx0Z2hlTGxzald1YUxiZmpZejdDNSs1dHF5enZKMWtW?=
 =?utf-8?B?Wlhlb1EwN2xlcGYvdVFYQUFFYWtPaXR0ZndqWG9pMmE5ZFVrNkcwQ1FFUEQr?=
 =?utf-8?B?NjRSaEliUUJqT3BSMTZDZktsSjBmYUFHTmZrNVA0OVBsOXdEd0VUSUdtd2l0?=
 =?utf-8?B?dEpHbjIvQ25BVS9WajBLQkRPdmFjYlRTdGRud083bWFaZXkvUFF1WjBaSzNa?=
 =?utf-8?B?Z1VxWjRBTVAxOS9vUXlDZDJtdlpteTJoUlhmUXVXcXNIeUdkZkxGeWZ2eGFB?=
 =?utf-8?B?MXNkRnpSeHd0cHBiSHI4NkI5ZXVKT0Y5K1pNWjVieFRXa0lvWU1sNHYvbUFR?=
 =?utf-8?B?dnV5ODNlTGtxWWJjcllUMks3aVYxOUlNRks2UGF5emR6M2xTQU5IY3lRcG9a?=
 =?utf-8?B?L1dJV0xnYWFIZHFrdFo3NFltMnRudlBmS3NzZENNUHI5cklJdjBBeXlLdmNa?=
 =?utf-8?B?ODhVcEd2NVo1dzNvYjZaS2dpMlFFV0JobHNTaW5qOENSQTQzN2dOOXZmYU5h?=
 =?utf-8?B?TlVQb3BBUmRUMlhZUmpnMms3ZzZzWElOaUxFdGhlQTgySmRPY3NmbExIbzhB?=
 =?utf-8?B?SW5tNUFmSzJ5OTF5SUs1N0M5alVFZTV4ZWVzZXN2emdYS3phTGNta3R3RmxX?=
 =?utf-8?B?bEJNK3ZyU2VjbGRmY2tPZHdCWEdRTjhQWmloRzlrTFZsNzUzeTk1emdndjJu?=
 =?utf-8?B?MDNZa011emg3Z2VBYk5RYTVKdDcyT3FEejRVSVQyTVpVTjZiKzIxenNBeTE1?=
 =?utf-8?B?OC9wRGd5SStDWTJPZHArUnlWU0Nqd0VTYTlUUTBPZkhDVmlwR3ZJMUlCZmQw?=
 =?utf-8?B?TXR5VVIxeDhSUU4vV0lDSDNFM1AwSGk0ZW9vSDNJd0RaOVdKR09iVHBaOG1n?=
 =?utf-8?B?QllWUEFWS0kzd0szV0tQM1crRjVTMVlDLzVqdXc2Y2tYcWhjc3V4dEZXOGRj?=
 =?utf-8?B?UFRZL0lJRmk5UWVtUkVVbk5mZzZQN3ZGTXVKVkt3RmZubUd4WnFIMjdpSGZC?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2NKQu9C1qEZZlyaQ/7jOmaIDxJs6ABgM7D9ECDPazyx7vbVgG1+Wp5j4EuqognI7pk8+nG/Zwji9VPz0NHFl7emwYaSk3KsI+kXPJEckIY1iibROquY52JfMxRAOWXmq+mBU0pm1ktVpIETr8bYcjrkwm7tzY3CJllFv5Spxdx8WhRPdA2yjgvZ9dMvg1qa8YrcOh0aI/qEJ5oxRB28R9mCCcVeZ9jZVLOyWyWjn/nNOSLG3Eg/8XOv9y5nDDE7SCytK86802RH2h0CwRGNjTMhEYNB72BzuYaAt4gAw0D37oZmlYjUapbdSflawwA8qv1JZjuY3Bp8hR7m9hW/MIsvPex35tzJ3JjiT8KoNREfXX1QHXn7I0+47gfQIV/HzuEeV41vj+bX0Kr9vZyxirW/M9HkJbV6rSWyXxkzYwnL8f04X25wR6svOV5I3/zU8iuzRXBJy9CVlcuT2s8XB05o5aLYoVAeK8HoQ7EpalPusaV01kCktlDmp7cummWkXyo76j8al0LrTOX8leuc3ur/tLWPB8m7zhhx+u9RFyenaKR7K9yJgXgdDgbyneWQOPr8bVPp1clMmQs/EWb9fv8QaxXEk5H3VUAt9b176AjuhmgTa0Sj/vKIYs/f7YCMrWFKtXmow9Le5ZOiLBmz6vEml8GKXh2006fBu4TL4r6fx5oa1sqPSzGUcVlfp7/M2JIxiAO94zJ2TV8A59kvdW4/mNIlUw+XH2Atlb0smn81glpT6ymlSww/sd1W/MSm57PFWVo/RQxB7yWmg/TouCLCsimTgwgj2gP4FdmGzIC5RIhEd4qodh2T4VGQrX3ER
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3bc1f16-2bdf-4b54-db81-08db1efb3af0
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 11:00:57.9107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fzM3DEAknTfErGcsSYQC1kl0t1gj5Fv1xqsb74IFyyxjsTdLy3hAFtXkg/CfAtRjk0XgSUTv4RYLWUhOAw8rgjG9Sjp94/SxgDoehdj5K4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7042
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_05,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=743 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070099
X-Proofpoint-GUID: g8FQzp_ufGk912ZRRBv9iPk5pSVHLkIC
X-Proofpoint-ORIG-GUID: g8FQzp_ufGk912ZRRBv9iPk5pSVHLkIC
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 07/03/2023 10:22, Joao Martins wrote:
> On 07/03/2023 09:47, Cédric Le Goater wrote:
>> On 3/7/23 10:13, Avihai Horon wrote:
>>> On 07/03/2023 4:02, Joao Martins wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>> The checks are replicated against region_add and region_del
>>>> and will be soon added in another memory listener dedicated
>>>> for dirty tracking.
>>>>
>>>> Move these into a new helper for avoid duplication.
>>>>
>>>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>>>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>>>> ---
>>>>   hw/vfio/common.c | 52 +++++++++++++++++++-----------------------------
>>>>   1 file changed, 21 insertions(+), 31 deletions(-)
>>>>
>>>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>>>> index 99acb998eb14..54b4a4fc7daf 100644
>>>> --- a/hw/vfio/common.c
>>>> +++ b/hw/vfio/common.c
>>>> @@ -933,23 +933,14 @@ static bool
>>>> vfio_known_safe_misalignment(MemoryRegionSection *section)
>>>>       return true;
>>>>   }
>>>>
>>>> -static void vfio_listener_region_add(MemoryListener *listener,
>>>> -                                     MemoryRegionSection *section)
>>>> +static bool vfio_listener_valid_section(MemoryRegionSection *section)
>>>>   {
>>>> -    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>>>> -    hwaddr iova, end;
>>>> -    Int128 llend, llsize;
>>>> -    void *vaddr;
>>>> -    int ret;
>>>> -    VFIOHostDMAWindow *hostwin;
>>>> -    Error *err = NULL;
>>>> -
>>>>       if (vfio_listener_skipped_section(section)) {
>>>>           trace_vfio_listener_region_add_skip(
>>>>                   section->offset_within_address_space,
>>>>                   section->offset_within_address_space +
>>>>                   int128_get64(int128_sub(section->size, int128_one())));
>>>
>>> The original code uses two different traces depending on add or del --
>>> trace_vfio_listener_region_{add,del}_skip.
>>> Should we combine the two traces into a single trace? If the distinction is
>>> important then maybe pass a flag or the caller name to indicate whether it's
>>> add, del or dirty tracking update?
>>
>> I think introducing a new trace event 'trace_vfio_listener_region_skip'
>> to replace 'trace_vfio_listener_region_add_skip' above should be enough.
>>
> OK, I'll introduce a predecessor patch to change the name.
> 

Albeit this trace_vfio_listener_region_skip will have a new argument which the
caller passes e.g. region_add, region_skip, tracking_update.

