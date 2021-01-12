Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C692F3BBD
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:09:12 +0100 (CET)
Received: from localhost ([::1]:44902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzQud-0002yE-QI
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:09:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kzQr0-000062-BI
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:05:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kzQqw-0000Uo-JY
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:05:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610485520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UVLok+8gRCB9IZRwUWy/49Gd7vikgPYuo4ChbbkCvZc=;
 b=ZgAF1Eeii4dSZF6//MAoW8RrT6Nbfq468lYPiE8npqtD/2SZOQGEvH+Ciwdfno1bsiIc46
 QB2YOBfxb4uR6ISHxH51LulfoOJM6HHvB/BgRXrZDoKeyYuSien1JAWaTcqAwXub2kgPiN
 I+6VKun2BncgRu09V4s7qWrQN3E/LWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-ldg31yQCOCWfjgJafVI3HQ-1; Tue, 12 Jan 2021 16:05:18 -0500
X-MC-Unique: ldg31yQCOCWfjgJafVI3HQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7290100F344;
 Tue, 12 Jan 2021 21:05:17 +0000 (UTC)
Received: from localhost (ovpn-119-212.rdu2.redhat.com [10.10.119.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74CC160C5D;
 Tue, 12 Jan 2021 21:05:17 +0000 (UTC)
Date: Tue, 12 Jan 2021 16:05:16 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] decodetree: Allow 'dot' in opcode names
Message-ID: <20210112210516.GB4161@habkost.net>
References: <20210112184156.2014305-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210112184156.2014305-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 07:41:56PM +0100, Philippe Mathieu-Daudé wrote:
> Some ISA use a dot in their opcodes. Allow the decodetree
> script to process them. The dot is replaced by an underscore
> in the generated code.

Will something break if we just use underscores instead of dots
in the input file?

> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  scripts/decodetree.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> index 47aa9caf6d1..b7572589e64 100644
> --- a/scripts/decodetree.py
> +++ b/scripts/decodetree.py
> @@ -49,7 +49,7 @@
>  re_arg_ident = '&[a-zA-Z0-9_]*'
>  re_fld_ident = '%[a-zA-Z0-9_]*'
>  re_fmt_ident = '@[a-zA-Z0-9_]*'
> -re_pat_ident = '[a-zA-Z0-9_]*'
> +re_pat_ident = '[a-zA-Z0-9_.]*'

If pattern identifiers are going to follow different rules,
doesn't this need to be documented at docs/devel/decodetree.rst?

>  
>  def error_with_file(file, lineno, *args):
>      """Print an error message from file:line and args and exit."""
> @@ -1082,6 +1082,7 @@ def parse_file(f, parent_pat):
>          elif re.fullmatch(re_fmt_ident, name):
>              parse_generic(start_lineno, None, name[1:], toks)
>          elif re.fullmatch(re_pat_ident, name):
> +            name = name.replace('.', '_')
>              parse_generic(start_lineno, parent_pat, name, toks)

Do we want error messages generated by the script to use the
modified identifier with underscores, or the original identifier
with dots?  (This patch does the former)

>          else:
>              error(lineno, 'invalid token "{0}"'.format(name))
> -- 
> 2.26.2
> 

-- 
Eduardo


