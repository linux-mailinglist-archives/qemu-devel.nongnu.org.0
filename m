Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDDC2EF7CC
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 20:00:47 +0100 (CET)
Received: from localhost ([::1]:37942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxx0A-0005AD-8k
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 14:00:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kxwy2-0003DG-LC
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:58:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kxwxy-0003Fr-Hi
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:58:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610132309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YYy44amsPW5LEhr7T2ulibnpDFOs7qhmUckJzb9xBJE=;
 b=KyrM/L1YDSEzTlWC4dsHHXhIzUXq2BIThZpnbzEJU0DVgXclDR9BruTzXspxyY8M9N2IMO
 Udu/ui8yfNmWMXme5vfuTYZBSN/qjT4t9e26rFHHcNyHg+627AMmWQgwaLd5r4Lyi9BJDf
 NEAkovIYWTL2BIQjJEiKo2kTvU1L3d4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-Hjf8VrpnPaq4Ad0Y2VErwg-1; Fri, 08 Jan 2021 13:58:26 -0500
X-MC-Unique: Hjf8VrpnPaq4Ad0Y2VErwg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D629CCC622;
 Fri,  8 Jan 2021 18:58:24 +0000 (UTC)
Received: from localhost (ovpn-117-149.rdu2.redhat.com [10.10.117.149])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EC5012D7E;
 Fri,  8 Jan 2021 18:58:24 +0000 (UTC)
Date: Fri, 8 Jan 2021 13:58:23 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] decodetree: Open files with encoding='utf-8'
Message-ID: <20210108185823.GB54056@habkost.net>
References: <20210108180952.358947-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210108180952.358947-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 08, 2021 at 07:09:52PM +0100, Philippe Mathieu-Daudé wrote:
> When decodetree.py was added in commit 568ae7efae7, QEMU was
> using Python 2 which happily reads UTF-8 files in text mode.
> Python 3 requires either UTF-8 locale or an explicit encoding
> passed to open(). Now that Python 3 is required, explicit
> UTF-8 encoding for decodetree source files.
> 
> To avoid further problems with the user locale, also explicit
> UTF-8 encoding for the generated C files.
> 
> Explicit both input/output are plain text by using the 't' mode.

I believe the 't' is unnecessary.  But it's harmless and makes it
more explicit.

> 
> This fixes:
> 
>   $ /usr/bin/python3 scripts/decodetree.py test.decode
>   Traceback (most recent call last):
>     File "scripts/decodetree.py", line 1397, in <module>
>       main()
>     File "scripts/decodetree.py", line 1308, in main
>       parse_file(f, toppat)
>     File "scripts/decodetree.py", line 994, in parse_file
>       for line in f:
>     File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
>       return codecs.ascii_decode(input, self.errors)[0]
>   UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position 80:
>   ordinal not in range(128)
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

However:

> ---
> v2: utf-8 output too (Peter)
>     explicit default text mode.
> ---
>  scripts/decodetree.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> index 47aa9caf6d1..d3857066cfc 100644
> --- a/scripts/decodetree.py
> +++ b/scripts/decodetree.py
> @@ -1304,7 +1304,7 @@ def main():
>  
>      for filename in args:
>          input_file = filename
> -        f = open(filename, 'r')
> +        f = open(filename, 'rt', encoding='utf-8')
>          parse_file(f, toppat)
>          f.close()
>  
> @@ -1324,7 +1324,7 @@ def main():
>          prop_size(stree)
>  
>      if output_file:
> -        output_fd = open(output_file, 'w')
> +        output_fd = open(output_file, 'wt', encoding='utf-8')
>      else:
>          output_fd = sys.stdout

This will still use the user locale encoding for sys.stdout.  Can
be solved with:

    output_fd = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

(Based on a suggestion from Yonggang Luo)

-- 
Eduardo


