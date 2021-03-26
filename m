Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0472834A1D4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 07:29:12 +0100 (CET)
Received: from localhost ([::1]:57188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPfy3-0005Uq-3w
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 02:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPfvm-0004xd-Vi
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 02:26:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPfvk-0002zl-24
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 02:26:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616740005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FiLCzAsGroBWnvTuzhp0WANJcTK0UW7S8DO4xo8hf0U=;
 b=HO8Ec452Q2fU1bJcithDK/RTAkjyO+k6INILuwy1XFZNtE7T2DOqH+vKuQpCJ8A7vlj/RP
 Z1sWkPuV6jcTUmkH5p1P4oNxAOleUESSC/rB3BkwRRptX/Qw76L0rInHSANNZ4hBGw/dMP
 xg/uVXKS/ACKvfx3/ePj3eYrn30Mxkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-dCXkTkqWPcmyoccYZ_n1mQ-1; Fri, 26 Mar 2021 02:26:43 -0400
X-MC-Unique: dCXkTkqWPcmyoccYZ_n1mQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF70F1007469;
 Fri, 26 Mar 2021 06:26:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D72B6EF54;
 Fri, 26 Mar 2021 06:26:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1BE5811327E1; Fri, 26 Mar 2021 07:26:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 02/19] flake8: Enforce shorter line length for
 comments and docstrings
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-3-jsnow@redhat.com>
 <877dlvs1gp.fsf@dusky.pond.sub.org>
 <ed5134b3-bff9-947e-f370-239e5c31a512@redhat.com>
Date: Fri, 26 Mar 2021 07:26:41 +0100
In-Reply-To: <ed5134b3-bff9-947e-f370-239e5c31a512@redhat.com> (John Snow's
 message of "Thu, 25 Mar 2021 16:20:24 -0400")
Message-ID: <871rc277mm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

> On 3/25/21 11:21 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> PEP8's BDFL writes: "For flowing long blocks of text with fewer
>>> structural restrictions (docstrings or comments), the line length should
>>> be limited to 72 characters."
>>>
>>> I do not like this patch. I have included it explicitly to recommend we
>>> do not pay any further heed to the 72 column limit.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>> 
>> I'd like to get the remainder of this series moving again before digging
>> into this patch.
>
> I am dropping it, then -- I have no interest in bringing a patch I 
> dislike along for another respin.

Despite your dislike, there might be good parts, and if there are, I'd
like to mine them.  I don't need you to track the patch for that,
though.  Feel free to drop it.

Thank you for exploring the max-doc-length option.


