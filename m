Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D4268E0C7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 20:03:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPTEO-0005mV-2p; Tue, 07 Feb 2023 14:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPTEI-0005lr-9G
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:02:14 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPTEF-0003bL-2q
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:02:10 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317Ix8LC011114; Tue, 7 Feb 2023 19:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=X68f8850kl9TOk5y2ptinJeSCAlRAEOYs/fMZwMmDso=;
 b=BxGkqbc8esjegnJI6sC2lfRz3Cq8924k2Xnmkj9SjDkEH7uxOqnFpZZ9uXz4kMx4vHlD
 n2a9IX0cbzJZVnUcYXZxAJMIURbbiqVXjelzRPvMOWKEMrhw+ntFVLld22kQEwolpOXi
 DZRNvqdq2/vy8RkE/TyBeEemB9bwifAiw4v/jX1q4S++z+Pko/qGQLM0xWqYk1A8Zv46
 Ymi9ENpe4Fft1lDCEFTtP9Sktv+10+wsWMLYzyCVUl8xfSV8T1GzXipVI15icfaE13Sz
 MD3YMFy98E0B7jv95lhF8rzeCNfr8JbKZ4IpIuvLufgQ0D4wM6TmK3CBZH1zOORuUntb yQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhf8a6bc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 19:01:45 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 317I0Kks028764; Tue, 7 Feb 2023 19:01:44 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdtd4a7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 19:01:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4XoRj/wmf7qiInO7Ht9AMqRHKLGrfaYLnbfAGQA3vWvpCW9vwxv2ReWt1zjpVpHhya84WDWq1wHMtJaK+vnUND1Emei5cqvSx46suQrMEhWN59GWN7nsAa2bwipItKSTNSWr3WVsRqP1OF9OhFUaVRX0P+eYpBeplb7kB+B4rk9lXrxd+CJrqD4onXtpen+qPzmhfVwWN3isXMivc3Ec5CyNAmAP4rMuv4g1LQ20rxuUaBgaaSVhbefGbpOyvWihRCsokBdsoIGiCKmr2fui6EhcwLEXI3Kb7Tarhuq7DqiqUGDLxZLDoLowK16O/AQ3kYR54nkT1gLpI67T23L9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X68f8850kl9TOk5y2ptinJeSCAlRAEOYs/fMZwMmDso=;
 b=VgMYFl619p/C+09w8dBRivOoRYkjRThN11ZaRoLAyTOo9q91J9ECJiDMK4BK/BBviuOv6kI8Dm9zoNEaETr187rNwlXNfhj/bkq+aVk+NsgU7ilkEvozJqW841eIPgilNisYoUvgtfmwRUS8OwBHSuRnMSG1D0sXcHyozBkzF0gExJfiItMrBQgf8VBl9j5ItfJLSfagF5CkQmDI4qbqdFrpsxXh3wKUE9nNzUgXqE/2rfrHq5uWudJUuYvY/lPacwbXh5zrpshG9FdUfNGGP19KGQmW1yfwpSEct4hEEdywELz11XOgm+h1NIQtw1taXVTwqtjAFO4A/P5BUbmGtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X68f8850kl9TOk5y2ptinJeSCAlRAEOYs/fMZwMmDso=;
 b=UH0nzv5Ow62olfb9Uafq2oHncrp7xWYREUkBQAozwEokhDo8hZoNBIp+0o4uHMzwSKib/x8Zyh694tO8G4CKcV3Kh4wwHBn126ngNPHh56a6DN7F4n2v5xqhouXhJdjjeI0bFcik4ViajjNqcW0rEOy5SV6z4IGacZzEtHagjN4=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by SA1PR10MB6320.namprd10.prod.outlook.com (2603:10b6:806:253::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.16; Tue, 7 Feb
 2023 19:01:41 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c%9]) with mapi id 15.20.6086.016; Tue, 7 Feb 2023
 19:01:41 +0000
