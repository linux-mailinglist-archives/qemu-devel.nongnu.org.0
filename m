Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C313629237E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 10:19:25 +0200 (CEST)
Received: from localhost ([::1]:54964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUQO4-0006bT-E8
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 04:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kUQEu-0006oL-Fa
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 04:09:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kUQEs-0005NN-Ka
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 04:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603094994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zuhxENw14ZJiJAiW1pplH3Ea7h5f5AD6Sn154T891dQ=;
 b=ISrw7+tPnHUWo6aTDnOSyU2QgXFVc++suhaBNkRpxCixRf5i7FaS2EuGKA+xP9I+MsGS8d
 YLPwnFxjnSHD0oNXm5bI37kpiSZFyzT2wKxROZVndzDTSQn3f0SyAa6yCow9jD8q6/jQJv
 S7fLCBbf/ij/w1wBxQzlpnothigHJkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-n8H8qBA2M3-tiiHIUBjrzw-1; Mon, 19 Oct 2020 04:09:49 -0400
X-MC-Unique: n8H8qBA2M3-tiiHIUBjrzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DC5618BE166;
 Mon, 19 Oct 2020 08:09:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C9751A4D6;
 Mon, 19 Oct 2020 08:09:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A07391132A08; Mon, 19 Oct 2020 10:09:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PULL 00/34] QAPI patches patches for 2020-10-10
References: <20201010095504.796182-1-armbru@redhat.com>
 <7f68ee42-dce8-b304-365a-402c5b37147b@amsat.org>
Date: Mon, 19 Oct 2020 10:09:46 +0200
In-Reply-To: <7f68ee42-dce8-b304-365a-402c5b37147b@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sun, 18 Oct 2020 09:29:49
 +0200")
Message-ID: <87eelu1vsl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 01:44:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: John Snow <jsnow@redhat.com>, peter.maydell@linaro.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 10/10/20 11:54 AM, Markus Armbruster wrote:
>> The following changes since commit 4a7c0bd9dcb08798c6f82e55b5a3423f7ee66=
9f1:
>>    Merge remote-tracking branch
>> 'remotes/dgibson/tags/ppc-for-5.2-20201009' into staging (2020-10-09
>> 15:48:04 +0100)
>> are available in the Git repository at:
>>    git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2020-10-10
>> for you to fetch changes up to
>> b4c0aa59aff520e2a55edd5fef393058ca6520de:
>>    qapi/visit.py: add type hint annotations (2020-10-10 11:37:49
>> +0200)
>> ----------------------------------------------------------------
>> QAPI patches patches for 2020-10-10
>
> The "GCC check-tcg (user)" is 6 min slower since this pull request,
> making Travis-CI fails:
>
> https://travis-ci.org/github/qemu/qemu/builds/734773760
> https://travis-ci.org/github/qemu/qemu/builds/734983001
>
> Any remote idea what could be the reason?

No.  This is unexpected.  The changes to generated QAPI files are
limited to whitespace.

John, can you work with Philippe to get to the bottom of this?


