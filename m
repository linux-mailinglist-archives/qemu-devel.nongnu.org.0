Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C8249719E
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jan 2022 14:19:20 +0100 (CET)
Received: from localhost ([::1]:59260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBcm6-0005I7-RB
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 08:19:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nBcbA-00089R-IN
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 08:08:00 -0500
Received: from mga06.intel.com ([134.134.136.31]:23362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nBcb7-0003oZ-M3
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 08:07:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642943277; x=1674479277;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LwFU8+K6q6NPl68+t508T+6vvLBCleycfGzOK2z5sx4=;
 b=FBfnKTdBRTczwlFZLw4osQeR7cjGH2HqrHEqw6lBU+/nwp1ywLy4lbak
 GpoOt3DUp0Eq58vaB+GVe7ProFttkMFc7rIwS9PKhJA/AiqlQnU54uC1y
 HGMOV/dmqYsIaBxgiz7H50UMvfEFzLCJt7jfWUOoGHRvbeX9mLSbhMdrX
 WJiTx6jezDX9duqDizKaqUTtFznOQyjG/qWydt/hAl9olOu4hMqbxf0M2
 BD8WoIcgLdQWfzjcvmDFc6gBkoi27VPH2G5zwXL8x5+/fOk6SkVFcCt5o
 RrBRVGepZa5Wy5GVA7tvm4nZM46+qjVvkoDFqWUmA11hNAedYzCgjDWUJ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10235"; a="306611308"
X-IronPort-AV: E=Sophos;i="5.88,310,1635231600"; d="scan'208";a="306611308"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 05:07:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,310,1635231600"; d="scan'208";a="478760909"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 23 Jan 2022 05:07:50 -0800
Date: Sun, 23 Jan 2022 20:52:30 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 2/2] hw/i386/sgx: Attach SGX-EPC to its memory backend
Message-ID: <20220123125230.GA981@yangzhon-Virtual>
References: <20220116235331.103977-1-f4bug@amsat.org>
 <20220116235331.103977-3-f4bug@amsat.org>
 <c1a8eba5-b1a1-bbcf-c237-23e16ce88475@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1a8eba5-b1a1-bbcf-c237-23e16ce88475@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, yang.zhong@intel.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 17, 2022 at 12:48:10PM +0100, Paolo Bonzini wrote:
> On 1/17/22 00:53, Philippe Mathieu-Daudé via wrote:
> >We have one SGX-EPC address/size/node per memory backend,
> >make it child of the backend in the QOM composition tree.
> >
> >Cc: Yang Zhong <yang.zhong@intel.com>
> >Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> >---
> >  hw/i386/sgx.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> >diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> >index 5de5dd08936..6362e5e9d02 100644
> >--- a/hw/i386/sgx.c
> >+++ b/hw/i386/sgx.c
> >@@ -300,6 +300,9 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
> >          /* set the memdev link with memory backend */
> >          object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
> >                                &error_fatal);
> >+        object_property_add_child(OBJECT(list->value->memdev), "sgx-epc",
> >+                                  OBJECT(obj));
> >+
> >          /* set the numa node property for sgx epc object */
> >          object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP, list->value->node,
> >                               &error_fatal);
> 
> I don't think this is a good idea; only list->value->memdev should
> add something below itself in the tree.
> 
> However, I think obj can be added under the machine itself as
> /machine/sgx-epc-device[*].
> 

  Philippe, Sorry I can't receive all Qemu mails from my mutt tool.

  https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg03535.html
  I verified this patch, and the issue was reported as below:

  Unexpected error in object_property_try_add() at ../qom/object.c:1224:
  qemu-system-x86_64: attempt to add duplicate property 'sgx-epc' to object (type 'pc-q35-7.0-machine')
  Aborted (core dumped)

  Even I changed it to another name, which still reported same kind of issue.

  I tried below patch as my previous patch, and it can work
  diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
  index d60485fc422..66444745b47 100644
  --- a/hw/i386/sgx.c
  +++ b/hw/i386/sgx.c
  @@ -281,6 +281,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
       SGXEPCState *sgx_epc = &pcms->sgx_epc;
       X86MachineState *x86ms = X86_MACHINE(pcms);
       SgxEPCList *list = NULL;
  +    int sgx_count = 0;
       Object *obj;

       memset(sgx_epc, 0, sizeof(SGXEPCState));
  @@ -297,7 +298,9 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
       for (list = x86ms->sgx_epc_list; list; list = list->next) {
           obj = object_new("sgx-epc");

  -        object_property_add_child(OBJECT(pcms), "sgx-epc", OBJECT(obj));
  +        gchar *name = g_strdup_printf("device[%d]", sgx_count++);
  +        object_property_add_child(container_get(qdev_get_machine(), "/sgx-epc-device"),
  +                                      name, obj);
  
           /* set the memdev link with memory backend */
           object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,


  From the monitor, 
  (qemu) qom-list /machine/sgx-epc-device
  type (string)
  device[0] (child<sgx-epc>)
  device[1] (child<sgx-epc>)
  
  This can normally show two sgx epc section devices.
  
  If you have new patch, I can help verify, thanks!

  Yang

> Paolo

