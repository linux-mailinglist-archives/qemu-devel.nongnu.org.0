Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A4E414B1E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 15:53:46 +0200 (CEST)
Received: from localhost ([::1]:50570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT2gz-0002BP-73
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 09:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mT2d1-0006Kf-Ry
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:49:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mT2cy-00059S-5E
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:49:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632318575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FhGQghMC2NOqk2Ku5Z+f192rgebvYDWIA7y6e3RqFvM=;
 b=HfNV9h2DIoXIonHx3riE1nOhxWhksrJaJo2WPgcq9wmoYYlWcvvFB7i/d+HDQFjVOfDCeE
 /Bik8HmJCSK3iEfm6psvaqbhziIewo2WoUbVrkJ2mk/iiUnOHXPrFsgt4OhhMAFGihMewQ
 HTNFT4VE3I3Yk4u0R8WXCp2gCY1VnIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-i8wwpFpNN5GLspBKgPeb4A-1; Wed, 22 Sep 2021 09:49:33 -0400
X-MC-Unique: i8wwpFpNN5GLspBKgPeb4A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94257A0CAD;
 Wed, 22 Sep 2021 13:49:31 +0000 (UTC)
Received: from paraplu.home (unknown [10.39.195.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72D4C79446;
 Wed, 22 Sep 2021 13:48:59 +0000 (UTC)
Date: Wed, 22 Sep 2021 15:48:56 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/3] docs: rSTify the "SpellCheck" wiki
Message-ID: <YUs0SB3SC/XdpaXC@paraplu.home>
References: <20210922121054.1458051-1-kchamart@redhat.com>
 <20210922121054.1458051-2-kchamart@redhat.com>
 <CAFEAcA8gZxk_F_0MhSShDU5EUet6UZM483Y8R54PXvVCVwUEMw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8gZxk_F_0MhSShDU5EUet6UZM483Y8R54PXvVCVwUEMw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, alex.bennee@linaro.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 02:10:43PM +0100, Peter Maydell wrote:
> On Wed, 22 Sept 2021 at 13:11, Kashyap Chamarthy <kchamart@redhat.com> wrote:

[...]

> > +If you installed codespell in your HOME directory, it can be called from
> > +the QEMU source directory like this::
> > +
> > +    ~/bin/codespell.py -d -r -s -x scripts/codespell.exclude -q 2 ~/share/codespell/dictionary.txt
> > +
> > +``-x scripts/codespell.exclude`` excludes some known lines from the check
> > +and needs a file which is not yet committed.
> 
> This command doesn't actually work, because there is no
> scripts/codespell.exclude in the source tree. It also
> assumes you have a ~/share/codespell/dictionary.txt in your
> home directory.
> 
> I think Stefan proposed a patch adding the excludelist file to
> the source repository back when he wrote this wiki page a decade
> ago, but it did not get through code review.

Thanks for catching it.  I couldn't find the unmerged
'codespell.exclude' from my searches online.  I don't know if it still
makes sense to include such a file.  But regardless, 'codespell' is
useful on its own.  

In v2, I can nuke that command altogether, and link to the README of
upstream 'codespell':

    https://github.com/codespell-project/codespell

I'll also edit the paragraph that talks about installing the the tool in
$HOME directory -- it's no longer required; many major distros packaged
it.  At least Debian, Ubuntu, and Fedora do (as 'codespell'), and the
dictionary file gets installed under:

    $> rpm -ql codespell | grep dictionary
    /usr/lib/python3.9/site-packages/codespell_lib/data/dictionary.txt
    /usr/lib/python3.9/site-packages/codespell_lib/data/dictionary_code.txt
    /usr/lib/python3.9/site-packages/codespell_lib/data/dictionary_en-GB_to_en-US.txt
    /usr/lib/python3.9/site-packages/codespell_lib/data/dictionary_informal.txt
    /usr/lib/python3.9/site-packages/codespell_lib/data/dictionary_names.txt
    /usr/lib/python3.9/site-packages/codespell_lib/data/dictionary_rare.txt
    /usr/lib/python3.9/site-packages/codespell_lib/data/dictionary_usage.txt

I'll also link to 'my-spell' from Alex Bennée, for Emacs users: 
https://github.com/stsquad/my-emacs-stuff/blob/master/my-spell.el

-- 
/kashyap


