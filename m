Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A9D38BDEA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 07:36:37 +0200 (CEST)
Received: from localhost ([::1]:44288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljxps-0006zW-A2
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 01:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljxoa-0006DX-PL
 for qemu-devel@nongnu.org; Fri, 21 May 2021 01:35:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljxoX-0003QA-2I
 for qemu-devel@nongnu.org; Fri, 21 May 2021 01:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621575311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UCvm7kp1QdMq6W3hf4OL5gzYoCvvVico6ZCR2Z8JSII=;
 b=MtM3CPt+PAknw43D1dcvQgvUxswcfy8F/fXL4KTT3suzE37tnd/mBijLXrEF8DB0uorFQJ
 IQ/qGvz3yxyC7/SpiILt4OvxxOcRgsAe/jxPKk5CAv6giMvX2OIHSBPQhRJMradcUPX2JU
 y7lRCL9sGwoc7eLmgVKIli7kEbL8Uf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-v9Oea6YvPcuNFP5Hr3PoUw-1; Fri, 21 May 2021 01:35:09 -0400
X-MC-Unique: v9Oea6YvPcuNFP5Hr3PoUw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F7CC801B12;
 Fri, 21 May 2021 05:35:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14FF310016FF;
 Fri, 21 May 2021 05:35:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A3FC7113865F; Fri, 21 May 2021 07:35:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 2/6] qapi/parser: Allow empty QAPIDoc Sections
References: <20210519191718.3950330-1-jsnow@redhat.com>
 <20210519191718.3950330-3-jsnow@redhat.com>
 <87y2c94gbp.fsf@dusky.pond.sub.org>
 <542e94f4-be9c-da6a-8307-1a36c8c6c7c4@redhat.com>
Date: Fri, 21 May 2021 07:35:06 +0200
In-Reply-To: <542e94f4-be9c-da6a-8307-1a36c8c6c7c4@redhat.com> (John Snow's
 message of "Thu, 20 May 2021 18:23:56 -0400")
Message-ID: <87v97cr6np.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 5/20/21 10:42 AM, Markus Armbruster wrote:
>> First step is to find out how _end_section() can be called twice in a
>> row.  It isn't in all of "make check".  Hmm.
>
> Ah, maybe not twice in a *row*. It does seem to be called when we have
> an "empty section" sometimes, which arises from stuff like this:
>
> Extension error:
> /home/jsnow/src/qemu/docs/../qga/qapi-schema.json:1143:1: ending a
> totally empty section
>
> ## 
> # @GuestExec: 
> # @pid: pid of child process in guest OS 
> # 
> # Since: 2.5 
> ## 
> { 'struct': 'GuestExec',
>   'data': { 'pid': 'int'} }
>
> Without the newline there, it seems to get confused. There's a few
> like this that could be fixed, but then some of the test cases break
> too.

I still can't see it.  I tried the obvious

    diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
    index f03ba2cfec..263aeb5fc5 100644
    --- a/scripts/qapi/parser.py
    +++ b/scripts/qapi/parser.py
    @@ -716,6 +716,7 @@ def _start_section(self, name=None, indent=0):
             self.sections.append(self._section)

         def _end_section(self):
    +        assert self._section
             if self._section:
                 text = self._section.text = self._section.text.strip()
                 if self._section.name and (not text or text.isspace()):

Does not fire for qga/qapi-schema.json.  Can you help?

> No appetite for barking up this tree right now.
>
> Can I fix the commit message and leave the patch in place? Maybe with
> a #FIXME comment nearby?

I'd like to understand your analysis before I answer your question.


