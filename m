Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A395F4BFC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 00:35:28 +0200 (CEST)
Received: from localhost ([::1]:59622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofqVb-0001he-1i
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 18:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ofqTj-0008Ke-39
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 18:33:31 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:30486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ofqTe-00019W-8Y
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 18:33:30 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294LNiIW011958;
 Tue, 4 Oct 2022 22:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=BzC/jLWrf0ULHnUj3fzvagVKrLs+507qIvrESvYzoOg=;
 b=lRxsiC4N+Vvgk75P+8SUou2XZzX02yVrKuSTMMXNKWx/5BKlc7zmg3K3wwMIPWV5VjWI
 BoZEl/9QNBvESEsRpgDhF4rhWtK1f/1wjAsTj/lczt3mSinbmSBjhGSWsKKS6tXJqvb4
 sFE92k9rPegKVBFF+7V5EyhaUQ4a1AAce5rXFw5rz39mRKmctvVTB+ZZI67/eDBjqlDS
 AnDLBofE9AR9mD4GQPJuXZaSLR+OKIMfh9F+2nCLoLgaZAO5CCCalo0l2J/7xZTiz913
 YddgKVbK1IMXGS+FstKO1sbHDgf6/O+SOg7M6C6XSp5l59g+qn0dJ66qDCOjEE5QmYkP eg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jxcb2qvyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Oct 2022 22:33:10 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 294J9VS2000541; Tue, 4 Oct 2022 22:33:09 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc054u1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Oct 2022 22:33:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lB2JoukGf6DOwohcw9ZECpKvfZ9ZSNMrPyOWz4rQUR36kSPxPLdYs0/D5h9ocP+vJzJ5RrjOi9qhDT2OmymxHgX2wK6vVXvXnTHJVrG6CzJZvC5IUpnIzqzJXjU4wCioaKhwX8NERw1oRpd58BuGabV4cLipN6PoCgynmGx538hz9oiYqmloyjP1Wxes0q5tsmsuQJJhcOnX951BUflLzfdvJYL4/miWNRJ2XYcOQt6c4VactYlHz88OEebHAXETn+EY4yV6lC3+Rvbr51xx0luteoJ632zQ5AhByoR3ekkWz99b1oFDbWV3gFfn6WplgkXJxS+sL6+zqyzY37BTfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzC/jLWrf0ULHnUj3fzvagVKrLs+507qIvrESvYzoOg=;
 b=LMTQ0BGAIgX6a6I2eUOzLoZxNDTXbgJhmso3SwYuVq9bvCxfVr/4qe0xHPjb+pFme6sacAPOsuSfMlkSaUQq8pYDrZbCoP/G8lsSt3b15U0lDTt6wOxU22iYbo7MF66w0NHiNy0Qt/0e/LZM+Xv52243IynHgzzYdR5hX3Ht1x8abiVkWR7WgddHyVIHuwPu1Lbzrvy+kneGvZkDpxYd5343XheS6GXXHFKsi/tLM5k4EpKpBe//OMtuAOju1oLArgUzfrPdG2E0lndmR0st968ry7iBZqIaLGyFU1D9F3xTcFJI+THaKm/N2CjI4aHkAcJyz42qiwZtt9SR2nOH1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzC/jLWrf0ULHnUj3fzvagVKrLs+507qIvrESvYzoOg=;
 b=T2UgNsebrj/RurYit2baF2axLLo+aerX1eZRrjXMrmDSEPo1P68EJU8I484WAn4ID93sdhyq1LzDJ2fTFcMJSr8xKBhcvx2lweYuntTLgB2xCo9vsl5Jax0Hasv/8zSzhPmYvFgvQnbP+0vxULd192DtM9Tvof/Q1RulqGvBbzo=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by SN7PR10MB6362.namprd10.prod.outlook.com (2603:10b6:806:26e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Tue, 4 Oct
 2022 22:33:07 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::bd57:f68a:ddd2:7edc]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::bd57:f68a:ddd2:7edc%6]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 22:33:07 +0000
