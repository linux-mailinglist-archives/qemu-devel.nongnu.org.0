Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF864AC83B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 19:10:17 +0100 (CET)
Received: from localhost ([::1]:58414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH8Sp-0000PU-T5
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 13:10:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nH8Or-0005zR-Tr
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 13:06:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nH8Oi-0005AK-KI
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 13:05:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644257155;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fS9nQMvmKnCQ2RdBqYNPcf88Z1X8p1wnY86rgqJgSB0=;
 b=XY6Eave/9V6QVxUOPY69AxR5dvEffzjYBLv4JBswcM8kmxZK2dOkOLf2nnyL4+Ctt3vHeI
 0bSBCwomxygtCmQBVoZdMarID9jCM4xxTE/KQ8pFv6EnJUk06OoXt2I3eKWI1Q8kzwtKcE
 W+nzCs6T2yigyq1AovHF1RBnC/52Qnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-H1c-qIGtMhmYaZUL8t2Vhg-1; Mon, 07 Feb 2022 13:05:48 -0500
X-MC-Unique: H1c-qIGtMhmYaZUL8t2Vhg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95C5E84DA43;
 Mon,  7 Feb 2022 18:05:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D037B78AB5;
 Mon,  7 Feb 2022 18:05:30 +0000 (UTC)
Date: Mon, 7 Feb 2022 18:05:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: Adding a 'qemu.qmp' repository to gitlab.com/qemu-project/
Message-ID: <YgFfZ+2cy/g9RTLQ@redhat.com>
References: <CAFn=p-YxK8JduYOzxwDJSsmANgsqb+tK049t75VbXK-=Qi3J9w@mail.gmail.com>
 <87czjyhaza.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87czjyhaza.fsf@linaro.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 07, 2022 at 04:54:25PM +0000, Alex Bennée wrote:
> 
> John Snow <jsnow@redhat.com> writes:
> 
> > Hi Peter:
> >
> > I am working my way towards splitting the QMP library out of the
> > qemu.git source tree. I'd like to ask for permission to:
> >
> > (1) Create a "qemu.qmp" repository under the qemu-project umbrella on
> > GitLab
> 
> No objection for my part except maybe a better name? QemuPythonQmp? I
> guess the header text can make it clear.

I think it definitely ought to have the word 'python' in the
repo name, because there's talk of having bindings for other
languages and we want a reliable way to distinguish what repo
and project we're dealing with, if the remaining part of the
name is not very distinctive.  'python-qemu.qmp.git' seems
reasonable enough.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


