Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 033D658CD10
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 19:52:22 +0200 (CEST)
Received: from localhost ([::1]:52292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL6vL-00017U-U1
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 13:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oL6t4-0007gw-FD
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 13:50:05 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oL6t2-0000Wj-3s
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 13:49:58 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 278HLi43004323;
 Mon, 8 Aug 2022 17:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=FrjjL1OPAFf2TJeD1p0WkO0ZaZikYGURPcn9upGJwuk=;
 b=WhR4nBjZK91Hp5so5upGSq/89lammWeqVCC/Jc9PsixviQ7/PmErcr1UKtRlluKcKGGt
 POJimzWv/xstCivur2UAo40pRZQUglj28MttOOT3CnKZ+fYQh3Chhm2jKUoV+98vNuZs
 Apyn6J/swXSr919dQIYcHAXLDaX/6w1amDUHrUQt9p5yty6d9ytlHwftEI8Fk0/YgCk6
 Z4abGckaAEwSmX6yduTaLlYnxifuVr+9V1ElnvTyiO/J8OIEV1Pn3lei1qKp8Wpmx7sp
 eSni3FKrWk4eMY0TPljbpgs2ZCJPEs/0vOCRnbQ+CEz9BSPXUBu5LpdoFXXiRkmBVaMc mQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hu6tggs6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Aug 2022 17:49:51 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 278HaN3p007719;
 Mon, 8 Aug 2022 17:49:50 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 3hu5dx0h3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Aug 2022 17:49:50 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 278Hnnrp41812336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Aug 2022 17:49:50 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2E17136051;
 Mon,  8 Aug 2022 17:49:49 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A679F13604F;
 Mon,  8 Aug 2022 17:49:49 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Aug 2022 17:49:49 +0000 (GMT)
Message-ID: <3535a85c-7a1f-5444-080a-aed714624b54@linux.ibm.com>
Date: Mon, 8 Aug 2022 13:49:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] tpm_emulator: Avoid double initialization during migration
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc: qemu-devel@nongnu.org
References: <20220801142725.815399-1-ross.lagerwall@citrix.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220801142725.815399-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FCWuw2xeRn5SiCElTFaLVRMHkXpQixtj
X-Proofpoint-GUID: FCWuw2xeRn5SiCElTFaLVRMHkXpQixtj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_11,2022-08-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080082
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 8/1/22 10:27, Ross Lagerwall via wrote:
> When resuming after a migration, the backend sends CMD_INIT to the
> emulator from the startup callback, then it sends the migration state

This startup hook is called upon TIS/CRB device reset, so this is likely 
called before the device state has been received.

> from the vmstate to the emulator, then it sends CMD_INIT again. Skip the
> first CMD_INIT during a migration to avoid initializing the TPM twice.

Ok, that's sufficient to start it up once all the state has been received.

> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>


Tested-by: Stefan Berger <stefanb@linux.ibm.com>

> ---
>   backends/tpm/tpm_emulator.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
> index 87d061e9bb..9b50c5b3e2 100644
> --- a/backends/tpm/tpm_emulator.c
> +++ b/backends/tpm/tpm_emulator.c
> @@ -32,6 +32,7 @@
>   #include "qemu/sockets.h"
>   #include "qemu/lockable.h"
>   #include "io/channel-socket.h"
> +#include "sysemu/runstate.h"
>   #include "sysemu/tpm_backend.h"
>   #include "sysemu/tpm_util.h"
>   #include "tpm_int.h"
> @@ -383,6 +384,15 @@ err_exit:
> 
>   static int tpm_emulator_startup_tpm(TPMBackend *tb, size_t buffersize)
>   {
> +    /* TPM startup will be done from post_load hook */
> +    if (runstate_check(RUN_STATE_INMIGRATE)) {
> +        if (buffersize != 0) {
> +            return tpm_emulator_set_buffer_size(tb, buffersize, NULL);
> +        }
> +
> +        return 0;
> +    }
> +
>       return tpm_emulator_startup_tpm_resume(tb, buffersize, false);
>   }
>

