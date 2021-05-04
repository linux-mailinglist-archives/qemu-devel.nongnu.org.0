Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1583729C0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 13:56:45 +0200 (CEST)
Received: from localhost ([::1]:39084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldtfQ-0001i3-2O
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 07:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldtdj-0000sW-27; Tue, 04 May 2021 07:54:59 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:35943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldtdf-0008S8-NP; Tue, 04 May 2021 07:54:58 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.240])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3110EA1C3369;
 Tue,  4 May 2021 13:54:50 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 4 May 2021
 13:54:41 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00309d6300c-36a4-488b-9937-b6392cd04309,
 FE205EFFD255CB112FC695D6C3BB315DBE02FA54) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH] target/ppc: Do not check for LPCR[HAIL] on power10_v1.0
 CPUs
To: Nicholas Piggin <npiggin@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>
References: <20210504095900.505668-1-clg@kaod.org>
 <1620125242.e97yybasbv.astroid@bobo.none>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <850b8bb4-0e79-f5ee-ef95-a0e8d95ff9b0@kaod.org>
Date: Tue, 4 May 2021 13:54:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1620125242.e97yybasbv.astroid@bobo.none>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 312157d8-0d0a-4889-b9a0-7c212a3a2247
X-Ovh-Tracer-Id: 3891391557067770787
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdefiedggeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/21 12:49 PM, Nicholas Piggin wrote:
> Excerpts from Cédric Le Goater's message of May 4, 2021 7:59 pm:
>> The LPCR[HAIL] bit only applies to POWER10 DD2 CPUs. On POWER10 DD1,
>> the ail value should be extracted using the LPCR_AIL mask like on P9.
>>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Thanks for this, my oversight for not realising the P10 CPU is DD1 
> (which doesn't have HAIL).
> 
> I wonder if it could just use the POWER9 excp_model?

Yes. Why not. It does bring up another problem which is how to define
(cleanly) different characteristics for CPUs of the same POWER family.

Currently, all P10s are under POWERPC_FAMILY(POWER10). This is a base 
abstract class and definitions can not depend on the PVR. See below
what needs to be done to add a custom LPCR mask for DD2 :/

We could also simply switch P10 to DD2. I would favor that instead of 
adding complexity. 

David, what is your opinion on this ? 

Thank,

C. 


Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 target/ppc/cpu-models.c |   13 +++++++++++--
 target/ppc/cpu-models.h |    1 +
 2 files changed, 12 insertions(+), 2 deletions(-)

Index: qemu-powernv-6.1.git/target/ppc/cpu-models.c
===================================================================
--- qemu-powernv-6.1.git.orig/target/ppc/cpu-models.c
+++ qemu-powernv-6.1.git/target/ppc/cpu-models.c
@@ -32,7 +32,7 @@
 /* PowerPC CPU definitions                                                 */
 #define POWERPC_DEF_PREFIX(pvr, svr, type)                                  \
     glue(glue(glue(glue(pvr, _), svr), _), type)
-#define POWERPC_DEF_SVR(_name, _desc, _pvr, _svr, _type)                    \
+#define __POWERPC_DEF_SVR(_name, _desc, _pvr, _svr, _type, _lpcr)           \
     static void                                                             \
     glue(POWERPC_DEF_PREFIX(_pvr, _svr, _type), _cpu_class_init)            \
     (ObjectClass *oc, void *data)                                           \
@@ -40,6 +40,7 @@
         DeviceClass *dc = DEVICE_CLASS(oc);                                 \
         PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);                       \
                                                                             \
+        pcc->lpcr_mask    |= _lpcr;                                         \
         pcc->pvr          = _pvr;                                           \
         pcc->svr          = _svr;                                           \
         dc->desc          = _desc;                                          \
@@ -63,6 +64,12 @@
     type_init(                                                              \
         glue(POWERPC_DEF_PREFIX(_pvr, _svr, _type), _cpu_register_types))
 
+#define POWERPC_DEF_SVR(_name, _desc, _pvr, _svr, _type)                    \
+    __POWERPC_DEF_SVR(_name, _desc, _pvr, _svr, _type, 0)
+
+#define POWERPC_DEF_LPCR(_name, _pvr, _type, _desc, _lpcr)                  \
+    __POWERPC_DEF_SVR(_name, _desc, _pvr, POWERPC_SVR_NONE, _type, _lpcr)
+
 #define POWERPC_DEF(_name, _pvr, _type, _desc)                              \
     POWERPC_DEF_SVR(_name, _desc, _pvr, POWERPC_SVR_NONE, _type)
 
@@ -776,6 +783,8 @@
                 "POWER9 v2.0")
     POWERPC_DEF("power10_v1.0",  CPU_POWERPC_POWER10_DD1,            POWER10,
                 "POWER10 v1.0")
+    POWERPC_DEF_LPCR("power10_v2.0",  CPU_POWERPC_POWER10_DD20,      POWER10,
+                     "POWER10 v2.0", LPCR_HAIL)
 #endif /* defined (TARGET_PPC64) */
 
 /***************************************************************************/
@@ -952,7 +961,7 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
     { "power8", "power8_v2.0" },
     { "power8nvl", "power8nvl_v1.0" },
     { "power9", "power9_v2.0" },
-    { "power10", "power10_v1.0" },
+    { "power10", "power10_v2.0" },
 #endif
 
     /* Generic PowerPCs */
Index: qemu-powernv-6.1.git/target/ppc/cpu-models.h
===================================================================
--- qemu-powernv-6.1.git.orig/target/ppc/cpu-models.h
+++ qemu-powernv-6.1.git/target/ppc/cpu-models.h
@@ -375,6 +375,7 @@ enum {
     CPU_POWERPC_POWER9_DD20        = 0x004E1200,
     CPU_POWERPC_POWER10_BASE       = 0x00800000,
     CPU_POWERPC_POWER10_DD1        = 0x00800100,
+    CPU_POWERPC_POWER10_DD20       = 0x00800200,
     CPU_POWERPC_970_v22            = 0x00390202,
     CPU_POWERPC_970FX_v10          = 0x00391100,
     CPU_POWERPC_970FX_v20          = 0x003C0200,

