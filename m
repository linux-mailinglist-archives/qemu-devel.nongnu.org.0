Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD16369F10
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 08:39:36 +0200 (CEST)
Received: from localhost ([::1]:49550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laBx0-0004DC-Sj
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 02:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1laBvq-0003mO-Ae
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 02:38:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1laBvn-0006Vn-08
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 02:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619246297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8RrdjvSU1Ul6uwpB4YluNcla7aiIpvre40lsbNwvzI8=;
 b=hh4sfu3xJmeM2nc6M9++iFgAqaXGyKwjdT3SQAICUwA5fbKqmCsUa12/aATn41tcpSdpxc
 Ox6qHBR5KVerEVOC6MLI2cmhQxcqKfJTz8ZLwwNQrRenzZL7Bcty+xY7qdUzIiA+q1+RTl
 bUSj2EK3D9aXaQIEEKrxacvGF215Zn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-x-PTVCi1N1m_-EEiaQGiig-1; Sat, 24 Apr 2021 02:38:12 -0400
X-MC-Unique: x-PTVCi1N1m_-EEiaQGiig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 914CC18397A5;
 Sat, 24 Apr 2021 06:38:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C5456087C;
 Sat, 24 Apr 2021 06:38:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D28F1113525D; Sat, 24 Apr 2021 08:38:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 03/22] qapi/source: Remove line number from
 QAPISourceInfo initializer
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-4-jsnow@redhat.com>
Date: Sat, 24 Apr 2021 08:38:09 +0200
In-Reply-To: <20210422030720.3685766-4-jsnow@redhat.com> (John Snow's message
 of "Wed, 21 Apr 2021 23:07:01 -0400")
Message-ID: <87o8e49oha.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

> With the QAPISourceInfo(None, None, None) construct gone, there's not
> really any reason to have to specify that a file starts on the first
> line.
>
> Remove it from the initializer and have it default to 1.
>
> Remove the last vestiges where we check for 'line' being unset. That
> won't happen again, now!
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/parser.py |  2 +-
>  scripts/qapi/source.py | 12 +++---------
>  2 files changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index b378fa33807..edd0af33ae0 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -47,7 +47,7 @@ def __init__(self, fname, previously_included=None, incl_info=None):
>          if self.src == '' or self.src[-1] != '\n':
>              self.src += '\n'
>          self.cursor = 0
> -        self.info = QAPISourceInfo(fname, 1, incl_info)
> +        self.info = QAPISourceInfo(fname, incl_info)
>          self.line_pos = 0
>          self.exprs = []
>          self.docs = []
> diff --git a/scripts/qapi/source.py b/scripts/qapi/source.py
> index 21090b9fe78..afa21518974 100644
> --- a/scripts/qapi/source.py
> +++ b/scripts/qapi/source.py
> @@ -37,10 +37,9 @@ def __init__(self) -> None:
>  class QAPISourceInfo:
>      T = TypeVar('T', bound='QAPISourceInfo')
>  
> -    def __init__(self, fname: str, line: int,
> -                 parent: Optional['QAPISourceInfo']):
> +    def __init__(self, fname: str, parent: Optional['QAPISourceInfo'] = None):

Not mentioned in the commit message: you add a default parameter value.
It's not used; there's just one caller, and it passes a value.
Intentional?

>          self.fname = fname
> -        self.line = line
> +        self.line = 1
>          self._column: Optional[int] = None
>          self.parent = parent
>          self.pragma: QAPISchemaPragma = (
> @@ -59,12 +58,7 @@ def next_line(self: T) -> T:
>          return info
>  
>      def loc(self) -> str:
> -        # column cannot be provided meaningfully when line is absent.
> -        assert self.line or self._column is None
> -
> -        ret = self.fname
> -        if self.line is not None:
> -            ret += ':%d' % self.line
> +        ret = f"{self.fname}:{self.line}"
>          if self._column is not None:
>              ret += ':%d' % self._column
>          return ret

Mixing f-string and % interpolation.  I doubt we'd write it this way
from scratch.  I recommend to either stick to % for now (leave
conversion to f-strings for later), or conver the column formatting,
too, even though it's not related to the patch's purpose.


