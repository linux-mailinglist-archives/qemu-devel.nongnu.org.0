Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE926A1B63
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 12:26:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVWCy-0008Ja-87; Fri, 24 Feb 2023 06:25:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pVWCn-0008Dz-OF
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 06:25:39 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pVWCY-00049P-QF
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 06:25:25 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31O1mkTf021846; Fri, 24 Feb 2023 11:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 from : subject : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=x3YCILqydBMOyQP6IpGPEE5looTAxV0fre18q+XFLGo=;
 b=sxPKNe4XoeWzmxtvKg5HMH602Kka66CB0OuVgX/QoQ2Pg3HX6ALU06lFIolqoEr8o1IX
 Ziq3iocrOFbPA9Vp4dhDlJRjUaZ0j+nZ0Mtv+z8SBY39YTO95UPEtlS+Y9Hm9qlBMJpa
 S3ChjKtlkPuFOIl5kddqjvnvJB8xypJO3WFMIZ9iaqtLsMODDUuoYojOsoqzuYWeWgyw
 AwLjD7dT5+aotak0uk9gJyRAUP0wQ1wAi548NxXXmqEFO4S8MrKOnXe2nhJX6urzW1EU
 wyhZFUlsFlgOt70TzeQ7PJdOtM0IdnPtoJEpgU6nJvE7ctK1J9ZYrGZsINCFbwzjpOi5 dA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntp9tvykk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Feb 2023 11:25:15 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31OAI05Z001887; Fri, 24 Feb 2023 11:25:15 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nxsb46759-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Feb 2023 11:25:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jg+vDHIR87s9ijyAXJVzNHCWqJErvOPg4bhwEvYhVnARPl6rpg89IjUcnAyyd30x1F3141/TnuBObQEFVI4SS4IouWgAE+u0MX7XoSIXeDHhBEdJkcjJvaMLJ4h0RIusurDyVtXi7mw6ijnhbCy3hXok/Dvix3a4uGgQyhdawCMkgpZ1ILAKSTtrDn/TcA0sanmH0iJspWYNFAcMp8irFLQVZTWbea/TexkrcAlHGUIAMhhueGnFag514yN2P4ROST/eVF6h6UPNxyypmqn2tfn+a2DFDg/0j2LJuISpK8AgV3vWhfk7rEosf+74CEPjb10JiKT+g9NbKJNVKp1aqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3YCILqydBMOyQP6IpGPEE5looTAxV0fre18q+XFLGo=;
 b=JHi2507grVgMVqHt8HurwRwEKM4zz/siKHS4T9kGR7K5MqM0pVDyuPUIWW0hehUfYXUeBTGtR8XtIptXlMdM8gZD+iBAN0+rT2QE87SHhs+bzndWUyEUewTKFPTF1QHbTczAnLjHr5GPOEN3Jaar/9axAp1mlqe4YoxQxeuWxfLkNnOW+jCyqZsIaQcdlj5/PsfAooTwhgMNy6+Y76+OtaojKakOhjixbhexUhbjOFg6BQzMjgAf59jjfyON1qkKrgkyA1aypotCD9+/7WXVUXW6YuZORGc6zf43UXtPhXuNACBWFizcxUtqBa8Cbx99Uky54eZGgCFcmeIpMFoKZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3YCILqydBMOyQP6IpGPEE5looTAxV0fre18q+XFLGo=;
 b=nnmGdkAxIVauzpWwKUMCgB4YLtUGcA3CqDncmsArklg3L19CvdGzJy4FUNwF07nifqyTqpRYPVzu23+IUXypCm0eii1xnLcWSmiXGoJ2NtHjuEi+z9v2t4raZdzgKKV2N7z6HM1kykPljKWaPmTj7D7NYz6+I0MlipQUNL9RxD8=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DM4PR10MB6814.namprd10.prod.outlook.com (2603:10b6:8:10a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.7; Fri, 24 Feb
 2023 11:25:12 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.011; Fri, 24 Feb 2023
 11:25:12 +0000
Message-ID: <3419a4d1-041f-f4f3-1d7d-ab3608bb54ac@oracle.com>
Date: Fri, 24 Feb 2023 11:25:05 +0000
From: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v2 17/20] vfio/common: Support device dirty page tracking
 with vIOMMU
