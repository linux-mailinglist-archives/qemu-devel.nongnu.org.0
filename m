Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA36B48D315
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 08:44:35 +0100 (CET)
Received: from localhost ([::1]:45436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7umg-0005WC-IH
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 02:44:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n7uPV-00020q-DM
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:20:43 -0500
Received: from mga12.intel.com ([192.55.52.136]:11691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n7uPP-0004YU-A4
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:20:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642058431; x=1673594431;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uibUom8wUBLLeZWZTuDGOMVJrNEWYwNYqMLzHmr/328=;
 b=S3oVvSt7WMcpW1pUTuoniC8RlFp6AZfy5o3D2ba5i8lOw59m9iATi/ZG
 l4uy4dx3at+XNOM3WFoR8QGZhEG+P3BRMUts8XyEQ6XqeUiWRVPdHSszr
 /zotILhfAhJ8l4BQ4ODBBxZiiBz/q1JuYBk6jSXnwryOjwLNMbWLF7+G/
 kOViB/iS4msW9QXoQT9ZmX7TJgCyfLXBqOvWeJxHpoNS+VE9+mMoAXjFM
 DKuC/KsMRmHSP6YgOFsraGYPSUpkZaFFahzECVuA9qXYWIpNKcFAUkn8k
 ihvb+FlpjLznNYOQQnXORU15MKmcJyI5ukBHCNA/EPYeTOUadSu1i++8w A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="223931711"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="223931711"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 23:20:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="529553435"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 12 Jan 2022 23:20:26 -0800
Date: Thu, 13 Jan 2022 15:05:12 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] sgx: Move sgx object from /machine/unattached to /machine
Message-ID: <20220113070512.GB14771@yangzhon-Virtual>
References: <20220112165517.4140482-1-yang.zhong@intel.com>
 <Yd6pV+6kdfLNQRnA@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yd6pV+6kdfLNQRnA@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.136; envelope-from=yang.zhong@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: eduardo@habkost.net, yang.zhong@intel.com, lin.a.yang@intel.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, haibin.huang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel,

On Wed, Jan 12, 2022 at 10:11:35AM +0000, Daniel P. Berrangé wrote:
> On Wed, Jan 12, 2022 at 11:55:17AM -0500, Yang Zhong wrote:
> > When Libvirt start, it get the vcpu's unavailable-features from
> > /machine/unattached/device[0] path by qom-get command, but in SGX
> > guest, since the sgx-epc virtual device is initialized before VCPU
> > creation(virtual sgx need set the virtual EPC info in the cpuid). This
> > /machine/unattached/device[0] is occupied by sgx-epc device, which
> > fail to get the unvailable-features from /machine/unattached/device[0].
> 
> If libvirt decides to enable SGX in a VM, then surely it knows
> that it should just query /machine/unattached/device[1] to get
> the CPU features instead. Why do we need to do anything in QEMU ?
> 

  I listed two solutions in the Qemu or Libvirt before:
  https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg05670.html

  This time, I posted this patch and hope to have a talk for this issue.

  If Libvirt side should handle this, I will drop this patch and inform
  them to do this. Thanks!


> > 
> > This patch make one new /machine/sgx object to avoid this issue.
> > (qemu) qom-list /machine/unattached/
> > device[0] (child<host-x86_64-cpu>)
> > 
> > (qemu) qom-list /machine/sgx
> > device[0] (child<sgx-epc>)
> > 
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  hw/core/qdev.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> > index 84f3019440..4154eef0d8 100644
> > --- a/hw/core/qdev.c
> > +++ b/hw/core/qdev.c
> > @@ -497,7 +497,7 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
> >      NamedClockList *ncl;
> >      Error *local_err = NULL;
> >      bool unattached_parent = false;
> > -    static int unattached_count;
> > +    static int unattached_count, sgx_count;
> >  
> >      if (dev->hotplugged && !dc->hotpluggable) {
> >          error_setg(errp, QERR_DEVICE_NO_HOTPLUG, object_get_typename(obj));
> > @@ -509,7 +509,15 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
> >              goto fail;
> >          }
> >  
> > -        if (!obj->parent) {
> > +        if (!obj->parent && !strcmp(object_get_typename(obj), "sgx-epc")) {
> > +            gchar *name = g_strdup_printf("device[%d]", sgx_count++);
> > +
> > +            object_property_add_child(container_get(qdev_get_machine(),
> > +                                                    "/sgx"),
> > +                                      name, obj);
> > +            unattached_parent = true;
> > +            g_free(name);
> 
> The qdev.c file is part of our generic object code. It should not
> contain any code that is tied to very specific object types like
> this.

  Okay, thanks!

  Yang 


> 
> > +        } else if (!obj->parent) {
> >              gchar *name = g_strdup_printf("device[%d]", unattached_count++);
> >  
> >              object_property_add_child(container_get(qdev_get_machine(),
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

