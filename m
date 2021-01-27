Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4FD3057BC
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 11:04:39 +0100 (CET)
Received: from localhost ([::1]:41786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4hgk-0002js-Bx
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 05:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4hes-000178-AL
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:02:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4hej-0003lc-01
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611741752;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPAY0sI+7fVFP5fvJftAdBdFvByZe+GzE4pJQshDOTo=;
 b=YOoU8uKLr5D+ktnN+Xy8AGdUbH6yYQWtFF3yt6+zMiwPiVkVqNGo/srESHRDZ7hymdSDMs
 AvTFbJFChyzh1LVR15V4wNo1rreREGb+s7cdJH2AzCr8bPXTyKn4jR0gUfuIwhY8vSV+va
 gfVmcLFffY4cYWwUTYPfljjPpShJTmo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-fnt_GTydPKyLPZJry-IAdA-1; Wed, 27 Jan 2021 05:02:27 -0500
X-MC-Unique: fnt_GTydPKyLPZJry-IAdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 409A1190A7A2;
 Wed, 27 Jan 2021 10:02:26 +0000 (UTC)
Received: from redhat.com (ovpn-115-120.ams2.redhat.com [10.36.115.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DEEE10074E1;
 Wed, 27 Jan 2021 10:02:24 +0000 (UTC)
Date: Wed, 27 Jan 2021 10:02:21 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v4 4/4] meson: Warn when TCI is selected but TCG backend
 is available
Message-ID: <20210127100221.GD3653144@redhat.com>
References: <20210125144530.2837481-1-philmd@redhat.com>
 <20210125144530.2837481-5-philmd@redhat.com>
 <20210125164746.GE3538803@redhat.com>
 <992cbe66-dfae-7950-0d92-516b2f0c9717@redhat.com>
 <9f22d4b0-34ca-6798-3661-36057609c152@weilnetz.de>
 <30cc0c14-fbec-bb21-2b6b-8e295029bc1f@linaro.org>
 <8f1f2dc6-5ad2-7d48-c2f9-9afa1e4d4065@weilnetz.de>
 <81c810b4-1bd3-631d-4b5b-7e54a27a5b4c@linaro.org>
 <cd9265f7-4887-63bb-e36e-ace708d062c1@weilnetz.de>
 <875z3jy3tt.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <875z3jy3tt.fsf@linaro.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 26, 2021 at 05:24:10PM +0000, Alex Bennée wrote:
> 
> Stefan Weil <sw@weilnetz.de> writes:
> 
> > Am 25.01.21 um 23:35 schrieb Richard Henderson:
> >> On 1/25/21 11:02 AM, Stefan Weil wrote:
> >>> Am 25.01.21 um 20:02 schrieb Richard Henderson:
> >>>> On 1/25/21 8:58 AM, Stefan Weil wrote:
> >>>>> I have no evidence that TCI is less reliable than TCG, so I would not write
> >>>>> that.
> >>>> It can't pass make check-tcg.
> >>> Where does it fail? Maybe an expected timeout problem which can be solved by
> >>> increasing the timeouts for TCI?
> >>>
> >>> I have just run a local test of `make check-tcg` with native TCG and with TCI
> >>> and did not see a difference. But I noticed that in both cases many tests show
> >>> "skipped".
> >> You need to enable docker or podman for your development, so that you get all
> >> of the cross-compilers.
> >>
> >> Then:
> >>
> >>    TEST    fcvt on arm
> >> TODO ../qemu/tcg/tci.c:614: tcg_qemu_tb_exec()
> >> ../qemu/tcg/tci.c:614: tcg fatal error
> >> qemu: uncaught target signal 11 (Segmentation fault) - core dumped
> >>
> >>    TEST    float_convs on m68k
> >> TODO ../qemu/tcg/tci.c:614: tcg_qemu_tb_exec()
> >> ../qemu/tcg/tci.c:614: tcg fatal error
> >> qemu: uncaught target signal 11 (Segmentation fault) - core dumped
> >>
> >> which is of course one of the TODO assertions.
> >> It's positively criminal those still exist in the code.
> >
> >
> > I installed podman and repeated `make check-tcg`. The log file still 
> > shows 87 lines with "SKIPPED". There is also a gdb core dump, several 
> > warnings, but nothing related to TCI. Both tests cited above seem to 
> > work without a problem.
> 
> I'm going to go out on a limb and guess you have commit:
> 
>   23a77b2d18 (build-system: clean up TCG/TCI configury)
> 
> which temporarily has the effect of disabling TCI. See
> 
>   Subject: Re: [PATCH v4 1/4] configure: Fix --enable-tcg-interpreter
>   From: Paolo Bonzini <pbonzini@redhat.com>
>   Message-ID: <2b8b6291-b54c-b285-ae38-21f067a8497d@redhat.com>
>   Date: Mon, 25 Jan 2021 17:36:42 +0100
> 
> with that fix fixed I see the same failures as Richard:
> 
>   ./qemu-arm ./tests/tcg/arm-linux-user/fcvt > /dev/null
>   TODO ../../tcg/tci.c:614: tcg_qemu_tb_exec()
>   ../../tcg/tci.c:614: tcg fatal error
>   qemu: uncaught target signal 11 (Segmentation fault) - core dumped
>   fish: “./qemu-arm ./tests/tcg/arm-linu…” terminated by signal SIGSEGV (Address boundary error)
> 
> which does raise the question before today when was the last time anyone
> attempted to run check-tcg on this?
> 
> > The complete log file is available from 
> > https://qemu.weilnetz.de/test/check-tcg.txt.
> >
> > Daniel, regarding your comment: TCI has 100 % test coverage for the 
> > productive code lines.
> 
> By what tests? The fact you don't hit asserts in your day to day testing
> doesn't mean there are features missing that are easily tripped up or
> that TCI got it right.
> 
> > All code lines which were never tested raise an 
> > assertion, so can easily be identified (and fixed as soon as there is a 
> > test case which triggers such an assertion). The known deficits are 
> > speed, missing TCG opcodes, unimplemented TCG opcodes because of missing 
> > test cases and missing support for some host architectures.
> 
> Passing check-tcg would be a minimum for me.

Passing check-tcg *in gitlab CI* would be the minimum to consider
it on a par with TCG.

The lack of automated GitLab CI for TCI is a reason my proposed wording
described TCI as less reliable than native TCG. We can't claim it has
equivalent reliability unless we have equiv automated testing of TCI.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


