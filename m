Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688122FCEE9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 12:18:05 +0100 (CET)
Received: from localhost ([::1]:52266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2BUy-0000sL-Gl
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 06:18:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l2BTb-0000Sn-2l
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 06:16:39 -0500
Received: from 9.mo52.mail-out.ovh.net ([87.98.180.222]:52918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l2BTY-0000lA-Up
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 06:16:38 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.191])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id B2068236C08;
 Wed, 20 Jan 2021 12:16:32 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 20 Jan
 2021 12:16:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00507e2a719-4cf6-45d3-bb3c-8ee88662792d,
 BC30773A3D735F3651E1A72FF92628D33EE1AD8E) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 20 Jan 2021 12:16:26 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/1] spapr_caps.c: check user input before warning
 about TCG only caps
Message-ID: <20210120121626.3e7bf3c4@bahia.lan>
In-Reply-To: <20210120105406.163074-2-danielhb413@gmail.com>
References: <20210120105406.163074-1-danielhb413@gmail.com>
 <20210120105406.163074-2-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 6f2de231-4bcb-4d05-80f3-108c8256a4e6
X-Ovh-Tracer-Id: 1229482698797324768
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvgddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=87.98.180.222; envelope-from=groug@kaod.org;
 helo=9.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Jan 2021 07:54:06 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> Commit 006e9d361869 added warning messages for cap-cfpc, cap-ibs and
> cap-sbbc when enabled under TCG. Commit 8ff43ee404d3 did the same thing
> when introducing cap-ccf-assist.
> 
> These warning messages, although benign to the machine launch, can make
> users a bit confused. E.g:
> 
> $ sudo ./ppc64-softmmu/qemu-system-ppc64
> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-cfpc=workaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-sbbc=workaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ibs=workaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ccf-assist=on
> 
> We're complaining about "TCG doesn't support requested feature" when the
> user didn't request any of those caps in the command line.
> 
> Check if these caps were set in the command line before sending an user
> warning.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Heh I've just posted a mail suggesting you to do something like that :)

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_caps.c | 47 ++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 36 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index 9341e9782a..629c24a96d 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -244,9 +244,15 @@ static void cap_safe_cache_apply(SpaprMachineState *spapr, uint8_t val,
>      uint8_t kvm_val =  kvmppc_get_cap_safe_cache();
>  
>      if (tcg_enabled() && val) {
> -        /* TCG only supports broken, allow other values and print a warning */
> -        warn_report("TCG doesn't support requested feature, cap-cfpc=%s",
> -                    cap_cfpc_possible.vals[val]);
> +        /*
> +         * TCG only supports broken, allow other values and print a warning
> +         * in case the user attempted to set a different value in the command
> +         * line.
> +         */
> +        if (spapr->cmd_line_caps[SPAPR_CAP_CFPC] != SPAPR_CAP_BROKEN) {
> +            warn_report("TCG doesn't support requested feature, cap-cfpc=%s",
> +                        cap_cfpc_possible.vals[val]);
> +        }
>      } else if (kvm_enabled() && (val > kvm_val)) {
>          error_setg(errp,
>                     "Requested safe cache capability level not supported by KVM");
> @@ -269,9 +275,15 @@ static void cap_safe_bounds_check_apply(SpaprMachineState *spapr, uint8_t val,
>      uint8_t kvm_val =  kvmppc_get_cap_safe_bounds_check();
>  
>      if (tcg_enabled() && val) {
> -        /* TCG only supports broken, allow other values and print a warning */
> -        warn_report("TCG doesn't support requested feature, cap-sbbc=%s",
> -                    cap_sbbc_possible.vals[val]);
> +        /*
> +         * TCG only supports broken, allow other values and print a warning
> +         * in case the user attempted to set a different value in the command
> +         * line.
> +         */
> +        if (spapr->cmd_line_caps[SPAPR_CAP_SBBC] != SPAPR_CAP_BROKEN) {
> +            warn_report("TCG doesn't support requested feature, cap-sbbc=%s",
> +                        cap_sbbc_possible.vals[val]);
> +        }
>      } else if (kvm_enabled() && (val > kvm_val)) {
>          error_setg(errp,
>  "Requested safe bounds check capability level not supported by KVM");
> @@ -297,9 +309,15 @@ static void cap_safe_indirect_branch_apply(SpaprMachineState *spapr,
>      uint8_t kvm_val = kvmppc_get_cap_safe_indirect_branch();
>  
>      if (tcg_enabled() && val) {
> -        /* TCG only supports broken, allow other values and print a warning */
> -        warn_report("TCG doesn't support requested feature, cap-ibs=%s",
> -                    cap_ibs_possible.vals[val]);
> +        /*
> +         * TCG only supports broken, allow other values and print a warning
> +         * in case the user attempted to set a different value in the command
> +         * line.
> +         */
> +        if (spapr->cmd_line_caps[SPAPR_CAP_IBS] != SPAPR_CAP_BROKEN) {
> +            warn_report("TCG doesn't support requested feature, cap-ibs=%s",
> +                        cap_ibs_possible.vals[val]);
> +        }
>      } else if (kvm_enabled() && (val > kvm_val)) {
>          error_setg(errp,
>  "Requested safe indirect branch capability level not supported by KVM");
> @@ -483,8 +501,15 @@ static void cap_ccf_assist_apply(SpaprMachineState *spapr, uint8_t val,
>      uint8_t kvm_val = kvmppc_get_cap_count_cache_flush_assist();
>  
>      if (tcg_enabled() && val) {
> -        /* TCG doesn't implement anything here, but allow with a warning */
> -        warn_report("TCG doesn't support requested feature, cap-ccf-assist=on");
> +        /*
> +         * TCG doesn't implement anything here, but allow with a warning
> +         * in case the user attempted to set a different value in the command
> +         * line.
> +         */
> +        if (spapr->cmd_line_caps[SPAPR_CAP_CCF_ASSIST] != SPAPR_CAP_OFF) {
> +            warn_report("TCG doesn't support requested feature, "
> +                        "cap-ccf-assist=on");
> +        }
>      } else if (kvm_enabled() && (val > kvm_val)) {
>          uint8_t kvm_ibs = kvmppc_get_cap_safe_indirect_branch();
>  


