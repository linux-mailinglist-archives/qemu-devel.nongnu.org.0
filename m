Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E562F536604
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:32:29 +0200 (CEST)
Received: from localhost ([::1]:38016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuct2-0005wg-R0
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nucqJ-0003dO-MF
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:29:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nucqI-0002Fw-2N
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:29:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653668977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JmaaUMbEXk8AZvknAJ+V8S7Op1HWX6W5W27Z9o3Mk5A=;
 b=LiqrNB9cBkaweAcycTtIQVW1gnide0u4g8K1rEF4ulg8j/PxzO+x0gQF1Ei9avI/wdez19
 IjJ087+mlSiSBM3CjXWOPBqo1Lz1sdCkbAJAtI3WtN+deSe4MS7YlHkVnJN6c/SRq/eAej
 o7WOrSOD/An0cQNKIjusZV8wGHgl1qA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-1pONF5D9PEi9FDzhH02C5g-1; Fri, 27 May 2022 12:29:34 -0400
X-MC-Unique: 1pONF5D9PEi9FDzhH02C5g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4005858EEE;
 Fri, 27 May 2022 16:29:33 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51461492C3B;
 Fri, 27 May 2022 16:29:32 +0000 (UTC)
Date: Fri, 27 May 2022 18:29:29 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] iotests: fix source directory location
Message-ID: <YpD8aeAUxXokKy4n@redhat.com>
References: <20220526002512.1585246-1-jsnow@redhat.com>
 <Yo8yMoNjKsjZROQK@redhat.com>
 <CAFn=p-Y2+3JyTd_nn_HfCz6BbE=G3FYf5E1hZF7sovXBRK7YpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFn=p-Y2+3JyTd_nn_HfCz6BbE=G3FYf5E1hZF7sovXBRK7YpQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.05.2022 um 16:21 hat John Snow geschrieben:
> On Thu, May 26, 2022, 3:54 AM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Wed, May 25, 2022 at 08:25:12PM -0400, John Snow wrote:
> > > If you invoke the check script from outside of the tests/qemu-iotests
> > > directory, the directories initialized as source_iotests and
> > > build_iotests will be incorrect.
> > >
> > > We can use the location of the source file itself to be more accurate.
> > >
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > > ---
> > >  tests/qemu-iotests/testenv.py | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/tests/qemu-iotests/testenv.py
> > b/tests/qemu-iotests/testenv.py
> > > index a864c74b123..9b0f01e84db 100644
> > > --- a/tests/qemu-iotests/testenv.py
> > > +++ b/tests/qemu-iotests/testenv.py
> > > @@ -217,10 +217,10 @@ def __init__(self, imgfmt: str, imgproto: str,
> > aiomode: str,
> > >              self.build_iotests =
> > os.path.dirname(os.path.abspath(sys.argv[0]))
> > >          else:
> > >              # called from the source tree
> > > -            self.source_iotests = os.getcwd()
> > > +            self.source_iotests = str(Path(__file__, '..').resolve())
> >
> > Path(__file__).parent
> >
> > >              self.build_iotests = self.source_iotests
> > >
> > > -        self.build_root = os.path.join(self.build_iotests, '..', '..')
> > > +        self.build_root = str(Path(self.build_iotests,
> > '../..').resolve())
> >
> > Path(self.build_iotests).parent.parent
> >
> > to be portable
> >
> 
> With windows? I think Path() is meant to be a fully portable class as-is,
> but I'll double-check my assumption. I use ".." elsewhere in code already
> checked in, so if it's a problem I ought to fix it everywhere.

I don't see any potential problem with the second hunk because we're
dealing with the path of a directory there, but "regular_file.py/.."
looks a bit fishy to me and doesn't work if you ask the kernel. Is this
guaranteed to work in Python or is it an implementation detail of Path
that may change?

Kevin