Content-Type: multipart/alternative;
 boundary="------------EalnFMSrw0x16EcOWI3IYXHd"
Message-ID: <3d377755-f036-77f1-e502-36cd30e0b2cd@oracle.com>
Date: Tue, 4 Oct 2022 15:33:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/3] vdpa: load vlan configuration at NIC startup
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Harpreet Singh Anand
 <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20220906163621.1144675-3-eperezma@redhat.com>
 <CACGkMEvnVavevtxWa49Yew+Nnkx_Wfmgf1JLVXCBe=zkpvdHnQ@mail.gmail.com>
 <CACGkMEswG2nmTve+p2MU9ue5CuwAu69CpeOUzYnu_BVfZE56JA@mail.gmail.com>
 <CAJaqyWf=NfkL_2uXVapJ6qCLziBc2jg+jMyR+cBQu+yDG6eg5w@mail.gmail.com>
 <CACGkMEvW5ZUZEcx9COvwjAT5PUraoko8k1foBez=T1nmhjKpDw@mail.gmail.com>
 <34969f96-b7c4-c9f8-2248-3e84a84148b2@oracle.com>
 <CAJaqyWfZBHSTwY+WRDbwS+Sw0NsXsmpfhgpOtmLNM3dUWzrd7w@mail.gmail.com>
 <411586c9-22a2-1bd5-fbcd-a7658fd00446@oracle.com>
 <CAJaqyWcJ9Ci5=0jw_WcVuY27mG+H7uUq_imkV3+CWycCEt_h8A@mail.gmail.com>
 <5c5ad692-7162-ec05-cf40-dffa310706c8@oracle.com>
 <20220929031210-mutt-send-email-mst@kernel.org>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20220929031210-mutt-send-email-mst@kernel.org>
