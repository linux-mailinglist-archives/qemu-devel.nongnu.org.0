Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9905B0881
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 17:24:49 +0200 (CEST)
Received: from localhost ([::1]:47604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVwv2-0003dC-Iq
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 11:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVwsz-00029e-LU
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:22:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVwsv-0007Wx-K8
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662564156;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=QI3zqZ2v+3PHo55GhdaPBfgI12wkjic1RYBORAiiHI4=;
 b=TaWnyIn74BeaaSg4nI8FWP/6XT8DW5Xh12q+6YQFjb+tn8w2QHhzhL7E1Bp8a0MgmHuZzQ
 ZteF2apD3Dgln0czYTVooQYBgq/klVOFEPU1bZLtW+0A1dyLcZsrajBGE0AbGmijDPs31T
 SiP8ZEa/NnCUgPTkBtj6YTilrE3H18I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-7dB00y44P7erhANHhIa_tA-1; Wed, 07 Sep 2022 11:22:33 -0400
X-MC-Unique: 7dB00y44P7erhANHhIa_tA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB5282999B56;
 Wed,  7 Sep 2022 15:22:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1E06492C3B;
 Wed,  7 Sep 2022 15:22:28 +0000 (UTC)
Date: Wed, 7 Sep 2022 16:22:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] audio: add help option (?) for -audiodev
Message-ID: <Yxi3MOT/s8nn45zp@redhat.com>
References: <20220907142359.31827-1-cfontana@suse.de>
 <87fsh3usub.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87fsh3usub.fsf@pond.sub.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Wed, Sep 07, 2022 at 05:06:36PM +0200, Markus Armbruster wrote:
> Claudio Fontana <cfontana@suse.de> writes:
> 
> > add a simple help option for -audiodev, so users can do
> >
> > qemu -audiodev ?
> 
> The preferred form is actually '-audiodev help'.  The other one is
> deprecated.  Recommend to stay away from it even in commit messages.

We introduced 'help' many many years ago, but don't thing we
ever formally deprecated '?'.  Should we do so and aim to
remove it, or are we happy to keep '?' forever, despite it
tripping up shell filename expansion with single char filenames.

(tangential to this patch, NOT a request to fix something in v2)

> >
> > to get the list of drivers available.
> >
> > Signed-off-by: Claudio Fontana <cfontana@suse.de>
> > ---
> >  audio/audio.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)

Update qemu-options.hx ?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


