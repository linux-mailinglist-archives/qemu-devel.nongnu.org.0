Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B306D65D9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:54:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pji1X-0007Xm-AJ; Tue, 04 Apr 2023 10:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pji1T-0007Wv-Jh; Tue, 04 Apr 2023 10:52:35 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1pji1P-0000pE-DI; Tue, 04 Apr 2023 10:52:35 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 334Du4qS028335; Tue, 4 Apr 2023 14:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=MDd35Xe+ZPsxpPYoAJshAr7H4mLsf+hYa0IQYcTxV5U=;
 b=Vy4SEesXfR4ht97Y7AodWaOlFe3JVY+7YTubfKY8Jy1i9HIhb6kXdkfnS9dNfyWcZmyM
 BevS8Jc7IlRYYYVscVg3lhLi45LeAxTWuo4POtw+THRuiswzAWwEMuWdbnrHUbeAWEgA
 WsfLrciws2oJowfgOR4+i7IjVX2plTGuN8gM7fAgSb19//j1c9p5+PV6fSHgtHZ5OQNQ
 uBk5zeW4nxuv0u/Amoug1cXdvZkKziBBF6dcpYIP3TUJPyktXRaR5Ab8K6qvBbwQ7txA
 rMgU8bVqn240zZG6T6IUIrJGA/l+u/BQCAd0fg7BQCI/yPVvvRdNG2XgKmola7K3ikBr qg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ppd5ue17f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Apr 2023 14:52:22 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 334EcaED039503; Tue, 4 Apr 2023 14:52:21 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ppt26g1wr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Apr 2023 14:52:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIxMwz+FeqkNy9Arbp1HxeY1NHYDRGFMC6y4khVVoT6JYz6MyqRYjDsSShZmaCnBheVnZZm+WaFmzRDEKtM5iCRsZAD0RpX3L7vp001jy0xEivEFg64L9DZyfrx9nMy+ulU9kDy16/q1uFViCjQKCVvkcMwTv4++dUQc/EFFOAy5D4siydVS4UQpUEmLNNg1xg/Z1SANLGhlxVeUGQPia8WRycmPHrYQ7MoXmgw+zLCgn2yHfoQrK4el/A2hRraM3LmMr1NaiHryxQukbvnV2x1xIbaGa1+7D4t0csdnf1GtycRKs1aHVALpaAF0fGaPUOV2yUdCkUh5iaB1iN9yzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDd35Xe+ZPsxpPYoAJshAr7H4mLsf+hYa0IQYcTxV5U=;
 b=V66F4jcnHpHeurCTCxsqnq1v7dj/Oks8SKM5/92+UsVES801sP8JAKs21LifwYV9o8NYzLaiLK60CGWfC7LstJBhCzcwmRGKxfcMH5BQbA+H+uTB1YLjbGEnuIErKyLYHpeflZsYSsYKjqz75gW+hBxJbrl+KqVmLsa40oq3bkrmJwd+QLtNOIWABs5zuNWz0/okZvMCujy3d7k6fD8FdLgUCEAxm3ET6+jyZ38zPFEQ0+d8pLHn033oWF2Vkjt2TBT+brfFwPNaiULC8nP17qPeIrtV8CSPxbJDG8u5yE4xIgfdFLwKXOSXk+PjbKEGlxD+JIfUXoBM4Mr5BAtD9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDd35Xe+ZPsxpPYoAJshAr7H4mLsf+hYa0IQYcTxV5U=;
 b=Gxyza1C2caoFdBDJS95RNbr7uEKU3I20K/PrHpQazVmrGRJ4LLVOnjXYDZUlE/xkYW3ofVTl4OreiNVUwJOdNuq6eKktCq4PvsePyBF9v2xPkMDxmSQkCesFTx0UaWZHu8qlV7cFz8wK14sb38hAlZdyWh/ECO6kaiKsz4Bcaoc=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM4PR10MB6160.namprd10.prod.outlook.com (2603:10b6:8:bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 4 Apr
 2023 14:52:13 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::e9ed:8782:64cb:cfc3]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::e9ed:8782:64cb:cfc3%9]) with mapi id 15.20.6254.028; Tue, 4 Apr 2023
 14:52:13 +0000