X-ClientProxiedBy: SJ0PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::15) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|SN7PR10MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f1d4ef-20be-4ec4-c77a-08daa658689c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ti3axSSUU8FhGA/sJicZKHCvxWaFqkHcWD276OT+opOnMrbAMuauDxUvRjPV7DMaII67G3hrbJX6wFfGYEeglvDzdli1N3YzLA4HnXRwEDZU/tBgTOuzfHsBiB4ifwty+Mj7vpGtaeODzbwdXIeymnFALAK43vxmGlWHzkeu6FX/eFMzUAudONO1X/unvbxlRV9dgMxY2FJlT8yp+hMVsXdjsNT5C4/e4Mp7K31wlLO2KSDK+CLF8LA1P4vk43HIjSMcuhd+Y/RoJnaKTF9ibYp4vqJnkLF2T7Fwx+meTqOcbK56/uwPNpjyyzj2bn8b/VC1eXFbTD8On/Z+YSmIES9/VJQAX5A8chVgbs3fi8zjwDplcIxVMcFEnA/KiHniAjYTEMfVH8Zrz9FaRD0FqS5a7P1Mon5NsFtbJgdw9uF7JAM41YwFtkGnqszDAOxt0s6Yy2Dwv/nKa3xwFDEzo6WnEbtQOhkJllInj6NfYj1MS17zkRqXgaHO5iD1dwTnPwrwGLs2S0Zy4j4vAQWDAfTytU8MgIT416x9ALnIZPWX8UFRj5iVEyNVy5Qh0QiQriSd7DJdD4bF10iUF2uP4MEfrvM44+jmB/DwZLANa1Oxzljhe0HNaVi+AzG1m2HO+hCQvzneU0UnAPBfidDOef4WmVhnzcYK7V2Z69KxnKLbR7LwVSEwZ9suWGGqgYtwsHQ9A/jleioSbZNw93ovKqUSKmnIr8XU/1WpJnuaWZe3WoqK/J47VOwXd8TKckvtI1mNEVOovR9blu6TmTjAc67AmCWv5eNzEmwTGfZR+5bHRfXYALhwe/t9xXU/FY2z5XB6nhlxDL2W6DpdtxpjGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199015)(5660300002)(41300700001)(166002)(7416002)(2616005)(8936002)(2906002)(36756003)(53546011)(26005)(4326008)(86362001)(8676002)(6666004)(31696002)(36916002)(83380400001)(186003)(66946007)(316002)(6916009)(54906003)(66476007)(66556008)(478600001)(6486002)(6512007)(966005)(33964004)(6506007)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTF0VWR0VCsvS1EwN0RuVW44Vzk0NW4xdzB5VzIyNThmOTlkMGxSTGpVODd5?=
 =?utf-8?B?ZmRFTzRaVGVkL2hkczl2TmU1MnlxS2g5aVd6UEZyV1N1MmFSNlRidFJwTTNy?=
 =?utf-8?B?Nkl5NmJ2ZmdleEpWVHlSUkZDNjhCNkhCWnR6VkZxemVwRFcwUXpHZTBZSUNz?=
 =?utf-8?B?QVBsb3FOakgrUlBjTlR3Yy9HdDI5T25DSUcwMU1UM0pDMnYvMkZvNEJVQnVs?=
 =?utf-8?B?b1UxVmRrRDE0MTAzc0MvejNkVEJ6YUQ5TDJIQ1ViL08zSGZNaHphUUkzSWZT?=
 =?utf-8?B?SlgvMEU2SUJXUnh6aFM2Q2FROGcvRStaOHcwdDd5UkgvbHhES1hFUWg1UUxo?=
 =?utf-8?B?eUVkV3JrTnNlWG5JY0l0enF5NjRuay9wcUErNDBTZ0RJZXh4eW9SU1ZrT3dG?=
 =?utf-8?B?dFUxSmxUYVdXQis5OUdGWkRMZTJQOEpQbk9WdVBadmNSTXFqYy85UTdMOWd0?=
 =?utf-8?B?VDZ5QTB4eUVoVks0UGN1RFZ4NUtPd0YrV3VvWWdRV2NkdUI0Z1dqWll3aW41?=
 =?utf-8?B?bVFrMFNoajQrcWUycVRmWGhqNWp3d255YWpKUUJHVEthUkt2RHF5YVYyWFQw?=
 =?utf-8?B?NlYrRFE2WnRVNlFlOU1tM2p3UGhYMDNORk55VHFuZU5kUVI3ZU1VSGtocE1z?=
 =?utf-8?B?dGhITE1HaG5wTWFNK2hWTk9HOW5pOGdySU40VmlkU0NRZTFtTTVELzJPS1kw?=
 =?utf-8?B?S1Q0MUx6MlQwVmY0dFJBclVXRDhvcW5CZDNOaE5tMTREcDNEdUYrNndLTlNn?=
 =?utf-8?B?T2hiQ0gxSlZMd25FSW9hYVlPSSt0QjBHTzdxMitQVFFQY04wdEtoTmRiRFNw?=
 =?utf-8?B?K1owZmg3bU13UUZveXZEcXNOdytFR0lESDBCVURTaE53TmlIN1NsL0o5ZHRU?=
 =?utf-8?B?N0pEeHlSOEdOa3ptaWFveW42dXdXYTc4cldZZ1BUb0tWMG41b1J6QzY5VzB1?=
 =?utf-8?B?bTZSbXFYQTR4dDJWK3gwcEtJNDRkWUFJM2Q5WG12ZzVGUFZJVWUvUFhRVjZW?=
 =?utf-8?B?dXo3MW8zWE0wYTBhWG9rWVdLSWxtcUw0TEozNWRYVmpFSHpTYjd5NTlzRUhk?=
 =?utf-8?B?eGEzL2RURGhIb21hRFV6dWJOUE1iNGVmQjA3OXVQemU4L29vME1XWG1uVjNj?=
 =?utf-8?B?ZVQwSXJxN21EenhPUVdqY1FtTTVuQ1BObVNkWVhCc2xXd2dLNllaeGc4QXZF?=
 =?utf-8?B?U2JYVEhPN2lVbFJnY05GMGRrc1hHeURnY0h5azZlbThNL0MweGNXS0FLT1NN?=
 =?utf-8?B?ckwzQy82N1ZheUNSZFFPZTdBL3UxdTF1STVWODlrU1NuSm1rYWx0aE9KUWVS?=
 =?utf-8?B?WFoyM1k0YUR2TGRiZVFrOVg0SVIwWFR5RGdlaVhmdUsvcHpSMGJzTFpGbFpE?=
 =?utf-8?B?dE5BaGZyL0NwM3dRTTRUelVxTGtwVCtSSFM0TGVQS0FxOE1LYjM1L21BRzRs?=
 =?utf-8?B?K3h3SEhOSVhxSmI4LzU2dWRBQ3BlSk1xSDNFUFNESW5adVBuLzhybUN4Zkgw?=
 =?utf-8?B?Z1RqNXRCSkQzbzJraXBMSVQ2RDJRWVpmNGpoWEJ0TFE4Mis5V2swVVFGbVp0?=
 =?utf-8?B?UGw2eUdzMlpkS0ljTlI1NEQrN0JwbkNUUGhOcmNPTDRkd3ZFRyt5MVVKQ29Q?=
 =?utf-8?B?V2J0ZlFkTnhVeU5pd2NPS0xhRWhtQ3Z6R2Q5MmFDN3lSU0hhYi8vYzR2NUhB?=
 =?utf-8?B?WjVDWUtJRnlyMFBIQkMrRDZKYU12SkVaMTJBcUloOURQWnhDTElPWWFRQ1lB?=
 =?utf-8?B?VDVtVlh1Z0FuZ2I3SWRVYVVnZEwzd1lZOSs0VGxXOTRFcm1TWGg2UzRYQXlL?=
 =?utf-8?B?MXhubE1oL0dGM3MyYU1kdUhBQmdsUmdCN0JYT3pIZmUxL21GOWViUERpSks5?=
 =?utf-8?B?MkdBVWtsdWVuT0UxZ3lnd3dMV1NiSTdLZ1kwcmxvMDE3UER2Vnoyc1ZuYmtv?=
 =?utf-8?B?Ym41YlArcXJTRFJ3SXJzUG0vTzI2NzJvejMrNUhlWHlSZzZTdG0vMHU2RS9E?=
 =?utf-8?B?YmM5RWo5YTdvR3h1bDY3Q3U5SXh5YzNJQ1JBUE9UM05lZ0xBeGNESlo4K0Qz?=
 =?utf-8?B?MDdvZmlxbmR6VGN4VHlreVZUdlNwcHluZHNJbkcxZStQZ2pPaVdpQ2VpRUpp?=
 =?utf-8?Q?UZ7qf3J0Dccpm9LPp8K0W5GfR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?SzVGWm1wYjRydUt4Y3Q5RUt1L3hUZ0J5bnBlV3JDbUVaeGRVU2w3WWQxU2ta?=
 =?utf-8?B?ZUhSQ1FoV2toaGdjZGY1SnhYNHNPL0JobmVoVXZHL2xWNlpKMm0vYkNIRHll?=
 =?utf-8?B?VzNlbHVIYVNUTVVKLzNFT2lNalIxRVc2dEo5RERjcDFwM2NoZ1JiVk0yVWZm?=
 =?utf-8?B?OXN3NFpPV20vQlVPdGlzMTBkcHN4WVoyZFJPcGgrT2dLWVpXQUJvNTV3TE5Y?=
 =?utf-8?B?UjUvcWNSRGxQb1pRYzVXQkV4K3hOcWxDT1J6ZXFneDZIalViRzJzTGpsNGlq?=
 =?utf-8?B?Rmt2aFRSRG1lU2JKZ3BwWWJTdUdrVE9MeExWYkhhTUo0UDZyb2MrQzFkZll0?=
 =?utf-8?B?dlhqbjI5TERxdC9vcENHMFJhRTI3RFJ3NFQxN1cvVUk3NHZBYlc4ZGQvSi8x?=
 =?utf-8?B?VjBlQ1ZCVmRxcVZnQVo5V254Q0FOczVSSFVUaUtwNVlEYjN0dHJ2Y2pXTFJk?=
 =?utf-8?B?UFZqQStjVUU5WlZ1MkxDeTlmRU1GN3hSbDZsZ2EyOUpMVGVoZ3Jockc1TlZW?=
 =?utf-8?B?NXNRWk5xbnVFdURCZjIrRW9mdjVNVGFpdHNwVkFrK2NjSTFkejhGamlJYjRj?=
 =?utf-8?B?TENaS2FCaWVKM1M3SG1rWDJKZXpPZXIyT3Q5U0JEcUszTmpsb3pZU2VFd1dy?=
 =?utf-8?B?YjB4czNOWnhLS1Y5aVA4UUF3c0JrSGlIVzFWOTE0UHhVZEQySVdaL3VDZ3Y2?=
 =?utf-8?B?elIzNHp4UWFXb0J6LzFRTFdTVjBNWlhWT24zTnNlckRhdjFJQ095YXFqY1Qy?=
 =?utf-8?B?MlJxL0p5WENxbTJXOXpUNEh1SE0rV0RXSDc5SmJacGpsZ2lHQ2dJUE96VVIw?=
 =?utf-8?B?VHZIT1dKa2JNdk9ud3p5WlZzbVMyWVlEMGFNdjZyczdkODBXUHhwTkVtU1Qy?=
 =?utf-8?B?NVI4MVdpOVdaWkRHa2tTaGNVVi9zRFJnVHZZOUxnRi90R1RFai9ERUJlZjB1?=
 =?utf-8?B?MXpPRVNsTzBIaC9OTUhRWVFEaEF6aGQ3NEZTZGxOK1RsQkNJbmlWRHQzcC9T?=
 =?utf-8?B?T1ozR25PdVMwZzV4cm4ySHZtSmtMNWtWUW85aWh5a0pha0ovMnJZT3VwYTBZ?=
 =?utf-8?B?TmRvSjR6ck1BSklxM3ZFUmlZdDlBZWdJMnBiSndmQUNFTWhmVlVIeG5qQ1dK?=
 =?utf-8?B?aTVPYVpGWEJUalVacCtHbjBaSW9saDl6bXV6cmJIYTVJYmRsSVBFbDRGOGdp?=
 =?utf-8?B?TnJVczZLdHZtRTNBU0F5YXJJWFgzbENLdWZ5ZG5kMlhxREpRRHpPUG1acVIz?=
 =?utf-8?B?VloxQ0doeno3YU5GWTQ1c1czaU1JVkJXTmF6Tkh0TFpYZU0ycUNQNkdyWElP?=
 =?utf-8?B?a1pPaWVrdUhIOGVaWmdhNWJGYW1yNXY4V0pod1FudTBKWmVOK08xbEZBeko2?=
 =?utf-8?B?cnhjNnZlL3dqZEFOL29TM3d1MFBtVXF2eUViTndkNUdqQWNZTnlEU0hjWW5C?=
 =?utf-8?B?WVEvOHVMT0ZYSkZVNCs5bks2cm1jYTFPM3ViSzR2UXd3SFY1dk5xMjJaOENy?=
 =?utf-8?B?cTE3L0Z3MkhJSWR1cHdLS2k3VDJDdDBNSGNER1JGRXlaY2ptdU1WSVFKd1Mw?=
 =?utf-8?B?eS93V0Zvb05IUFhQc3RFWWphb011N0FRb2RzWlArMTNJdlQzS2hJNlFULzMw?=
 =?utf-8?Q?FOV1DFLfguGh9FeMDJsOwnil6ong2wQzdmn91aPJfJ0E=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f1d4ef-20be-4ec4-c77a-08daa658689c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 22:33:07.1752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JC3iDV7LDNj3Cw+6qZX+o2yQR9stftEm5MPhdUnIaWZ5OCzqRfCIGBz9wyokSAvO/wHsIQHZ0mFbMcLQ0PlCtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6362
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_09,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040145
X-Proofpoint-GUID: FdSYjqiep3MlQinLdqOcZRdiVeIUEzlB
X-Proofpoint-ORIG-GUID: FdSYjqiep3MlQinLdqOcZRdiVeIUEzlB
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.449, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--------------EalnFMSrw0x16EcOWI3IYXHd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/29/2022 12:13 AM, Michael S. Tsirkin wrote:
> On Wed, Sep 21, 2022 at 04:00:58PM -0700, Si-Wei Liu wrote:
>>>>>     The spec doesn't explicitly say anything about that
>>>>> as far as I see.
>>>> Here the spec is totally ruled by the (software artifact of)
>>>> implementation rather than what a real device is expected to work with
>>>> VLAN rx filters. Are we sure we'd stick to this flawed device
>>>> implementation? The guest driver seems to be agnostic with this broken
>>>> spec behavior so far, and I am afraid it's an overkill to add another
>>>> feature bit or ctrl command to VLAN filter in clean way.
>>>>
>>> I agree with all of the above. So, double checking, all vlan should be
>>> allowed by default at device start?
>> That is true only when VIRTIO_NET_F_CTRL_VLAN is not negotiated. If the
>> guest already negotiated VIRTIO_NET_F_CTRL_VLAN before being migrated,
>> device should resume with all VLANs filtered/disallowed.
>>
>>>    Maybe the spec needs to be more
>>> clear in that regard?
>> Yes, I think this is crucial. Otherwise we can't get consistent behavior,
>> either from software to vDPA, or cross various vDPA vendors.
> OK. Can you open a github issue for the spec? We'll try to address.
Thanks, ticket filed at:
https://github.com/oasis-tcs/virtio-spec/issues/147
> Also, is it ok if we make it a SHOULD, i.e. best effort filtering?
>
Yes, that's fine.

