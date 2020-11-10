Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15742ACB6C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 04:00:17 +0100 (CET)
Received: from localhost ([::1]:41962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcJtI-0005vX-60
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 22:00:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1kcJsQ-0005TL-Gs
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 21:59:22 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:41412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1kcJsN-0002B9-8u
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 21:59:21 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AA2rjST177580;
 Tue, 10 Nov 2020 02:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=Dgt9AyOSMaHgWt3aC8y4FYcr3GXwcNZBJD6iXpb+Tbs=;
 b=QJCle1AtXRt9/NZZN5Fp6MANJmyoPokqNTeP7DW/LRG2PD39hxmosg7S9CNG+uokQkt5
 1JIaJ6quWV1JNV0gYCKfa4M2CAfWnH6hb5KNS190IrNYM7WWZ7WedtHcRk87yaRrZSKq
 5k4M+yUDbEnqlTg1dchnehJZbcgD/JGGdEdb5KCCoz0AgbSQ8yAHMLLchlRJQKj6vi9e
 QHyRupVwdffXzFA0ZBBOL9OUsWK1sDKzAZnVtpgCw5QEsFHwzjgyxXCMN+BQ4KjzWSd8
 xSDmiDgE0uD+OHW4tdRYtLg9RS2u7KjWEn30J9Lrmd56nychjacn9O3IR6H7M6weRYE4 qQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 34nkhks9v2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 02:59:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AA2snJr178152;
 Tue, 10 Nov 2020 02:59:14 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 34p5fykxxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Nov 2020 02:59:14 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AA2xDdg008136;
 Tue, 10 Nov 2020 02:59:13 GMT
Received: from [10.39.237.188] (/10.39.237.188)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 09 Nov 2020 18:59:13 -0800
Subject: Re: [PATCH] pvpanic: Advertise the PVPANIC_CRASHLOADED event support
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201109143311.1000958-1-pbonzini@redhat.com>
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Organization: Oracle Corporation
Message-ID: <112eba9b-0305-f40d-8b81-6b3e46d62d75@oracle.com>
Date: Mon, 9 Nov 2020 21:59:09 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201109143311.1000958-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9800
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011100020
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9800
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 priorityscore=1501
 mlxscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011100020
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=alejandro.j.jimenez@oracle.com; helo=aserp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 19:07:29
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: maciej.szmigiero@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(CC Maciej)

Hi Paolo,

Thank you for fixing the patch. One comment below..

On 11/9/2020 9:33 AM, Paolo Bonzini wrote:
> Advertise both types of events as supported when the guest OS
> queries the pvpanic device.  Currently only PVPANIC_PANICKED is
> exposed; PVPANIC_CRASHLOADED must also be advertised, but only on
> new machine types.
>
> Fixes: 7dc58deea79a ("pvpanic: implement crashloaded event handling")
> Reported-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/core/machine.c | 1 +
>   hw/misc/pvpanic.c | 5 ++++-
>   2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 98b87f76cb..d0408049b5 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -35,6 +35,7 @@ GlobalProperty hw_compat_5_1[] = {
>       { "virtio-blk-device", "num-queues", "1"},
>       { "virtio-scsi-device", "num_queues", "1"},
>       { "nvme", "use-intel-id", "on"},
> +    { "pvpanic", "events", "1"}, /* PVPANIC_PANICKED */
>   };
>   const size_t hw_compat_5_1_len = G_N_ELEMENTS(hw_compat_5_1);
>   
> diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
> index 598d5471a4..35d6797831 100644
> --- a/hw/misc/pvpanic.c
> +++ b/hw/misc/pvpanic.c
> @@ -61,12 +61,14 @@ struct PVPanicState {
>   
>       MemoryRegion io;
>       uint16_t ioport;
> +    uint8_t events;
>   };
>   
>   /* return supported events on read */
>   static uint64_t pvpanic_ioport_read(void *opaque, hwaddr addr, unsigned size)
>   {
> -    return PVPANIC_PANICKED;
> +    PVPanicState *pvp = opaque;
> +    return pvp->events;
>   }
>   
>   static void pvpanic_ioport_write(void *opaque, hwaddr addr, uint64_t val,
> @@ -112,6 +114,7 @@ static void pvpanic_isa_realizefn(DeviceState *dev, Error **errp)
>   
>   static Property pvpanic_isa_properties[] = {
>       DEFINE_PROP_UINT16(PVPANIC_IOPORT_PROP, PVPanicState, ioport, 0x505),
> +    DEFINE_PROP_UINT8("events", PVPanicState, events, PVPANIC_PANICKED | PVPANIC_CRASHLOADED),
>       DEFINE_PROP_END_OF_LIST(),
>   };
One side effect of defining the "events" property (as Maciej pointed out 
to me), is that we are able to overwrite it with an alternative value in 
the cmdline. e.g.

-device pvpanic,events=<event mask>

This can be used to force QEMU to report a set of events different than 
what it actually supports to a guest OS reading from the pvpanic device. 
I assume you are not concerned about this scenario, since it would have 
to be deliberately triggered, and even then it would not cause any 
serious issues, correct?

Assuming the above is not a problem:
Reviewed-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>


