Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7C26BD40A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 16:39:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcphQ-0000qx-3h; Thu, 16 Mar 2023 11:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pcphK-0000ps-Kr
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:39:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pcphI-0006bh-W6
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678981160;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=tsggQ8Zx0s88a6UCfUtJhaGwohA/wPwk6hC7Xezu5Qc=;
 b=GUB0tVOy9Sg9mnVjmhShQQOlMLHgpKnXmXJm6K3GMbIOCv42q0C6bS7UcCrylIvY38WwVI
 +dROfD4L8BICfCA8mNovgDo7528OWkpZ0StOvMc/i9rglyptWAS5OT9Vdo4GCn1wG7B5xt
 G5ZH/6X2cEM1AwskBJogClf+RvelXrI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-kbDO-qJROuuIU_OoSYnk4Q-1; Thu, 16 Mar 2023 11:39:17 -0400
X-MC-Unique: kbDO-qJROuuIU_OoSYnk4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE87F1C07557;
 Thu, 16 Mar 2023 15:39:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B68EE2166B26;
 Thu, 16 Mar 2023 15:39:15 +0000 (UTC)
Date: Thu, 16 Mar 2023 15:39:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Randrianasulu <randrianasulu@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: dropping 32-bit host support
Message-ID: <ZBM4IfhnjvJ5iPdh@redhat.com>
References: <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
 <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
 <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
 <632e7256-34f5-ca87-ff60-a5c11aa1dd7f@redhat.com>
 <CA+rFky6WqdLjNpeU3sCXwjwMEuEK+XVHE5BBCKYC=umRGK81eg@mail.gmail.com>
 <CA+rFky4su7ZEo8pNQGk3qEkTOLEkFAqO2Tsrh6VyDaNOf7w=_Q@mail.gmail.com>
 <ac632c34-42e0-d715-52d9-b70ead6296a7@redhat.com>
 <CA+rFky6Tt0hcv9TuthS7Q-5SMXtPi+3W8B5qX5itJ0A+meh_Ew@mail.gmail.com>
 <ZBMNEdz9WnUsckd7@redhat.com>
 <CA+rFky6hnaCxF10ST=qsLsBjH6=M__kQPA=yoZhdCoB8sH96ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+rFky6hnaCxF10ST=qsLsBjH6=M__kQPA=yoZhdCoB8sH96ug@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Mar 16, 2023 at 04:01:06PM +0300, Andrew Randrianasulu wrote:
> Well, this language about "market" and "investment"  not just figures of
> the speech, sadly? Because paid developers work on  areas they paid to
> develop, by boss with big bucks.

This is FUD.

Many QEMU maintainers are employeed, but that does not mean that their
boss gets to dictate what the QEMU community does. The company has its
priorities but this cannot be forced onto the community. Changes have
to be made through tradeoffs and consensus building across all active
maintainers.

To put it another way, responsible open source maintainers/contributors
wear two hats.

With their corporate hat on they have tasks to work on that are directly
important to their employer in the short term. They can make a case for
why these contributions are beneficial, but there's never a guarantee
the community will agree / accept it.

With their community hat on they look at, and work on, what is important
for the health of the community in general. This can sometimes be contrary
to what the employer would otherwise like to see. Wise companies accept
this tradeoff, because the long term health of the community is ultimately
important to them too.

QEMU is fortunate to have many responsible maintainers who balance the
demands of their employer vs the community on an ongoing basis.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