Message-ID: <6cefff77-30a7-32ab-4650-49852d32c6fc@oracle.com>
Date: Tue, 7 Feb 2023 14:01:36 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V9 00/46] Live Update
Content-Language: en-US
From: Steven Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>, Zheng Chuan
 <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
 <53075574-9e73-f773-ccb1-cca42a719801@oracle.com>
 <d0a2df99-5935-9b06-cc42-fd93488b59f5@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <d0a2df99-5935-9b06-cc42-fd93488b59f5@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0109.namprd04.prod.outlook.com
 (2603:10b6:806:122::24) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|SA1PR10MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: 37f5e167-a943-45f4-f39f-08db093dbf51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s1BF3aSElWYmHFw7zKiXOYqumAaOyYetvCrOGSbKQEirNWa+xP2G3w1DWpgi+705FXHfNEW0S1REYwNltg3KI2EtOj1Hd8vLEJglCqeGQNVNMrz4YjVuE3yRu4KkN/AnfPAL3eAbzI0spBz1L5jeFf/tlxSxD2XwSEtPUVMtyusbdptiZoQJsbtn67khI6ZjZiKVUBQwdkqMgPEMB82GmeGaVnRIrFldjp0Qe15J0yaci0NVjn/jjYmbjHBT9RSUGWfJ3HVcQeRlc0wUY4/0ZGfGXXoiwk3lDBLouWYGoYnAmGmDNKAV0W4tVZX+uw5AxCmepk39rJ+aAitz/XhpdRhJ3bmHL4sZd072Gfzs1tJefdvhD0xtpNLuXZ+i+wGr9CYdI5QEteNgN4of6wUpEjLOEuWmsBKA8/CdQDI5ou9zVBqEQ4OaDvkKquvoQjETxTxbidwSK0Nzt9V61v9lcZgggdK+2yTbMDvwqaqfxhLJaefj0Kw9N/BqqoxP1WDRDs4n/ThKfd4jZRE+vh0qcqXSFWkOIMfwI5GOdjES8vjgd3xEVq7TpOy63JpiOX8fV3Od6WxiovTH6/S2oMZCFlR8NVY7y+vJ4g4liAeMFpa9t2jjl77dfHZBx0/ye4i8n6thJlEEe3848m3cATNd+ju6xH98cwnQylhCTMWYK0UNm4JtH8WxGHGCb+/pyvtUFl8QKlZVIV/glm4ORTYkWVUWKg3AjQKrJRar8jwlBFRVi6xNzbZdc86cQLpc4AD5CbkZbP9Vl27q5MK6JXv4lida05WdkokBs2TpnMj2GpK2h+2z+vTOaLlB7Gq3JoxO212jcOhXUN6Vm7F9A+pNwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199018)(36756003)(15650500001)(44832011)(186003)(2906002)(30864003)(83380400001)(2616005)(31696002)(921005)(86362001)(38100700002)(66556008)(66476007)(66946007)(5660300002)(316002)(110136005)(8936002)(8676002)(7416002)(6666004)(41300700001)(6506007)(478600001)(53546011)(26005)(6512007)(36916002)(6486002)(966005)(66899018)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTdnM3VmWGRmWENseHNUUW40ajhoTWZuU3B3OXRXejBrVkMwYUVFNHhWOUhE?=
 =?utf-8?B?SnpqTVNNdC91TXJ4R3RuMzQrQXlMZHVBK016VU96TkFzS3hXaFEvVndCZkJl?=
 =?utf-8?B?cVhhaGNFSitucWVDRWMySnFCV2JpUmgxSHdOMUdxWXZ1VWkveTA2MmI2UWRY?=
 =?utf-8?B?OGNDT3ZMeDU2dE96d1NiVDN5K1kvaGVnSzkzcm9Oa2o3OEJ6L2RBN0RRajkx?=
 =?utf-8?B?U1dDNTNvUWNIeUt5THFXSWFJWGhTWlZQcm9pYlJjOUdxdURTRlMwSEtKb1hx?=
 =?utf-8?B?blNLSkgxOFoxOXlDdlVBNElvTXJKdmVKYWVrMXMrN0F3NmlzNnNFU28zRUhR?=
 =?utf-8?B?eFRuaWJZMFhFb0FXVENvdnJ4SzRTM1QvRXdiR2hJbGx3RlVkcDRLTDVZSXdq?=
 =?utf-8?B?c0dRTmVCTXFGd0VDbVg0TXQzeEcyQ0I0azlBblN6SmNnWVN4a1ZFazg2anRG?=
 =?utf-8?B?TFV3TElwNysxY3UxUFdNY2VGZkxYejIrYS9scUl1dXhCdktIcml2MVoyNU5G?=
 =?utf-8?B?VHQ2TmpISDZ0bEM2dzMxZFplSU5VZC9GMFNRQ0ErSi91VmZwY1RmZ2VSZUdE?=
 =?utf-8?B?SFNocVRnOWEzSnJ3RXRGZEJIbXpiZm9WMnF6QlE1c0daSmdwMlh4elJuYzZu?=
 =?utf-8?B?N3IzVG13TUk4UjVCcElqY1BEakRpb1IrV3greW9CVXd5ZTk0M0ZYMkNaYjVW?=
 =?utf-8?B?STBleGdwbUNoa3dOTzRPQkNEMVJTcGFhS0toclVicitRbmErTVBlbXFwYWh1?=
 =?utf-8?B?MUhYN3FIMFFWQmFXcGJnSWsrZ1ZxaE1WblhjbVlFeUpDOE90UlVxTXIvYXoy?=
 =?utf-8?B?amMxTWZMaWN3a3Z5Wkh0SGRJMnNYQmZEMFY1aWNEK0I3Z09KSEgxMlhieThW?=
 =?utf-8?B?TmU1RkpzL3BkWG9FZ0k2L1FXZWplNWNlUWF0ZDh0enBTRG1DVUhMdnAyK2gy?=
 =?utf-8?B?VW05cFo3ZldPNDBveDdSUS9OMFJIK3IzL2s1NXIzZzN6YmNWSDUvRmZpcElu?=
 =?utf-8?B?Z1BWbzNXV3d0YjFWcE10REIwSTFFcTBNRXBZeHF3WThrSzZVdllXaHFaU253?=
 =?utf-8?B?di9HeFBtZW5vMnVIblFmUmFVZW12dmdQZm9nNVBCTVF6aUxCaDk3bmQ3cHhY?=
 =?utf-8?B?WlJWY2xjQUlRNHN0R1B5ZlludzMwSmtMSGJjRWZXTkwxNURTSTY1d3RvcHhm?=
 =?utf-8?B?Zm5HTUpGeHE1L21sc2w1d3ZXdGM1dnNiUFhUMThMNlAwVUUyNDAyRWJFcWEv?=
 =?utf-8?B?SGEwMVVub0tlaWdvZURKMWdybXA1dE9lK3V6VjVDYTUvZHE4M3dOeHlnTkpw?=
 =?utf-8?B?S1IwVzlnSlJXbER2THlWVEljeCtDQnEyUEI4bXg2c09icUlRcDFDL2lYRUpv?=
 =?utf-8?B?MFhKVHBNeEs0SW9ITXE3VW9mVmVBRXRnZEprN0VvU3BNbW5RUDdDSzdtSncr?=
 =?utf-8?B?SG5MTjNEREFlTzRYR0IwdnVOektNQVhQL1VzMTZCUklwTENQS3dpdzYzWmZM?=
 =?utf-8?B?N3FLdGtmOG5lV2NOLzZsZXh1Z3llOWM5bG82ZFd3OTdPL2dEMWxjWW1pN2xN?=
 =?utf-8?B?ZE0yWHlkV1dZUHBZTTVVU1Y5SnY2VTJjLzJkTHVrYm5XZ0RKSVZONXBsZW8r?=
 =?utf-8?B?SjlrSWdCazBKT1gxWDNYbisxZDV5NmNRdXI4T2tLYVlTNHVjdmtpUzlPcEo5?=
 =?utf-8?B?eXFOS1VMNWV3OW9mYWdSZlorZEJEUGZ1ejdXK3hKZU5zTCtrNDhrbHpEZ092?=
 =?utf-8?B?YnJJdU5vUWI0MUNZQUd4bXhVNXdvVUc3S1hnRWMwdXlTMXhCeVVMdmZXdVFw?=
 =?utf-8?B?OEZjQlpEVUpKc2RPcW8rR3BQb1B4ejA5d3hVOHcxdWcxUlRzQmlTV2QxeWVn?=
 =?utf-8?B?UHRhZUdaeG54a25oNGlodFlrVTFESEhJSjVMWW5xTmNSMWpBVzRHbEp4Uk1F?=
 =?utf-8?B?dGNMazhyUlVSMkxIYTNDNXlOLzdIR2lMV09lN1RUZlJaMXorMFRITk9KRHpu?=
 =?utf-8?B?NnBacmJETEpuQnV0T2ViaVlncjBGMTRMVU5QdEREWkNUY0U5WGtNY2xCQTVw?=
 =?utf-8?B?Qi9TUjBWQzRrWVpFY21RVk53NW9yU3ZaSzMwdXdPSHdkSEFsNmtweWZPd1N1?=
 =?utf-8?B?NTZBZ2YrVDVtdnp2bThVaGxIVjM1QTNWN1RLREhUanVBdExwUG1JN2lNRHFs?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?NlBOdktRUWlSdzVuVkc1SXlMRUQrZHlWL2FQdHgrSktLaG5RTjliSmFVQ0dk?=
 =?utf-8?B?aWZRTUpNTmMrd2ZlUVJQaVVoRTU0YzJrQ3A1NndJRy9rQjJBVnpNREdTZlo1?=
 =?utf-8?B?ai85ekpsZFRCR0RGaVQzOTVUcDAzRDRjNE00NnJUOHp2cWgwSDhLb1diMzUr?=
 =?utf-8?B?Zk56MXR4aEVEVVR1ckMyamZwYmQrK0lucU5oZk1SRDNyUFh4K3lmeEJYSFBX?=
 =?utf-8?B?ZExLMVRTVHM3ekdteVVuT2FHeXQ1WFZQRFNwSjFUc1JVN2tHYWFlcUxQb3N2?=
 =?utf-8?B?eGVLRW81VXhZQURqRUUvVWQzNnNBYnFDbUhLcWw5L1g4R2lDTDdBdkpyMXRy?=
 =?utf-8?B?ZFgxWlhZZllaZkozcmVPR3FtUmpIM240S1RmQm5FSXhKZVBNMmszaEpvbndN?=
 =?utf-8?B?eG5zL0FtUE1aQlAwT2FmSWp4bnA4YWRBQjhnVVluWndQZ2R2SUhseDRsMHBR?=
 =?utf-8?B?RUlheUd2NGhIcVhlZUVpS3VTZHJUQTdDak1PeVpENzBYZXBUeEIxTlV4NTMv?=
 =?utf-8?B?aDcrRW9tUWF6SXdmV1I3SXRreGl2SkNmdzEwU1lXekUxdTZYTjRMaE1pREFp?=
 =?utf-8?B?K2RXOEVtK21RRU5XZ2VnSElVNmwyVmdLbXlWeURNRlBnOFdycDUvMXJBcExy?=
 =?utf-8?B?NE84Nis4VHM3Vm15NjU5SGl1SDFidGZ5YmdLdStqSkNyckxQOGpZQTY3WHI2?=
 =?utf-8?B?RWVEYzJTdmlSRUhYcEJ2UVdrdTlNdnNiWmVaeEsvcFgzdURacG5WUkRWdGw1?=
 =?utf-8?B?YlZySjZvdXlZUk52Um1hUFdMZ2ZUWnYxdjZRUzVpZVRWWHRUVC9QMnEyN2ZX?=
 =?utf-8?B?QWF0VEhBMWg2OExaM0JWK0ErZmloekVhVHBOWU05ZFJ4enlpZSt3RDZ0VXpk?=
 =?utf-8?B?dWtpWFo3MTJyOFJ2WDZhNGNpVWJFeTk4b3JRcW1HYW9ZRkEzUnIrZ2pOazVG?=
 =?utf-8?B?VkVVWi9tTTdjcTVxOW1YQ1Y1ZlljY0huMmc5NXV4NjYwTFVVQmd6UW5hUGZQ?=
 =?utf-8?B?MktUb2xJTUJGN3FZbzJ3SkVCMlhYelVvdTdYWFFKYWtXMlVwMjBuMFNVVnVI?=
 =?utf-8?B?R1kwSmtkcGtxWWJzU0pKamR2TVJDVzMrc0JIdFRlSTIyYWtNK2hyRnB1emVn?=
 =?utf-8?B?VmluQ3dnWGJ6ckQxdEducGdqMnVXMjlwVEZSUGEydXNPVzhPS0tvOWxBMXBC?=
 =?utf-8?B?Mm5qcnROclJGWXdRU054dnN3SSt3NFhsbHIzTkxreXdpUm80YnY4K3IrV1g2?=
 =?utf-8?Q?ciQR83/40RjhuSf?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f5e167-a943-45f4-f39f-08db093dbf51
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 19:01:41.2405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tW357GmhhIUz8fIzJECI4NHZdqVW5M7rS3fmPjBKDK6um2TGclcb8h0w+xhlKu2E4IxymiUTAw270nfhzmkHFpVqWQOwkyWV0WN0+xtucw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6320
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_11,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070169
X-Proofpoint-ORIG-GUID: kbIjff9zuWFBl6m0DaHQM28fDc3NWFY7
X-Proofpoint-GUID: kbIjff9zuWFBl6m0DaHQM28fDc3NWFY7
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

