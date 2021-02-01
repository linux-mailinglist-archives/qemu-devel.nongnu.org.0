Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDAC30AD37
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:58:06 +0100 (CET)
Received: from localhost ([::1]:46916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6cWb-0003dL-TN
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:58:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6cTp-0002Vi-Aa
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:55:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6cTg-0004yY-7B
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612198502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KOY9qOtV9SE0Pd6NiDLb5inv1Ue+ijZjOraPVvx0A9E=;
 b=UhSQ+yZ2qbWu5Ola7pionKNdGh7D0ZLYT+vS88qiSxljuSpHQ9tbAXWOKDLCoTIy6sSxhu
 DVOWMVuZZn9k79lbGXWWOPyK9SfefJjjMDUcd1GB7Gpy+OnKvmOxakJIxYCDQOM2FWAIoR
 AccY67kVI2/5dJdjAOkKzLlc18QIFE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-eyCFChQmPxmnLPVW5d6EhA-1; Mon, 01 Feb 2021 11:54:55 -0500
X-MC-Unique: eyCFChQmPxmnLPVW5d6EhA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDA91800D55;
 Mon,  1 Feb 2021 16:54:53 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B7A15D749;
 Mon,  1 Feb 2021 16:54:46 +0000 (UTC)
Date: Mon, 1 Feb 2021 17:54:45 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PULL 10/11] trace: document how to specify multiple --trace
 patterns
Message-ID: <20210201165445.GI13157@merkur.fritz.box>
References: <20210201154703.180022-1-stefanha@redhat.com>
 <20210201154703.180022-11-stefanha@redhat.com>
 <d5e9b59a-f7df-5a7b-55bb-cc6066b18a70@eik.bme.hu>
 <20210201161352.GH13157@merkur.fritz.box>
 <cbab5846-b5d-d256-89d7-b2bf9f7c69f@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <cbab5846-b5d-d256-89d7-b2bf9f7c69f@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.02.2021 um 17:29 hat BALATON Zoltan geschrieben:
> On Mon, 1 Feb 2021, Kevin Wolf wrote:
> > Am 01.02.2021 um 17:05 hat BALATON Zoltan geschrieben:
> > > On Mon, 1 Feb 2021, Stefan Hajnoczi wrote:
> > > > It is possible to repeat the --trace option to specify multiple
> > > > patterns. This may be preferrable to users who do not want to create a
> > > > file with a list of patterns.
> > > > 
> > > > Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > > > Message-id: 20210112165859.225534-2-stefanha@redhat.com
> > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > ---
> > > > docs/devel/tracing.rst | 9 +++++++--
> > > > 1 file changed, 7 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
> > > > index af395e957d..e8f9b82c5e 100644
> > > > --- a/docs/devel/tracing.rst
> > > > +++ b/docs/devel/tracing.rst
> > > > @@ -22,10 +22,15 @@ events::
> > > > This output comes from the "log" trace backend that is enabled by default when
> > > > ``./configure --enable-trace-backends=BACKENDS`` was not explicitly specified.
> > > > 
> > > > -More than one trace event pattern can be specified by providing a file
> > > > -instead::
> > > > +Multiple patterns can be specified by repeating the ``--trace`` option::
> > > > +
> > > > +    $ qemu --trace "kvm_*" --trace "virtio_*" ...
> > > 
> > > Does that actually work? I've always used -trace enable="pattern1" -trace
> > > enable="pattern2" Not sure if omitting enable= is the same.
> > 
> > qemu_trace_opts has .implied_opt_name = "enable", so without having
> > tested it, I assume this works.
> 
> How does this option parsing work? Would then multiple patterns separated by
> comma as in -trace pattern1,pattern2 also work?

This would be interpreted as an implied "enable" option with a value of
"pattern1,pattern2". I don't think anything splits that string at the
comma, so it would look for a trace event matching that string.

Kevin


