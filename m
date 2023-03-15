Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3396BAF01
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 12:16:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcP7A-0001Dq-Si; Wed, 15 Mar 2023 07:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pcP75-0001B5-AA
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:16:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pcP72-0006UW-LD
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:16:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678878967;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kcADufBuko/0+uZ49Bk3bPRbK0qK8iXufR+pbhckNxk=;
 b=ZKvizfbPke632u3DiLoZUy2zgLJSzYVsvWwyssaURS6VK4uP/69kAgTpDkzWSEb0dgG44C
 l95bmBhv1noIjh9XKQ5yW61xsVW43GYiw1bcq7rG5FaWuInZJb5xFFu592V3c+GUifXdUA
 ktk0EmwEArUlbzFeKUHOIEBD4RiruHw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-6rJp4DRYNxSfSsYfnOn_Cg-1; Wed, 15 Mar 2023 07:16:06 -0400
X-MC-Unique: 6rJp4DRYNxSfSsYfnOn_Cg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C191429AA3BD;
 Wed, 15 Mar 2023 11:16:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4654140CF8EF;
 Wed, 15 Mar 2023 11:16:04 +0000 (UTC)
Date: Wed, 15 Mar 2023 11:16:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Marco Liebel <quic_mliebel@quicinc.com>, qemu-devel@nongnu.org,
 Taylor Simpson <tsimpson@quicinc.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH] Use f-strings in python scripts
Message-ID: <ZBGo8WNlnRZUGYJZ@redhat.com>
References: <20230313172535.2409370-1-quic_mliebel@quicinc.com>
 <c05ddbd3-8f26-5492-3961-7f3d564373d7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c05ddbd3-8f26-5492-3961-7f3d564373d7@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 15, 2023 at 08:43:33AM +0100, Philippe Mathieu-Daudé wrote:
> Hi Marco,
> 
> (+Python experts)
> 
> On 13/3/23 18:25, Marco Liebel wrote:
> > Replace python 2 format string with f-strings
> > 
> > Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
> > ---
> >   target/hexagon/gen_helper_funcs.py      |  54 ++--
> >   target/hexagon/gen_helper_protos.py     |  10 +-
> >   target/hexagon/gen_idef_parser_funcs.py |   8 +-
> >   target/hexagon/gen_op_attribs.py        |   4 +-
> >   target/hexagon/gen_op_regs.py           |  10 +-
> >   target/hexagon/gen_opcodes_def.py       |   2 +-
> >   target/hexagon/gen_printinsn.py         |  14 +-
> >   target/hexagon/gen_shortcode.py         |   2 +-
> >   target/hexagon/gen_tcg_func_table.py    |   2 +-
> >   target/hexagon/gen_tcg_funcs.py         | 317 +++++++++++-------------
> >   target/hexagon/hex_common.py            |   4 +-
> >   11 files changed, 198 insertions(+), 229 deletions(-)
> 
> These files use a mix of ', " and '''... Since you are modifying
> them, it would be nice to unify. I'm not sure there is a recommended
> style; matter of taste, I find the single quote (') less aggressive,
> then escaping it using ", and keeping ''' for multi-lines strings.

FWIW, rather than debating code style issues and coming up with a custom
set of rules for QEMU python code, my recommendation would be to consider
adopting 'black'

  https://black.readthedocs.io/en/stable/

There is a trend with recent languages to offer an opinionated code
formatting tool as standard to maximise consistency across projects
in a given language. 'black' is a decent attempt to bring this to
the python world. I found it pretty liberating when doing recent
python work in libvirt, to be able to mostly not worry about formatting
anymore.

The main downside is the bulk-reformat in the history, which can
make backports more challenging. For "git blame" you can use the
.git-blame-ignore-revs file to hide the reformats.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


