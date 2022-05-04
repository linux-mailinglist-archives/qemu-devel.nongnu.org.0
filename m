Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0AF5199DF
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 10:33:52 +0200 (CEST)
Received: from localhost ([::1]:51962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmASF-0005tf-60
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 04:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmAMl-0004Hl-Ep
 for qemu-devel@nongnu.org; Wed, 04 May 2022 04:28:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmAMj-0000Qk-Ob
 for qemu-devel@nongnu.org; Wed, 04 May 2022 04:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651652889;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gvBzULLGKC1NPYHn/pU9bQtuvimsC/sXRNIWE7ne4bM=;
 b=gNvYLwAzpna9DeBGwbfzDWfnDgLV08P7BefAbIhLlvrA9b2bpCrhf2wYz4m53PH69D/suR
 c5DvbDOCR8Y4nuQD6LT/8GQLjdHQq1qePj5OVS4oBn1SCbwdsFD2KoqIa8SlZIlueAnnmj
 iL3cGQt0AYDnDX/TYfU8LX9EJMA28WQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-utAVuO1BML2JmExSh_G5Ow-1; Wed, 04 May 2022 04:28:05 -0400
X-MC-Unique: utAVuO1BML2JmExSh_G5Ow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A84985A5BE;
 Wed,  4 May 2022 08:28:05 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D0AA1557D5B;
 Wed,  4 May 2022 08:28:04 +0000 (UTC)
Date: Wed, 4 May 2022 09:28:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: qemu-devel@nongnu.org, philmd@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 2/3] ui/gtk: detach_all option for making all VCs
 detached upon starting
Message-ID: <YnI5EeToL+y6i0ER@redhat.com>
References: <20220428231304.19472-1-dongwon.kim@intel.com>
 <20220428231304.19472-3-dongwon.kim@intel.com>
 <YnDyC4jvC/V0o33Z@redhat.com>
 <20220503232144.GB352@dongwonk-MOBL.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220503232144.GB352@dongwonk-MOBL.amr.corp.intel.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 03, 2022 at 04:21:44PM -0700, Dongwon Kim wrote:
> On Tue, May 03, 2022 at 10:12:43AM +0100, Daniel P. Berrangé wrote:
> > On Thu, Apr 28, 2022 at 04:13:03PM -0700, Dongwon Kim wrote:
> > > With "detach-all=on" for display, QEMU starts with all VC windows
> > > detached automatically.
> > > 
> > > If used with "full-screen=on", it places individual windows (from
> > > top window) starting from monitor 0 or monitor n in case monitor=n.
> > > 
> > > In case # mon < # VCs, only same number of VCs as # mon will be sent to
> > > the monitors for full-screen while others are remaining in windowed-mode.
> > > 
> > > Target monitor number for individual VC is rotated in case monitor=n
> > > (n != 0) (e.g. if monitor=1 and # VCs = 2, the top window will be
> > > full-screened on monitor 1 and top second window will be full-screened
> > > on monitor 0.)
> > 
> > I tend to wonder whether we actually need this at all, as opposed
> > to just changing QEMU's behaviour by default.
> > 
> > It makes sense to have tabs per-VC for the things like the HMP
> > console, serial ports, etc, but I think graphical video outputs
> > should always be displayed as multiple windows. Putting graphical
> > outputs as tabs rather defeats the purpose of having multiple
> > outputs IMHO. 
> > 
> > IOW, why won't we just create 1 gtk window per graphical output
> > all the time.
> 
> I got your point but I think this requires changes in the
> policy, which I guess need community-wide agreement. Why don't we move
> on with this new option and at the same time start the discussion?

Once we add a CLI option is it is more complicated to remove it again
later. So if we don't actually need it, it is better not to add it in
the first place.

> One more point is, I tried to find out but I couldn't think of any good way
> to distinguish between guest output consoles and other consoles. Do you
> have any thought on this?

There's a helper:

  bool qemu_console_is_graphic(QemuConsole *con);
 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


