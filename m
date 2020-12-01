Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CA12CA3F5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 14:38:05 +0100 (CET)
Received: from localhost ([::1]:40928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5r2-0008SR-T2
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 08:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kk5oa-0006tr-1B
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:35:32 -0500
Received: from 3.mo51.mail-out.ovh.net ([188.165.32.156]:60844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kk5oW-0000EE-Ji
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:35:31 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.141])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id ACB9A23EB25;
 Tue,  1 Dec 2020 14:35:24 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 1 Dec 2020
 14:35:23 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001fe2206e9-bc56-4dc9-b69c-870799e476a6,
 6EE3354161D935669C7EC452F04D1EFE94C746D2) smtp.auth=groug@kaod.org
Date: Tue, 1 Dec 2020 14:35:21 +0100
From: Greg Kurz <groug@kaod.org>
To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH] target/ppc: Remove "compat" property of server class
 POWER CPUs
Message-ID: <20201201143521.4e3cc11f@bahia.lan>
In-Reply-To: <20201201131103.897430-1-groug@kaod.org>
References: <20201201131103.897430-1-groug@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: c0db589c-3f19-4f3d-9f61-b03f2aa66638
X-Ovh-Tracer-Id: 5087941683108551136
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeivddgheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehlihgsvhhirhdqlhhishhtsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=groug@kaod.org;
 helo=3.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: libvir-list@redhat.com, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just to clarify, this is for 6.0.

On Tue, 1 Dec 2020 14:11:03 +0100
Greg Kurz <groug@kaod.org> wrote:

> This property has been deprecated since QEMU 5.0 by commit 22062e54bb68.
> We only kept a legacy hack that internally converts "compat" into the
> official "max-cpu-compat" property of the pseries machine type.
> 
> According to our deprecation policy, we could have removed it for QEMU 5.2
> already. Do it now ; since ppc_cpu_parse_featurestr() now just calls the
> generic parent_parse_features handler, drop it as well.
> 
> Users are supposed to use the "max-cpu-compat" property of the pseries
> machine type instead.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  docs/system/deprecated.rst      |  7 ----
>  target/ppc/translate_init.c.inc | 59 ---------------------------------
>  2 files changed, 66 deletions(-)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 565389697e84..09c8f380bc82 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -281,13 +281,6 @@ a future version of QEMU. It's unclear whether anybody is still using
>  CPU emulation in QEMU, and there are no test images available to make
>  sure that the code is still working.
>  
> -``compat`` property of server class POWER CPUs (since 5.0)
> -''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> -
> -The ``compat`` property used to set backwards compatibility modes for
> -the processor has been deprecated. The ``max-cpu-compat`` property of
> -the ``pseries`` machine type should be used instead.
> -
>  ``lm32`` CPUs (since 5.2.0)
>  '''''''''''''''''''''''''''
>  
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
> index 78cc8f043b92..e4082cfde746 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -10470,63 +10470,6 @@ static ObjectClass *ppc_cpu_class_by_name(const char *name)
>      return oc;
>  }
>  
> -static void ppc_cpu_parse_featurestr(const char *type, char *features,
> -                                     Error **errp)
> -{
> -    Object *machine = qdev_get_machine();
> -    const PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(object_class_by_name(type));
> -
> -    if (!features) {
> -        return;
> -    }
> -
> -    if (object_property_find(machine, "max-cpu-compat")) {
> -        int i;
> -        char **inpieces;
> -        char *s = features;
> -        Error *local_err = NULL;
> -        char *compat_str = NULL;
> -
> -        /*
> -         * Backwards compatibility hack:
> -         *
> -         *   CPUs had a "compat=" property which didn't make sense for
> -         *   anything except pseries.  It was replaced by "max-cpu-compat"
> -         *   machine option.  This supports old command lines like
> -         *       -cpu POWER8,compat=power7
> -         *   By stripping the compat option and applying it to the machine
> -         *   before passing it on to the cpu level parser.
> -         */
> -        inpieces = g_strsplit(features, ",", 0);
> -        *s = '\0';
> -        for (i = 0; inpieces[i]; i++) {
> -            if (g_str_has_prefix(inpieces[i], "compat=")) {
> -                warn_report_once("CPU 'compat' property is deprecated; "
> -                    "use max-cpu-compat machine property instead");
> -                compat_str = inpieces[i];
> -                continue;
> -            }
> -            if ((i != 0) && (s != features)) {
> -                s = g_stpcpy(s, ",");
> -            }
> -            s = g_stpcpy(s, inpieces[i]);
> -        }
> -
> -        if (compat_str) {
> -            char *v = compat_str + strlen("compat=");
> -            object_property_set_str(machine, "max-cpu-compat", v, &local_err);
> -        }
> -        g_strfreev(inpieces);
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> -            return;
> -        }
> -    }
> -
> -    /* do property processing with generic handler */
> -    pcc->parent_parse_features(type, features, errp);
> -}
> -
>  PowerPCCPUClass *ppc_cpu_get_family_class(PowerPCCPUClass *pcc)
>  {
>      ObjectClass *oc = OBJECT_CLASS(pcc);
> @@ -10905,8 +10848,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
>      device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);
>  
>      cc->class_by_name = ppc_cpu_class_by_name;
> -    pcc->parent_parse_features = cc->parse_features;
> -    cc->parse_features = ppc_cpu_parse_featurestr;
>      cc->has_work = ppc_cpu_has_work;
>      cc->do_interrupt = ppc_cpu_do_interrupt;
>      cc->cpu_exec_interrupt = ppc_cpu_exec_interrupt;