To: Jason Gunthorpe <jgg@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-18-avihaih@nvidia.com>
 <20230222163439.68ad5e63.alex.williamson@redhat.com>
 <Y/bKoUBe17YNhGEA@nvidia.com>
 <20230223130633.4bd07948.alex.williamson@redhat.com>
 <Y/fS2rX+JvYVC9jR@nvidia.com>
 <20230223153309.298af6e1.alex.williamson@redhat.com>
 <Y/f2CJXGLLAtFezU@nvidia.com>
Content-Language: en-US
In-Reply-To: <Y/f2CJXGLLAtFezU@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::14) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|DM4PR10MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a82a01b-f444-4ae0-bd33-08db1659cb5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FNWNu4xwBidDEZ7OlXs35ISMqtf9KdMkseZ9RAGzFSLkEtAKoqBsrJ/jQBUFAH6TEqyjWAGgiyEb5Gpg4m0pfSv0iavyFYcMVvuq/ZF/olA5/dvKzDjKEudEV3uAanVSrFhDMxDxkwleqh9+nOis+gHZP0Oxgj5bIHSl9vdXXT0JvzlYavlnPRKq8KEpJZFqAVl0gBG7DsCZ9vQufW9nIYiJg2rS/6jU5l5NodFTQV9TJhpeUzchIo+wnW1aAQyZZenSGu+drG6jrbqsjC4L7/KX2+lsf5+bZNYbsNxaA6/NXxJB26vEamSSCEpJtK9CMMuxJoATIkNn72SzOYK6Zf34bFgXJQGAHmpmVqomavFDDBhIeRP9SnzwRobwQqKRzqeCmUHVPuXjyicGnhWYSc4QTfAlhDYVLet3e6+/O1+tzx3C+HjVvutSyxVIRHj5+ieH0q6hIg8Ln+Jnm6SPf16rPNzE129eeUCt/eHQA41DSYFeE1r/dOAgeFVFW/xWetbyf6jYS9Gl5ckmTpOKqmPrgDPwiF/Rbzgn9btSF1/mB59N4waQ9KGoMDhp/N+I5r1cLO6KUcVSvw4oDNZNRweiK3TDqPhcLDFaC1FrRQvHIrtMwVdZc5oSsLqW7JjpEjxHXW2sniqaUnLhp7CzoHdeZsGEIL5Y1r0sSnmdaHfItPxqf14B1mJ0XHGA/Q5zSEGaihrv+9UJ8Ljw/9kXVCruHiakXCAhqltHya98njc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199018)(6506007)(53546011)(26005)(186003)(6512007)(6666004)(83380400001)(86362001)(31696002)(36756003)(38100700002)(2616005)(41300700001)(66476007)(66556008)(4326008)(8676002)(66946007)(7416002)(5660300002)(31686004)(2906002)(8936002)(6486002)(478600001)(110136005)(54906003)(316002)(14143004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzRHSnJyKy9mVXlyMS9QS2puN1RIZzR1YTdiSTVZRk11L1drbHByZjRZRHlI?=
 =?utf-8?B?Zi9nSDVOWXhoTy9WZDJWSHNXRXRiYlV5M1dvYnVhc2hWTlZXWWUwWXVMRkxB?=
 =?utf-8?B?VDl4eTdNdXkySHlQV1MzYzVwNUR1OXZybXAyeDNjUGwxWUV4MVZyb3NuakJP?=
 =?utf-8?B?WkFpNkh2am5FNWM5UTUrL0szc1I5dnZXaWJzL0UrT1ptSHdtYUxYRXhoT2Jx?=
 =?utf-8?B?UXEvdlpxUDFwZnRRMW4rU2czVnJEUlZJQUpkNmkwdWEzTHo4NFlJNExHQkVC?=
 =?utf-8?B?ekxIZklaejdqeWNiS3BLZUd3a0V6QW9oVC9jeC9kTDVPUWZXdkxDWUlkYnA4?=
 =?utf-8?B?WFNibGYyY1EyaU9yS1dWaXRzaWRHY1RWblI1ZHZVUEIyM0RlSldJTVdjNUR0?=
 =?utf-8?B?QWxNOGhnYVlTZmRoRG4zMnh2dE9sL2x0cStrK3ZpMytGS2RWTk9rSmVZWkhH?=
 =?utf-8?B?NHZ2UENzMlRYWmJFa282L05keUM2R3JYdmx0aTBSUkZVZkova2JEMjNuempl?=
 =?utf-8?B?UlVMZVd5dk1maDZNelp3cU5qNEduNjczRFNsODFyWlBMbUhOT0NidXBOenVl?=
 =?utf-8?B?SUc5R21KU2p1YytCUmFUYzg1ckM4NjZpUGhQcU5PaEo0YzFuL1UwT2JZQms0?=
 =?utf-8?B?dXRFUnozVHJwcUR4T0J5S0VqQWVFekVPNFJxbUhlTVNQTzZTTVhuYlc4Vk0r?=
 =?utf-8?B?WWJ1bGtSaXJxYms3QnFQQ1lyMWY0cW41Z1dNOWt6aERhbHV3c3RJU2V5bG43?=
 =?utf-8?B?OEttY0UxdVFEWmNBWnR4VUxKb1ZjMEZSeHlwQ3NkckRzZ2U4MTJCWmtQblFU?=
 =?utf-8?B?VmpBWlNGK2FrOUFyNEtaeFBsdDQ5T29Hck4vSTArWmsrY1dsdFk4d2tvTnJ4?=
 =?utf-8?B?NUF1TFB3R2pUQ004NGY0a09MdmYvQndyc2ZjNjJ6OGFLVHNSUlJmajczN1Iy?=
 =?utf-8?B?eFo5bHVLMG5QUC9nbHhZOGtzUnVPaFNaNmR4c1diakJpZCsvNnNZNnBINVZH?=
 =?utf-8?B?V2FzTzNTbS8yTXJLNVExL0poZkRQb3IzTFhtSndMRjA0eUN2eGtFN2FiRXhX?=
 =?utf-8?B?eVlTaUVjQVcrYmx6RTdIcjJ1d2o2NDNtdkI3UHgwUHZqTld0cm9aeEl1S3Vr?=
 =?utf-8?B?RnJuSnpXTkRJSU1xZ1NCc004T1ErQzVjdm53U29DaFc1a1VnVG5hYTlaYXdz?=
 =?utf-8?B?WWZwZGNVNnpRWFl4WStPdnp1NmYxeU0zYVhhWjVudVlOU3BKbWZTZnpDSjBW?=
 =?utf-8?B?QXJuYmhRVDhtUHlFWkV4bVpMaVNsTEp5dVEvYWhodE1jeEpQTHZmVWVyaE5L?=
 =?utf-8?B?V2d2MStuOG1nZ09rcTRrUWJFbmNEWE9MNHZ2UG0xd05oL0NKOEFVN05UNFpQ?=
 =?utf-8?B?YTRNTFVuZTltZ3VudUc0QkU0Nzdpa1hBZ2RhdUZKeTVhVVdiaDNlNWc2OGpR?=
 =?utf-8?B?L2ZXUHV0OWRWQmFqdkI3RGtqL3RmenkzK1NURUpZanl2RmM1cHpac0Z3WFhC?=
 =?utf-8?B?bklnNlhyaEV2bm5sSTN5MEpuSlN2cG9BeGFvaDRkR2YrTjk3ZWhGeCszQlB6?=
 =?utf-8?B?bGcyemt1anVzNW93ZzBjdHBud1Urd09EZllLYVROeVExNTFFR2FtQ2pMRzNU?=
 =?utf-8?B?ZEZsRFJWcmxKUis2NCtlUzJESXlVRjBQc1lOeFVVbkpxSGdJclRUTDBkdkla?=
 =?utf-8?B?dmQreXREazNXSFI1Q1RkNjVLemIxZCtlVDhFd2Z0cXQ3VEswMnBWQzhpVXdE?=
 =?utf-8?B?elpMdVdkKzkwL01WaFV6VjJRdHcwUWFYSCtWUzI5RlpZeEZrMC8xQlZ6YWFM?=
 =?utf-8?B?OEZsdG1zMG91SWo4MGR6N3BvNVlBcng4OHRjbk5nUTRZZXhpZEZFL1hFYTha?=
 =?utf-8?B?aDVLWkE5eHJmYTMvZmN2R1NoLzhlSzl0UEZUWk9XZzdKbU5kWTVRbTAyVWhw?=
 =?utf-8?B?b0NLZzlrUVhHU3VrY1cweWdib3Y4T2FWK0ZDeTgzd0hrNTZSYlk0NEpUN05t?=
 =?utf-8?B?K1RNaGE5ZTNrWkFWdmQ4T2ZOc3Z1cEV0N2tiQmRtSmMvWnNQeXRCdXM1ditV?=
 =?utf-8?B?enBWZDlXOEFQS3NabWM0MGpBNGV0dVhHQzJHK3lvSkhMSVdCbk5sZmJwZFgz?=
 =?utf-8?B?amdTZlphdmhXR2VzWjNGcjFhRnNZME5Ld2prQ0hGaTdNYU5VTW5Oek0rWUF4?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: VDB969SPDGTaTcdF50ok6cYh+Y/0cRhEFO0yCAOzbaNdT6zSIIbmv48KJIDGwXvSlZ1UeC+bSqWGlrn5NR9LdKTYPWQFrIFA36qQa9yYUYK42EBnU+8q3gun7x43w29l8fwM/uyBHBFtWeuEv7UqmGd37R1IK69pMBdyl2P7Kx0pLTBnAk9ejG27mSaEfatChtpo7ao6BRFlCWnj0/tRLWJFwVZ8cl/p4pMr1vsgF3tS7zdWb0CR5qFXaNOnCp0kxAj1B+/xroAi4VFlqr9AKElBgg4nslkpRCWlFHC8drkLw3O9wFZvbQUU4UGSJyxhlWVV3c2/9ECoXV26rGycPao7cDgSQNe9giSAFA3jE6mpAfEaVF6Sewnmnk+FhBZwnAU7EbSm6fyux4YNvXGsqYAw85hoaII7HnjLkSgl2EPlcSMfIgkZumSUfGMZ6RI2GXQhVq6i/MJOVnDaQ+f/8nRL3ikydl8Mwtw1oe+8/6TsHOf/UBB4n4lRajAimggxMB3BUKUQjGDLoeN0sf3u9b8Ssbw8TvBFeItt4DXoldv8uN5WrmyS+naIdfcl2WiJU6FEVv5etUufUeod4urMB7kgp11GcM3OcQxW2tn94IbdmKxKJKFUgo2VUGE1vvstHFvYmCtHuu4H2uAoNlBB2VYYlLpCCxPpb6f2rdvHNeMTbwXE+AEYOP/8XNbNWfqGVNOCxVmOP+jLdSj8XB7I8UxJwAGO26qH0XGzFECtDR6JWLk9l3WDu447j6gxFk00Vva+BQvljMbWSi+OW5DllxEzyQjddQPK/JnK9SoT00omTaGfHipKSpPNItLv/f6PwhtBrb13FwqzHnpQ9RiC+Tc+ytipksKtGKR5t/77n/Afv3zTW/dUvqWnZ6i54Y+TKSeLfP/KMVPN00XcytKoUA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a82a01b-f444-4ae0-bd33-08db1659cb5b
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 11:25:12.5412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuChDeWMBnLBAkhIanY4F8fC/cj7hvzOeOAlcmhW+1r06v/v49JpUHnQjhQQgTiPHzFbsgJ3jvDm9Oy8eL62rx3e5iAex456VjHXeA8gn5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6814
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_06,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 mlxlogscore=883 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302240093
X-Proofpoint-GUID: sfLDMs5oTV4sV_jXVj0vL6PkdDQKEmnR
X-Proofpoint-ORIG-GUID: sfLDMs5oTV4sV_jXVj0vL6PkdDQKEmnR
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 23/02/2023 23:26, Jason Gunthorpe wrote:
> On Thu, Feb 23, 2023 at 03:33:09PM -0700, Alex Williamson wrote:
>> On Thu, 23 Feb 2023 16:55:54 -0400
>> Jason Gunthorpe <jgg@nvidia.com> wrote:
>>> On Thu, Feb 23, 2023 at 01:06:33PM -0700, Alex Williamson wrote:
>>> Or even better figure out how to get interrupt remapping without IOMMU
>>> support :\
>>
>> -machine q35,default_bus_bypass_iommu=on,kernel-irqchip=split \
>> -device intel-iommu,caching-mode=on,intremap=on
> 
> Joao?
> 
> If this works lets just block migration if the vIOMMU is turned on..

At a first glance, this looked like my regular iommu incantation.

But reading the code this ::bypass_iommu (new to me) apparently tells that
vIOMMU is bypassed or not for the PCI devices all the way to avoiding
enumerating in the IVRS/DMAR ACPI tables. And I see VFIO double-checks whether
PCI device is within the IOMMU address space (or bypassed) prior to DMA maps and
such.

You can see from the other email that all of the other options in my head were
either bit inconvenient or risky. I wasn't aware of this option for what is
worth -- much simpler, should work!

And avoiding vIOMMU simplifies the whole patchset too, if it's OK to add a live
migration blocker if `bypass_iommu` is off for any PCI device.

	Joao