Message-ID: <bae30149-0f0a-750a-a050-88e40fc1e4c1@oracle.com>
Date: Tue, 4 Apr 2023 09:52:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 0/2] hw/acpi: bump MADT to revision 5
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: shannon.zhaosl@gmail.com, ani@anisinha.ca, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 boris.ostrovsky@oracle.com
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230329010406-mutt-send-email-mst@kernel.org>
 <96144a1b-efa7-ecc2-3e35-56825fcf48c6@oracle.com>
 <20230329124442-mutt-send-email-mst@kernel.org>
 <20230331182538.15980cc9@imammedo.users.ipa.redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230331182538.15980cc9@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::21) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DM4PR10MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: d2881bab-bdba-4575-a264-08db351c2d1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199021)(31686004)(66946007)(966005)(6486002)(4326008)(66556008)(8676002)(66476007)(110136005)(41300700001)(316002)(31696002)(36756003)(86362001)(53546011)(6512007)(6506007)(6666004)(2616005)(83380400001)(478600001)(107886003)(8936002)(2906002)(5660300002)(7416002)(186003)(38100700002)(30864003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2881bab-bdba-4575-a264-08db351c2d1c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 14:52:13.7485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBePpZs3Vza5w0AYZa4CzA2W/80KQKVqJWsJR0+tqm8SGkSRy9fc0F/H+ldROW0QBopunlrFbRLVo354GKuNGxePsfRe4LqKLWJBjUvZwP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6160
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_06,2023-04-04_04,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040137
X-Proofpoint-ORIG-GUID: 6OKhAiCjYlF2HyQJdZAp_hxlGRZQg6Dj
X-Proofpoint-GUID: 6OKhAiCjYlF2HyQJdZAp_hxlGRZQg6Dj
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
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

I'm back from travel and catching up. More info below.
eric


On 3/31/23 11:25, Igor Mammedov wrote:
> On Wed, 29 Mar 2023 12:47:05 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
>> On Wed, Mar 29, 2023 at 08:14:37AM -0500, Eric DeVolder wrote:
>>>
>>>
>>> On 3/29/23 00:19, Michael S. Tsirkin wrote:
>>>> Hmm I don't think we can reasonably make such a change for 8.0.
>>>> Seems too risky.
>>>> Also, I feel we want to have an internal (with "x-" prefix") flag to
>>>> revert to old behaviour, in case of breakage on some guests.  and maybe
>>>> we want to keep old revision for old machine types.
>>> Ok, what option name, for keeping old behavior, would you like?
>>
>> Don't much care. x-madt-rev?
> 
> if it works fine (cold & hot-plug) with older linux/windows guests
> I'd rather avoid adding compat knob (we typically do that in ACPI tables
> only when change breaks something).
> 
> (as old guest I'd define WinXP sp3 (/me wonders if we  still care about
> dead EOLed OS) perhaps WS2008 would be a better minimum target these days
> and RHEL6 (or some older ACPI enabled kernel with hotplug support))

Thus far I've tested this patch series with the following guests. In both cases below,
the guest started with -smp 8,maxcpus=16, and I simply attempted to hot plug and unplug
cpu8, with: device_add id=cpu8 driver=host-x86_64-cpu socket-id=0 core-id=8 thread-id=0.

1) Windows Server 2008.
  In Windows, after logging-in, I close the first full-screen window
  and then "Server Manager" window pops up. I navigate to left hand
  pane and choose Diagnostics -> Device Manager -> Processors.
  I count them before and after.
  When hotplugging a cpu, you can see the new processor show up in the
  processor list. That is, it goes from 8 to 9.
  When hot unplugging the CPU, Windows refuses:

   The 'Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz' device is not
   removable and cannot be ejected or unplugged.

2) RHEL 6.9
  From dmesg:
  ACPI: APIC 000000007ffe32f0 000F0 (v05 BOCHS  BXPC    00000001 BXPC 00000001)
  SMP: Allowing 16 CPUs, 8 hotplug CPUs

  # cat /sys/devices/system/cpu/online
  0-7

  (QEMU) device_add ...

  CPU 8 got hotplugged
  Booting Node 0 Processor 8 APIC 0x8
  kvm-clock: cpu 8, msr 2830ed00
  Will online and init hotplugged CPU: 8
  microcode: CPU8 sig=0x50663, pf=0x1, revision=0x700001c
  platform microcode: firmware: requesting intel-ucode/06-56-03

  # cat /sys/devices/system/cpu/online
  0-8

  (QEMU) device_del ...

  Broke affinity for irq 24
  CPU 8 is now offline

  # cat /sys/devices/system/cpu/online
  0-7

  RHEL 6.9
  kernel 2.6.32-696.el6.x86_64
  build Feb 21 2017


So with these two older guest OS, it appears to still work. If there are others to be tested, let me 
know.


