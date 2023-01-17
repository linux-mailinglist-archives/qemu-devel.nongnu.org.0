Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EFB66DD21
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 13:03:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHkft-0004Z7-3j; Tue, 17 Jan 2023 07:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHkfp-0004Th-HM
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:02:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHkfm-0001m8-VK
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:02:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673956956;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QLgvqefKmYRpQj5J5X7n4GVyzk/Qdo/4EVcDNctfklg=;
 b=ThfvLu0TBc6IZFdo14qfUaq0TKGGAMj6tH1syT1IX5hHpIudwgcvIErTRqI0AIRZpGFUXY
 R8ZQzpFEu67487c05BhUz3QSrrhVZatcCqvlsZQLaXPjH+Dn4Hl/XnTVPuMiP2lJX37lpC
 DdbrADL8O5eH49AuNNGSEW2O8PqS1gw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-MZgGUOl9MeGLkrY7i0TMOA-1; Tue, 17 Jan 2023 07:02:34 -0500
X-MC-Unique: MZgGUOl9MeGLkrY7i0TMOA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F59E858F0E;
 Tue, 17 Jan 2023 12:02:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 443A914171B8;
 Tue, 17 Jan 2023 12:02:33 +0000 (UTC)
Date: Tue, 17 Jan 2023 12:02:31 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2] tests/qtest/qom-test: Do not print tested properties
 by default
Message-ID: <Y8aOVxklkrvriPQc@redhat.com>
References: <20221215153036.422362-1-thuth@redhat.com>
 <CAFEAcA_EUNGFzLh8d9631WZR+-bR8oVynBs6=FV_kmLWNx2bSg@mail.gmail.com>
 <CAFEAcA80=+dXd5uDfSd8-sAPwbrYMqaPKhLGt7w8vh3MiQwLCQ@mail.gmail.com>
 <43415e4f-c6bf-31c6-3a2e-cea86c511223@redhat.com>
 <Y8Z8CJoFyxB9uHqU@redhat.com>
 <CAFEAcA_hMpFL=Pn8hSc1BDJO3n4e5kq2dSmyWTNBfs2gRa8mjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA_hMpFL=Pn8hSc1BDJO3n4e5kq2dSmyWTNBfs2gRa8mjA@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Tue, Jan 17, 2023 at 11:16:32AM +0000, Peter Maydell wrote:
> On Tue, 17 Jan 2023 at 10:44, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > Something random that looks like bad text data
> >
> > ▶ 166/619 /ptimer/oneshot policy=no_immediate_����������������������������������������������������������������...snip....�������������
> 
> I don't understand this one. The string comes from
> tests/unit/ptimer-test.c:add_ptimer_tests() but that
> code creates the test string using g_strlcat() and
> g_strdup_printf(), so I don't see how it could end
> up being junk, especially not at that point in
> the string. I guess it's possible something else in
> the test is managing to corrupt the g_test test name
> strings?

Actually it looks like something else spewing ����������
a to stderr, and this getting intermixed with stdout from the
test suite.  The test case name isn't corrupt, as I see the
remaining "reload,..." bit that jouins with 'policy=no_immediate_"

Wonder what's responsible for this garbage on stderr...


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