-Siwei
--------------EalnFMSrw0x16EcOWI3IYXHd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 9/29/2022 12:13 AM, Michael S.
      Tsirkin wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20220929031210-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">On Wed, Sep 21, 2022 at 04:00:58PM -0700, Si-Wei Liu wrote:
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">   The spec doesn't explicitly say anything about that
as far as I see.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Here the spec is totally ruled by the (software artifact of)
implementation rather than what a real device is expected to work with
VLAN rx filters. Are we sure we'd stick to this flawed device
implementation? The guest driver seems to be agnostic with this broken
spec behavior so far, and I am afraid it's an overkill to add another
feature bit or ctrl command to VLAN filter in clean way.

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I agree with all of the above. So, double checking, all vlan should be
allowed by default at device start?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">That is true only when VIRTIO_NET_F_CTRL_VLAN is not negotiated. If the
guest already negotiated VIRTIO_NET_F_CTRL_VLAN before being migrated,
device should resume with all VLANs filtered/disallowed.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">  Maybe the spec needs to be more
clear in that regard?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Yes, I think this is crucial. Otherwise we can't get consistent behavior,
either from software to vDPA, or cross various vDPA vendors.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
OK. Can you open a github issue for the spec? We'll try to address.</pre>
    </blockquote>
    Thanks, ticket filed at:<br>
    <a class="moz-txt-link-freetext" href="https://github.com/oasis-tcs/virtio-spec/issues/147">https://github.com/oasis-tcs/virtio-spec/issues/147</a><br>
    <blockquote type="cite" cite="mid:20220929031210-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">
Also, is it ok if we make it a SHOULD, i.e. best effort filtering?

</pre>
    </blockquote>
    Yes, that's fine.<br>
    <br>
    -Siwei<br>
  </body>
</html>

--------------EalnFMSrw0x16EcOWI3IYXHd--

