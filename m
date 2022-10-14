Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 268DD5FED4D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 13:44:06 +0200 (CEST)
Received: from localhost ([::1]:49286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojJ6i-0007PX-P7
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 07:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ojIyT-00039i-M4
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:35:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ojIyR-0002oQ-Jb
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665747331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=laD1G3TsA9SUSIg2ooKDBMmGbYEUIOrfTdiIR5rn0tQ=;
 b=aesdKioY2hvWryzDIZ52dqMnal1n86Qnf5pMkyE4tUTkosyPD7fO0dYlQrsN5xkcz+6hIp
 KYI+x3xibhBsot1uj2teEdFnwgACABx/ZoupmS39lTHgMFhVnC+xf4tuhGE+6jnv4ryBLx
 HAXpLJkrdLS3vpuSk4QbSqM3lesd3Y0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-k40eXRdCM8KDhXIyHnyVCw-1; Fri, 14 Oct 2022 07:35:27 -0400
X-MC-Unique: k40eXRdCM8KDhXIyHnyVCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78ECD87B2A2;
 Fri, 14 Oct 2022 11:35:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45296207B31A;
 Fri, 14 Oct 2022 11:35:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1149021E691D; Fri, 14 Oct 2022 13:35:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org,
 pbonzini@redhat.com,  stefanha@redhat.com,  peter.maydell@linaro.org,
 agraf@csgraf.de
Subject: Re: [RFC PATCH 0/4] docs/devel suggestions for discussion
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
 <b3d01cdd-9893-ee76-0d3c-fd11ea6e3f7c@ilande.co.uk>
Date: Fri, 14 Oct 2022 13:35:26 +0200
In-Reply-To: <b3d01cdd-9893-ee76-0d3c-fd11ea6e3f7c@ilande.co.uk> (Mark
 Cave-Ayland's message of "Fri, 14 Oct 2022 10:46:29 +0100")
Message-ID: <87wn92r62p.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> On 12/10/2022 13:11, Alex Benn=C3=A9e wrote:
>
>> Hi,
>> This is an attempt to improve our processes documentation by:
>>   - adding an explicit section on maintainers
>>   - reducing the up-front verbiage in patch submission
>>   - emphasising the importance to respectful reviews
>> I'm sure the language could be improved further so I humbly submit
>> this RFC for discussion.
>> Alex Benn=C3=A9e (4):
>>    docs/devel: add a maintainers section to development process
>>    docs/devel: make language a little less code centric
>>    docs/devel: simplify the minimal checklist
>>    docs/devel: try and improve the language around patch review
>>   docs/devel/code-of-conduct.rst           |   2 +
>>   docs/devel/index-process.rst             |   1 +
>>   docs/devel/maintainers.rst               |  84 +++++++++++++++++++
>>   docs/devel/submitting-a-patch.rst        | 101 +++++++++++++++--------
>>   docs/devel/submitting-a-pull-request.rst |  12 +--
>>   roms/qboot                               |   2 +-
>>   6 files changed, 157 insertions(+), 45 deletions(-)
>>   create mode 100644 docs/devel/maintainers.rst
>
> Hi Alex,
>
> I've replied with a couple of things I noticed, but in general I think th=
is is a really nice improvement.
>
> If you're looking at documenting some of the maintainer processes better,=
 there are a few other things I have been thinking about that it may be wor=
th discussing:
>
>
> i) Requiring an R-B tag for all patches before merge
>
> - Is this something we should insist on and document?
>
> ii) Unresponsive maintainers
>
> - Should we have a process for this? When Blue Swirl (the previous SPARC =
maintainer) disappeared abruptly, I think it took nearly 3 months to get my=
 first patches merged=20
> since no-one knew if they were still active. If a maintainer has been unr=
esponsive for e.g. 2 months should that then allow a process where other ma=
intainers can merge=20
> patches on their behalf and/or start a process of maintainer transition?
>
> iii) Differences(?) between maintainers
>
> - There have been a few instances where I have been delayed in finding ti=
me for patch review, and in the meantime someone has stepped up to review t=
he patch and given it=20
> an R-B tag which is great. However I have then reviewed the patch and not=
iced something amiss, and so it needs a bit more work before being merged. =
I think in=20
> these cases the review of the maintainer of the code in question should t=
ake priority over other maintainer reviews: do we need to explicitly docume=
nt this? I can=20
> certainly see how this can be confusing to newcomers having an R-B tag as=
 a pre-requisite for merge coming from one person, and then a NACK from som=
eone else later.

The opposite also happens: I review in my role as a maintainer, and give
my R-by, then somebody else has questions or objections.  These need to
be addressed.  My R-by as maintainer does not change that at all.

Maintainers' reviews are not special.  Issues raised in review need to
be addressed regardless of who raised them.  Maintainers' "specialness"
kicks in at the point where they make judgement calls, such as "this is
good enough, we can address the remaining issues on top".

If multiple maintainers are responsible and disagree, they need to
hammer out some kind of consensus.


