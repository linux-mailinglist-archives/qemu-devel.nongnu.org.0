Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB43F5180C8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 11:16:12 +0200 (CEST)
Received: from localhost ([::1]:54914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlodf-0000Dj-6Z
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 05:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nloaY-0007YY-BX
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:12:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nloaV-0000Qk-Hz
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651569175;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=RqVgFvSinPdTZYAmNEbHU5BMWMii6kMbbxsEZaPKaiw=;
 b=YU8FELEG/n5Ajqv5PZ2RFZgSRZdHLMOWzMGOLYuO/Q+OkF+jHT277lDB3pDjEejBudSEyD
 aG6IwrdWxdXGAFEMk26i9UiUFdPkH+KE30bKBOZfRQ4q38cWrwmgtucsQAul9qrTYYAovr
 hkYAWj6qfQa4VT2tLy1Om4kQFhBF2IE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-oEVShjf7PrOPT_m1a6Xnxg-1; Tue, 03 May 2022 05:12:53 -0400
X-MC-Unique: oEVShjf7PrOPT_m1a6Xnxg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 960181C151AE;
 Tue,  3 May 2022 09:12:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26F772166B41;
 Tue,  3 May 2022 09:12:46 +0000 (UTC)
Date: Tue, 3 May 2022 10:12:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: qemu-devel@nongnu.org, philmd@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 2/3] ui/gtk: detach_all option for making all VCs
 detached upon starting
Message-ID: <YnDyC4jvC/V0o33Z@redhat.com>
References: <20220428231304.19472-1-dongwon.kim@intel.com>
 <20220428231304.19472-3-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220428231304.19472-3-dongwon.kim@intel.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

On Thu, Apr 28, 2022 at 04:13:03PM -0700, Dongwon Kim wrote:
> With "detach-all=on" for display, QEMU starts with all VC windows
> detached automatically.
> 
> If used with "full-screen=on", it places individual windows (from
> top window) starting from monitor 0 or monitor n in case monitor=n.
> 
> In case # mon < # VCs, only same number of VCs as # mon will be sent to
> the monitors for full-screen while others are remaining in windowed-mode.
> 
> Target monitor number for individual VC is rotated in case monitor=n
> (n != 0) (e.g. if monitor=1 and # VCs = 2, the top window will be
> full-screened on monitor 1 and top second window will be full-screened
> on monitor 0.)

I tend to wonder whether we actually need this at all, as opposed
to just changing QEMU's behaviour by default.

It makes sense to have tabs per-VC for the things like the HMP
console, serial ports, etc, but I think graphical video outputs
should always be displayed as multiple windows. Putting graphical
outputs as tabs rather defeats the purpose of having multiple
outputs IMHO. 

IOW, why won't we just create 1 gtk window per graphical output
all the time.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


