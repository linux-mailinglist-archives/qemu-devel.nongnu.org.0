Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39936343FE0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:33:06 +0100 (CET)
Received: from localhost ([::1]:59122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOInx-0005NP-65
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOImm-0004vb-Pn
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:31:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOImk-00016g-PL
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616412710;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVsTBstRSUC0T7XohQxt8/knZGxcnVlFO1G1KzsvqEI=;
 b=GmNaJFjW7juqS73lGvm9WYRnOP/L/eTpvQVKHrqLFRs/NpdKAFijDKM8YN/ovxBTykmJoa
 05RHF31CRNNA885Nj5WGtiD8Y3RFFUbP8Jc5SYLClCK2SdIOneMuypjQNv1F7+pzypAwQz
 Ahx4Y1eBt6nmQuzEmGL2j3D+wegHnEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-h7A8jLX4PaeYIayq0Ckfzw-1; Mon, 22 Mar 2021 07:31:43 -0400
X-MC-Unique: h7A8jLX4PaeYIayq0Ckfzw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79D631007467;
 Mon, 22 Mar 2021 11:31:42 +0000 (UTC)
Received: from redhat.com (ovpn-112-245.ams2.redhat.com [10.36.112.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75EEC62A6F;
 Mon, 22 Mar 2021 11:31:41 +0000 (UTC)
Date: Mon, 22 Mar 2021 11:31:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/13] misc patches removing deprecated features
Message-ID: <YFiAGgZmvEXwR+h6@redhat.com>
References: <20210318092512.250725-1-berrange@redhat.com>
 <CAFEAcA-z2Yw+9wxHSYsq3q_n9fQUgfmoEg4C1u=89cr+BWgOeQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-z2Yw+9wxHSYsq3q_n9fQUgfmoEg4C1u=89cr+BWgOeQ@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Ian Jackson <iwj@xenproject.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 10:52:02AM +0000, Peter Maydell wrote:
> On Thu, 18 Mar 2021 at 09:30, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > ----------------------------------------------------------------
> > Remove many old deprecated features
> >
> > The following features have been deprecated for well over the 2
> > release cycle we promise
> >
> >   ``-drive file=json:{...{'driver':'file'}}`` (since 3.0)
> >   ``-vnc acl`` (since 4.0.0)
> >   ``-mon ...,control=readline,pretty=on|off`` (since 4.1)
> >   ``migrate_set_downtime`` and ``migrate_set_speed`` (since 2.8.0)
> >   ``query-named-block-nodes`` result ``encryption_key_missing`` (since 2.10.0)
> >   ``query-block`` result ``inserted.encryption_key_missing`` (since 2.10.0)
> >   ``migrate-set-cache-size`` and ``query-migrate-cache-size`` (since 2.11.0)
> >   ``query-named-block-nodes`` and ``query-block`` result dirty-bitmaps[i].status (since 4.0)
> >   ``query-cpus`` (since 2.12.0)
> >   ``query-cpus-fast`` ``arch`` output member (since 3.0.0)
> >   ``query-events`` (since 4.0)
> >   chardev client socket with ``wait`` option (since 4.0)
> >   ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, ``acl_remove`` (since 4.0.0)
> >   ``ide-drive`` (since 4.2)
> >   ``scsi-disk`` (since 4.2)
> 
> Just FYI, it turns out that removing 'query-cpus' has broken Xen,
> whose libxl control library is still using it:
> 
> https://lists.xenproject.org/archives/html/xen-devel/2021-03/msg01178.html

I don't know what Xen's expected min QEMU version is, but if it
can assume QEMU >= 2.12, then there's no need to check for existance
of query-cpus-fast, and can just apply

diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 5d4ec90711..5fdcc182c0 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -1749,14 +1749,14 @@ static int qmp_parse_query_cpus(libxl__gc *gc,
     const libxl__json_object *cpu;
 
     libxl_bitmap_set_none(map);
-    /* Parse response to QMP command "query-cpus":
-     * [ { 'CPU': 'int',...} ]
+    /* Parse response to QMP command "query-cpus-fast":
+     * [ { 'cpu-index': 'int',...} ]
      */
     for (i = 0; (cpu = libxl__json_array_get(response, i)); i++) {
         unsigned int cpu_index;
         const libxl__json_object *o;
 
-        o = libxl__json_map_get("CPU", cpu, JSON_INTEGER);
+        o = libxl__json_map_get("cpu-index", cpu, JSON_INTEGER);
         if (!o) {
             LOGD(ERROR, domid, "Failed to retrieve CPU index.");
             return ERROR_QEMU_API;
@@ -1841,7 +1841,7 @@ int libxl_set_vcpuonline(libxl_ctx *ctx, uint32_t domid,
                                              LIBXL_QMP_CMD_TIMEOUT * 1000);
             if (rc) goto out;
             qmp->callback = set_vcpuonline_qmp_cpus_queried;
-            rc = libxl__ev_qmp_send(egc, qmp, "query-cpus", NULL);
+            rc = libxl__ev_qmp_send(egc, qmp, "query-cpus-fast", NULL);
             if (rc) goto out;
             return AO_INPROGRESS;
         default:
@@ -2199,7 +2199,7 @@ static void retrieve_domain_configuration_lock_acquired(
         libxl_bitmap_alloc(CTX, &rdcs->qemuu_cpus,
                            d_config->b_info.max_vcpus);
         rdcs->qmp.callback = retrieve_domain_configuration_cpu_queried;
-        rc = libxl__ev_qmp_send(egc, &rdcs->qmp, "query-cpus", NULL);
+        rc = libxl__ev_qmp_send(egc, &rdcs->qmp, "query-cpus-fast", NULL);
         if (rc) goto out;
         has_callback = true;
     }


If Xen needs to support QEMU < 2.12, then it will need to
probe for existance of query-cpus-fast using "query-commands"
as libvirt does...

> This suggests we should probably try to coordinate a bit better
> with Xen as one of our downstream QMP users.

They could be added to the MAINTAINERS file for the deprecated features
doc, so that paches automatically CC xen-devel (or another suitable
list or person). 



> Am I right in thinking that QEMU now has an option that Xen
> could turn on in their CI for "make attempts to use deprecated
> features fail" so they could catch them earlier in the
> deprecate-and-delete cycle?

Yes, you just merged it from Markus:

  https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg06803.html

it won't capture all deprecations, but it will catch QMP related ones
and thus I believe would have caught the query-cpus deprecaton.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