and of course I immediately screwed up and forgot to delete series numbers from
the email titles.  I will resend.

- Steve

On 2/7/2023 1:44 PM, Steven Sistare wrote:
> To make forward progress on this series and reduce its size, I will be posting
> those of its patches that can be independently integrated and have some value
> on their own, to a reduced distribution of reviewers for each.  This is what
> I plan to break out:
> 
> migration: fix populate_vfio_info
> 
> memory: RAM_NAMED_FILE flag
> 
> memory: flat section iterator
> 
> oslib: qemu_clear_cloexec
> 
> migration: simplify blockers
> 
> migration: simplify notifiers
> 
> python/machine: QEMUMachine full_args
> 
> python/machine: QEMUMachine reopen_qmp_connection
> 
> qapi: strList_from_string
> qapi: QAPI_LIST_LENGTH
> qapi: strv_from_strList
> qapi: strList unit tests
> 
> - Steve
> 
> On 12/7/2022 10:48 AM, Steven Sistare wrote:
>> This series desperately needs review in its intersection with live migration.
>> The code in other areas has been reviewed and revised multiple times -- thank you!
>>
>> David, Juan, can you spare some time to review this?  I have done my best to order 
>> the patches logically (see the labelled groups in this email), and to provide 
>> complete and clear cover letter and commit messages. Can I do anything to facilitate,
>> like doing a code walk through via zoom?
>>
>> And of course, I welcome anyone's feedback.
>>
>> Here is the original posting.
>>
>> https://lore.kernel.org/qemu-devel/1658851843-236870-1-git-send-email-steven.sistare@oracle.com/
>>
>> - Steve
>>
>> On 7/26/2022 12:09 PM, Steve Sistare wrote:
>>> This version of the live update patch series integrates live update into the
>>> live migration framework.  The new interfaces are:
>>>   * mode (migration parameter)
>>>   * cpr-exec-args (migration parameter)
>>>   * file (migration URI)
>>>   * migrate-mode-enable (command-line argument)
>>>   * only-cpr-capable (command-line argument)
>>>
>>> Provide the cpr-exec and cpr-reboot migration modes for live update.  These
>>> save and restore VM state, with minimal guest pause time, so that qemu may be
>>> updated to a new version in between.  The caller sets the mode parameter
>>> before invoking the migrate or migrate-incoming commands.
>>>
>>> In cpr-reboot mode, the migrate command saves state to a file, allowing
>>> one to quit qemu, reboot to an updated kernel, start an updated version of
>>> qemu, and resume via the migrate-incoming command.  The caller must specify
>>> a migration URI that writes to and reads from a file.  Unlike normal mode,
>>> the use of certain local storage options does not block the migration, but
>>> the caller must not modify guest block devices between the quit and restart.
>>> The guest RAM memory-backend must be shared, and the @x-ignore-shared
>>> migration capability must be set, to avoid saving it to the file.  Guest RAM
>>> must be non-volatile across reboot, which can be achieved by backing it with
>>> a dax device, or /dev/shm PKRAM as proposed in
>>> https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-anthony.yznaga@oracle.com
>>> but this is not enforced.  The restarted qemu arguments must match those used
>>> to initially start qemu, plus the -incoming option.
>>>
>>> The reboot mode supports vfio devices if the caller first suspends the guest,
>>> such as by issuing guest-suspend-ram to the qemu guest agent.  The guest
>>> drivers' suspend methods flush outstanding requests and re-initialize the
>>> devices, and thus there is no device state to save and restore.  After
>>> issuing migrate-incoming, the caller must issue a system_wakeup command to
>>> resume.
>>>
>>> In cpr-exec mode, the migrate command saves state to a file and directly
>>> exec's a new version of qemu on the same host, replacing the original process
>>> while retaining its PID.  The caller must specify a migration URI that writes
>>> to and reads from a file, and resumes execution via the migrate-incoming
>>> command.  Arguments for the new qemu process are taken from the cpr-exec-args
>>> migration parameter, and must include the -incoming option.
>>>
>>> Guest RAM must be backed by a memory backend with share=on, but cannot be
>>> memory-backend-ram.  The memory is re-mmap'd in the updated process, so guest
>>> ram is efficiently preserved in place, albeit with new virtual addresses.
>>> In addition, the '-migrate-mode-enable cpr-exec' option is required.  This
>>> causes secondary guest ram blocks (those not specified on the command line)
>>> to be allocated by mmap'ing a memfd.  The memfds are kept open across exec,
>>> their values are saved in special cpr state which is retrieved after exec,
>>> and they are re-mmap'd.  Since guest RAM is not copied, and storage blocks
>>> are not migrated, the caller must disable all capabilities related to page
>>> and block copy.  The implementation ignores all related parameters.
>>>
>>> The exec mode supports vfio devices by preserving the vfio container, group,
>>> device, and event descriptors across the qemu re-exec, and by updating DMA
>>> mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_VADDR and
>>> VFIO_DMA_MAP_FLAG_VADDR as defined in
>>>   https://lore.kernel.org/kvm/1611939252-7240-1-git-send-email-steven.sistare@oracle.com
>>> and integrated in Linux kernel 5.12.
>>>
>>> Here is an example of updating qemu from v7.0.50 to v7.0.51 using exec mode.
>>> The software update is performed while the guest is running to minimize
>>> downtime.
>>>
>>> window 1                                        | window 2
>>>                                                 |
>>> # qemu-system-$arch ...                         |
>>>   -migrate-mode-enable cpr-exec                 |
>>> QEMU 7.0.50 monitor - type 'help' ...           |
>>> (qemu) info status                              |
>>> VM status: running                              |
>>>                                                 | # yum update qemu
>>> (qemu) migrate_set_parameter mode cpr-exec      |
>>> (qemu) migrate_set_parameter cpr-exec-args      |
>>>   qemu-system-$arch ... -incoming defer         |
>>> (qemu) migrate -d file:/tmp/qemu.sav            |
>>> QEMU 7.0.51 monitor - type 'help' ...           |
>>> (qemu) info status                              |
>>> VM status: paused (inmigrate)                   |
>>> (qemu) migrate_incoming file:/tmp/qemu.sav      |
>>> (qemu) info status                              |
>>> VM status: running                              |
>>>
>>>
>>> Here is an example of updating the host kernel using reboot mode.
>>>
>>> window 1                                        | window 2
>>>                                                 |
>>> # qemu-system-$arch ... mem-path=/dev/dax0.0    |
>>>   -migrate-mode-enable cpr-reboot               |
>>> QEMU 7.0.50 monitor - type 'help' ...           |
>>> (qemu) info status                              |
>>> VM status: running                              |
>>>                                                 | # yum update kernel-uek
>>> (qemu) migrate_set_parameter mode cpr-reboot    |
>>> (qemu) migrate -d file:/tmp/qemu.sav            |
>>> (qemu) quit                                     |
>>>                                                 |
>>> # systemctl kexec                               |
>>> kexec_core: Starting new kernel                 |
>>> ...                                             |
>>>                                                 |
>>> # qemu-system-$arch mem-path=/dev/dax0.0 ...    |
>>>   -incoming defer                               |
>>> QEMU 7.0.51 monitor - type 'help' ...           |
>>> (qemu) info status                              |
>>> VM status: paused (inmigrate)                   |
>>> (qemu) migrate_incoming file:/tmp/qemu.sav      |
>>> (qemu) info status                              |
>>> VM status: running                              |
>>>
>>> Changes from V8 to V9:
>>>   vfio:
>>>     - free all cpr state during unwind in vfio_connect_container
>>>     - change cpr_resave_fd to return void, and avoid new unwind cases
>>>     - delete incorrect .unmigratable=1 in vmstate handlers
>>>     - add route batching in vfio_claim_vectors
>>>     - simplified vfio intx cpr code
>>>     - fix commit message for 'recover from unmap-all-vaddr failure'
>>>     - verify suspended runstate for cpr-reboot mode
>>>   Other:
>>>     - delete cpr-save, cpr-exec, cpr-load
>>>     - delete ram block vmstate handlers that were added in V8
>>>     - rename cpr-enable option to migrate-mode-enable
>>>     - add file URI for migration
>>>     - add mode and cpr-exec-args migration parameters
>>>     - add per-mode migration blockers
>>>     - add mode checks in migration notifiers
>>>     - fix suspended runstate during migration
>>>     - replace RAM_ANON flag with RAM_NAMED_FILE
>>>     - support memory-backend-epc
>>>
>>> Steve Sistare (44):
>>>   migration: fix populate_vfio_info                  ---  reboot mode  ---
>>>   memory: RAM_NAMED_FILE flag
>>>   migration: file URI
>>>   migration: mode parameter
>>>   migration: migrate-enable-mode option
>>>   migration: simplify blockers
>>>   migration: per-mode blockers
>>>   cpr: relax some blockers
>>>   cpr: reboot mode
>>>
>>>   qdev-properties: strList                           ---  exec mode ---
>>>   qapi: strList_from_string
>>>   qapi: QAPI_LIST_LENGTH
>>>   qapi: strv_from_strList
>>>   qapi: strList unit tests
>>>   migration: cpr-exec-args parameter
>>>   migration: simplify notifiers
>>>   migration: check mode in notifiers
>>>   memory: flat section iterator
>>>   oslib: qemu_clear_cloexec
>>>   vl: helper to request re-exec
>>>   cpr: preserve extra state
>>>   cpr: exec mode
>>>   cpr: add exec-mode blockers
>>>   cpr: ram block blockers
>>>   cpr: only-cpr-capable
>>>   cpr: Mismatched GPAs fix
>>>   hostmem-memfd: cpr support
>>>   hostmem-epc: cpr support
>>>
>>>   pci: export msix_is_pending                       --- vfio for exec ---
>>>   vfio-pci: refactor for cpr
>>>   vfio-pci: cpr part 1 (fd and dma)
>>>   vfio-pci: cpr part 2 (msi)
>>>   vfio-pci: cpr part 3 (intx)
>>>   vfio-pci: recover from unmap-all-vaddr failure
>>>
>>>   chardev: cpr framework                            --- misc for exec ---
>>>   chardev: cpr for simple devices
>>>   chardev: cpr for pty
>>>   python/machine: QEMUMachine full_args
>>>   python/machine: QEMUMachine reopen_qmp_connection
>>>   tests/avocado: add cpr regression test
>>>
>>>   vl: start on wakeup request                       --- vfio for reboot ---
>>>   migration: fix suspended runstate
>>>   migration: notifier error reporting
>>>   vfio: allow cpr-reboot migration if suspended
>>>
>>> Mark Kanda, Steve Sistare (2):
>>>   vhost: reset vhost devices for cpr
>>>   chardev: cpr for sockets
>>>
>>>  MAINTAINERS                         |  14 ++
>>>  accel/xen/xen-all.c                 |   3 +
>>>  backends/hostmem-epc.c              |  18 +-
>>>  backends/hostmem-file.c             |   1 +
>>>  backends/hostmem-memfd.c            |  22 ++-
>>>  backends/tpm/tpm_emulator.c         |  11 +-
>>>  block/parallels.c                   |   7 +-
>>>  block/qcow.c                        |   7 +-
>>>  block/vdi.c                         |   7 +-
>>>  block/vhdx.c                        |   7 +-
>>>  block/vmdk.c                        |   7 +-
>>>  block/vpc.c                         |   7 +-
>>>  block/vvfat.c                       |   7 +-
>>>  chardev/char-mux.c                  |   1 +
>>>  chardev/char-null.c                 |   1 +
>>>  chardev/char-pty.c                  |  16 +-
>>>  chardev/char-serial.c               |   1 +
>>>  chardev/char-socket.c               |  48 +++++
>>>  chardev/char-stdio.c                |  31 +++
>>>  chardev/char.c                      |  49 ++++-
>>>  dump/dump.c                         |   4 +-
>>>  gdbstub.c                           |   1 +
>>>  hmp-commands.hx                     |   2 +-
>>>  hw/9pfs/9p.c                        |  11 +-
>>>  hw/core/qdev-properties-system.c    |  12 ++
>>>  hw/core/qdev-properties.c           |  44 +++++
>>>  hw/display/virtio-gpu-base.c        |   8 +-
>>>  hw/intc/arm_gic_kvm.c               |   3 +-
>>>  hw/intc/arm_gicv3_its_kvm.c         |   3 +-
>>>  hw/intc/arm_gicv3_kvm.c             |   3 +-
>>>  hw/misc/ivshmem.c                   |   8 +-
>>>  hw/net/virtio-net.c                 |  10 +-
>>>  hw/pci/msix.c                       |   2 +-
>>>  hw/pci/pci.c                        |  12 ++
>>>  hw/ppc/pef.c                        |   2 +-
>>>  hw/ppc/spapr.c                      |   2 +-
>>>  hw/ppc/spapr_events.c               |   2 +-
>>>  hw/ppc/spapr_rtas.c                 |   2 +-
>>>  hw/remote/proxy.c                   |   7 +-
>>>  hw/s390x/s390-virtio-ccw.c          |   9 +-
>>>  hw/scsi/vhost-scsi.c                |   9 +-
>>>  hw/vfio/common.c                    | 235 +++++++++++++++++++----
>>>  hw/vfio/cpr.c                       | 177 ++++++++++++++++++
>>>  hw/vfio/meson.build                 |   1 +
>>>  hw/vfio/migration.c                 |  23 +--
>>>  hw/vfio/pci.c                       | 336 ++++++++++++++++++++++++++++-----
>>>  hw/vfio/trace-events                |   1 +
>>>  hw/virtio/vhost-vdpa.c              |   6 +-
>>>  hw/virtio/vhost.c                   |  32 +++-
>>>  include/chardev/char-socket.h       |   1 +
>>>  include/chardev/char.h              |   5 +
>>>  include/exec/memory.h               |  48 +++++
>>>  include/exec/ram_addr.h             |   1 +
>>>  include/exec/ramblock.h             |   1 +
>>>  include/hw/pci/msix.h               |   1 +
>>>  include/hw/qdev-properties-system.h |   4 +
>>>  include/hw/qdev-properties.h        |   3 +
>>>  include/hw/vfio/vfio-common.h       |  12 ++
>>>  include/hw/virtio/vhost.h           |   1 +
>>>  include/migration/blocker.h         |  69 ++++++-
>>>  include/migration/cpr-state.h       |  30 +++
>>>  include/migration/cpr.h             |  20 ++
>>>  include/migration/misc.h            |  13 +-
>>>  include/migration/vmstate.h         |   2 +
>>>  include/qapi/util.h                 |  28 +++
>>>  include/qemu/osdep.h                |   9 +
>>>  include/sysemu/runstate.h           |   2 +
>>>  migration/cpr-state.c               | 362 ++++++++++++++++++++++++++++++++++++
>>>  migration/cpr.c                     |  85 +++++++++
>>>  migration/file.c                    |  62 ++++++
>>>  migration/file.h                    |  14 ++
>>>  migration/meson.build               |   3 +
>>>  migration/migration.c               | 268 +++++++++++++++++++++++---
>>>  migration/ram.c                     |  24 ++-
>>>  migration/target.c                  |   1 +
>>>  migration/trace-events              |  12 ++
>>>  monitor/hmp-cmds.c                  |  59 +++---
>>>  monitor/hmp.c                       |   3 +
>>>  monitor/qmp.c                       |   4 +
>>>  python/qemu/machine/machine.py      |  14 ++
>>>  qapi/char.json                      |   7 +-
>>>  qapi/migration.json                 |  68 ++++++-
>>>  qapi/qapi-util.c                    |  37 ++++
>>>  qemu-options.hx                     |  50 ++++-
>>>  replay/replay.c                     |   4 +
>>>  softmmu/memory.c                    |  31 ++-
>>>  softmmu/physmem.c                   | 100 +++++++++-
>>>  softmmu/runstate.c                  |  42 ++++-
>>>  softmmu/vl.c                        |  10 +
>>>  stubs/cpr-state.c                   |  26 +++
>>>  stubs/meson.build                   |   2 +
>>>  stubs/migr-blocker.c                |   9 +-
>>>  stubs/migration.c                   |  33 ++++
>>>  target/i386/kvm/kvm.c               |   8 +-
>>>  target/i386/nvmm/nvmm-all.c         |   4 +-
>>>  target/i386/sev.c                   |   2 +-
>>>  target/i386/whpx/whpx-all.c         |   3 +-
>>>  tests/avocado/cpr.py                | 176 ++++++++++++++++++
>>>  tests/unit/meson.build              |   1 +
>>>  tests/unit/test-strlist.c           |  81 ++++++++
>>>  trace-events                        |   1 +
>>>  ui/spice-core.c                     |   5 +-
>>>  ui/vdagent.c                        |   5 +-
>>>  util/oslib-posix.c                  |   9 +
>>>  util/oslib-win32.c                  |   4 +
>>>  105 files changed, 2781 insertions(+), 330 deletions(-)
>>>  create mode 100644 hw/vfio/cpr.c
>>>  create mode 100644 include/migration/cpr-state.h
>>>  create mode 100644 include/migration/cpr.h
>>>  create mode 100644 migration/cpr-state.c
>>>  create mode 100644 migration/cpr.c
>>>  create mode 100644 migration/file.c
>>>  create mode 100644 migration/file.h
>>>  create mode 100644 stubs/cpr-state.c
>>>  create mode 100644 stubs/migration.c
>>>  create mode 100644 tests/avocado/cpr.py
>>>  create mode 100644 tests/unit/test-strlist.c
>>>