> 
>>
>>>>
>>>>
>>>> On Tue, Mar 28, 2023 at 11:59:24AM -0400, Eric DeVolder wrote:
>>>>> The following Linux kernel change broke CPU hotplug for MADT revision
>>>>> less than 5.
>>>>>
>>>>>    commit e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")
>>>>
>>>> Presumably it's being fixed? Link to discussion? Patch fixing that in
>>>> Linux?
>>>
>>> https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t
>>
>> Great! Maybe stick a Link: tag in the commit log.

Sure, will include that with v2.

> 
> So it's guest bug which is in process of being fixed.
> (i.e. QEMU technically correct as long as MADT revision < 5)

Iiuc, if QEMU generates x2apic tables with .revision = 1, that is not correct
(as x2APIC shows up in .revision=3).
But if QEMU generates, apic, sapic, or x2apic tables with .revision = 5, that
is correct (as all are valid options thru .revision 5).

> 
> In this case I'd not touch x86 MADT at all (It should be upto
> downstream distros to fix guest kernel).

Fwiw, this has been fixed and should show up in 6.3-rc6 this weekend.

> 
> Probably the same applies to ARM variant
> i.e. we should bump rev only when current one gets in the way
> (aka we are pulling in new fields/definitions from new version)
> 
>     
>>>>> As part of the investigation into resolving this breakage, I learned
>>>>> that i386 QEMU reports revision 1, while technically it is at revision 3.
>>>>> (Arm QEMU reports revision 4, and that is valid/correct.)
>>>>>
>>>>> ACPI 6.3 bumps MADT revision to 5 as it introduces an Online Capable
>>>>> flag that the above Linux patch utilizes to denote hot pluggable CPUs.
>>>>>
>>>>> So in order to bump MADT to the current revision of 5, need to
>>>>> validate that all MADT table changes between 1 and 5 are present
>>>>> in QEMU.
>>>>>
>>>>> Below is a table summarizing the changes to the MADT. This information
>>>>> gleamed from the ACPI specs on uefi.org.
>>>>>
>>>>> ACPI    MADT    What
>>>>> Version Version
>>>>> 1.0             MADT not present
>>>>> 2.0     1       Section 5.2.10.4
>>>>> 3.0     2       Section 5.2.11.4
>>>>>                    5.2.11.13 Local SAPIC Structure added two new fields:
>>>>>                     ACPI Processor UID Value
>>>>>                     ACPI Processor UID String
>>>>>                    5.2.10.14 Platform Interrupt Sources Structure:
>>>>>                     Reserved changed to Platform Interrupt Sources Flags
>>>>> 3.0b    2       Section 5.2.11.4
>>>>>                    Added a section describing guidelines for the ordering of
>>>>>                    processors in the MADT to support proper boot processor
>>>>>                    and multi-threaded logical processor operation.
>>>>> 4.0     3       Section 5.2.12
>>>>>                    Adds Processor Local x2APIC structure type 9
>>>>>                    Adds Local x2APIC NMI structure type 0xA
>>>>> 5.0     3       Section 5.2.12
>>>>> 6.0     3       Section 5.2.12
>>>>> 6.0a    4       Section 5.2.12
>>>>>                    Adds ARM GIC structure types 0xB-0xF
>>>>> 6.2a    45      Section 5.2.12   <--- yep it says version 45!
>>>>> 6.2b    5       Section 5.2.12
>>>>>                    GIC ITS last Reserved offset changed to 16 from 20 (typo)
>>>>> 6.3     5       Section 5.2.12
>>>>>                    Adds Local APIC Flags Online Capable!
>>>>>                    Adds GICC SPE Overflow Interrupt field
>>>>> 6.4     5       Section 5.2.12
>>>>>                    Adds Multiprocessor Wakeup Structure type 0x10
>>>>>                    (change notes says structure previously misplaced?)
>>>>> 6.5     5       Section 5.2.12
>>>>>
>>>>> For the MADT revision change 1 -> 2, the spec has a change to the
>>>>> SAPIC structure. In general, QEMU does not generate/support SAPIC.
>>>>> So the QEMU i386 MADT revision can safely be moved to 2.
>>>>>
>>>>> For the MADT revision change 2 -> 3, the spec adds Local x2APIC
>>>>> structures. QEMU has long supported x2apic ACPI structures. A simple
>>>>> search of x2apic within QEMU source and hw/i386/acpi-common.c
>>>>> specifically reveals this.
>>>>
>>>> But not unconditionally.
>>>
>>> I don't think that reporting revision 3 requires that generation of x2apic;
>>> one could still see apic, x2apic, or sapic in theory. I realize qemu doesn't
>>> do sapic...
>>>    
>>>>    
>>>>> So the QEMU i386 MADT revision can safely
>>>>> be moved to 3.
>>>>>
>>>>> For the MADT revision change 3 -> 4, the spec adds support for the ARM
>>>>> GIC structures. QEMU ARM does in fact generate and report revision 4.
>>>>> As these will not be used by i386 QEMU, so then the QEMU i386 MADT
>>>>> revision can safely be moved to 4 as well.
>>>>>
>>>>> Now for the MADT revision change 4 -> 5, the spec adds the Online
>>>>> Capable flag to the Local APIC structure, and the ARM GICC SPE
>>>>> Overflow Interrupt field.
>>>>>
>>>>> For the ARM SPE, an existing 3-byte Reserved field is broken into a 1-
>>>>> byte Reserved field and a 2-byte SPE field.  The spec says that is SPE
>>>>> Overflow is not supported, it should be zero.
>>>>>
>>>>> For the i386 Local APIC flag Online Capable, the spec has certain rules
>>>>> about this value. And in particuar setting this value now explicitly
>>>>> indicates a hotpluggable CPU.
>>>>>
>>>>> So this patch makes the needed changes to move both ARM and i386 MADT
>>>>> to revision 5. These are not complicated, thankfully.
>>>>>
>>>>> Without these changes, the information below shows "how" CPU hotplug
>>>>> breaks with the current upstream Linux kernel 6.3.  For example, a Linux
>>>>> guest started with:
>>>>>
>>>>>    qemu-system-x86_64 -smp 30,maxcpus=32 ...
>>>>>
>>>>> and then attempting to hotplug a CPU:
>>>>>
>>>>>     (QEMU) device_add id=cpu30 driver=host-x86_64-cpu socket-id=0 core-id=30 thread-id=0
>>>>>
>>>>> fails with the following:
>>>>>
>>>>>     APIC: NR_CPUS/possible_cpus limit of 30 reached. Processor 30/0x.
>>>>>     ACPI: Unable to map lapic to logical cpu number
>>>>>     acpi LNXCPU:1e: Enumeration failure
>>>>>
>>>>>     # dmesg | grep smpboot
>>>>>     smpboot: Allowing 30 CPUs, 0 hotplug CPUs
>>>>>     smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x)
>>>>>     smpboot: Max logical packages: 1
>>>>>     smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
>>>>>
>>>>>     # iasl -d /sys/firmware/tables/acpi/APIC
>>>>>     [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Descript
>>>>>     [004h 0004   4]                 Table Length : 00000170
>>>>>     [008h 0008   1]                     Revision : 01          <=====
>>>>>     [009h 0009   1]                     Checksum : 9C
>>>>>     [00Ah 0010   6]                       Oem ID : "BOCHS "
>>>>>     [010h 0016   8]                 Oem Table ID : "BXPC    "
>>>>>     [018h 0024   4]                 Oem Revision : 00000001
>>>>>     [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>>>>>     [020h 0032   4]        Asl Compiler Revision : 00000001
>>>>>
>>>>>     ...
>>>>>
>>>>>     [114h 0276   1]                Subtable Type : 00 [Processor Local APIC]
>>>>>     [115h 0277   1]                       Length : 08
>>>>>     [116h 0278   1]                 Processor ID : 1D
>>>>>     [117h 0279   1]                Local Apic ID : 1D
>>>>>     [118h 0280   4]        Flags (decoded below) : 00000001
>>>>>                                Processor Enabled : 1          <=====
>>>>>
>>>>>     [11Ch 0284   1]                Subtable Type : 00 [Processor Local APIC]
>>>>>     [11Dh 0285   1]                       Length : 08
>>>>>     [11Eh 0286   1]                 Processor ID : 1E
>>>>>     [11Fh 0287   1]                Local Apic ID : 1E
>>>>>     [120h 0288   4]        Flags (decoded below) : 00000000
>>>>>                                Processor Enabled : 0          <=====
>>>>>
>>>>>     [124h 0292   1]                Subtable Type : 00 [Processor Local APIC]
>>>>>     [125h 0293   1]                       Length : 08
>>>>>     [126h 0294   1]                 Processor ID : 1F
>>>>>     [127h 0295   1]                Local Apic ID : 1F
>>>>>     [128h 0296   4]        Flags (decoded below) : 00000000
>>>>>                                Processor Enabled : 0          <=====
>>>>>
>>>>> The (latest upstream) Linux kernel sees 30 Enabled processors, and
>>>>> does not consider processors 31 and 32 to be hotpluggable.
>>>>>
>>>>> With this patch series applied, by bumping MADT to revision 5, the
>>>>> latest upstream Linux kernel correctly identifies 30 CPUs plus 2
>>>>> hotpluggable CPUS.
>>>>>
>>>>>     CPU30 has been hot-added
>>>>>     smpboot: Booting Node 0 Processor 30 APIC 0x1e
>>>>>     Will online and init hotplugged CPU: 30
>>>>>
>>>>>     # dmesg | grep smpboot
>>>>>     smpboot: Allowing 32 CPUs, 2 hotplug CPUs
>>>>>     smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x6, model: 0x56, stepping: 0x3)
>>>>>     smpboot: Max logical packages: 2
>>>>>     smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
>>>>>
>>>>>     # iasl -d /sys/firmware/tables/acpi/APIC
>>>>>     [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Descript
>>>>>     [004h 0004 004h]                Table Length : 00000170
>>>>>     [008h 0008 001h]                    Revision : 05          <=====
>>>>>     [009h 0009 001h]                    Checksum : 94
>>>>>     [00Ah 0010 006h]                      Oem ID : "BOCHS "
>>>>>     [010h 0016 008h]                Oem Table ID : "BXPC    "
>>>>>     [018h 0024 004h]                Oem Revision : 00000001
>>>>>     [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
>>>>>     [020h 0032 004h]       Asl Compiler Revision : 00000001
>>>>>
>>>>>     ...
>>>>>
>>>>>     [114h 0276 001h]               Subtable Type : 00 [Processor Local APIC]
>>>>>     [115h 0277 001h]                      Length : 08
>>>>>     [116h 0278 001h]                Processor ID : 1D
>>>>>     [117h 0279 001h]               Local Apic ID : 1D
>>>>>     [118h 0280 004h]       Flags (decoded below) : 00000001
>>>>>                                Processor Enabled : 1          <=====
>>>>>                           Runtime Online Capable : 0          <=====
>>>>>
>>>>>     [11Ch 0284 001h]               Subtable Type : 00 [Processor Local APIC]
>>>>>     [11Dh 0285 001h]                      Length : 08
>>>>>     [11Eh 0286 001h]                Processor ID : 1E
>>>>>     [11Fh 0287 001h]               Local Apic ID : 1E
>>>>>     [120h 0288 004h]       Flags (decoded below) : 00000002
>>>>>                                Processor Enabled : 0          <=====
>>>>>                           Runtime Online Capable : 1          <=====
>>>>>
>>>>>     [124h 0292 001h]               Subtable Type : 00 [Processor Local APIC]
>>>>>     [125h 0293 001h]                      Length : 08
>>>>>     [126h 0294 001h]                Processor ID : 1F
>>>>>     [127h 0295 001h]               Local Apic ID : 1F
>>>>>     [128h 0296 004h]       Flags (decoded below) : 00000002
>>>>>                                Processor Enabled : 0          <=====
>>>>>                           Runtime Online Capable : 1          <=====
>>>>>
>>>>> Regards,
>>>>> Eric
>>>>
>>>> Can you please report which guests were tested?
>>>
>>> I've been using primarily upstream Linux. Kernels at and before 6.2.0 didn't
>>> have the "broken" patch mentioned above, and worked (for the reasons cited
>>> in the patch discussion to "fix" that patch). Any kernel since has the
>>> "broken" patch and will exhibit the issue.
>>>
>>> I've been using q35.
>>>
>>> If there are other samples you'd like to see, let me know and I'll try.
>>>
>>> Also, my responses will be delayed as I'm traveling the remainder of the week.
>>>
>>> Thanks!
>>> eric
>>
>> As a minimum some windows versions. The older the better.
>>
>>
>>>    
>>>>
>>>>    
>>>>>
>>>>> Eric DeVolder (2):
>>>>>     hw/acpi: arm: bump MADT to revision 5
>>>>>     hw/acpi: i386: bump MADT to revision 5
>>>>>
>>>>>    hw/arm/virt-acpi-build.c |  6 ++++--
>>>>>    hw/i386/acpi-common.c    | 13 ++++++++++---
>>>>>    2 files changed, 14 insertions(+), 5 deletions(-)
>>>>>
>>>>> -- 
>>>>> 2.31.1
>>>>>
>>>>>
>>>>>    
>>>>    
>>
> 

